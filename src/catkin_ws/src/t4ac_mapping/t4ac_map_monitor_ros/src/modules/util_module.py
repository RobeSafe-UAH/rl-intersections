"""
Different util functions for map monitor
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

def get_map(maps_path, map_name):
    """
    Method to get map object to be used by PythonAPI

    Args:
        map_name: Name of the map to work with

    Returns: 
        Map object to be used by PythonAPI
    """

    xodr_path = (maps_path + map_name + ".xodr")
    with open(xodr_path) as od_file:
        od_file_data = od_file.read()
    carla_map = carla.Map(map_name, od_file_data)
    return carla_map

def odom_to_location(odometry):
    """
    Converts nav_msgs/Odometry.msg to carla.Location()

    Args:
        odometry: Value of nav_msgs/Odometry.msg

    Returns: 
        location: Value of carla.Location()
    """
    location = carla.Location()
    location.x = odometry.pose.pose.position.x
    location.y = -odometry.pose.pose.position.y
    location.z = odometry.pose.pose.position.z
    return location

def odom_to_waypoint(odometry, carla_map):
    """
    Converts nav_msgs/Odometry.msg to carla.Waypoint()

    Args:
        odometry: Value of nav_msgs/Odometry.msg
        carla_map: Carla map object

    Returns: 
        waypoint: Value of carla.Waypoint()
    """
    location = odom_to_location(odometry)
    waypoint = carla_map.get_waypoint(location, project_to_road=True, 
        lane_type=carla.LaneType.Driving)
    return waypoint
