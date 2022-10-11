
"""
Last edit : 12/june/2020 Alejadro D.

Agent that uses a GlobalPlanner to get the shortest route from a waypoint start to a waypoint goal

"""

import random
import numpy as np
import carla

from navigation.global_route_planner import GlobalRoutePlanner
from navigation.global_route_planner_dao import GlobalRoutePlannerDAO

class Path_Planner():

    def __init__(self, map):
        """
        Constructor method.

            :param map: map to apply to local planner logic onto
        """

        self._map = map
        self._grp = None
        self._sampling_resolution = 3


    def set_destination(self, start_location, end_location, clean=False):
        """
        This method creates a list of waypoints from agent's position to destination location
        based on the route returned by the global router.

            :param start_location: initial position
            :param end_location: final position
        """
        self.start_waypoint = self._map.get_waypoint(start_location)
        self.end_waypoint = self._map.get_waypoint(end_location)

        route_trace = self._trace_route(self.start_waypoint, self.end_waypoint)

        # Mod por Alex
        return route_trace


    def _trace_route(self, start_waypoint, end_waypoint):
        """
        This method sets up a global router and returns the
        optimal route from start_waypoint to end_waypoint.

            :param start_waypoint: initial position
            :param end_waypoint: final position
        """
        # Setting up global router
        if self._grp is None:
            dao = GlobalRoutePlannerDAO(
                self._map, sampling_resolution=self._sampling_resolution)
            topology = dao.get_topology()
            grp = GlobalRoutePlanner(dao)
            grp.setup()
            self._grp = grp

        # Obtain route plan
        route = self._grp.trace_route(
            start_waypoint.transform.location,
            end_waypoint.transform.location)

        return route

