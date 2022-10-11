"""
Test to draw elements (waypoint, way or lane) in RVIZ.
Elements must be given by users in draw_way_test() function.
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
import markers_module
import util_module
import monitor_module

# ROS Publishers
way_visualizator_pub = rospy.Publisher(
    "/mapping_planning/debug/way", visualization_msgs.msg.Marker,
    queue_size = 10)

def get_central_way(initial_waypoint, n, distance):
    """
    Get central way from an initial waypoint

    Args:
        initial_waypoint: init carla.Waypoint() of the way
        n: (int) number of waypoints for the way
        distance: (int) distance in meters between each waypoint
    Returns:
        central_way: List of carla.Waypoint
    """
    central_way = [initial_waypoint]
    for i in range(n):
        next_options = central_way[-1].next(distance)
        if type(next_options) == list:
            next_waypoint = next_options[0]
        else:
            next_waypoint = next_options
        central_way.append(next_waypoint)
    return central_way

def get_elements(x = 0, y = 0, z = 0, carla_map = None):
    """
    Get elements to be represented as markers:
    Waypoint, Way, Lane.

    Args:
        x, y,z : (int) Value for the coordinates of the location

    Returns:
        initial_waypoint: carla.Waypoint
        central_way: List of carla.Waypoint
        lane: monitor_classes.Lane
    """
    initial_location = carla.Location(x = 4.7, y = 69.6, z = -0.007)
    initial_waypoint = carla_map.get_waypoint(
        initial_location, project_to_road = True, 
        lane_type = carla.LaneType.Driving)
    central_way = get_central_way(initial_waypoint, 5, 2)
    lane = monitor_module.calulate_lane(central_way)

    return initial_waypoint, central_way, lane

def get_markers(initial_waypoint, central_way, lane):
    """
    Get markers to represent tested elements in RVIZ

    Args:
        initial_waypoint: carla.Waypoint
        central_way: List of carla.Waypoint
        lane: monitor_classes.Lane

    Returns:
        initial_waypoint_marker: Marker of the initial_waypoint
        central_way_marker: Marker of the central_way
        lane_marker: Marker of the lane
    """
    initial_waypoint_marker = markers_module.get_waypoint(
        initial_waypoint, rgb = [1,0,0], lifetime = 0.2, scale = 0.5)
    central_way_marker = markers_module.get_way(central_way,
       rgb = [1,0,0], lifetime = 0.2, scale = 0.5)
    lane_marker = markers_module.get_lane(lane,
        rgb = [1,0,0], lifetime = 0.2, scale = 0.5)

    return initial_waypoint_marker, central_way_marker, lane_marker
    
def dataSet_1():
    """
    Main way of junction xxxx in Town03
    """

def draw_way_test():
    # Init node
    rospy.init_node("debug_way_node", anonymous=True)
    rate = rospy.Rate(10)

    carla_map = util_module.get_map("Town03")

    initial_waypoint, central_way, lane = get_elements(
        x = 4.7, y = 69.6, z = -0.007, carla_map = carla_map)

    initial_waypoint_marker, central_way_marker, lane_marker = get_markers(
        initial_waypoint, central_way, lane)
    
    while not rospy.is_shutdown():
        way_visualizator_pub.publish(lane_marker[0])
        way_visualizator_pub.publish(lane_marker[1])
        rate.sleep()


if __name__ == '__main__':
    draw_way_test()