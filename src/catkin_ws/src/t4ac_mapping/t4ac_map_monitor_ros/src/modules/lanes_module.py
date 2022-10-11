"""
Module to implement some lane object calculus
"""

import math
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

from . import monitor_classes

def calculate_lane(central_way):
    """
    Create a lane object using a central way of waypoints and calculating 
    waypoints at both sides.

    Args:
        central_way: List of waypoints centered in the lane to calculate

    Returns: 
        lane: Lane object definied by waypoints at both sides of the lane
    """
    lane = monitor_classes.Lane()  
    lane.central_way = central_way
    for i in range(len(central_way)):
        central_wp = central_way[i]
        node_right = monitor_classes.Node3D()
        node_left = monitor_classes.Node3D()
        yaw = central_wp.transform.rotation.yaw
        alpha = 90.0-yaw
        alpha_radians = math.radians(alpha)
        distance = central_wp.lane_width/2

        node_right.x = (central_wp.transform.location.x 
                        + math.cos(alpha_radians)*distance)
        node_right.y = (central_wp.transform.location.y 
                        - math.sin(alpha_radians)*distance)
        node_right.z = central_wp.transform.location.z
        lane.right_way.append(node_right)

        node_left.x = (central_wp.transform.location.x 
                       - math.cos(alpha_radians)*distance)
        node_left.y = (central_wp.transform.location.y 
                       + math.sin(alpha_radians)*distance)
        node_left.z = central_wp.transform.location.z
        lane.left_way.append(node_left)
    return lane

def calculate_contour(lane, start_index = 0, end_index = -1):
    """
    Receive a lane and get contour of the segment of that lane defined by an
    initial and a final index. If start or end index are not given, contour is
    calculated for complete lane. 

    Args:
        lane: monitor_classes.Lane object of the lane to be checked
        start_index: Initial index where the segment of the lane starts
        end_index: Final index where the segment of the lane ends

    Returns:
        contour: List of Node2D(x,y) defining the contour of the segment. This contour 
            can be used to check if a position is inside a lane with the function
            inside_polygon(position, polygon)
    """
    if end_index == -1: end_index = len(lane.right_way)
    contour = []
    for i in range (0,len(lane.left_way)):
        p_2D = monitor_classes.Node2D()
        p_2D.x = lane.left_way[i].x
        p_2D.y = lane.left_way[i].y         
        contour.append(p_2D)
    for i in range(0,len(lane.right_way)):
        p_2D = monitor_classes.Node2D()
        p_2D.x = lane.right_way[len(lane.right_way)-i-1].x
        p_2D.y = lane.right_way[len(lane.right_way)-i-1].y
        contour.append(p_2D)
    return contour
   
def calculate_lanes(current_waypoint, segment_index, waypoint_route, n1, n2):
    """
    Calculate lanes to monitorize in current route from current position to
    'n' waypoint in front and 'n2' in back. Also monitorize right and left
    lanes if lane change is allowed.

    Args:
        current_waypoint: Current position of ego_vehicle as carla.Waypoint
        segment_index: Index to locate in which segment of the route is the
            ego_vehicle
        waypoint_route: Route as a list of carla.Waypoint
        n1: Number of waypoints to monitorize in front (current lane)
        n2: Number of waypoints to monitorize in back (back lane)

    Returns:
        lanes: List of monitor_classes.Lane object for current, back, right and
        left lanes.
    """
    lanes = []
    # Current (front) lane
    current_central_way = []
    # current_central_way.append(current_waypoint)
    for i in range(n1):
        current_central_waypoint = waypoint_route[segment_index + i]
        current_central_way.append(current_central_waypoint)
    current_lane = calculate_lane(current_central_way)
    current_lane.role = "current" 
    lanes.append(current_lane)

    # Back lane
    back_central_way = []
    for i in range(n2):
        back_central_waypoint = waypoint_route[segment_index - n2 + i]
        back_central_way.append(back_central_waypoint)
    back_lane = calculate_lane(back_central_way)
    back_lane.role = "back"
    lanes.append(back_lane)

    # Right lane
    right_central_way = []
    for waypoint in current_central_way:
        if (waypoint.lane_change == carla.libcarla.LaneChange.Right or 
            waypoint.lane_change == carla.libcarla.LaneChange.Both):
            right_central_waypoint = waypoint.get_right_lane()
            if right_central_waypoint is not None:
               right_central_way.append(right_central_waypoint)
    right_lane = calculate_lane(right_central_way)
    right_lane.role = "right"
    lanes.append(right_lane)


    # Left lane
    left_central_way = []
    for waypoint in current_central_way:
        if (waypoint.lane_change == carla.libcarla.LaneChange.Left or 
            waypoint.lane_change == carla.libcarla.LaneChange.Both):
            left_central_waypoint = waypoint.get_left_lane()
            if left_central_waypoint is not None:
                left_central_way.append(left_central_waypoint)
    left_lane = calculate_lane(left_central_way)
    left_lane.role = "left"
    lanes.append(left_lane)

    return lanes
