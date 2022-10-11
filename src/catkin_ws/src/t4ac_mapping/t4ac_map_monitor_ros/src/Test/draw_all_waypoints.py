"""
Draw waypoints in every driving lane of every road given a distance
"""

import sys 
import os
import glob

import rospy
import visualization_msgs.msg
        
sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/')
from t4ac_map_monitor_ros.src.modules import markers_module
from t4ac_map_monitor_ros.src.modules import util_module
from t4ac_map_monitor_ros.src.modules import monitor_module
from t4ac_map_monitor_ros.src.modules import monitor_classes
from map_utils import  map_utils
from map_parser.map_parser import MapParser


sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_planning_layer/')
from t4ac_global_planner_ros.src.test_challenge.route_parser import parse_route


# ROS Publishers
waypoints_visualizator_pub = rospy.Publisher(
    "/mapping_planning/debug/waypoints", visualization_msgs.msg.Marker,
    queue_size = 10)


def calculate_all_waypoints(map_name):
    """
    """
    map_object = MapParser(map_name, 0)
    waypoints = map_utils.generate_waypoints(map_object.roads, 2)

    nodes = []

    for waypoint in waypoints:
        node = monitor_classes.Node3D()
        node.x = float(waypoint.transform.location.x)
        node.y = -float(waypoint.transform.location.y)
        node.z = float(waypoint.transform.location.z)
        nodes.append(node)

    return nodes


def draw_waypoints():
    # Init node
    rospy.init_node("debug_way_node", anonymous=True)
    rate = rospy.Rate(10)

    data_0 = calculate_all_waypoints('Town04')
    waypoints_marker_0 = markers_module.get_nodes(
        data_0, [0,1,0], "3", 8, 0.5, 0, 0)


    
    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker_0)
        rate.sleep()

if __name__ == '__main__':
    draw_waypoints()
