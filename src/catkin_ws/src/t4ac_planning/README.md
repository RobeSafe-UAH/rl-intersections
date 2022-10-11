# Planning-Layer
This layer is focused on everything related to the route planning of the vehicle.

## Summary of the layer
The path planner is the module that receives the ego vehicle position and goal position and calculates
the route between them as a list of waypoints centered in the lane.
To do that, it applies an A* algorithm to a road-lanes graph previously generated from the HD Map
to obtain a topology (road-lane) route. Then, it generates waypoints centered in every lane of the route
separated by a given distance.
It also considers lane change when the order is published by the decision making layer.

So the route planning problem is solved using a Global Planner based on an HD Map in OpenDRIVE (XODR) format.

<p align="center">
  <img src="https://github.com/RobeSafe-UAH/Techs4AgeCar-Planning-Layer/blob/master/Docs/path_planner_block.png" width="700"/>
</p>

## File structure of the layer
There are two folders, but we will only use one of them:
1. **t4ac_global_planner_ros** : Here is all the development of the global planner that was commented before, structured into a ROS package
2. dummy_planner_ros : This is an old deprecated version of the route planning that was based on Carla Planner, so this version won't be used in the project

### Global Planner
There are some folders with util scripts for modules and testing, but the main files are two:
1. **lane_graph_planner.py**
2. **lane_waypoint_planner.py**

The route planning process has two main phases, each corresponding to one of the files mentioned above: 
1. First a topological route (road-lane level) is generated using A* and the HD Map
2. Then waypoints are generated centered on that lanes and separated by a given distance

#### Lane Graph Planner
First the Lane Graph Planner (**LGP**) generates a Directed Graph (DiGraph) of roads and lanes from the HD Map using the python module *Networkx*.
The LGP builds the graph using edges that represent the connection between two nodes. In this case,
a node is a tuple of 2 parameters: road_id and lane_id. Each edge is defined as a python set containing
the input node, output node and weight.
By default the weight is the total length of the road in meters, but could be changed by any other
unit as for example the time for going from the input node to the output at the maximum velocity of the
road.
To generate edges and build the graph, the LGP evaluates connections for every road/lane of the map
object parsed from the HD Map. A first loop is used to evaluate every road and a second nested loop
evaluates every lane connection of each road. Lane change is also considered adding a cost value for lane
change when it is allowed.

The following figure is an example of how the graph of a map with two roundabouts is generated, representing
also the distances between nodes:

<p align="center">
  <img src="https://github.com/RobeSafe-UAH/Techs4AgeCar-Planning-Layer/blob/master/Docs/road_digraph.png" width="700"/>
</p>

Once we have the road graph, the route is calculated using an A* algorithm already implemented in
the Networkx module as a method:

`route = netwokx.astar_path(graph, init_roadlane, goal_roadlane)`

The route returned by the LGP is a topological route as a list of tuples: (road, lane, action). Action
can be lane follow, lane change right or lane change left. It could be used as an input to a perception
based controller, but in this case a list of waypoints must be given to the controller.

#### Lane Waypoint Planner
The Lane Waypoint Planner (**LWP**) is in charge of calculating a route of waypoints centered at the
lane from an initial location to a goal point, using the road-lane route that has already been calculated by the LGP.

It is an extension of the LGP, keeping all its functionalities and adding new ones.

The different processes are organized in callback functions that are activated when a message is
published in the corresponding ROS topic.

**ROS subscribers:**
* pose : This topic constantly updates the pose of the ego vehicle
* goal : When a goal is published, a new route is calculated. To do so, first calculates the topology
road-lane-action route described in the LGP and then obtains waypoints centered at every lane of
the route separated by a given distance from the ego vehicle to the goal point
* change_left : Recalculates the route executing a left lane change
* change_right : Recalculates the route executing a right lane change

To execute a lane change, the LWP calculates a new route considering the ego vehicle’s pose moved
to the side lane as the first point of the route.

**ROS publishers:**
* route : Whenever a route is calculated, it is published in this topic as a t4ac_msg.msg/Path
* lane_change_executed : This flag ease the control layer flow to assert when the lane change has
been executed

Most of the code functions used in this part are developed in the map_utils.py file in the Mapping Layer.
