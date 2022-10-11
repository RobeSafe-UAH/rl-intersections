"""
Script for testing the correct yaw parameter of waypoints generated using
the map_utils. 
For testing it, yaw of generated waypoints are compared with carla waypoints.
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
from builder_classes import T4ac_Location 

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

# Testing location value
location_value = (-2.03, -36.07, 0)

# T4AC Map and Waypoint
t4ac_location = T4ac_Location()
t4ac_location.x = location_value[0]
t4ac_location.y = location_value[1]
t4ac_location.z = location_value[2]
t4ac_map_object = map_parser.MapParser(map_string, 1)
t4ac_waypoint = t4ac_map_object.get_waypoint(t4ac_location)

#CARLA Map and Waypoint
carla_location = carla.Location()
carla_location.x = location_value[0]
carla_location.y = -location_value[1]
carla_location.z = location_value[2]
carla_map_object = carla.Map("Town01", map_string)
carla_waypoint = carla_map_object.get_waypoint(carla_location,project_to_road=True, lane_type=carla.LaneType.Driving)

# Carla s0 point road 13 lane 1
carla_s0_waypoint = carla_map_object.get_waypoint_xodr(13, 1, 0) # (-2.02, 9.95, 0.0)

# T4AC equivalent 's0' waypoint
t4ac_s0_location = T4ac_Location()
t4ac_s0_location.x = -2.02
t4ac_s0_location.y = 9.95
t4ac_s0_location.z = 0.0
t4ac_s0_waypoint = t4ac_map_object.get_waypoint(t4ac_location)

print("Hola")

def get_nodes():
    """
    Returns the points in Node3D format to visualize it on RVIZ
    """

    nodes = []

    # node = monitor_classes.Node3D()
    # node.x = t4ac_waypoint.transform.location.x
    # node.y = -t4ac_waypoint.transform.location.y
    # node.z = t4ac_waypoint.transform.location.z
    # nodes.append(node)

    node = monitor_classes.Node3D()
    node.x = carla_waypoint.transform.location.x
    node.y = carla_waypoint.transform.location.y
    node.z = carla_waypoint.transform.location.z
    nodes.append(node)

    # Carla s0 waypoint 
    # node = monitor_classes.Node3D()
    # node.x = carla_s0_waypoint.transform.location.x
    # node.y = carla_s0_waypoint.transform.location.y
    # node.z = carla_s0_waypoint.transform.location.z
    # nodes.append(node)

    # T4AC equivalent 's0' waypoint
    # node = monitor_classes.Node3D()
    # node.x = t4ac_s0_waypoint.transform.location.x
    # node.y = t4ac_s0_waypoint.transform.location.y
    # node.z = t4ac_s0_waypoint.transform.location.z
    # nodes.append(node)

    # s0 explicit location
    # node = monitor_classes.Node3D()
    # node.x = -2.02
    # node.y = 9.95
    # node.z = 0.0
    # nodes.append(node)

    return nodes

def draw_waypoints():
    # Init node
    rospy.init_node("Debug_Yaw_Waypoint", anonymous=True)
    rate = rospy.Rate(10)

    routeNodes = get_nodes()

    waypoints_marker = markers_module.get_nodes(
        routeNodes, [0,0,1], "2", 8, 1.5, 1, 0)

    
    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker)
        rate.sleep()


draw_waypoints()