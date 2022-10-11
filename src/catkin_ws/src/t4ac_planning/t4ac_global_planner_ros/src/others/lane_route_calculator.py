"""
Temporal script to test the functionallity of global lane planner
class
"""

from lane_graph_planner import LaneGraphPlanner
from modules import map_utils

laneGraphPlanner = LaneGraphPlanner('campus_UAH')

"""
Global Route as a list of (road/lane)
"""


# Road 12 to road 1 
init_xyz = (188.12, 116.57, 0)
goal_xyz = (200.57, 110.47, 0) 

global_route = laneGraphPlanner.calculate_global_route(init_xyz, goal_xyz)
print(global_route)

"""
Total route as a waypoint list separated by 2 meters
"""
roads = laneGraphPlanner.map_object.roads

waypoint_route = []

# Temporal auxiliar loop to pop out repeated roads (because of lane change, 
# doing the change at the begining of the road)
previous_road_id = None 
filtered_global_route = []
for road_id, lane_id, action in global_route:
    if road_id == previous_road_id:
        filtered_global_route[-1] = ((road_id, lane_id))
    else: 
        filtered_global_route.append((road_id, lane_id))
    previous_road_id = road_id
print(filtered_global_route)

for road_id, lane_id in filtered_global_route:
    road = map_utils.get_road(roads, road_id)
    lane = map_utils.get_lane(road, lane_id)

    waypoint_route += map_utils.generate_waypoints_in_lane(road, lane, 3)

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

print("Finish")