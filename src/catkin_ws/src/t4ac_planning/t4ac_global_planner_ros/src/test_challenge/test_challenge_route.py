#!/usr/bin/env python3
"""
Last mod: Alejandro D. 07/10/2021

Test for the global waypoint planner based on HD Map for the 
Carla Challenge 2021. 

Inputs are:
    - (int) Route id  
    - Hd Map

This scripts parses the route from an xml and publish the waypoint
route as a marker to visualize it on RVIZ

The only values that may be changed are the route_id and the town_name

"""
import sys
import os
import glob

sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_planning_layer/')
sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/')

try:
    sys.path.append(glob.glob('/workspace/CARLA/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla
import rospy
import visualization_msgs.msg
        
from t4ac_map_monitor_ros.src.modules import markers_module
from t4ac_map_monitor_ros.src.modules import util_module
from t4ac_map_monitor_ros.src.modules import monitor_module
from t4ac_map_monitor_ros.src.modules import monitor_classes
from map_utils import map_utils  

from t4ac_global_planner_ros.src.lane_waypoint_planner import LaneWaypointPlanner
from t4ac_global_planner_ros.src.modules import planning_utils
from route_parser import parse_route

# ROS Publishers
waypoints_visualizator_pub = rospy.Publisher(
    "/mapping_planning/debug/waypoints", visualization_msgs.msg.Marker,
    queue_size = 10)


def get_route():
    ### Global parameters ###
    # Distance between each waypoint in the route
    distance = 2
    root_path = "/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/maps/xodr/"
    town_name = "carla_0910/Town01.xodr"
    map_path = root_path + town_name
    with open (map_path, "r") as myfile:
        map_string = myfile.read()
    route_id = 0

    ### Parse input data ###
    parsed_waypoint_route = parse_route(route_id)
    tuple_route = ([((float(waypoint.transform.location.x)), 
                    (float(waypoint.transform.location.y)), 
                    (float(waypoint.transform.location.z))) 
                    for waypoint in parsed_waypoint_route])


    ### Calculate complete waypoint route ###
    laneWaypointPlanner = LaneWaypointPlanner(map_string, 1)
    waypoint_route = laneWaypointPlanner.calculate_waypoint_route_multiple(
        1, tuple_route, 0, "time")

    return waypoint_route


def get_routeNodes(route):
    """
    Returns the route in Node3D format to visualize it on RVIZ
    """

    nodes = []

    for waypoint in route:
        node = monitor_classes.Node3D()
        node.x = waypoint.transform.location.x
        node.y = -waypoint.transform.location.y
        node.z = waypoint.transform.location.z
        nodes.append(node)
        

    return nodes


# print(len(complete_waypoint_route))
# print(len(waypoint_route_filtered))

### Print for debugging ###
# for waypoint in complete_waypoint_route:
#     print("node = monitor_classes.Node3D()\n"
#           "node.x = {}\n"
#           "node.y = {}\n"
#           "node.z = 0\n"
#           "nodes.append(node)\n"
#           .format(waypoint.transform.location.x, -waypoint.transform.location.y)
#          )

def draw_waypoints():
    # Init node
    rospy.init_node("Debug_ChallengeRoute_Node", anonymous=True)
    rate = rospy.Rate(10)

    routeWaypoints = get_route()
    routeNodes = get_routeNodes(routeWaypoints)

    waypoints_marker = markers_module.get_nodes(
        routeNodes, [0,0,1], "2", 8, 1.5, 1, 0)

    
    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker)
        rate.sleep()

if __name__ == '__main__':
    draw_waypoints()