"""
This is a temporal version of the planner working with the PythonAPI.
Subscribes to the odometry and calculates and publish a route when a 
new goal is published.
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

from tabulate import tabulate

from lane_graph_planner import LaneGraphPlanner
from modules import map_classes
from modules import map_parser
from modules import map_utils  
from modules import builder_classes

from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped
from t4ac_msgs.msg import Way
from t4ac_msgs.msg import Waypoint
from t4ac_msgs.msg import Path

class LaneWaypointPlanner(LaneGraphPlanner):
    """
    This class generates a plan of waypoints to follow.

    The calculation is done whenever a new goal is set.

    Subscribers:
        - /t4ac/localization/pose
        - /t4ac/planning/goal

    Publishers:
        - /t4ac/planning/route

    """

    def __init__(self, map_name):
        LaneGraphPlanner.__init__(self, map_name)
        """
        Self parameters
        """
        self.current_xyz = None
        self.goal_xyz = None
        self.distance = 3 # This could be given as a parameter instead of hardcoded

        # Get Carla map object
        map_path = "/home/robesafe/t4ac_ws/src/t4ac_architecture/t4ac_mapping_layer/maps/xodr/"
        xodr_path = (map_path + map_name + ".xodr")
        with open(xodr_path) as od_file:
            od_file_data = od_file.read()
        self.carla_map = carla.Map(map_name, od_file_data)
        

        """
        ROS Subscribers
        """
        self.location_subscriber = rospy.Subscriber(
                "/t4ac/localization/pose", Odometry, self.odometry_callback)
        self.goal_subscriber = rospy.Subscriber(
                "/t4ac/planning/goal", PoseStamped, self.goal_callback)

        """
        ROS Publishers
        """
        self.waypoint_publisher = rospy.Publisher(
                '/t4ac/planning/route', Path, queue_size=1, latch=True)

    def odometry_callback(self, odometry):
        """
        Callback for /t4ac/localization/pose

        Args:
            odometry: (nav_msgs.msg/Odometry) 

        Returns:
            Updates a variable with the last odometry publication of the 
            ego vehicle
        """
        self.current_xyz = (
            odometry.pose.pose.position.x,
            odometry.pose.pose.position.y,
            odometry.pose.pose.position.z
        )

    
    def goal_callback(self, goal):
        """
        callback for /t4ac/planning/goal

        Args:
            goal: (PoseStamped) Goal for the route

        Retuns:
            Calculates and publish in /t4ac/planning/route new route from 
            current odometry to goal
        """
        self.goal_xyz = (
            goal.pose.position.x,
            goal.pose.position.y,
            goal.pose.position.z
        )
        ### dev ###
        init_xyz = (188.12, 116.57, 0)
        # goal_xyz = (226.90, 11.52, 0)
        route = self.calculate_waypoint_route(
            self.distance, init_xyz, self.goal_xyz)
        ### dev ###


        # # Calculate route
        # route = self.calculate_waypoint_route(
        #     self.distance, self.current_xyz, self.goal_xyz)

        # Publish route
        self.publish_waypoints(route)

    def publish_waypoints(self, route):
        """
        Publish a list of waypoints in /t4ac/planning/route
        """
        path_msg = Path()
        path_msg.header.frame_id = "map"
        path_msg.header.stamp = rospy.Time.now()

        if route is not None:
            for wp in route:
                waypoint_msg = Waypoint()
                waypoint_msg.transform.location.x = wp.transform.location.x
                waypoint_msg.transform.location.y = -wp.transform.location.y
                waypoint_msg.transform.location.z = wp.transform.location.z
                waypoint_msg.lane_change = str(wp.lane_change)

                path_msg.waypoints.append(waypoint_msg)

        # Organize info to be printed cleaner
        waypoints_list = []
        waypoints_data = []
        wp_index = 1
        for waypoint in path_msg.waypoints:
            waypoints_list = ([wp_index, waypoint.transform.location.x, 
                -waypoint.transform.location.y, waypoint.transform.location.z])
            waypoints_data.append(waypoints_list)
            wp_index += 1

        # Print and publish waypoint route
        print("\n" + tabulate(waypoints_data, headers=["waypoint", "x", "y", "z"]) + "\n")
        self.waypoint_publisher.publish(path_msg)
        rospy.loginfo("Published {} waypoints.".format(len(path_msg.waypoints)))


    def calculate_waypoint_route(self, distance, init_xyz, goal_xyz):
        """
        Receives a route as a list of (road, lane, action) and generates 
        intermediate waypoints centered at the corresponding lane, given a 
        distance

        Args:
            distance: (int) Distance in meters to separate the waypoints
            init_xyz: (tuple) xyz values of the starting point of the route
            goal_xyz: (tuple) xyz values of the goal point of the route

        Returns:
            waypoint_route: (list) Total route as a list of carla.Waypoint 
            separated by a given distance
        """
        # lane_route: (list) Global route as a list of (road, lane, action)
        lane_route = self.calculate_global_route(init_xyz, goal_xyz)

        # roads: (list) road objects of the map where to get the waypoints from
        roads = self.map_object.roads

        # waypoints: (list) list of every waypoint cenetered at every lane
        # where to look for the init and the goal xyz
        waypoints = self.roadNetwork_waypoints

        waypoint_route = []

        # Convert xyz inputs to carla waypoints
        init_location = carla.Location()
        init_location.x = init_xyz[0]
        init_location.y = init_xyz[1]
        init_location.z = init_xyz[2]
        init_carla_waypoint = self.carla_map.get_waypoint(init_location, 
                            project_to_road=True, lane_type=carla.LaneType.Driving)

        goal_location = carla.Location()
        goal_location.x = goal_xyz[0]
        goal_location.y = goal_xyz[1]
        goal_location.z = goal_xyz[2]
        goal_carla_waypoint = self.carla_map.get_waypoint(goal_location, 
                            project_to_road=True, lane_type=carla.LaneType.Driving)

        init_waypoint_aux = builder_classes.T4ac_Waypoint()
        init_waypoint_aux.transform.location.x = init_xyz[0]
        init_waypoint_aux.transform.location.y = init_xyz[1]
        init_waypoint_aux.transform.location.z = init_xyz[2]
        init_waypoint = init_waypoint_aux.get_closer_wp(waypoints)

        goal_waypoint_aux = builder_classes.T4ac_Waypoint()
        goal_waypoint_aux.transform.location.x = goal_xyz[0]
        goal_waypoint_aux.transform.location.y = goal_xyz[1]
        goal_waypoint_aux.transform.location.z = goal_xyz[2]
        goal_waypoint = goal_waypoint_aux.get_closer_wp(waypoints)


        # Calculate waypoints from first waypoint of the route in first step 
        if lane_route[0][2] == "lanefollow":
            waypoint_route += init_carla_waypoint.next_until_lane_end(self.distance)

        # Calculate waypoints for every other step of the route
        for i in range (1, len(lane_route)-1):
            if lane_route[i][2] == "lanefollow":
                road = map_utils.get_road(roads, lane_route[i][0])
                lane = map_utils.get_lane(road, lane_route[i][1])
                # Get Carla waypoints
                lane_init = map_utils.get_initial_position(road, lane, "right")
                lane_init_location = carla.Location()
                lane_init_waypoint = self.carla_map.get_waypoint(lane_init_location, 
                            project_to_road=True, lane_type=carla.LaneType.Driving)
                waypoint_route += lane_init_waypoint.next_until_lane_end(self.distance)

        # Calculate waypoints until last waypoint of the route in last step
        if lane_route[-1][2] == "lanefollow":
            waypoint_route += goal_carla_waypoint.previous_until_lane_start(self.distance)

        # # Filter route for closer waypoint to the objetive distance
        # waypoint_route_filtered = []
        # for i in range(1, len(waypoint_route)):
        #     distance_aux = waypoint_route[i].distance(waypoint_route[i-1])
        #     if distance_aux > (distance - 1):
        #         waypoint_route_filtered.append(waypoint_route[i])

        # return waypoint_route_filtered
        return waypoint_route

def main():
    """
    Main function
    """

    try:
        rospy.init_node("waypoint_publisher", anonymous=True)
        rospy.loginfo("Route planner initialized..")
        laneWaypointPlanner = LaneWaypointPlanner("campus_UAH")
        rospy.spin()

    except rospy.ROSException:
        rospy.logerr("Error while waiting for info!")
        sys.exit(1)

    finally:
        rospy.loginfo("Done")


if __name__ == "__main__":
    main()