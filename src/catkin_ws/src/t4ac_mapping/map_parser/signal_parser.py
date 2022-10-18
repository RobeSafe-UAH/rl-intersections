"""
Provisional parser module for providing signals information in 
Carla Challenge 2021 using XODR information. 

Main function of this module is:
    * parse_signals(map_data, map_flag)

That returns a list of signal dicts
"""

import sys
import os
import math
import git

repo = git.Repo('.', search_parent_directories=True)
BASE_DIR = repo.working_tree_dir
sys.path.append(BASE_DIR)

from src.catkin_ws.src.t4ac_mapping.map_parser.map_parser import map_utils
from src.catkin_ws.src.t4ac_mapping.map_utils.map_utils import map_utils

def parse_signals(map_data, map_flag):
    """
    """
    map_object = map_parser.MapParser(map_data, map_flag)
    signals = []

    for road in map_object.roads:
        if len(road.signals.signal) > 0:
            for signal in road.signals.signal:
                parsed_signal = {}
                parsed_signal['name'] = signal.name
                parsed_signal['id'] = int(signal.id)
                parsed_signal['road'] = int(road.id)
                parsed_signal_xyz, heading = calculate_signal_xyz(
                    road, float(signal.s), float(signal.t), 
                    float(signal.hOffset), float(signal.height), 
                    signal.orientation)
                parsed_signal['x'] = parsed_signal_xyz.x
                parsed_signal['y'] = parsed_signal_xyz.y
                parsed_signal['z'] = parsed_signal_xyz.z
                parsed_signal['yaw'] = heading
                signals.append(parsed_signal)
    return signals

def calculate_signal_xyz(road, s, t, hOffset, height, orientation):
    """
    """
    # Locate in which geometry is s of the signal
    geometry_index = 0
    length = 0
    for i in range(0, len(road.planView)):
        # if (road.planView[i].length > length):
        #     geometry_index = i
        #     length = road.planView[i].length
        #     print
        

        if s > road.planView[i].s:
            geometry_index = i
        else:
            break

    i = geometry_index
    s_distance = s - road.planView[i].s
    heading = road.planView[i].hdg + hOffset

    # Apply 't' traslation
    # if orientation == '-':
    #     # pass
    #     heading = road.planView[i].hdg + hOffset
    # elif orientation == '+':
    #     # t = -t
    #     heading = road.planView[i].hdg - hOffset

    

    t_xyz = map_utils.get_point_in_line(
        road.planView[i].x, road.planView[i].y, 0, t, road.planView[i].hdg + math.pi/2)
    
    # Apply 's' traslation
    if (road.planView[i].type == "line"):
        signal_xyz = map_utils.get_point_in_line(
            t_xyz.x, t_xyz.y, height, s_distance, road.planView[i].hdg)

    elif (road.planView[i].type == "arc"):
        # heading += math.pi/2
        radius = 1 / road.planView[i].curvature
        new_radius = radius - t
        k_arc = s_distance / radius
        new_s = k_arc * new_radius
        
        new_curvature = 1 / new_radius
        heading += new_s*new_curvature
        signal_xyz = map_utils.get_point_in_arc(
            t_xyz.x, t_xyz.y, t_xyz.z, new_s, new_curvature, road.planView[i].hdg) # + hOffset)

    if heading < 0:
        heading += 2 * math.pi
    if heading > 2 * math.pi:
        heading -= 2 * math.pi

    return signal_xyz, heading



root_path = BASE_DIR + '/src/catkin_ws/src/t4ac_mapping/maps/xodr/'
town_name = "carla_0910/Town01.xodr"
map_path = root_path + town_name
with open (map_path, "r") as myfile:
    map_string = myfile.read()

parse_signals(map_string, 1)