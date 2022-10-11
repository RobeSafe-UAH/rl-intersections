# Mapping Layer
This layer is focused on everything related to the map. 

## Summary of the layer
The mapping layer uses map files in XODR format to obtain relevant information that can be used by other layers. First of all,
it parses the information from the XODR file (that is a text file using XML structure to describe the map characteristics).
There is a map_utils module which implements different util functions to manipulate that parsed data.
Finally there is the map_monitor module, in charge of monitoring the relevant elements on the surrounding area of the vehicle.

## File structure of the layer
There are 4 main folders:

1. Maps
2. Map Parser
3. Map Utils
4. Map Monitor

### Maps
Here are the map files. The maps we use for mapping and planning are in XODR format, created by Carla (Carla Towns) or by us using RoadRunner (CampusUAH for example).
In the xodr folder are specified multiple versions of Carla map that can be different: carla_0910, carla_0912, ...

### Map Parser
This module receives the XODR file and analyze every single text searching for characters matching
the classes names, detecting the objects and storing them into the map_classes previously defined. The
only input is the XODR file, and the output is a map object containing all the map parsed information.

The map parser has two main files:
* **map_classes.py** : Defines the structure of an xodr map using python classes: roads, lanes, ...
* **map_parser.py** : The class MapParser uses the xodr map as input and converts it into useful data that is accesible through the object instanciated. 
The class also have some util methods as *get_waypoint(self, location)*

A third file **signal_parser.py** as been recently developed for the Carla Challenge 2021 (november 2021) in order to provide signal information using the map.

<p align="center">
  <img src="https://github.com/RobeSafe-UAH/Techs4AgeCar-Mapping-Layer/blob/master/Docs/img/map_parser_block.png" width="700"/>
</p>


### Map Utils
This module contains multiple util functions to operate with the map as for example getting a point in a specific location of a road or generating waypoints
centered at the lane of a road.

### Map Monitor
The Map Monitor module is the part in charge of monitoring the surrounding area of the vehicle and
visualizing both the monitored area and the lanes describing the roads of the map.

The inputs of the Map Monitor are the XODR Map, the waypoint route (to know which area to
monitor) and the ego vehicle location to know in which part of the route is the ego vehicle.
The outputs are the monitored elements published into ROS topics using custom messages and markers
published into ROS topics too to visualize the elements in RVIZ.

There are 3 main python files:
* **map_monitor.py** : Calculates the monitor elements and publishes them into ROS topics
* **monitor_visualizator.py** : Gets the monitored elements from the map_monitor.py and publishes
lane markers to visualize them on RVIZ
* **map_visualizator.py** : Calculates the map topology from the HD Map file and publishes markers
to visualize the map on RVIZ

<p align="center">
  <img src="https://github.com/RobeSafe-UAH/Techs4AgeCar-Mapping-Layer/blob/master/Docs/img/map_monitor_block.png" width="800"/>
</p>
