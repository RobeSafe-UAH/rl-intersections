#!/usr/bin/env python
#
# Copyright (c) 2019 Intel Corporation
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
"""
Last edit : 10/june/2020 Alejadro D.

In this new version overtaking is considered

"""
"""
Generates a plan of waypoints to follow

It uses the current pose of the ego vehicle as starting point from the ROS topic '/localization/pose' 

The goal is either read from the ROS topic `/mapping_panning/goal`, if available
(e.g. published by RVIZ via '2D Nav Goal') or a fixed point is used.

The calculated route is published on '/mapping_planning/waypoints'

"""
import math
import sys
import threading

import rospy
import tf
from tf.transformations import euler_from_quaternion
from nav_msgs.msg import Path
from geometry_msgs.msg import PoseStamped

from nav_msgs.msg import Odometry
from std_msgs.msg import Bool

import glob 
import os
import sys

from tabulate import tabulate

# Techs4AgeCar project

try:
    sys.path.append('/home/robesafe/PythonAPI/examples')
except IndexError:
    pass

from navigation.agent_planner import Path_Planner

# Techs4AgeCar project

try:
    sys.path.append(glob.glob('/home/robesafe/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass

import carla

from navigation.global_route_planner import GlobalRoutePlanner
from navigation.global_route_planner_dao import GlobalRoutePlannerDAO

class CarlaToRosWaypointConverter(object):

    """
    This class generates a plan of waypoints to follow.

    The calculation is done whenever:
    - a new goal is set
    """
    WAYPOINT_DISTANCE = 2.0

    def __init__(self):
        """
        Constructor
        """

        # Techs4AgeCar project

        self.map_name = rospy.get_param('t4ac/map_name')
        self.carla_map = None
        self.ego_vehicle_location = None	
        self.ego_vehicle_waypoint = None

        # Waypoint publisher
        self.waypoint_publisher = rospy.Publisher(
                '/t4ac/planning/route', Path, queue_size=1, latch=True)

        # Set initial goal
        self.goal = None
        self.car_location = None
        self.current_route = None
        self.goal_subscriber = rospy.Subscriber(
                "/t4ac/planning/goal", PoseStamped, self.on_goal)

        # Set car position
        self.location_subscriber = rospy.Subscriber(
                "/t4ac/localization/pose", Odometry, self.car_start_point)

        # Set map 
        self.xodr_path = "/home/robesafe/t4ac_ws/src/t4ac_architecture/t4ac_mapping_layer/maps/xodr/"+self.map_name+".xodr"
        with open(self.xodr_path) as od_file:
                od_file_data = od_file.read()

        self.carla_map = carla.Map(self.map_name, od_file_data)

        # Overtaking left order
        self.overtakingleft_subscriber = rospy.Subscriber(
            "/t4ac/planning/overtaking_left_order", Bool, self.overtaking_left)

        # Overtaking right order
        self.overtakingright_subscriber = rospy.Subscriber(
            "/t4ac/planning/overtaking_right_order", Bool, self.overtaking_right)


        # Techs4AgeCar project

    def destroy(self):
        
        # Destructor
        
        self.ego_vehicle_location = None

    def car_start_point(self, car_odometry):
        """
        Callback for /carla/t4ac/location
        """
        carla_location = carla.Location()
        carla_location.x = car_odometry.pose.pose.position.x
        carla_location.y = -car_odometry.pose.pose.position.y
        carla_location.z = car_odometry.pose.pose.position.z
        self.ego_vehicle_location = carla_location
        self.ego_vehicle_waypoint = self.carla_map.get_waypoint(carla_location, project_to_road=True, lane_type=carla.LaneType.Driving)


    def on_goal(self, goal):
        """
        Callback for /mapping_planning/goal

        Receiving a goal (e.g. from RVIZ '2D Nav Goal') triggers a new route calculation.

        :return:
        """
        rospy.loginfo("Received goal, trigger rerouting...")
        carla_goal = carla.Transform()
        carla_goal.location.x = goal.pose.position.x
        carla_goal.location.y = -goal.pose.position.y
        carla_goal.location.z = goal.pose.position.z + 1  # 1m above ground
        quaternion = (
            goal.pose.orientation.x,
            goal.pose.orientation.y,
            goal.pose.orientation.z,
            goal.pose.orientation.w
        )
        _, _, yaw = euler_from_quaternion(quaternion)
        carla_goal.rotation.yaw = -math.degrees(yaw)

        self.goal = carla_goal
        self.reroute(self.ego_vehicle_location)

    def overtaking_left(self, order):
        """
        Callback for /mapping_planning/overtaking_left_order
        New route is calculated considering overtaking 
        """
        print("Overtaking left...")
        left_wpt = self.ego_vehicle_waypoint.get_left_lane()
        left_turn = self.ego_vehicle_waypoint.left_lane_marking.lane_change
        print(self.ego_vehicle_waypoint)
        print(left_wpt.transform.location)

        if (order.data == True and (left_turn == carla.LaneChange.Left or left_turn == carla.LaneChange.Both)):
            print("Warning Overtaking!")
            self.reroute(left_wpt.transform.location)
        else:
            print("Overtaking left is not possible")

    def overtaking_right(self, order):
        """
        Callback for /mapping_planning/overtaking_right_order
        """
        right_wpt = self.ego_vehicle_waypoint.get_right_lane()
        right_turn = self.ego_vehicle_waypoint.right_lane_marking.lane_change

        if (order.data == True and (right_turn == carla.LaneChange.Right or right_turn == carla.LaneChange.Both)):
            self.reroute(right_wpt.transform.location)  
        else:
            print("Overtaking right is not possible")  
        


    def reroute(self, start):
        """
        Triggers a rerouting
        """
        if self.ego_vehicle_location is None or self.goal is None:
            # print("in if")
            # no ego vehicle location, remove route if published
            self.current_route = None
            self.publish_waypoints()
        else:
            # print("in else")
            self.current_route = self.calculate_route(start, self.goal)
        self.publish_waypoints()

    # Techs4AgeCar project
    def _filter_closer_waypoints(self, route, threshold):
        route_filtered = []

        for i in range(1, len(route)):
            distance = route[i][0].transform.location.distance(route[i-1][0].transform.location)
            if distance > threshold:
                route_filtered.append(route[i])
                print(route[i])
        return route_filtered
    # Techs4AgeCar project

    def calculate_route(self, start, goal):
        """
        Calculate a route from the current location to 'goal'
        """
        rospy.loginfo("Calculating route to x={}, y={}, z={}".format(
            goal.location.x,
            goal.location.y,
            goal.location.z))

        # Techs4AgeCar project

        rospy.loginfo("Generando e imprimiendo ruta...")
        planner = Path_Planner(self.carla_map)
        print(start)
        print(self.goal.location)
        route = planner.set_destination(start, self.goal.location)

        # Filter route (route is a list of (carla.Waypoint, RoadOption))
        route_filtered = self._filter_closer_waypoints(route, 2)

        return route_filtered

        # Techs4AgeCar project

    def publish_waypoints(self):
        """
        Publish the ROS message containing the waypoints
        """
        msg = Path()
        msg.header.frame_id = "map"
        msg.header.stamp = rospy.Time.now()
        pose_i = None
        poses_list = []
        poses_data = []
        nwp = 1
        if self.current_route is not None:
            for wp in self.current_route:
                pose = PoseStamped()
                pose.pose.position.x = wp[0].transform.location.x
                pose.pose.position.y = -wp[0].transform.location.y
                pose.pose.position.z = wp[0].transform.location.z

                quaternion = tf.transformations.quaternion_from_euler(
                    0, 0, -math.radians(wp[0].transform.rotation.yaw))
                pose.pose.orientation.x = quaternion[0]
                pose.pose.orientation.y = quaternion[1]
                pose.pose.orientation.z = quaternion[2]
                pose.pose.orientation.w = quaternion[3]

                # Filter for repeated waypoints
                if(pose == pose_i):
                    pass
                else:
                    msg.poses.append(pose)
                pose_i = pose

        # Organize info to be printed cleaner
        for poses in msg.poses:
            poses_list = [nwp, poses.pose.position.x, -poses.pose.position.y, poses.pose.position.z]
            poses_data.append(poses_list)
            nwp += 1

        # Print and publish waypoint route
        print("\n" + tabulate(poses_data, headers=["waypoint", "x", "y", "z"]) + "\n")	
        self.waypoint_publisher.publish(msg)
        rospy.loginfo("Published {} waypoints.".format(len(msg.poses)))


    
   


def main():
    """
    main function
    """

    try:
        rospy.init_node("waypoint_publisher", anonymous=True)

    except rospy.ROSException:
        rospy.logerr("Error while waiting for info!")
        sys.exit(1)

    try:

        # Techs4AgeCar project

        rospy.loginfo("Route planner initialized..")
        waypointConverter = CarlaToRosWaypointConverter()
        rospy.spin()
        #waypointConverter.destroy()
        del waypointConverter

        # Techs4AgeCar project

    finally:
        rospy.loginfo("Done")


if __name__ == "__main__":
    main()
