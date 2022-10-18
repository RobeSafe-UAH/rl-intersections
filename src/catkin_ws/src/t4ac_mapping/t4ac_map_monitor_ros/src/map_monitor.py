#!/usr/bin/env python3
"""
Receive path planning route, ego_vehicle_position and xodr map.
With that info calculate monitorized elements.
"""

import sys 
import os
import glob
import git

repo = git.Repo('.', search_parent_directories=True)
BASE_DIR = repo.working_tree_dir
sys.path.append(BASE_DIR)

try:
    sys.path.append(glob.glob('/home/robesafe/libraries/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla
import rospy
import nav_msgs.msg

from src.catkin_ws.src.t4ac_mapping.t4ac_map_monitor_ros.src.modules import monitor_classes
from src.catkin_ws.src.t4ac_mapping.t4ac_map_monitor_ros.src.modules import route_module
from src.catkin_ws.src.t4ac_mapping.t4ac_map_monitor_ros.src.modules import lanes_module
from src.catkin_ws.src.t4ac_mapping.t4ac_map_monitor_ros.src.modules import util_module
from src.catkin_ws.src.t4ac_mapping.t4ac_map_monitor_ros.src.modules import calculus_module
from src.catkin_ws.src.t4ac_mapping.t4ac_map_monitor_ros.src.modules import monitor_module
from src.catkin_ws.src.t4ac_mapping.t4ac_map_monitor_ros.src.modules import regElem_module
import t4ac_msgs.msg


class MapMonitor:
    """
    Class for the map monitor. 
    Here are two main callbacks: one when a new route is published an other 
    when localization of th evehicle is published (localization is supposed 
    to be constantly published) 
    """

    def __init__(self, map_name):
        # Map
        self.map_name = map_name 
        maps_path = BASE_DIR + '/src/catkin_ws/src/t4ac_mapping/maps/xodr/'
        self.carla_map = util_module.get_map(maps_path, map_name)
        # Ego vehicle localization 
        self.segment_index = None
        self.ego_vehicle_location = None
        self.ego_vehicle_waypoint = None
        # Route
        self.location_route = []
        self.waypoint_route = []
        self.flag_goal_reached = 0
        # Monitor
        self.n_min = 15

        # Monitor ROS Publishers
        self.lanes_monitor_pub = rospy.Publisher(
            "/t4ac/mapping/monitor/lanes", t4ac_msgs.msg.MonitorizedLanes,
            queue_size=1, latch=True)
        self.intersections_monitor_pub = rospy.Publisher(
            "/t4ac/mapping/monitor/intersections", 
            t4ac_msgs.msg.MonitorizedLanes, queue_size=1, latch=True)
        self.regElems_monitor_pub = rospy.Publisher(
            "/t4ac/mapping/monitor/regElems", 
            t4ac_msgs.msg.MonitorizedRegElem, queue_size=1, latch=True)

        # Monitor ROS Subscribers
        self.route_sub = rospy.Subscriber("/t4ac/planning/route",
        t4ac_msgs.msg.Path, self.route_callback)
        self.localization_sub = rospy.Subscriber("/t4ac/localization/pose", 
        nav_msgs.msg.Odometry, self.localization_callback)


    ### Route Callback ###
    def route_callback(self, path_route):
        """
        Callback function called when a route is published by path planner

        Args:
            route: Route of type nav_msgs/Path.msg

        Returns: 
            Set route_location and route_waypoint with new route published.
            Also check if vehicle is inside the route and in which segment.
        """
        # Generate route as a list of carla.Location()
        self.location_route = route_module.t4ac_path_to_location_route(path_route)

        # Generate route as a list of carla.Waypoint()
        self.waypoint_route = route_module.t4ac_path_to_waypoint_route(
            path_route, self.carla_map)

        # Check if ego_vehicle is inside the route
        if self.ego_vehicle_location is not None:
            is_in_route = route_module.is_in_route(self.waypoint_route, 
                self.ego_vehicle_location)
            if is_in_route == True:
                # Get segment_index 
                # (When route is calculated, segment index is supposed to be 0)
                self.segment_index = route_module.get_segment_index(
                    self.waypoint_route, self.ego_vehicle_location)
        else:
            is_in_route = False
            self.segment_index = None
        


    ### Ego_vehicle_position Callback ###
    def localization_callback(self, ego_vehicle_odometry):
        """
        Callback function called when a ego_vehicle position is published

        Args:
            ego_vehicle_odometry: Current local UTM position of the 
                vehicle of type nav_msgs/Odometry.msg

        Returns: 
            Set monitorization

        """
        # Get localization as carla.Location() object
        self.ego_vehicle_location = util_module.odom_to_location(
            ego_vehicle_odometry)

        # Get localization as carla.Waypoint() object
        self.ego_vehicle_waypoint = util_module.odom_to_waypoint(
            ego_vehicle_odometry, self.carla_map)
        
        # Calculate number of waypoints to monitorize depending on the velocity
        # 'n' is number of waypoints to monitorize in the frontside and 'n2' in
        # the backside
        n_max = calculus_module.braking_n_distance(ego_vehicle_odometry)
        if n_max < self.n_min: n_max = self.n_min
        n2_max = int(n_max/2)
        
        # Check conditions to monitorize
        # Check route is > 0
        if len(self.location_route) > 0:
            # Check if is inside the route
            is_in_route = route_module.is_in_route(self.waypoint_route[:],
                self.ego_vehicle_location)
            # Get in which segment
            if is_in_route == True:
                self.segment_index = route_module.get_segment_index(
                    self.waypoint_route[:], self.ego_vehicle_location)
            else:
                self.segment_index = None

        # If conditions are ok, monitorize
        if self.segment_index is not None and self.segment_index >= 0:              
            # Check if current segment is last segment of the route
            if (self.segment_index == len(self.waypoint_route) or 
                self.segment_index == len(self.waypoint_route)-1):
                if self.flag_goal_reached == 0:
                    print("Congratz, goal reached!")
                    self.flag_goal_reached = 1
            # Monitorize 
            else:
                # Set n front and n2 back waypoints to monitorize
                if (self.segment_index + n_max) < len(self.location_route):
                    n1 = n_max
                else: 
                    n1 = len(self.location_route) - self.segment_index
                if (self.segment_index - n2_max) < 0:
                    n2 = self.segment_index
                else:
                    n2 = n2_max

                # Calculate and publish monitorized lanes
                lanes = monitor_module.calculate_lanes(
                    self.ego_vehicle_waypoint, self.segment_index, 
                    self.waypoint_route[:], n1, n2)
                self.lanes_monitor_pub.publish(lanes)

                # Calculate and publish monitorized intersections
                intersection_lanes = monitor_module.calculate_intersections(
                    self.ego_vehicle_waypoint, self.waypoint_route[:], 
                    self.segment_index, n1)
                if intersection_lanes:
                    self.intersections_monitor_pub.publish(intersection_lanes)
                
                # Calculate and publish regulatory elements
                regElems = monitor_module.calculate_regElems(
                    self.ego_vehicle_waypoint, self.waypoint_route[:], 
                    self.segment_index, n1, 10, self.carla_map)
                if regElems:
                    self.regElems_monitor_pub.publish(regElems)




# @ADD 17/12/20: This is provisonal. Solve how to run every script
def map_monitor():

    rospy.init_node("map_monitor_node", anonymous=True)
    map_name = rospy.get_param('t4ac/map_name') 
    map_monitor = MapMonitor(map_name)    
    rospy.spin()

if __name__ == '__main__':
    try:
        map_monitor()
    except rospy.ROSInterruptException:
        pass

