#!/usr/bin/env python3
"""
===============================
Test Lane Waypoint Planner
===============================
Last mod: Alejandro D. 21/january/2022



"""
import sys

sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_planning_layer/')
sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/')
from t4ac_global_planner_ros.src import lane_waypoint_planner

"""
Init and goal waypoints"""
# Initial and goal point in xyz coordinates
# Road 2 interior to road 12 exterior
# init_xyz = (175.56, 182.08, 0)
# goal_xyz = (167.63, 181.12, 0)

# # Road 2 exterior to road 12 exterior
# init_xyz = (179.86, 177.24, 0)
# goal_xyz = (167.63, 181.12, 0)

init_xyz = (-120.41, -136.69, 0)
goal_xyz = (56.43, 196.08, 0)


"""
Total waypoint route as a waypoint list separated by 3 meters
"""
laneWaypointPlanner = lane_waypoint_planner.LaneWaypointPlanner('carla_0910/Town03', 0)
waypoint_route = laneWaypointPlanner.calculate_waypoint_route(
                    2, init_xyz, goal_xyz, "length")


# Uncoment to print #
# Print the route to be drawn in rviz with draw_waypoints.py script
# for waypoint in waypoint_route:
#     print("node = monitor_classes.Node3D()\n"
#           "node.x = {}\n"
#           "node.y = {}\n"
#           "node.z = 0\n"
#           "nodes.append(node)\n"
#           .format(waypoint.transform.location.x, -waypoint.transform.location.y)
#          )

print("Route nodes = ", len(waypoint_route))
print("Finish")