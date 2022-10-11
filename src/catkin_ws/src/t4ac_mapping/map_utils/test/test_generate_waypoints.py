"""
Script for testing the method generate waypoints.
For testing it, generated waypoints are visualized on RVIZ.
"""

import sys 
import os
import glob

try:
    sys.path.append(glob.glob('/home/robesafe/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla
import rospy
import visualization_msgs.msg

sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/')
from t4ac_map_monitor_ros.src.modules import markers_module
from t4ac_map_monitor_ros.src.modules import monitor_classes
from map_parser import map_parser
from map_utils import generate_waypoints

# ROS Publishers
waypoints_visualizator_pub = rospy.Publisher(
    "/mapping/debug/waypoints", visualization_msgs.msg.Marker,
    queue_size = 10)

# Map xodr
root_path = "/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/maps/xodr/"
town_name = "carla_0910/Town01.xodr"
map_path = root_path + town_name
with open (map_path, "r") as myfile:
    map_string = myfile.read()

# T4AC Map and Waypoints
t4ac_map_object = map_parser.MapParser(map_string, 1)
t4ac_waypoints = generate_waypoints(t4ac_map_object.roads, 0.1)

def get_nodes(waypoints):
    """
    Returns the points in Node3D format to visualize it on RVIZ
    """

    nodes = []

    # Waypoints to Node3D
    for waypoint in waypoints:
        node = monitor_classes.Node3D()
        node.x = waypoint.transform.location.x
        node.y = -waypoint.transform.location.y
        node.z = waypoint.transform.location.z
        nodes.append(node)

    return nodes

def draw_waypoints():
    # Init node
    rospy.init_node("Debug_Generate_Waypoints", anonymous=True)
    rate = rospy.Rate(10)

    routeNodes = get_nodes(t4ac_waypoints)

    waypoints_marker = markers_module.get_nodes(
        routeNodes, [0,0,1], "2", 8, 0.05, 1, 0)

    
    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker)
        rate.sleep()


draw_waypoints()