"""
Test to draw waypoints in RVIZ.
"""
import sys 
import os
import glob

try:
    sys.path.append(glob.glob('/home/robesafe/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla
import rospy
import visualization_msgs.msg
        
sys.path.insert(0, '/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/t4ac_map_monitor/src')
from modules import markers_module
from modules import util_module
from modules import monitor_module
from modules import monitor_classes

# ROS Publishers
waypoints_visualizator_pub = rospy.Publisher(
    "/mapping_planning/debug/waypoints", visualization_msgs.msg.Marker,
    queue_size = 10)

def draw_waypoints():
    # Init node
    rospy.init_node("debug_way_node", anonymous=True)
    rate = rospy.Rate(10)

    carla_map = util_module.get_map("Town01")
    landmarks = carla_map.get_all_landmarks_from_id("371")
    nodes = []
    for landmark in landmarks:
        node = monitor_classes.Node3D()
        node.x = landmark.transform.location.x
        node.y = landmark.transform.location.y
        node.z = landmark.transform.location.z
        nodes.append(node)

    
    waypoints_marker_1 = markers_module.get_nodes(
        nodes, [1,0,0], "1", 8, 1.5, 1, 0.2)

    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker_1)
        rate.sleep()

if __name__ == '__main__':
    draw_waypoints()