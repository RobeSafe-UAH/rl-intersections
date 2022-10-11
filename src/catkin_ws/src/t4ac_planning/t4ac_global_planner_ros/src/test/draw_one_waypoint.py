"""
Last edit: 14 / october / 2021 by Alejandro D.

Draw a list of waypoints in RVIZ given xyz coordinates
"""
import sys 
import os
import glob

try:
    sys.path.append(glob.glob('/workspace/CARLA/PythonAPI/carla/dist/carla-*%d.%d-%s.egg' % (
        sys.version_info.major,
        sys.version_info.minor,
        'win-amd64' if os.name == 'nt' else 'linux-x86_64'))[0])
except IndexError:
    pass
import carla
import rospy
import visualization_msgs.msg
        
sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/' \
                    't4ac_map_monitor_ros/src/')
from modules import markers_module
from modules import util_module
from modules import monitor_module
from modules import monitor_classes

# ROS Publishers
waypoints_visualizator_pub = rospy.Publisher(
    "/mapping_planning/debug/waypoints", visualization_msgs.msg.Marker,
    queue_size = 10)

def dataSet_1():
    """
    testing lane_graph planner xxxx in campus_UAH
    """
    nodes = []

    # # Route 12
    # node = monitor_classes.Node3D()
    # node.x = -43.98
    # node.y = -2.91
    # node.z = 0
    # nodes.append(node)

    # node = monitor_classes.Node3D()
    # node.x = -78.20
    # node.y = -17.75
    # node.z = 0
    # nodes.append(node)

    # Route 14
    node = monitor_classes.Node3D()
    node.x = 338.7
    node.y = 209.1
    node.z = 0
    nodes.append(node)


    return nodes

def draw_waypoints():
    # Init node
    rospy.init_node("debug_way_node", anonymous=True)
    rate = rospy.Rate(10)

    data = dataSet_1()
    waypoints_marker_1 = markers_module.get_nodes(
        data, [1,0,1], "2", 8, 1.5, 1, 0)

    
    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker_1)
        rate.sleep()

if __name__ == '__main__':
    draw_waypoints()