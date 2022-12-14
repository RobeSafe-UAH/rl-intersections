"""
( DEPRECATED --> Now use lane_graph_planner.py)
Last edit: 13 / april / 2021 by Alejandro D.

Generates a lane based graph using networkx, using an xodr map as an input.
Map parser is used to obtain the information from the xodr file.

Each edge of the graph is composed by its road id and its lane id. 

- Added lane change
- Added conversion from xyz ro road/lane
"""
import math 
import networkx as nx
import matplotlib.pyplot as plt 

from modules import map_classes
from modules import map_parser
from modules import map_builder  
from modules import builder_classes

map_object = map_parser.MapParser('campus_UAH')
# Using this map_builder is not the most efficient method, an need to be
# improved in the future, but we can use it now temporally to have a system working 
# without using PythonAPI
map_builder = map_builder.MapBuilder('campus_UAH')
road_2 = [wp for wp in map_builder.roadNetwork_waypoints if wp.road_id == 2]
road_12 = [wp for wp in map_builder.roadNetwork_waypoints if wp.road_id == 12]
edges = []

road_map_topology = []

# Constant to define the weight of lanechange
LANECHANGECOST = 10


def xyz_to_roadlane(x, y, z, waypoint_list):
    """
    Receives a location an get its corresponding road and lane, because global
    path planning need road/lane tuple as input. If the location is not inside 
    a lane/road, returns the closer one inside a lane/road.

    Args:
        x: (int)
        y: (int)
        z: (int)
        waypoint_list: (list) list of every waypoint generated by the map bulder
            centered at every lane

    Returns:
        closer_roadlane: (tuple) Closer road/lane to the given location
    """

    t4ac_waypoint = builder_classes.T4ac_Waypoint()
    t4ac_waypoint.transform.location.x = x
    t4ac_waypoint.transform.location.y = y
    t4ac_waypoint.transform.location.z = z


    closer_waypoint = t4ac_waypoint.get_closer_wp(waypoint_list)
    closer_roadlane = (int(closer_waypoint.road_id), int(closer_waypoint.lane_id))

    return closer_roadlane

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

def get_lane(road, lane_id):
    """
    Get a lane from a road by its id

    Args:
        road: (T4ac_Road) road containing the lane
        lane_id: (int)

    Returns: 
        lane: (T4ac_Lane)
    """
    for lane in (road.lanes.laneSections[0].right + 
                 road.lanes.laneSections[0].left):
        if lane.id == lane_id:
            return lane

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

def get_initial_position(road, lane, side):
    """
    Returns initial position of the road centered at the lane

    Args:
        road: (T4ac_Road())
        lane: (T4ac_Lane())
        side: (str) left or right 

    Returns: 
        location: (T4ac_Location()) 
    """
    # First get offset from the center of the lane to the center of the road
    lane_width_offset = 0
    if (side == 'left'):
        for i in range(0, abs(lane.id)):
            # -1-i because the list must be checked inside out
            lane_width_offset += road.lanes.laneSections[0].left[-1-i].width[0].a
        # total lane offset for lane origin
        lane_offset = lane_width_offset - lane.width[0].a/2 + road.lanes.laneOffset[0].a
    elif (side == 'right'):
        for i in range(0, abs(lane.id)):
            lane_width_offset += road.lanes.laneSections[0].right[i].width[0].a
        # total lane offset for lane origin
        lane_offset = -lane_width_offset + lane.width[0].a/2 + road.lanes.laneOffset[0].a

    location = get_point_in_line(road.planView[0].x,
                                 road.planView[0].y,
                                 0,
                                 lane_offset,
                                 road.planView[0].hdg + math.pi/2)
    location.x = round(location.x, 3)
    location.y = round(location.y, 3)
    location.z = round(location.z, 3)

    return location 

def get_inverted_initial_position(road, lane, side):
    """
    Return last position of the road. It can be used to get the origin 
    position for inverted roads

    Args:
        road: (T4ac_Road())
        lane: (T4ac_Lane())
        side: (str) left or right 

    Returns: 
        location: (T4ac_Location()) 
    """
    # First get offset from the center of the lane to the center of the road
    lane_width_offset = 0
    if (side == 'left'):
        for i in range(0, abs(lane.id)):
            # -1-i because the list must be checked inside out
            lane_width_offset += road.lanes.laneSections[0].left[-1-i].width[0].a
        # total lane offset for lane origin
        lane_offset = lane_width_offset - lane.width[0].a/2 + road.lanes.laneOffset[0].a
    elif (side == 'right'):
        for i in range(0, abs(lane.id)):
            lane_width_offset += road.lanes.laneSections[0].right[i].width[0].a
        # total lane offset for lane origin
        lane_offset = -lane_width_offset + lane.width[0].a/2 + road.lanes.laneOffset[0].a

    # The get location centered on the road
    if (road.planView[-1].type == "line"):
        location_aux = get_point_in_line(road.planView[-1].x,
                                     road.planView[-1].y,
                                     0,
                                     road.planView[-1].length,
                                     road.planView[-1].hdg,
                                     )
    elif (road.planView[-1].type == "arc"):
        location_aux = get_point_in_arc(road.planView[-1].x,
                                    road.planView[-1].y,
                                    0,
                                    road.planView[-1].length,
                                    road.planView[-1].curvature,
                                    road.planView[-1].hdg,
                                    )
    # Apply offset
    location = get_point_in_line(location_aux.x,
                                 location_aux.y,
                                 0,
                                 lane_offset,
                                 road.planView[-1].hdg + math.pi/2)

    # Round value 
    location.x = round(location.x, 3)
    location.y = round(location.y, 3)
    location.z = round(location.z, 3)

    return location

edge_labels = dict()
pos = dict()

"""
Evaluate connections for every road/lane in the map to generate the graph.
Graph is generated from edges, and an edge in generated from two nodes.
A node is a tuple of two parameters : (road_id, lane_id).

There is a first loop that evaluates every road in the map, and there is a 
second nested loop to evaluate every lane of each road.
"""
for road in map_object.roads:
    road_direction = get_direction(road)

    # In + case use right side lanes 
    # (assuming simplification of unidirectional roads)
    if (road_direction == '+'):
        for lane in road.lanes.laneSections[0].right:
            if (lane.type == "driving"):
                # When successor is road get successor connection
                if (road.link.successor.elementType == 'road'): 

                    # Create edge from current to successor
                    edge = ([(road.id, lane.id),
                        (road.link.successor.elementId, lane.link.successor.id),
                        {'weight': round(road.length, 3)}])

                    edges.append(edge)
                    # Add new edge label
                    edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                    # Add initial position of the road to pos dict
                    location = get_initial_position(road, lane, 'right')
                    pos[road.id, lane.id] = (location.x, location.y)

                # When successor is junction get all possible connections
                elif (road.link.successor.elementType == 'junction'):

                    junction = get_junction(
                        map_object.junctions, road.link.successor.elementId)
                    # Create edge from current to all possible connections
                    for connection in junction.connection:
                        if (connection.incomingRoad == road.id):
                            for laneLink in connection.laneLink:
                                if laneLink.fromLane == lane.id:
                                    connectingLane = laneLink.toLane
                                    edge = ([(road.id, lane.id),
                                            (connection.connectingRoad, connectingLane),
                                            {'weight': round(road.length, 3)}])
                                    edges.append(edge)
                                    edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                                    location = get_initial_position(road, lane, 'right')
                                    pos[road.id, lane.id] = (location.x, location.y)  

                # Check lane changes
                if (lane.roadMark[0].laneChange == "left"):
                    # Get left lane
                    left_lane = get_lane(road, lane.id + 1)
                    if (left_lane is not None and left_lane.type == "driving"):
                        # Create edge from current to left lane
                        edge = ([(road.id, lane.id),
                            (road.id, left_lane.id),
                            {'weight': LANECHANGECOST}])                
                        edges.append(edge)
                        # Add new edge label
                        edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                        # Add initial position of the road to pos dict
                        location = get_initial_position(road, left_lane, 'right')
                        pos[road.id, lane.id] = (location.x, location.y)

                elif (lane.roadMark[0].laneChange == "right"):
                    # Get right lane
                    right_lane = get_lane(road, lane.id - 1)
                    if (right_lane is not None and right_lane.type == "driving"):
                        # Create edge from current to left lane
                        edge = ([(road.id, lane.id),
                            (road.id, right_lane.id),
                            {'weight': LANECHANGECOST}])                
                        edges.append(edge)
                        # Add new edge label
                        edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                        # Add initial position of the road to pos dict
                        location = get_initial_position(road, right_lane, 'right')
                        pos[road.id, lane.id] = (location.x, location.y)

                elif (lane.roadMark[0].laneChange == "both"):
                    # Get left lane
                    left_lane = get_lane(road, lane.id + 1)
                    if (left_lane is not None and left_lane.type == "driving"):
                        # Create edge from current to left lane
                        edge = ([(road.id, lane.id),
                            (road.id, left_lane.id),
                            {'weight': LANECHANGECOST}])                
                        edges.append(edge)
                        # Add new edge label
                        edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                        # Add initial position of the road to pos dict
                        location = get_initial_position(road, left_lane, 'right')
                        pos[road.id, lane.id] = (location.x, location.y)
                    # Get right lane
                    right_lane = get_lane(road, lane.id - 1)
                    if (right_lane is not None and right_lane.type == "driving"):
                        # Create edge from current to left lane
                        edge = ([(road.id, lane.id),
                            (road.id, right_lane.id),
                            {'weight': LANECHANGECOST}])                
                        edges.append(edge)
                        # Add new edge label
                        edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                        # Add initial position of the road to pos dict
                        location = get_initial_position(road, right_lane, 'right')
                        pos[road.id, lane.id] = (location.x, location.y)







    # In - case use left side lanes 
    elif (road_direction == '-'):
        for lane in  road.lanes.laneSections[0].left:
            if (lane.type == "driving"):
                # When predecessor is road get predecessor connection
                if (road.link.predecessor.elementType == 'road'): 

                    # Create edge from current to predecessor
                    edge = ([(road.id, lane.id),
                        (road.link.predecessor.elementId, lane.link.predecessor.id),
                        {'weight': round(road.length, 3)}])

                    edges.append(edge)
                    # Add new edge label
                    edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                    # Add initial position of the road to pos dict
                    location = get_inverted_initial_position(road, lane, 'left')
                    pos[road.id, lane.id] = (location.x, location.y)

                # When predecessor is junction get all possible connections
                elif (road.link.predecessor.elementType == 'junction'):

                    junction = get_junction(
                        map_object.junctions, road.link.predecessor.elementId)
                    # Create edge from current to all possible connections
                    for connection in junction.connection:
                        if (connection.incomingRoad == road.id):
                            for laneLink in connection.laneLink:
                                if laneLink.fromLane == lane.id:
                                    connectingLane = laneLink.toLane
                                    edge = ([(road.id, lane.id),
                                            (connection.connectingRoad, connectingLane),
                                            {'weight': round(road.length, 3)}])
                                    edges.append(edge)
                                    edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                                    location = get_inverted_initial_position(road, lane, 'left')
                                    pos[road.id, lane.id] = (location.x, location.y)                   

                # Check lane changes
                if (lane.roadMark[0].laneChange == "left"):
                    # Get left lane
                    left_lane = get_lane(road, lane.id - 1)
                    if (left_lane is not None and left_lane.type == "driving"):
                        # Create edge from current to left lane
                        edge = ([(road.id, lane.id),
                            (road.id, left_lane.id),
                            {'weight': LANECHANGECOST}])                
                        edges.append(edge)
                        # Add new edge label
                        edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                        # Add initial position of the road to pos dict
                        location = get_inverted_initial_position(road, left_lane, 'left')
                        pos[road.id, lane.id] = (location.x, location.y)

                elif (lane.roadMark[0].laneChange == "right"):
                    # Get right lane
                    right_lane = get_lane(road, lane.id - 1)
                    if (right_lane is not None and right_lane.type == "driving"):
                        # Create edge from current to left lane
                        edge = ([(road.id, lane.id),
                            (road.id, right_lane.id),
                            {'weight': LANECHANGECOST}])                
                        edges.append(edge)
                        # Add new edge label
                        edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                        # Add initial position of the road to pos dict
                        location = get_inverted_initial_position(road, right_lane, 'left')
                        pos[road.id, lane.id] = (location.x, location.y)

                elif (lane.roadMark[0].laneChange == "both"):
                    # Get left lane
                    left_lane = get_lane(road, lane.id + 1)
                    if (left_lane is not None and left_lane.type == "driving"):
                        # Create edge from current to left lane
                        edge = ([(road.id, lane.id),
                            (road.id, left_lane.id),
                            {'weight': LANECHANGECOST}])                
                        edges.append(edge)
                        # Add new edge label
                        edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                        # Add initial position of the road to pos dict
                        location = get_inverted_initial_position(road, left_lane, 'left')
                        pos[road.id, lane.id] = (location.x, location.y)
                    # Get right lane
                    right_lane = get_lane(road, lane.id - 1)
                    if (right_lane is not None and right_lane.type == "driving"):
                        # Create edge from current to left lane
                        edge = ([(road.id, lane.id),
                            (road.id, right_lane.id),
                            {'weight': LANECHANGECOST}])                
                        edges.append(edge)
                        # Add new edge label
                        edge_labels[((edge[0]), (edge[1]))] = edge[2]['weight']
                        # Add initial position of the road to pos dict
                        location = get_inverted_initial_position(road, right_lane, 'left')
                        pos[road.id, lane.id] = (location.x, location.y)

G = nx.DiGraph()
G.add_edges_from(edges)
# pos2 = nx.spring_layout(G)
plt.figure()
nx.draw(G, pos, labels={node:node for node in G.nodes()})


nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)
# plt.show()

# Initial and goal point in xyz coordinates
init_xyz = (175.56, 182.08, 0)
goal_xyz = (167.63, 181.12, 0)

# Get initial and goal (road, lane) from the xyz coordinates
init_roadlane = xyz_to_roadlane(init_xyz[0], init_xyz[1], init_xyz[2], 
                                map_builder.roadNetwork_waypoints)
goal_roadlane = xyz_to_roadlane(goal_xyz[0], goal_xyz[1], goal_xyz[2], 
                                map_builder.roadNetwork_waypoints)

# Calculate route as a list of (road, lane) using A* algorithm
route = nx.astar_path(G, init_roadlane, goal_roadlane) 

# Uncoment to print #
# Print the route to be drawn in rviz with draw_waypoints.py script
# for node in route:
#     print("node = monitor_classes.Node3D()\n"
#           "node.x = {}\n"
#           "node.y = {}\n"
#           "node.z = 0\n"
#           "nodes.append(node)\n"
#           .format(pos[node][0], -pos[node][1])
#          )

print(route)
