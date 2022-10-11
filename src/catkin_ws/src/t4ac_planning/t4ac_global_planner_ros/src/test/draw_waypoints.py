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
        
sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer/')
from t4ac_map_monitor_ros.src.modules import markers_module
from t4ac_map_monitor_ros.src.modules import util_module
from t4ac_map_monitor_ros.src.modules import monitor_module
from t4ac_map_monitor_ros.src.modules import monitor_classes

# ROS Publishers
waypoints_visualizator_pub = rospy.Publisher(
    "/mapping_planning/debug/waypoints", visualization_msgs.msg.Marker,
    queue_size = 10)

def dataSet_0():
    """
    
    """
    nodes = []

    node = monitor_classes.Node3D()
    node.x = 338.7
    node.y = -209.1
    node.z = 0
    nodes.append(node)

    # node = monitor_classes.Node3D()
    # node.x = 
    # node.y = 
    # node.z = 0
    # nodes.append(node)

    # node = monitor_classes.Node3D()
    # node.x = 
    # node.y = 
    # node.z = 0
    # nodes.append(node)

    

    

    return nodes

def draw_waypoints():
    # Init node
    rospy.init_node("debug_way_node", anonymous=True)
    rate = rospy.Rate(10)

    data = dataSet_2()
    waypoints_marker = markers_module.get_nodes(
        data, [0,1,0], "3", 8, 1.5, 1, 0)

    
    while not rospy.is_shutdown():
        waypoints_visualizator_pub.publish(waypoints_marker)
        rate.sleep()

if __name__ == '__main__':
    draw_waypoints()