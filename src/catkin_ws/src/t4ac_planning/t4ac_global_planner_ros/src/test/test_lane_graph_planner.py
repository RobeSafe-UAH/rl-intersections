#!/usr/bin/env python3
"""
Last mod: Alejandro D. 13/10/2021

Test for the Lane Graph Planner
Receives an initial position, goal position and XODR map as inputs, 
and returns a list of roan/lanes for the route.
"""

import sys
sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_planning_layer/' \
                    't4ac_global_planner_ros/src/')

from lane_graph_planner import LaneGraphPlanner

# Path and name of the map
map_path = '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/maps/xodr/'
map_name = 'carla_0910/Town03'
LGP = LaneGraphPlanner(map_name, 0)

# Tuples of (road, lane) for init and goal
init_roadlane = (61, 1)
goal_roadlane = (13, -5)

# Calculate and print the route of (road, lane)
roadlane_route = LGP.calcula_roadlane_route(init_roadlane, goal_roadlane)
print(roadlane_route)
print("...Route calculated")