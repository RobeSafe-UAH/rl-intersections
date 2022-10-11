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
import time
import rospy

try:
    sys.path.append(glob.glob('/home/robesafe/libraries/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass

import visualization_msgs.msg

from modules import util_module
from modules import markers_module


# ROS Publishers
lanes_map_visualizator_pub = rospy.Publisher(
    "/t4ac/mapping/map/lanes_marker", visualization_msgs.msg.Marker, queue_size=5)#,queue_size = 10)

def map_visualizator():
    # Init node
    rospy.init_node("map_visualizator_node", anonymous=True)
    rate = rospy.Rate(1)

    maps_path = rospy.get_param("/t4ac/map_parameters/maps/xodr")
    prev_map_name ="previous_map"
    start_time = time.time()
    
    # Get params

    while not rospy.is_shutdown():
        map_name = rospy.get_param("/t4ac/map_parameters/map_name")
        current_time = time.time()
        wait = current_time - start_time

        if map_name != prev_map_name or wait < 30: # Only update the map if it is different to the previous one.
                                                   # Wait N seconds until it is displayed in RVUZ for the first time
                                                   # TODO: Improve this wait (get_num_connections, etc.) to know if RVIZ 
                                                   # is subcribing to this topics
            prev_map_name = map_name

            # Get map and generate waypoint
            
            carla_map = util_module.get_map(maps_path, map_name)
            waypoints = carla_map.generate_waypoints(0.1)

            # Get markers
            lane_markers = markers_module.get_topology(waypoints, rgb=[192,192,192])
            lanes_map_visualizator_pub.publish(lane_markers)
            rate.sleep()

# @ADD 15/12/20 --> Esto hay que ver como hacerlo bien para que se este
# llamando todo el tiempo. Porque realmente esta forma se utiliza para test.
if __name__ == '__main__':
    try:
        map_visualizator()
    except rospy.ROSInterruptException:
        pass


