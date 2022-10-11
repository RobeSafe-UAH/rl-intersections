
"""
Auxiliar script for Felipe to get route files in xml from 
scenario simulation in the challenge
"""
import sys

sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_planning_layer/')
sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/')

from route_parser import parse_route

### Global parameters ###
root_path = "/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/maps/xodr/"
town_name = "carla_0910/Town04.xodr"
map_path = root_path + town_name
with open (map_path, "r") as myfile:
    map_string = myfile.read()
route_id = 0

### Parse input data ###
parsed_waypoint_route = parse_route(route_id)
tuple_route = ([((float(waypoint.transform.location.x)), 
                -(float(waypoint.transform.location.y)), 
                0) 
                for waypoint in parsed_waypoint_route])

planning_root = "/workspace/team_code/catkin_ws/src/t4ac_planning_layer/"
routes_path = "t4ac_global_planner_ros/src/test_challenge/" 
file_name = "raw_routes.xml"
raw_routes_path = planning_root + routes_path + file_name
with open (raw_routes_path, "a") as f:
    f.write("""<route id="" town="Town0">\n""")
    for tuple in tuple_route:
        f.write("""   <waypoint x="{x}" y="{y}" z="{z}" />\n""".format(
            x = tuple[0], y = tuple[1], z = tuple[2]))
    f.write("</route>\n")