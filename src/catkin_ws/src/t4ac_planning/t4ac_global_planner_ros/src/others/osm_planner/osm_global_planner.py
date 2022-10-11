import osmnx as ox
import networkx as nx
import queue
import math
import priority_dict

map_graph = ox.graph_from_xml(
    '/home/robesafe/t4ac_ws/src/t4ac_mapping_planning/maps/osm/map_campus_test_1.osm')
origin = ox.get_nearest_node(map_graph, (37.8743, -122.277))
destination = list(map_graph.nodes())[-1]

shortest_path = nx.shortest_path(map_graph, origin, destination, weight='length')
fig, ax = ox.plot_graph_route(map_graph, shortest_path)