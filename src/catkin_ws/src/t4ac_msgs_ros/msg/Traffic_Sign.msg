# Techs4AgeCar project

string type                                    # Traffic Sign type
uint8[] lanes                                  # Lanes involved

float64   x1                                   # Top-left x coordinate
float64   y1                                   # Top-left y coordinate 
float64   x2                                   # Bottom-right x coordinate
float64   y2                                   # Bottom-right y coordinate 
geometry_msgs/PoseWithCovariance local_pose    # 3D Centroid x,y,z (Ego-vehicle frame)
geometry_msgs/PoseWithCovariance global_pose   # 3D Centroid x,y,z (Map frame)

float64  stop_line                             # Minimum distance at which the traffic light is 
                                               # fully observed. TODO: TAKE THIS STOP LINE FROM 
                                               # THE MAP AND ENSURE YOU OBSERVE THE CORRESPONDING
                                               # TRAFFIC LIGHT AT THIS POINT