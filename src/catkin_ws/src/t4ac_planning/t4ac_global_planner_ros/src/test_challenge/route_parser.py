#!/usr/bin/env python3
"""
Last mod: Alejandro D. 07/10/2021

This script takes the routes_training.xml as the input and then returns
the desired route.
"""
import sys
import xml.etree.ElementTree as ET

sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer')
from map_utils.builder_classes import T4ac_Waypoint

def parse_route(route_id):
    """
    Returns the route indicated as a list of waypoint

    Args:
        - route_id : (int) id indicating the route number

    Returns: 
        - waypoint_route: (list) List of T4ac_Waypoint
    """

    route_training_path = "t4ac_planning_layer/t4ac_global_planner_ros/src/" \
                          "test_challenge/raw_routes_training.xml"
    mytree = ET.parse(route_training_path)
    myroot = mytree.getroot()

    waypoint_route = []

    for parsed_wp in myroot[int(route_id)]:
        waypoint = T4ac_Waypoint()
        waypoint.transform.location.x = parsed_wp.attrib['x']
        waypoint.transform.location.y = parsed_wp.attrib['y']
        waypoint.transform.location.z = parsed_wp.attrib['z']
        waypoint_route.append(waypoint)

    return waypoint_route

