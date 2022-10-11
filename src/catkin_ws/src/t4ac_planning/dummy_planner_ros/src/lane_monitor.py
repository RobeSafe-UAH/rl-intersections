#!/usr/bin/env python
#
# Copyright (c) 2019 Intel Corporation
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
"""
Last edit : 03/sept/2020 Alejadro D.

In this version monitorizes lanes of the route and around

"""
"""
Monitor lanes around the car

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

from t4ac_msgs.msg import MonitorizedLanes
from t4ac_msgs.msg import Lane
from t4ac_msgs.msg import Way
from t4ac_msgs.msg import Node

import glob 
import os
import sys

from tabulate import tabulate

# Techs4AgeCar project

try:
    sys.path.append('/home/robesafe/PythonAPI/examples')
except IndexError:
    pass


# Techs4AgeCar project

try:
    sys.path.append(glob.glob('/home/robesafe/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass

import carla

class LaneMonitor(object):

    """
    This class monitors lanes around the ego vehicle

    The calculation is done whenever:
    - a new car position is updated
    """

    def __init__(self):
        """
        Constructor
        """

    # Techs4AgeCar project

        # -----
        # Config param
        self.debug_flag = 1 # Enable this flag to watch wp in simulator
        self.map_name = "Campus_v0_7_4"
        self.n_max = 30 # Number max of wp to monitorize in the frontside lane
        self.n2_max = 10 # Number max of wp to monitorize in the backside lane (must belong to the route)
        # -----

        # -----
        # Client and World setup (only for simulator)
        if self.debug_flag == 1:
            self.client = carla.Client('localhost', 2000)
            self.client.set_timeout(10.0)
            self.world = self.client.get_world()
        # -----

        self.global_route_location = [] # Global route in carla.Location() type (x,y,z)
        self.global_route_waypoint = [] # Global route in carla.Waypoint() type (x,y,z,pitch,yaw,roll)
        self.last_wp_index = None
        
        self.carla_map = None
        self.ego_vehicle_location = None	
        self.ego_vehicle_waypoint = None

        # Monitorized lanes publisher
        self.lane_monitor_publisher = rospy.Publisher(
            '/mapping_planning/lane_monitor', MonitorizedLanes, queue_size=1, latch=True)

        # Route subscriber
        self.route_subscriber = rospy.Subscriber(
            "/mapping_planning/waypoints", Path, self.route_callback)

        # Car position subscriber
        self.location_subscriber = rospy.Subscriber(
            "/localization/pose", Odometry, self.car_start_point)

        # Set map 
        self.xodr_path = "/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/maps/xodr/"+self.map_name+".xodr"
        with open(self.xodr_path) as od_file:
            od_file_data = od_file.read()

        self.carla_map = carla.Map(self.map_name, od_file_data)

        # Techs4AgeCar project


    def destroy(self):
        
        # Destructor      
        self.ego_vehicle_location = None


    def route_callback(self, route):
        """
        Callback for /mapping_planning/waypoints
        """
        del self.global_route_location[:] #As it is going to generate a new route, delete older route
        del self.global_route_waypoint[:]
        for wp in route.poses:
            wp_location = carla.Location()
            wp_location.x = wp.pose.position.x
            wp_location.y = -wp.pose.position.y
            wp_location.z = wp.pose.position.z
            self.global_route_location.append(wp_location) # Generate a list of global route locations
            waypoint = self.carla_map.get_waypoint(location=wp_location, project_to_road=True, lane_type=carla.LaneType.Driving)
            self.global_route_waypoint.append(waypoint) # Generate a list of global route waypoints
        self.last_wp_index = 0
        

        

    def car_start_point(self, car_odometry):
        """
        Callback for /carla/t4ac/location
        """
        # (Location is constantly published by the ego vehicle)
        carla_location = carla.Location()
        carla_location.x = car_odometry.pose.pose.position.x
        carla_location.y = -car_odometry.pose.pose.position.y # 'y' coordinate is inverted in Carla simulator
        carla_location.z = car_odometry.pose.pose.position.z
        self.ego_vehicle_location = carla_location
        self.ego_vehicle_waypoint = self.carla_map.get_waypoint(carla_location, project_to_road=True, lane_type=carla.LaneType.Driving)

        #----
        if len(self.global_route_location)>0:
            for i in range(self.last_wp_index,len(self.global_route_location)):
                distance = self.ego_vehicle_location.distance(self.global_route_location[i])
                distance_next = self.ego_vehicle_location.distance(self.global_route_location[i+1])
                # The ego vehicle is trying to reach the next wp on the route (keep in mind that this callback function is constantly called)
                if distance<distance_next and distance<10:
                    self.last_wp_index = i
                    break
                # The wp has been reached, so it increments last_wp_index in order to set a new next_wp to reach on the route
                else:
                    self.last_wp_index = i+1
                    break
            # 'n' for current lane
            if (self.last_wp_index + self.n_max) < len(self.global_route_location):
                n = self.n_max
            else:
                n = len(self.global_route_location)-self.last_wp_index
            # 'n2' for backside lane
            if (self.last_wp_index - self.n2_max) < 0:
                n2 = self.last_wp_index
            else:
                n2 = self.n2_max
            lanes = self.calculate_lanes(self.ego_vehicle_waypoint, n, n2)
            self.publish_monitorized_lanes(lanes)

        # Pruebas 28_julio

        #print("El cambio es: ", self.ego_vehicle_waypoint.lane_change)
        #self.world.debug.draw_point(location=right_chance.transform.location, color = carla.Color(255,0,0), life_time=1)

        #
            


    def calculate_lane(self, central_way):
        # Get a central way and calculate wp at both sides, defining a lane
        lane = Lane()
        for i in range(len(central_way)):
            central_wp = central_way[i]
            node_right = Node()
            node_left = Node()
            yaw = central_wp.transform.rotation.yaw
            alpha = 90.0-yaw
            alpha_radians = math.radians(alpha)
            distance = central_wp.lane_width/2

            node_right.x = central_wp.transform.location.x + math.cos(alpha_radians)*distance
            node_right.y = central_wp.transform.location.y - math.sin(alpha_radians)*distance
            node_right.z = central_wp.transform.location.z
            lane.right.way.append(node_right)

            node_left.x = central_wp.transform.location.x - math.cos(alpha_radians)*distance
            node_left.y = central_wp.transform.location.y + math.sin(alpha_radians)*distance
            node_left.z = central_wp.transform.location.z
            lane.left.way.append(node_left)
        return lane

    def calculate_lanes(self, waypoint, n, n2):
        lanes = []

        # Current (frontside) lane
        central_current_way = []
        central_current_way.append(waypoint)
        for i in range(n):
            central_current_wp = self.global_route_waypoint[self.last_wp_index+i]
            central_current_way.append(central_current_wp)

        current_lane = self.calculate_lane(central_current_way) 
        current_lane.role = "current"
        lanes.append(current_lane)

        # Backside lane
        central_backside_way = []
        for i in range(n2):
            central_backside_wp = self.global_route_waypoint[self.last_wp_index-n2+i]
            central_backside_way.append(central_backside_wp)

        backside_lane = self.calculate_lane(central_backside_way)
        backside_lane.role = "backside"
        lanes.append(backside_lane)

        # Left lane
        central_left_way = []
        for wp in central_current_way:
            if wp.lane_change == carla.libcarla.LaneChange.Left or wp.lane_change == carla.libcarla.LaneChange.Both:
                central_left_wp = wp.get_left_lane()
                if central_left_wp is not None:
                    central_left_way.append(central_left_wp)
                else:
                    pass
        left_lane = self.calculate_lane(central_left_way)
        left_lane.role = "current_left"
        lanes.append(left_lane)

        # Right lane
        central_right_way = []
        for wp in central_current_way:
            if wp.lane_change == carla.libcarla.LaneChange.Right or wp.lane_change == carla.libcarla.LaneChange.Both:
                central_right_wp = wp.get_right_lane()
                if central_right_wp is not None:
                    central_right_way.append(central_right_wp)
                else:
                    pass
        right_lane = self.calculate_lane(central_right_way)
        right_lane.role = "current_right"
        lanes.append(right_lane)

        return lanes



    def publish_monitorized_lanes(self, lanes):
        monitorized_lanes = MonitorizedLanes()
        monitorized_lanes.header.frame_id = "monitorized_lanes"
        monitorized_lanes.header.stamp = rospy.Time.now()
        monitorized_lanes.lanes = lanes

        # DEBUG (only for simulator)
        # ------------- 
        
        if self.debug_flag ==1:
            i = 0
            for lane in monitorized_lanes.lanes:
                
                location_a = carla.Location()
                
                if lane.role == "current":
                    for b in lane.right.way:
                        location_a.x = b.x
                        location_a.y = b.y
                        location_a.z = b.z
                        #print(location_a)
                        self.world.debug.draw_point(location=location_a, color = carla.Color(255,0,0), life_time=0.1)

                    for b in lane.left.way:
                        location_a.x = b.x
                        location_a.y = b.y
                        location_a.z = b.z
                        #print(location_a)
                        self.world.debug.draw_point(location=location_a, color = carla.Color(255,0,0), life_time=0.1)

                        i += 1
                
                elif lane.role == "backside":
                    for b in lane.right.way:
                        location_a.x = b.x
                        location_a.y = b.y
                        location_a.z = b.z
                        #print(location_a)                    
                        self.world.debug.draw_point(location=location_a, color = carla.Color(0,0,255), life_time=0.1)

                    for b in lane.left.way:
                        location_a.x = b.x
                        location_a.y = b.y
                        location_a.z = b.z
                        #print(location_a)
                        self.world.debug.draw_point(location=location_a, color = carla.Color(0,0,255), life_time=0.1)

                        i += 1
                
                elif lane.role == "current_left":
                    for b in lane.right.way:
                        location_a.x = b.x
                        location_a.y = b.y
                        location_a.z = b.z
                        #print(location_a)
                        self.world.debug.draw_point(location=location_a, color = carla.Color(0,255,0), life_time=0.1)
                    
                elif lane.role == "current_right":
                    for b in lane.left.way:
                        location_a.x = b.x
                        location_a.y = b.y
                        location_a.z = b.z
                        #print(location_a)                    
                        self.world.debug.draw_point(location=location_a, color = carla.Color(0,255,0), life_time=0.1)

                else:
                    pass
            
        # END DEBUG
        # -------------
        
        self.lane_monitor_publisher.publish(monitorized_lanes)

def main():
    """
    main function
    """

    try:
        rospy.init_node("lane_monitor_publisher", anonymous=True)

    except rospy.ROSException:
        rospy.logerr("Error while waiting for info!")
        sys.exit(1)

    try:

        # Techs4AgeCar project

        rospy.loginfo("Lane monitor initialized..")
        laneMonitor = LaneMonitor()
        rospy.spin()
        del laneMonitor
    
    # Techs4AgeCar project
    
    finally:
        rospy.loginfo("Done")


if __name__ == "__main__":
    main()
