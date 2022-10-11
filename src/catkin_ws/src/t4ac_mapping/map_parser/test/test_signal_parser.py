"""
Test for signal_parser. Plots signals in RVIZ using markers.
"""

# Setup
import sys

import rospy
import visualization_msgs.msg

sys.path.insert(0, '/workspace/team_code/catkin_ws/src/t4ac_mapping_layer')
from map_parser import signal_parser
from t4ac_map_monitor_ros.src.modules import markers_module
from t4ac_map_monitor_ros.src.modules import monitor_classes

# ROS Publishers
signals_visualizator_pub = rospy.Publisher(
    "/mapping/debug/signals", visualization_msgs.msg.Marker,
    queue_size = 10)

signals_visualizator_text_pub = rospy.Publisher(
    "/mapping/debug/signals_id", visualization_msgs.msg.MarkerArray,
    queue_size = 10)

root_path = "/root/team_code/catkin_ws/src/t4ac_mapping_layer/maps/xodr/"
root_path = rospy.get_param("/t4ac/map_parameters/maps/xodr")

town_name = "carla_0910/Town03.xodr"
map_path = root_path + town_name
with open (map_path, "r") as myfile:
    map_string = myfile.read()

# Get signals info
signals = signal_parser.parse_signals(map_string, 1)

# Publish RVIZ markers
nodes = []
traffic_signal_ids = visualization_msgs.msg.MarkerArray()
for signal in signals:
    # if signal['id'] == 369 or signal['id'] == 370 or signal['id'] == 371:
    node = monitor_classes.Node3D()
    node.x = signal['x']
    node.y = -signal['y']
    node.z = signal['z']
    nodes.append(node)
    traffic_signal_id = visualization_msgs.msg.Marker()
    traffic_signal_id.header.frame_id = "map"
    # traffic_signal_id.header.stamp = rospy.Time.now()
    traffic_signal_id.ns = "global_plan"
    traffic_signal_id.action = visualization_msgs.msg.Marker.ADD
    traffic_signal_id.pose.orientation.w = 1.0
    traffic_signal_id.id = signal['id']
    traffic_signal_id.type = visualization_msgs.msg.Marker.TEXT_VIEW_FACING
    traffic_signal_id.color.r = 0
    traffic_signal_id.color.g = 0
    traffic_signal_id.color.b = 1
    traffic_signal_id.color.a = 1.0
    traffic_signal_id.scale.z = 1.5
    traffic_signal_id.lifetime = rospy.Duration(0)
    traffic_signal_id.pose.position.x = signal['x']
    traffic_signal_id.pose.position.y = signal['y']
    traffic_signal_id.pose.position.z = signal['z']
    traffic_signal_id.text = str(signal['id'])
    traffic_signal_ids.markers.append(traffic_signal_id)

def draw_signals():
    # Init node
    rospy.init_node("debug_signals_node", anonymous=True)
    rate = rospy.Rate(10)
    signals_marker = markers_module.get_nodes(
        nodes = nodes, rgb = [1,0,1], name = "2", marker_type = 8, 
        scale = 1.5, extra_z = 1, lifetime = 0)

    
    while not rospy.is_shutdown():
        signals_visualizator_pub.publish(signals_marker)
        signals_visualizator_text_pub.publish(traffic_signal_ids)
        rate.sleep()

if __name__ == '__main__':
    draw_signals()