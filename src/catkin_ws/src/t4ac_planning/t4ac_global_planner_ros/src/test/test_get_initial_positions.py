"""
Script to test the functionallity of the functions:
    >> get_initial_position(road, lane, side)
    >> get_inverted_initial_position(..) 
From lane_graph_topology script

To check the proper behaviour of the function, the positions
obtained will be represented on rviz, so first is needed to call 
the map_visualizator script.
"""
import sys 
import os
import glob
import math 

import rospy
import visualization_msgs.msg

sys.path.insert(0, '/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/global_planner/t4ac_planner')
import map_classes
import map_parser
sys.path.insert(0, '/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/t4ac_map_monitor/src')
from modules import markers_module
from modules import util_module
from modules import monitor_module
from modules import monitor_classes
import aux_functions

# ROS Publishers
waypoints_visualizator_pub = rospy.Publisher(
    "/mapping_planning/debug/waypoints", visualization_msgs.msg.Marker,
    queue_size = 10)

def get_point_in_line(x, y, z, s, heading):
    """
    Get a T4ac_Location into a line geometry given an 's' distance
    """
    
    location = map_classes.T4ac_Location()
    location.x = x
    location.y = y
    location.z = z

    location.x += (s * math.cos(heading)) #+ (t * math.sin(heading))
    location.y += (s * math.sin(heading)) #+ (t * math.cos(heading))  

    return location

def get_point_in_arc(x, y, z, s, curvature, heading):
    """
    Get a T4ac_Location into an arc geometry given an 's' distance
    """
    location = map_classes.T4ac_Location()
    location.x = x
    location.y = y
    location.z = z
    radius = 1.0 / curvature
    pi_half = math.pi / 2

    location.x += radius * math.cos(heading + pi_half)     
    location.y += radius * math.sin(heading + pi_half)
    heading += s*curvature
    location.x -= radius * math.cos(heading + pi_half)    
    location.y -= radius * math.sin(heading + pi_half)

    return location

def get_initial_position(road, lane, side):
    """
    Returns initial position of the road centered at the lane

    Args:
        road: (T4ac_Road())
        lane: (T4ac_Lane())
        side: (str) left or right 

    Returns: 
        location: (T4ac_Location()) 
    """
    # First get offset from the center of the lane to the center of the road
    lane_width_offset = 0
    if (side == 'left'):
        for i in range(0, abs(lane.id)):
            # -1-i because the list must be checked inside out
            lane_width_offset += road.lanes.laneSections[0].left[-1-i].width[0].a
        # total lane offset for lane origin
        lane_offset = lane_width_offset - lane.width[0].a/2 + road.lanes.laneOffset[0].a
    elif (side == 'right'):
        for i in range(0, abs(lane.id)):
            lane_width_offset += road.lanes.laneSections[0].right[i].width[0].a
        # total lane offset for lane origin
        lane_offset = -lane_width_offset + lane.width[0].a/2 + road.lanes.laneOffset[0].a

    location = get_point_in_line(road.planView[0].x,
                                 road.planView[0].y,
                                 0,
                                 lane_offset,
                                 road.planView[0].hdg + math.pi/2)
    location.x = round(location.x, 3)
    location.y = round(location.y, 3)
    location.z = round(location.z, 3)

    return location 

def get_inverted_initial_position(road, lane, side):
    """
    Return last position of the road. It can be used to get the origin 
    position for inverted roads

    Args:
        road: (T4ac_Road())
        lane: (T4ac_Lane())
        side: (str) left or right 

    Returns: 
        location: (T4ac_Location()) 
    """
    # First get offset from the center of the lane to the center of the road
    lane_width_offset = 0
    if (side == 'left'):
        for i in range(0, abs(lane.id)):
            # -1-i because the list must be checked inside out
            lane_width_offset += road.lanes.laneSections[0].left[-1-i].width[0].a
        # total lane offset for lane origin
        lane_offset = lane_width_offset - lane.width[0].a/2 + road.lanes.laneOffset[0].a
    elif (side == 'right'):
        for i in range(0, abs(lane.id)):
            lane_width_offset += road.lanes.laneSections[0].right[i].width[0].a
        # total lane offset for lane origin
        lane_offset = -lane_width_offset + lane.width[0].a/2 + road.lanes.laneOffset[0].a

    # The get location centered on the road
    if (road.planView[-1].type == "line"):
        location_aux = get_point_in_line(road.planView[-1].x,
                                     road.planView[-1].y,
                                     0,
                                     road.planView[-1].length,
                                     road.planView[-1].hdg,
                                     )
    elif (road.planView[-1].type == "arc"):
        location_aux = get_point_in_arc(road.planView[-1].x,
                                    road.planView[-1].y,
                                    0,
                                    road.planView[-1].length,
                                    road.planView[-1].curvature,
                                    road.planView[-1].hdg,
                                    )
    # Apply offset
    location = get_point_in_line(location_aux.x,
                                 location_aux.y,
                                 0,
                                 lane_offset,
                                 road.planView[-1].hdg + math.pi/2)

    # Round value 
    location.x = round(location.x, 3)
    location.y = round(location.y, 3)
    location.z = round(location.z, 3)

    return location

def draw_waypoints():
    # Init node
    rospy.init_node("debug_get_position_node", anonymous=True)
    rate = rospy.Rate(10)

    # Get the map 
    map_object = map_parser.MapParser('campus_UAH')

    # Get road and lane object 
    road = aux_functions.get_road(map_object.roads, 2, map_object.road_ids)
    lane = aux_functions.get_lane(road, 2)

    # Get initial position to test
    initial_position = get_inverted_initial_position(road, lane, 'left')

    # Create list of nodes to send to the marker
    nodes = []
    node = monitor_classes.Node3D()
    node.x = initial_position.x
    node.y = -initial_position.y
    node.z = initial_position.z
    nodes.append(node)

    # Get marker
    waypoints_marker_1 = markers_module.get_nodes(
        nodes, [1,0,0], "1", 8, 0.5, 1, 0.2)

    # Publish nodes and visualize them on rviz
    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker_1)
        rate.sleep()

if __name__ == '__main__':
    draw_waypoints()
