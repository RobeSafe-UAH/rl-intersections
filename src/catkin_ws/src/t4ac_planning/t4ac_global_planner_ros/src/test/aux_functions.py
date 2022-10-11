"""
Some auxiliar functions to work with the map
"""


def get_road(roads, road_id, road_ids):
    """
    Get a road from a road list by its id
    """
    road_index = road_ids.index(road_id)
    return roads[road_index]

def get_lane(road, lane_id):
    """
    Get a T4ac_Lane() in a T4ac_Road() given a lane_id
    """
    if lane_id > 0: #left side
        for lane in road.lanes.laneSections[0].left:
            if lane.id == lane_id:
                return lane

    elif lane_id < 0: #right side
        for lane in road.lanes.laneSections[0].right:
            if lane.id == lane_id:
                return lane


def get_junction(junctions, junction_id, junction_ids):
    """
    Get a junction from a junction list by its id
    """
    junction_index = junction_ids.index(junction_id)
    return junctions[junction_index]