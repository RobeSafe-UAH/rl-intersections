"""
Last edit: 12 / march / 2021 by Alejandro D.

This script calls the global planner implemented using PythonAPI from libcarla
"""

import glob 
import os
import sys

import rospy
import visualization_msgs.msg
import geometry_msgs.msg

try:
    sys.path.append(glob.glob('/home/robesafe/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla

from navigation.agent_planner import Path_Planner


def calculate_global_plan(start, goal, map_name):
    """
    Calculates the route from an initial point to a goal point

    Args:
        start: (x,y,z) Initial position from where to calculate the route
        goal: (x,y,z) Goal position to calculate the route 
        map_name: (str) Name of the map, to get the carla.Map() object

    Returns:
        route: ((x1,y1,z1), (x2,y2,z2), ..., (xn,yn,zn)) List of (x,y,z) points
            that define the route from start to goal
    """
    # Set map object 
    xodr_path = (
        "/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/maps/xodr/"
        + map_name + ".xodr")
    with open(xodr_path) as od_file:
        od_file_data = od_file.read()

    carla_map = carla.Map(map_name, od_file_data)

    # Convert start and goal to carla.Location() objects
    start_location = carla.Location(start[0], start[1], start[2])
    goal_location = carla.Location(goal[0], goal[1], goal[2])

    # Calculate route 
    planner = Path_Planner(carla_map)
    route = planner.set_destination(start_location, goal_location)

    return route


# ROS Publisher
global_plan_marker_pub = rospy.Publisher(
            "/t4ac/path_planning/global_plan", 
            visualization_msgs.msg.Marker, queue_size = 10)


"""
# Test points
--- Town01 ---
start = (357, 326.7, 0)
goal = (226.38, 195, 0)

start = (396.11, 193.73, 0)
goal = (92.12, 97.54, 0)

--- Town03 ---
start = (63.5, -3.83, 0)
goal = (4.73, -77.47, 0)

start = (63.5, -3.83, 0)
goal = (8.89, -76.29, 0)

start = (63.5, -3.83, 0)
goal = (-2.24, -23.39, 0)

start = (63.5, -3.83, 0)
goal = (-29.89, -5.99, 0)

start = (63.5, -3.83, 0)
goal = (-58.64, -3.28, 0)

start = (63.5, -3.83, 0)
goal = (-10.11, 64.86, 0)

--- Town10HD ---
start = (12.44, 66.22, 0)
goal = (66.29, 28.31, 0)

--- campus_UAH ---
start = (184.84, -162.38, 0)
goal = (176.92, -149.94, 0)

start = (179.90, -168.07, 0)
goal = (176.92, -149.94, 0)

start = (179.90, -168.07, 0)
goal = (174.22, -170.29, 0)


"""

# Set initial and goal points and calculate global plan
start = (185.61, -158.68, 0)
goal = (199.77, -107.10, 0)
global_plan = calculate_global_plan(start, goal, 'campus_UAH')

# Get marker for initial and goal points
def set_limit_markers():
    limit_markers = visualization_msgs.msg.Marker()
    limit_markers.header.frame_id = "/map"
    limit_markers.header.stamp = rospy.Time.now()
    limit_markers.ns = "global_plan"
    limit_markers.action = visualization_msgs.msg.Marker.ADD
    limit_markers.pose.orientation.w = 1.0
    limit_markers.id = 0
    limit_markers.type = visualization_msgs.msg.Marker.POINTS
    limit_markers.color.r = 0
    limit_markers.color.g = 1
    limit_markers.color.b = 0
    limit_markers.color.a = 1.0
    limit_markers.scale.x = 0.8
    limit_markers.lifetime.secs = 0.2

    point = geometry_msgs.msg.Point()
    point.x = start[0]
    point.y = -start[1]
    point.z = start[2]
    limit_markers.points.append(point)

    point = geometry_msgs.msg.Point()
    point.x = goal[0]
    point.y = -goal[1]
    point.z = goal[2] 
    limit_markers.points.append(point)

    return limit_markers

# Get marker to represent the route in RVIZ
def set_route_marker():
    route_marker = visualization_msgs.msg.Marker()
    route_marker.header.frame_id = "/map"
    route_marker.header.stamp = rospy.Time.now()
    route_marker.ns = "global_plan"
    route_marker.action = visualization_msgs.msg.Marker.ADD
    route_marker.pose.orientation.w = 1.0
    route_marker.id = 1
    route_marker.type = visualization_msgs.msg.Marker.POINTS
    route_marker.color.r = 1
    route_marker.color.g = 0
    route_marker.color.b = 0
    route_marker.color.a = 1.0
    route_marker.scale.x = 0.4
    route_marker.lifetime.secs = 0.2

    for waypoint in global_plan:
            point = geometry_msgs.msg.Point()
            point.x = waypoint[0].transform.location.x
            point.y = -waypoint[0].transform.location.y
            point.z = waypoint[0].transform.location.z
            route_marker.points.append(point)
    return route_marker


# Init ROS node
rospy.init_node("global_plan_node")

# Plot markers 
limit_marker = set_limit_markers()
route_marker = set_route_marker()
rate = rospy.Rate(10)
while not rospy.is_shutdown():
    global_plan_marker_pub.publish(route_marker)
    global_plan_marker_pub.publish(limit_marker)
    rate.sleep