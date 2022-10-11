#!/usr/bin/env python

import math 

"""
Some classes describing structures to operate with map structure (already parsed from an xodr)
"""

class T4ac_Waypoint:
    def __init__(self):
        self.id = ""
        self.transform = T4ac_Transform()
        self.road_id = ""
        self.lane_id = ""
        self.junction = ""
        self.s = ""
        self.lane_width = ""
        self.lane_change = ""
        self.lane_type = ""
        self.right_lane_marking = ""
        self.left_lane_marking = ""
        self.vmax = 0
        self.vunit = ""
        self.nLanes = 0         # Number of lanes in same direction
        self.lanePosition = 0   # Position of the current lane,
                                # starting from 1 to the right

    def get_closer_wp(self, waypoint_list):
        """
        Return closer wp given a wp list
        It can be usefull to get road and lane info of the self waypoint
        """
        closer_distance = 10000 # High arbitrary value
        for wp in waypoint_list:
            distance = math.sqrt((wp.transform.location.x-self.transform.location.x)**2 + 
                                 (wp.transform.location.y-self.transform.location.y)**2 +
                                 (wp.transform.location.z-self.transform.location.z)**2)
            if distance < closer_distance:
                closer_distance = distance
                closer_wp = wp
        return closer_wp

    def distance(self, waypoint):
        """
        Calculate distance from current waypoint to other waypoint

        Args:
            waypoint: Goal waypoint to compute distance from current

        Returns:
            distance: (float) euclidean distance
        """
        distance = math.sqrt(
            (waypoint.transform.location.x-self.transform.location.x)**2 + 
            (waypoint.transform.location.y-self.transform.location.y)**2)

        return distance

    def get_lanePosition(self, lane_id, road):
        """
        Returns the number of lanes in the current road with same direction
        and the position of the current lane, starting to count from 1 from 
        the right to the left

        Args:
            lane_id: (int) Id of the current lane
            road: (T4ac_Road) Road containing the current lane

        Returns:
            nLanes: (int) Number of lanes
            lanePosition: (int) Position of the current lane
        """

        nLanes = 0
        lanePosition = 0

        if lane_id < 0:
            for lane in road.lanes.laneSections[0].right:
                if lane.type == "driving":
                    nLanes += 1
                if lane.id == lane_id:
                    lanePosition = nLanes
        elif lane_id > 0:
            for lane in road.lanes.laneSections[0].left:
                if lane.type == "driving":
                    nLanes += 1
                if lane.id == lane_id:
                    lanePosition = nLanes

        return nLanes, lanePosition

            



class T4ac_Transform:
    def __init__(self):
        self.location = T4ac_Location()
        self.rotation = T4ac_Rotation()

class T4ac_Location:
    def __init__(self):
        self.x = ""
        self.y = ""
        self.z = ""

class T4ac_Rotation:
    def __init__(self):
        self.pitch = ""
        self.yaw = ""
        self.roll = ""