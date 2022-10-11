import math 
import networkx as nx
import matplotlib.pyplot as plt 

import map_classes
import map_parser

map_object = map_parser.MapParser('campus_UAH')
edges = []

road_map_topology = []


def get_junction(junctions, junction_id):
    """
    Get a junction from a map.junctions by its id

    Args:
        junctions: (list) List of T4ac_Junction()
        junction_id: (int) 

    Returns:
        junction: (T4ac_Junction()) Junction of the given id
    """
    for junction in junctions:
        if junction.id == junction_id:
            return junction
    print("get_junction Error: Junction not found!")

def get_direction(road):
    """
    Get driving direction of the road, positive or negative, 
    according to the predecessor --> successor sequence

    Args:
        road: (T4ac_Road())

    Returns:
        (str) '+' or '-' defining driving direction
    """
    if (len(road.lanes.laneSections[0].right) > 0):
        for lane in road.lanes.laneSections[0].right:
            if (lane.type == "driving" and lane.id < 0):
                return "+"
    if (len(road.lanes.laneSections[0].left) > 0):
        for lane in road.lanes.laneSections[0].left:
            if (lane.type == "driving" and lane.id > 0):
                return "-"

def get_point_in_line(x, y, z, s, heading):
    """
    Get a T4ac_Location into a line geometry given an 's' distance
    """
    
    location = map_classes.T4ac_Location()
    location.x = x
    location.y = y
    location.z = z

    location.x += (s * math.cos(heading)) #+ (t * math.sin(heading))
    location.y += (s * math.sin(heading)) #+ (t * math.cos(heading))  

    return location

def get_point_in_arc(x, y, z, s, curvature, heading):
    """
    Get a T4ac_Location into an arc geometry given an 's' distance
    """
    location = map_classes.T4ac_Location()
    location.x = x
    location.y = y
    location.z = z
    radius = 1.0 / curvature
    pi_half = math.pi / 2

    location.x += radius * math.cos(heading + pi_half)     
    location.y += radius * math.sin(heading + pi_half)
    heading += s*curvature
    location.x -= radius * math.cos(heading + pi_half)    
    location.y -= radius * math.sin(heading + pi_half)

    return location

def get_initial_position(road):
    """
    Returns initial position of the road

    Args:
        road: (T4ac_Road())

    Returns: 
        location: (T4ac_Location()) 
    """
    location = map_classes.T4ac_Location()
    location.x = round(road.planView[0].x, 3)
    location.y = round(road.planView[0].y, 3)
    location.z = 0

    return location 



def get_inverted_initial_position(road):
    """
    Return last position of the road. It can be used to get the origin 
    position for inverted roads

    Args:
        road: (T4ac_Road())

    Returns: 
        location: (T4ac_Location()) 
    """
    if (road.planView[-1].type == "line"):
        location = get_point_in_line(road.planView[-1].x,
                                     road.planView[-1].y,
                                     0,
                                     road.planView[-1].length,
                                     road.planView[-1].hdg,
                                     )
    elif (road.planView[-1].type == "arc"):
        location = get_point_in_arc(road.planView[-1].x,
                                    road.planView[-1].y,
                                    0,
                                    road.planView[-1].length,
                                    road.planView[-1].curvature,
                                    road.planView[-1].hdg,
                                    )
    location.x = round(location.x, 3)
    location.y = round(location.y, 3)
    location.z = round(location.z, 3)
    return location

edge_labels = dict()
pos = dict()

for road in map_object.roads:
    # Case for positive direction of the road
    if (get_direction(road) == '+'):
        # Case for road
        if (road.link.successor.elementType == 'road'):
            # Append new edge: [road_in, road_out, length]
            edge = ([road.id, 
                     road.link.successor.elementId, 
                     {'weight': round(road.length, 3)}])
            edges.append(edge)
            # Add new edge label
            edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
            # Add initial position of the road to pos dict
            location = get_initial_position(road)
            pos[road.id] = (location.x, location.y)
        # Case for junction
        elif (road.link.successor.elementType == 'junction'):
            junction = get_junction(
                map_object.junctions, road.link.successor.elementId)
            for connection in junction.connection:
                if (connection.incomingRoad == road.id):
                    edge = ([road.id, 
                             connection.connectingRoad, 
                             {'weight': round(road.length, 3)}])
                    edges.append(edge)
                    edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                    location = get_initial_position(road)
                    pos[road.id] = (location.x, location.y)
    # Case for negative direction of the road
    elif (get_direction(road) == '-'):
        if (road.link.predecessor.elementType == 'road'):
            edge = ([road.id, 
                     road.link.predecessor.elementId, 
                     {'weight': round(road.length, 3)}])
            edges.append(edge)
            edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
            location = get_inverted_initial_position(road)
            # location = get_initial_position(road)
            pos[road.id] = (location.x, location.y)
        elif (road.link.predecessor.elementType == 'junction'):
            junction = get_junction(
                map_object.junctions, road.link.predecessor.elementId)
            for connection in junction.connection:
                if (connection.incomingRoad == road.id):
                    edge = ([road.id, 
                             connection.connectingRoad, 
                             {'weight': round(road.length, 3)}])
                    edges.append(edge)
                    edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                    location = get_inverted_initial_position(road)
                    # location = get_initial_position(road)
                    pos[road.id] = (location.x, location.y)

G = nx.DiGraph()
G.add_edges_from(edges)
# pos2 = nx.spring_layout(G)
plt.figure()
nx.draw(G, pos, labels={node:node for node in G.nodes()})


nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)
plt.show()

route = nx.astar_path(G, 7, 12) 
print(route)
