"""
Temporal script to test the functionallity of global waypoint planner
class
"""

from lane_graph_planner import LaneGraphPlanner
from lane_waypoint_planner import LaneWaypointPlanner
from modules import map_utils

laneGraphPlanner = LaneGraphPlanner('campus_UAH')

"""
Init and goal waypoints"""
# Initial and goal point in xyz coordinates
# Road 2 interior to road 12 exterior
# init_xyz = (175.56, 182.08, 0)
# goal_xyz = (167.63, 181.12, 0)

# # Road 2 exterior to road 12 exterior
init_xyz = (179.86, 177.24, 0)
goal_xyz = (167.63, 181.12, 0)

"""
Total waypoint route as a waypoint list separated by 3 meters
"""
laneWaypointPlanner = LaneWaypointPlanner('campus_UAH')
waypoint_route = laneWaypointPlanner.calculate_waypoint_route(
                    2, init_xyz, goal_xyz)


# Uncoment to print #
# Print the route to be drawn in rviz with draw_waypoints.py script
for waypoint in waypoint_route:
    print("node = monitor_classes.Node3D()\n"
          "node.x = {}\n"
          "node.y = {}\n"
          "node.z = 0\n"
          "nodes.append(node)\n"
          .format(waypoint.transform.location.x, -waypoint.transform.location.y)
         )

print("Finish")