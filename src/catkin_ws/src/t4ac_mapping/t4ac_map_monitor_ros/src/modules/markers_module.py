"""
Module that implement functions to generate  util marker objects to represent
different elements of the map in RVIZ
"""
import math 

import rospy
import visualization_msgs.msg
import geometry_msgs.msg

from . import monitor_classes

def get_topology(waypoint_list, rgb = [0,0,0]):
    """
    Get markers to represent map topology defined by every lane.

    Args:
        waypoint_list: List of waypoints centered in every lane of the map
            at a given distance.

    Returns:
        points: Point markers defining every lane of the map.
    """
    points = visualization_msgs.msg.Marker()
    points.header.frame_id = "map"
    points.header.stamp = rospy.Time.now()
    points.ns = "map_visualizator_lanes"
    points.action = visualization_msgs.msg.Marker.ADD
    points.pose.orientation.w = 1.0
    points.id = 0
    points.type = visualization_msgs.msg.Marker.POINTS
    points.color.r = rgb[0]
    points.color.g = rgb[1]
    points.color.b = rgb[2]
    points.color.a = 1.0
    points.scale.x = 0.2

    points.lifetime = rospy.Duration.from_sec(0)

    # Fill points.points list with every wp defining lanes
    for waypoint in waypoint_list:
        node_right = monitor_classes.Node3D()
        node_left = monitor_classes.Node3D()
        yaw = waypoint.transform.rotation.yaw
        alpha = 90.0-yaw
        alpha_radians = math.radians(alpha)
        distance = waypoint.lane_width/2

        node_right.x = waypoint.transform.location.x + math.cos(alpha_radians)*distance
        node_right.y = waypoint.transform.location.y - math.sin(alpha_radians)*distance
        node_right.z = waypoint.transform.location.z

        node_left.x = waypoint.transform.location.x - math.cos(alpha_radians)*distance
        node_left.y = waypoint.transform.location.y + math.sin(alpha_radians)*distance
        node_left.z = waypoint.transform.location.z

        p1 = geometry_msgs.msg.Point()
        p1.x = node_right.x
        p1.y = -node_right.y
        p1.z = node_right.z

        p2 = geometry_msgs.msg.Point()
        p2.x = node_left.x
        p2.y = -node_left.y
        p2.z = node_left.z

        points.points.append(p1)
        points.points.append(p2)
    return points

def get_waypoint(waypoint, rgb = [0,0,0], lifetime = 0.2, scale = 0.2):
    """
    Get way marker to represent a carla.Waypoint in RVIZ

    Args:
        waypoint: carla.Waypoint()
        rgb: Colour
        lifetime: Lifetime of the marker in seconds
        scale: Scale for the marker

    Returns:
        waypoint_marker: Marker to represent a waypoint in RVIZ
    """
    waypoint_marker = visualization_msgs.msg.Marker()
    waypoint_marker.header.frame_id = "map"
    waypoint_marker.header.stamp = rospy.Time.now()
    waypoint_marker.ns = "waypoint_marker"
    waypoint_marker.action = visualization_msgs.msg.Marker.ADD
    waypoint_marker.pose.orientation.w = 1.0
    waypoint_marker.id = 0
    waypoint_marker.type = visualization_msgs.msg.Marker.POINTS
    waypoint_marker.color.r = rgb[0]
    waypoint_marker.color.g = rgb[1]
    waypoint_marker.color.b = rgb[2]
    waypoint_marker.color.a = 1.0
    waypoint_marker.scale.x = scale
    waypoint_marker.lifetime.secs = rospy.Duration(lifetime)

    point = geometry_msgs.msg.Point()
    point.x = waypoint.transform.location.x
    point.y = -waypoint.transform.location.y
    point.z = waypoint.transform.location.z
    waypoint_marker.points.append(point)

    return waypoint_marker

def get_way(way, rgb = [0,0,0], lifetime = 0.2, scale = 0.2):
    """
    Get way marker to represent a way in RVIZ

    Args:
        way: List of carla.Waypoint()
        rgb: Colour
        lifetime: Lifetime of the marker in seconds
        scale: Scale for the marker

    Returns:
        way_marker: Marker to represent a way in RVIZ
    """
    way_marker = visualization_msgs.msg.Marker()
    way_marker.header.frame_id = "map"
    way_marker.header.stamp = rospy.Time.now()
    way_marker.ns = "way_marker"
    way_marker.action = visualization_msgs.msg.Marker.ADD
    way_marker.pose.orientation.w = 1.0
    way_marker.id = 0
    way_marker.type = visualization_msgs.msg.Marker.LINE_STRIP
    way_marker.color.r = rgb[0]
    way_marker.color.g = rgb[1]
    way_marker.color.b = rgb[2]
    way_marker.color.a = 1.0
    way_marker.scale.x = scale
    way_marker.lifetime.secs = rospy.Duration(lifetime)

    for waypoint in way:
        point = geometry_msgs.msg.Point()
        point.x = waypoint.transform.location.x
        point.y = -waypoint.transform.location.y
        point.z = waypoint.transform.location.z
        way_marker.points.append(point)
    return way_marker

def get_lane(lane, rgb = [0,0,0], name = "", marker_type = 4,
             scale = 0.2, extra_z = 0, lifetime = 0.2):
    """
    Get lane marker to represent monitorized lane.

    Args:
        lane: Monitorized lane to represent of type t4ac_msgs.msg.Lane()
        rbg: Colour to represent the lane
        name: Differential name of the marker for namespace
        marker_type: (int) Type of marker, usually LINE_STRIP (4) or POINTS (8)
        scale: Scale for the marker
        extra_z: (int) Extra value for coordinate z
        lifetime: Lifetime of the marker in seconds

    Returns:
        lane_marker_right: Marker to represent right way of monitorized lane.
        lane_marker_left: Marker to represent left way of monitorized lane.
    """
    # Right way of lane 
    lane_marker_right = visualization_msgs.msg.Marker()
    lane_marker_right.header.frame_id = "map"
    lane_marker_right.header.stamp = rospy.Time.now()
    # lane_marker_right.ns = str(lane.role)+"lane_marker_right"
    lane_marker_right.ns = "lane_" + name + "marker_right"
    lane_marker_right.action = visualization_msgs.msg.Marker.ADD
    lane_marker_right.pose.orientation.w = 1.0
    lane_marker_right.id = 0
    lane_marker_right.type = marker_type
    lane_marker_right.color.r = rgb[0]
    lane_marker_right.color.g = rgb[1]
    lane_marker_right.color.b = rgb[2]
    lane_marker_right.color.a = 1.0
    lane_marker_right.scale.x = scale
    lane_marker_right.lifetime.secs = rospy.Duration(lifetime)

    for node in lane.right.way:
        point = geometry_msgs.msg.Point()
        point.x = node.x
        point.y = -node.y
        point.z = node.z + extra_z
        lane_marker_right.points.append(point)

    # Left way of lane
    lane_marker_left = visualization_msgs.msg.Marker()
    lane_marker_left.header.frame_id = "map"
    lane_marker_left.header.stamp = rospy.Time.now()
    # lane_marker_left.ns = str(lane.role)+"lane_marker_left"
    lane_marker_left.ns = "lane_" + name + "marker_left"
    lane_marker_left.action = visualization_msgs.msg.Marker.ADD
    lane_marker_left.pose.orientation.w = 1.0
    lane_marker_left.id = 1
    lane_marker_left.type = marker_type
    lane_marker_left.color.r = rgb[0]
    lane_marker_left.color.g = rgb[1]
    lane_marker_left.color.b = rgb[2]
    lane_marker_left.color.a = 1.0
    lane_marker_left.scale.x = scale
    lane_marker_left.lifetime.secs = rospy.Duration(lifetime)

    for node in lane.left.way:
        point = geometry_msgs.msg.Point()
        point.x = node.x
        point.y = -node.y
        point.z = node.z + extra_z
        lane_marker_left.points.append(point)

    return lane_marker_right, lane_marker_left

def get_nodes(nodes, rgb = [0,0,0], name = "", marker_type = 4,
             scale = 0.2, extra_z = 0, lifetime = 0.2):
    """
    Get nodes marker to represent a list of nodes in RVIZ

    Args:
        nodes: List of monitor_classes.Node3D
        rbg: Colour to represent the lane
        name: Differential name of the marker for namespace
        marker_type: (int) Type of marker, usually LINE_STRIP (4) or POINTS (8)
        scale: Scale for the marker
        extra_z: (int) Extra value for coordinate z
        lifetime: Lifetime of the marker in seconds

    Returns:
        nodes: Marker to represent a way in RVIZ
    """
    nodes_marker = visualization_msgs.msg.Marker()
    nodes_marker.header.frame_id = "map"
    nodes_marker.header.stamp = rospy.Time.now()
    nodes_marker.ns = "nodes_marker" + name
    nodes_marker.action = visualization_msgs.msg.Marker.ADD
    nodes_marker.pose.orientation.w = 1.0
    nodes_marker.id = 0
    nodes_marker.type = marker_type
    nodes_marker.color.r = rgb[0]
    nodes_marker.color.g = rgb[1]
    nodes_marker.color.b = rgb[2]
    nodes_marker.color.a = 1.0
    nodes_marker.scale.x = scale
    nodes_marker.lifetime = rospy.Duration(lifetime)

    for node in nodes:
        point = geometry_msgs.msg.Point()
        point.x = node.x
        point.y = -node.y
        point.z = node.z + extra_z
        nodes_marker.points.append(point)
    return nodes_marker
