"""
Module to implemente some route calculus
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

from . import lanes_module
from . import calculus_module

def path_to_location_route(path_route):
    """
    Transform a route of nav_msgs/Path.msg format into a route of 
    carla.Location() format

    Args:
        path_route: List of nav_msgs/Path.msg

    Returns: 
        Route as a List of carla.Location
    """
    location_route = []
    for path_value in path_route.poses:
        location_value = carla.Location()
        location_value.x = path_value.pose.position.x
        location_value.y = -path_value.pose.position.y
        location_value.z = path_value.pose.position.z
        location_route.append(location_value)
    return location_route

def path_to_waypoint_route(path_route, carla_map):
    """
    Transform a route of nav_msgs/Path.msg format into a route of 
    carla.Waypoint() format

    Args:
        path_route: List of nav_msgs/Path.msg
        carla_map: Carla map object is needed by WaypointAPI to generate
        waypoints

    Returns: 
        Route as a List of carla.Waypoint
    """
    location_route = path_to_location_route(path_route)
    waypoint_route = []
    for location_value in location_route:
        waypoint_value = carla_map.get_waypoint(
                location = location_value, 
                project_to_road = True,    
                lane_type = carla.LaneType.Driving)        
        waypoint_route.append(waypoint_value)
    return waypoint_route

def t4ac_path_to_location_route(path_route):
    """
    Transform a route of nav_msgs/Path.msg format into a route of 
    carla.Location() format

    Args:
        path_route: List of t4ac_msgs/Path.msg

    Returns: 
        Route as a List of carla.Location
    """
    location_route = []
    for waypoint in path_route.waypoints:
        location_value = carla.Location()
        location_value.x = waypoint.transform.location.x
        location_value.y = waypoint.transform.location.y
        location_value.z = waypoint.transform.location.z
        location_route.append(location_value)
    return location_route

def t4ac_path_to_waypoint_route(path_route, carla_map):
    """
    Transform a route of t4ac_msgs/Path.msg format into a route of 
    carla.Waypoint() format

    Args:
        path_route: List of t4ac_msgs/Path.msg
        carla_map: Carla map object is needed by WaypointAPI to generate
        waypoints

    Returns: 
        Route as a List of carla.Waypoint
    """
    location_route = t4ac_path_to_location_route(path_route)
    waypoint_route = []
    for location_value in location_route:
        waypoint_value = carla_map.get_waypoint(
                location = location_value, 
                project_to_road = True,    
                lane_type = carla.LaneType.Driving)        
        waypoint_route.append(waypoint_value)
    return waypoint_route

def is_in_route(waypoint_route, location):
    """
    Check if location is inside the path route

    Args:
        waypoint_route: Route of the vehicle as a list of carla.Waypoint()
        location: Current location(x,y,z) of the vehicle

    Returns:
        Returns True if the vehicle is inside the route and False if not
    """
    # Calculate the global waypoint route with and extra waypoint before
    # the initial waypoint. This way if the vehicle is at the init of the 
    # route, will also be considered inside.
    # WaypointAPI returns a list of waypoints in case of intersection. As we
    # only need one, take first of the list.
    # Defined distance to get previous extra waypoint is 3 meters
    waypoint_options = waypoint_route[0].previous(3)
    extra_waypoint = waypoint_options[0]
    waypoint_route.insert(0, extra_waypoint)

    # Define the complete route as one lane, to get its contour and check
    # if vehicle is inside the route
    route_lane = lanes_module.calculate_lane(waypoint_route)
    route_contour = lanes_module.calculate_contour(route_lane)
    
    return calculus_module.inside_polygon(location, route_contour)
     
def get_segment_index(waypoint_route, location):
    """
    Get index of the segment where the ego_vehicle is in the route. A segment
    is defined between every two waypoints of the route.

    Args:
        waypoint_route: Route of the vehicle as a list of carla.Waypoint()
        location: Current location(x,y,z) of the vehicle

        Returns:
            Return int value index (i) of the segment of the route where the
            ego_vehicle is. If there is no match with any index return -1.
    """
    # Calculate the global waypoint route with and extra waypoint before
    # the initial waypoint. This way if the vehicle is at the init of the 
    # route, will also be considered inside.
    waypoint_options = waypoint_route[0].previous(3)
    extra_waypoint = waypoint_options[0]
    waypoint_route[0] = extra_waypoint

    # Check if is inside for every segment of the route
    for i in range(0, len(waypoint_route)-1):
        segment_central_way = [waypoint_route[i], waypoint_route[i+1]]
        segment = lanes_module.calculate_lane(segment_central_way)
        contour = lanes_module.calculate_contour(segment)
        is_in_segment = calculus_module.inside_polygon(location, contour)
        if is_in_segment == True:
            return i
            
    return -1



