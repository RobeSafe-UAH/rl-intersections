#!/usr/bin/env python3
"""
Represent static elements of the map in RVIZ using markers.
Elements represented are:
    - Lanes
    - Stop signals
    - Yield signals
    - TrafficLight signals
    - Crosswalks
"""
import sys 
import os
import glob
import rospy

try:
    sys.path.append(glob.glob('/home/robesafe/libraries/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla
import rospy
import visualization_msgs.msg

from modules import util_module
from modules import markers_module

# ### Test Yaw ###
# sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/')
# from map_parser import map_parser
# from map_utils import generate_waypoints
# ### Test Yaw ###

# ROS Publishers
lanes_map_visualizator_pub = rospy.Publisher(
    "/t4ac/mapping/map/lanes_marker", visualization_msgs.msg.Marker,
    queue_size = 10)

def map_visualizator():
    # Init node
    rospy.init_node("map_visualizator_node", anonymous=True)
    rate = rospy.Rate(1)

    # Get params
    map_name = rospy.get_param('t4ac/map_name') 
    # map_name = "Town03"

    # Get map and generate waypoint
    maps_path = rospy.get_param("t4ac/mapping/maps/xodr")
    carla_map = util_module.get_map(maps_path, map_name)
    waypoints = carla_map.generate_waypoints(0.1)

    # ### Test Yaw ###
    # # Map xodr
    # root_path = "/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/maps/xodr/"
    # town_name = "carla_0910/Town01.xodr"
    # map_path = root_path + town_name
    # with open (map_path, "r") as myfile:
    #     map_string = myfile.read()

    # t4ac_map_object = map_parser.MapParser(map_string, 1)
    # waypoints = generate_waypoints(t4ac_map_object.roads, 1)
    # ### Test Yaw ###

    # Get markers
    lane_markers = markers_module.get_topology(waypoints, rgb=[192,192,192])


    while not rospy.is_shutdown():
        lanes_map_visualizator_pub.publish(lane_markers)
        rate.sleep()

# @ADD 15/12/20 --> Esto hay que ver como hacerlo bien para que se este
# llamando todo el tiempo. Porque realmente esta forma se utiliza para test.
if __name__ == '__main__':
    try:
        map_visualizator()
    except rospy.ROSInterruptException:
        pass