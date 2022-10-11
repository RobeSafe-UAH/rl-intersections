"""
Module to implement juntions (intersections) calculus
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

def calculate_intersections(current_waypoint, waypoint_route, segment_index, n1):
    """
    Calculate intersection lanes in the current monitorized lane

    Args:
        current_waypoint: (carla.Waypoint) Current position of ego_vehicle 
        waypoint_route: (list) Route as a list of carla.Waypoint
        segment_index: (int) Index to locate in which segment of the route is the
            ego_vehicle
        n1: (int) Number of waypoints to monitorize in front (current lane)
    """
    current_way = waypoint_route[segment_index : segment_index + n1]
    junctions = get_junctions(current_way)

    if junctions:
        intersection_lanes = check_junctions(junctions, waypoint_route[:])
        return intersection_lanes
    else:
        return False


def get_junctions(current_way):
    """
    In a list of waypoints, check for every waypoint if is in a junction

    Args:
        current_way: (list) List of waypoints centered at the current lane

    Returns:
        junctions: (list) List of carla.Junctions in the part of the route
            analyzed
    """
    junctions = []
    junctions_id = []
    for waypoint in current_way:
        if waypoint.is_junction == True:
            junction = waypoint.get_junction()
            junction_id = junction.id
            if junction_id not in junctions_id:
                junctions.append(junction)
                junctions_id.append(junction_id)

    return junctions
        
def check_junctions(junctions, waypoint_route):
    """
    Receive a list of junction a calculate for each junction its inteserction
    lanes with the route.
    Type of intersections are:
        - merge
        - split
        - cross

    Args:
        junctions: (list) List of carla.Junction
        waypoint_route: (list) Route as a list of carla.Waypoint

    Returns:
        intersection_lanes: (list) List of lanes that are an intersection of
            the current lane.
    """
    intersection_lanes = []
    junctions_ways = []

    for junction in junctions:
        junction_ways = calculate_junction_ways(junction)
        #junctions_ways += junction_ways

        main_way, junction_ways = get_main_way(junction_ways[:], waypoint_route[:])
        if (main_way):
            main_lane = lanes_module.calculate_lane(main_way)
            main_contour = lanes_module.calculate_contour(main_lane)

            for way in junction_ways:
                way_role = classify_way(way, main_contour)
                if way_role == "split" or way_role == "merge" or way_role == "cross":
                    intersection_lane = lanes_module.calculate_lane(way)
                    intersection_lane.role = way_role
                    intersection_lanes.append(intersection_lane)
    return intersection_lanes

def get_main_way(junction_ways, waypoint_route):
    """
    Receive a list of ways and separate main way from rest of junction ways.

    Args:
        junction_ways: (list) List of ways inside monitorized junctions
        waypoint_route: (list) Route as a list of carla.Waypoint

    Returns: 
        main_way: (list) Way of the current way of the route in the junction.
            Add an extra waypoint at the begining and another at the end, to 
            make sure when check other waypoints inside this contour.
        ways: (list) Other ways of the junction that are not main way
    """
    ways = []
    main_way = None
    route_lane = lanes_module.calculate_lane(waypoint_route[:])
    route_contour = lanes_module.calculate_contour(route_lane)
    for way in junction_ways:
        if (calculus_module.inside_polygon(
                way[1].transform.location, route_contour) and 
            calculus_module.inside_polygon(
                way[-2].transform.location, route_contour)):
                main_way = way[:]
                waypoint_options_previous = main_way[0].previous(3)
                extra_waypoint = waypoint_options_previous[0]
                main_way.insert(0, extra_waypoint)
                waypoint_options_next = main_way[-1].next(3)
                extra_waypoint = waypoint_options_next[0]
                main_way.append(extra_waypoint)

        else:
            ways.append(way)

    return main_way, ways
    
def classify_way(way, contour):
    """
    Classify the role of a way with the current lane. A way can be:
    - merge (first waypoint is outside, last waypoint is inside the lane)
    - split (first waypoint is inside, last waypoint is outside the lane)
    - cross (first and last waypoint are outside, but some others are inside)
    - none (the way is not any type of intersection with the current lane)
    with the current lane.

    Args:
        way: (list) Way to check
        contour: (list) Waypoints defining the contour of the 
            lane to check if the way is inside

    Retuns:
        way_role: (str) Intersection role of the way
    """
    way_role = "none"
    if (calculus_module.inside_polygon(
            way[0].transform.location, contour) and
        calculus_module.inside_polygon(
            way[-1].transform.location, contour)):
        way_role = "current"
    elif (calculus_module.inside_polygon(
            way[0].transform.location, contour) and not
        calculus_module.inside_polygon(
            way[-1].transform.location, contour)):
        way_role = "split"
    elif (calculus_module.inside_polygon(
            way[-1].transform.location, contour) and not
        calculus_module.inside_polygon(
            way[0].transform.location, contour)):
        way_role = "merge"
    elif ((calculus_module.inside_polygon(
            way[0].transform.location, contour) or
        calculus_module.inside_polygon(
            way[-1].transform.location, contour)) == 0):
        for i in range(1, len(way)-1):
            if calculus_module.inside_polygon(way[i].transform.location, 
                contour):
                way_role = "cross"
                break

    return way_role
        
        





def calculate_junction_ways(junction):
    """
    Get junction ways (way is a list of waypoints centered in the lane)
    given a specific junction

    Args:
        junction: (carla.Junction)

    Returns:
        junctions_ways: (list) List of ways in the junction (one way for each 
        possible lane inside the junction)
    """
    junction_ways = []
    junction_topology = junction.get_waypoints(carla.LaneType.Driving)
    for way_topology in junction_topology:
        way = way_topology[0].next_until_lane_end(1)
        junction_ways.append(way)
    return junction_ways





