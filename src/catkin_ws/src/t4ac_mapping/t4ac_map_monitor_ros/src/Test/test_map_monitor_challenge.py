"""
Script for testing the map monitor in Carla Challenge (without PythonAPI)

The steps for this test are:
    1) Launch map_visualizator_aux.launch
    2) Launch RVIZ
    3) Launch map_monitor_challenge.launch
    4) Publish odometry
    5) Launch planner
"""
"""
Odometry pub example

rostopic pub -r 1 /localization/pose nav_msgs/Odometry "header:
  seq: 0
  stamp:
    secs: 0
    nsecs: 0
  frame_id: 'map'
child_frame_id: ''
pose:
  pose:
    position: {x: 338.70, y: -226.75, z: 0.0}
    orientation: {x: 0.000, y: 0.000, z: 0.0, w: 0.0}
  covariance: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
twist:
  twist:
    linear: {x: 0.0, y: 0.0, z: 0.0}
    angular: {x: 0.0, y: 0.0, z: 0.0}
  covariance: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 0.0, 0.0, 0.0]" 
"""
# General imports
import sys

# ROS imports
import rospy

# Custom functions imports
sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_planning_layer/')
from t4ac_global_planner_ros.src.lane_waypoint_planner import LaneWaypointPlanner

# Init ROS node
rospy.init_node('test_map_monitor', anonymous=True)

# Xodr map data in string format
root_path = "/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/maps/xodr/"
town_name = "carla_0910/Town01.xodr"
map_path = root_path + town_name
with open (map_path, "r") as myfile:
    map_string = myfile.read()

# Global plan
global_plan = [
               (338.70, 226.75, 0.0),
               (1.36, 47.93, 0.0)
              ]

# Instance Lane Waypoint Planner
LWP = LaneWaypointPlanner(map_string, 1)
route = LWP.calculate_waypoint_route_multiple(2, global_plan, 0)
LWP.publish_waypoints(route)


