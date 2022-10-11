#!/usr/bin/env python3
"""
Get waypoint route and publish corresponding markers to visualize the route
on RVIZ
"""
import time
import rospy

from modules import markers_module

from visualization_msgs.msg import Marker
from t4ac_msgs.msg import Path


class RouteVisualizator:
    """
    Class to get waypoint route and publish corresponding markers to visualize 
    the route on RVIZ
    """

    def __init__(self):
        """
        ROS Subscribers
        """
        self.global_route_sub = rospy.Subscriber(
            "t4ac/planning/route", Path, self.route_callback) 

        """
        ROS Publishers
        """
        self.global_route_marker_pub = rospy.Publisher(
            "t4ac/planning/visualization/global_route", Marker, queue_size = 10)

    def route_callback(self, global_route):
        """
        Callback function called when a global route is published in 
        /t4ac/planning/route

        Args:
            global_route: (t4ac_msgs.msg.Path) Global route 

        Returns:
            Publish markers to visualize the route in: 
            t4ac/planning/visualization/route
        """

        global_route_marker = markers_module.get_waypoints(global_route.waypoints,
                                                           [0, 1, 1], -1, 0.5)
        self.global_route_marker_pub.publish(global_route_marker)
        time.sleep(2)
        ### dev ###
        # for waypoint in global_route.waypoints:
        #     waypoints = [waypoint]
        #     waypoint_marker = markers_module.get_waypoints(waypoints, [0, 1, 1], 1, 0.5)
        #     self.global_route_marker_pub.publish(waypoint_marker)
        #     time.sleep(0.2)
        ### dev ###

def main():
    """
    Main function
    """
    rospy.init_node("route_visualizator_node", anonymous=True)
    route_visualizator = RouteVisualizator()
    rospy.spin()


if __name__ == "__main__":
    main()