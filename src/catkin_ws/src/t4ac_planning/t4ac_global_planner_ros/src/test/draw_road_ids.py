"""
Last edit: 13 / october / 2021 by Alejandro D.

This script draws in rviz waypoints centered in every lane at a given
distance and its road id
"""

import glob 
import os
import sys

import rospy
import visualization_msgs.msg
import geometry_msgs.msg

try:
    sys.path.append(glob.glob('/workspace/CARLA/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla

def get_carla_map(map_name):
    """
    Get map_name and return carla.Map() object

    Args:
        map_name: (str) Name of the map, i.e. 'Town01'

    Returns:
        carla_map: (carla.Map()) Map object to be used with PythonAPI
    """
    xodr_path = (
        "/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/maps/xodr/"
        + map_name + ".xodr")
    with open(xodr_path) as od_file:
        od_file_data = od_file.read()
    carla_map = carla.Map(map_name, od_file_data)
    
    return carla_map

def get_road_id_markers(road_waypoints):
    """
    Get a list of waypoints with a certain distance between them for every 
    lane and centered inside of it. 
    Returns a marker to visualized the road id of every waypoint in RVIZ.

    Args:
        road_waypoints: (list) List containing waypoints

    Returns:
        road_id_markers: (visualization_msgs.msg.Marker()) List of marker 
        object to be visualized on RVIZ
    """
    road_id_markers = visualization_msgs.msg.MarkerArray()

    cnt = 0

    for waypoint in road_waypoints:
        cnt += 1
        # print("cnt: ", cnt)
        road_id_marker = visualization_msgs.msg.Marker()
        road_id_marker.header.frame_id = "map"
        road_id_marker.header.stamp = rospy.Time.now()
        road_id_marker.ns = "global_plan"
        road_id_marker.action = visualization_msgs.msg.Marker.ADD
        road_id_marker.pose.orientation.w = 1.0
        road_id_marker.id = cnt
        road_id_marker.type = visualization_msgs.msg.Marker.TEXT_VIEW_FACING
        road_id_marker.color.r = 1
        road_id_marker.color.g = 0
        road_id_marker.color.b = 0
        road_id_marker.color.a = 1.0
        road_id_marker.scale.z = 1.5
        road_id_marker.lifetime = rospy.Duration(0)
        road_id_marker.pose.position.x = waypoint.transform.location.x
        road_id_marker.pose.position.y = -waypoint.transform.location.y
        road_id_marker.pose.position.z = waypoint.transform.location.z
        road_id_marker.text = str(waypoint.road_id)
        road_id_markers.markers.append(road_id_marker)
            
    return road_id_markers

# ROS Publisher
road_ids_pub = rospy.Publisher(
            "/t4ac/path_planning/road_ids", 
            visualization_msgs.msg.MarkerArray, queue_size = 10)

# Init ROS node
rospy.init_node("global_plan_node")
rate = rospy.Rate(10)

carla_map = get_carla_map('carla_0910/Town03')
road_waypoints = carla_map.generate_waypoints(3)
road_id_markers = get_road_id_markers(road_waypoints)



while not rospy.is_shutdown():
    #for marker in road_id_markers: road_ids_pub.publish(marker)
    road_ids_pub.publish(road_id_markers)
    rate.sleep