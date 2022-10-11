"""
Last edit: 17 / march / 2021 by Alejandro D.

This script gets topology waypoints and draw them on RVIZ
"""

import glob 
import os
import sys

import rospy
import visualization_msgs.msg
import geometry_msgs.msg

try:
    sys.path.append(glob.glob('/home/robesafe/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla
import networkx as nx

def get_carla_map(map_name):
    """
    Get map_name and return carla.Map() object

    Args:
        map_name: (str) Name of the map, i.e. 'Town01'

    Returns:
        carla_map: (carla.Map()) Map object to be used with PythonAPI
    """
    xodr_path = (
        "/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/maps/xodr/"
        + map_name + ".xodr")
    with open(xodr_path) as od_file:
        od_file_data = od_file.read()
    carla_map = carla.Map(map_name, od_file_data)
    
    return carla_map

def get_topology_markers(topology_waypoints):
    """
    Get a list of tuples from carla.Map.get_topology() and returns markers
    to visualize that topology on RVIZ

    Args:
        topology_waypoints: (list) List of tuples containing waypoints

    Returns:
        topology_markers: (visualization_msgs.msg.Marker()) Marker objetc to be
            visualized on RVIZ
    """
    topology_marker = visualization_msgs.msg.Marker()
    topology_marker.header.frame_id = "/map"
    topology_marker.header.stamp = rospy.Time.now()
    topology_marker.ns = "global_plan"
    topology_marker.action = visualization_msgs.msg.Marker.ADD
    topology_marker.pose.orientation.w = 1.0
    topology_marker.id = 1
    topology_marker.type = visualization_msgs.msg.Marker.POINTS
    topology_marker.color.r = 1
    topology_marker.color.g = 0
    topology_marker.color.b = 0
    topology_marker.color.a = 1.0
    topology_marker.scale.x = 0.4
    topology_marker.lifetime.secs = 0.2

    for waypoint_tuple in topology_waypoints:
            point = geometry_msgs.msg.Point()
            point.x = waypoint_tuple[0].transform.location.x
            point.y = -waypoint_tuple[0].transform.location.y
            point.z = waypoint_tuple[0].transform.location.z
            topology_marker.points.append(point)
            point = geometry_msgs.msg.Point()
            point.x = waypoint_tuple[1].transform.location.x
            point.y = -waypoint_tuple[1].transform.location.y
            point.z = waypoint_tuple[1].transform.location.z
            topology_marker.points.append(point)
            
    return topology_marker


# ROS Publisher
topology_waypoints_pub = rospy.Publisher(
            "/t4ac/path_planning/topology_waypoints", 
            visualization_msgs.msg.Marker, queue_size = 10)

# Init ROS node
rospy.init_node("global_plan_node")
rate = rospy.Rate(10)

carla_map = get_carla_map('campus_UAH')
topology_waypoints = carla_map.get_topology()
topology_marker = get_topology_markers(topology_waypoints)



while not rospy.is_shutdown():
    topology_waypoints_pub.publish(topology_marker)
    rate.sleep
