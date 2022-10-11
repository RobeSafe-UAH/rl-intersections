#!/usr/bin/env python3
"""
Module to implement callbacks for monitorized elements. Every time a
monitorized element is published, there is a callback to represent it
in RVIZ
"""

import rospy
import visualization_msgs.msg

import t4ac_msgs.msg
from modules import monitor_classes
from modules import markers_module

class MonitorVisualizator:
    """
    Class for the monitor visualizator.
    Represents all the monitorized elements in ROS topics as markers, to 
    be visualized in RVIZ.
    Subscriber to "/mapping_planning/monitor" topics and publish in 
    "/mapping_planning/visualizator/monitor/ topics
    """

    def __init__(self):
        # ROS Subscribers
        self.lanes_monitor_sub = rospy.Subscriber(
            "/t4ac/mapping/monitor/lanes", 
            t4ac_msgs.msg.MonitorizedLanes, self.lanes_callback)
        self.intersections_monitor_sub = rospy.Subscriber(
            "/t4ac/mapping/monitor/intersections", 
            t4ac_msgs.msg.MonitorizedLanes, self.intersections_callback)
        self.regElems_monitor_sub = rospy.Subscriber(
            "/t4ac/mapping/monitor/regElems", 
            t4ac_msgs.msg.MonitorizedRegElem, self.regElems_callback)

        # ROS Publishers
        self.lanes_monitor_visualizator_pub = rospy.Publisher(
            "/t4ac/mapping/monitor/lanes_marker", 
            visualization_msgs.msg.Marker, queue_size = 10)
        self.intersections_monitor_visualizator_pub = rospy.Publisher(
            "/t4ac/mapping/monitor/intersections_marker", 
            visualization_msgs.msg.Marker, queue_size = 10)
        self.regElems_monitor_visualizator_pub = rospy.Publisher(
            "/t4ac/mapping/monitor/regElems_marker", 
            visualization_msgs.msg.Marker, queue_size = 10)

    def lanes_callback(self, lanes):
        """
        Callback function called when lanes are published by the map_monitor
        in /t4ac/mapping/monitor/lanes

        Args:
            lanes: (t4ac_msgs.msg.MonitorizedLanes)
                Monitorized lanes pusblished by the map_monitor

        Returns:
            Publish lane markers to be visualized in RVIZ
        """
        for lane in lanes.lanes:
            if lane.role == "current":
                current_lane_right_marker, current_lane_left_marker = ( 
                    markers_module.get_lane(
                        lane, [1,0,0], "current_", 4, 0.2, 0.1))

            elif lane.role == "back":
                back_lane_right_marker, back_lane_left_marker = (
                    markers_module.get_lane(
                        lane, [0,0,1], "back_", 4, 0.2, 0.1))

            elif lane.role == "right":
                right_lane_right_marker, right_lane_left_marker = (
                    markers_module.get_lane(
                        lane, [1,1,0], "right_", 8, 0.4, 0.1))

            elif lane.role == "left":
                left_lane_right_marker, left_lane_left_marker = (
                    markers_module.get_lane(
                        lane, [1,1,0], "left_", 8, 0.4, 0.1))

        self.lanes_monitor_visualizator_pub.publish(current_lane_right_marker)
        self.lanes_monitor_visualizator_pub.publish(current_lane_left_marker)
        self.lanes_monitor_visualizator_pub.publish(back_lane_right_marker)
        self.lanes_monitor_visualizator_pub.publish(back_lane_left_marker)
        self.lanes_monitor_visualizator_pub.publish(right_lane_right_marker)
        self.lanes_monitor_visualizator_pub.publish(right_lane_left_marker)
        self.lanes_monitor_visualizator_pub.publish(left_lane_right_marker)
        self.lanes_monitor_visualizator_pub.publish(left_lane_left_marker)

    def intersections_callback(self, intersection_lanes):
        """
        Callback function called when intersection_lanes are published by 
        the map_monitor in /t4ac/mapping/monitor/intersections

        Args:
            intersection_lanes: (t4ac_msgs.msg.MonitorizedLanes).
                Monitorized intersection_lanes pusblished by the map_monitor

        Returns:
            Publish lane_intersection markers to be visualized in RVIZ
        """
        intersection_lane_markers = []
        i = 0
        for lane in intersection_lanes.lanes:
            i += 1
            if lane.role == "merge": # Colour yellow
                intersection_lane_markers += ( 
                    markers_module.get_lane(
                        lane, [1,1,0], "merge_"+str(i), 4, 0.2, 0.2))

            elif lane.role == "split": # Colour orange
                intersection_lane_markers += (
                    markers_module.get_lane(
                        lane, [1,0.5,0], "split_"+str(i), 4, 0.2, 0.2))

            elif lane.role == "cross": # Colour purple
                intersection_lane_markers += (
                    markers_module.get_lane(
                        lane, [1,0,1], "cross_"+str(i), 4, 0.2, 0.2))

        for lane_marker in intersection_lane_markers:
            self.intersections_monitor_visualizator_pub.publish(lane_marker)

    def regElems_callback(self, regElems):
        """
        Callback function called when regElems are published by 
        the map_monitor in /t4ac/mapping/monitor/regElems

        Args:
            regElems: (t4ac_msgs.msg.MonitorizedRegElem).
                Monitorized Regulatory Elements pusblished by the map_monitor

        Returns:
            Publish Regulatory Element markers to be visualized in RVIZ
        """
        nodes = []

        if len(regElems.reg_elems) > 0:
            for regElem in regElems.reg_elems:
                node = monitor_classes.Node3D()
                node.x = regElem.location.x
                node.y = regElem.location.y
                node.z = regElem.location.z
                nodes.append(node)
                if len(regElem.landmarks) > 0:
                    for landmark in regElem.landmarks:
                        node = monitor_classes.Node3D()
                        node.x = landmark.location.x
                        node.y = landmark.location.y
                        node.z = landmark.location.z
                        nodes.append(node)

            landmarks_marker = markers_module.get_nodes(
                nodes, [1,0,0], "1", 8, 0.5, 1, 0.2)
            self.regElems_monitor_visualizator_pub.publish(landmarks_marker)


def monitor_visualizator():
    # Init node
    rospy.init_node("monitor_visualizator_node", anonymous=True)
    monitor_visualizator = MonitorVisualizator()
    rospy.spin()

if __name__ == '__main__':
    try:
        monitor_visualizator()
    except rospy.ROSInterruptException:
        pass
