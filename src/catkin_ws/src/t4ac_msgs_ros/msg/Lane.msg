## Lane definition (from the Carla library) in ROS message format
#
# Lanes are mapped using PythonAPI from Carla.
# They are made up from one "Way" that determine its left and right bounds

#uint8 speedlimit	# mapped max speed in km/h
Way left		# mapped left boundary
Way right		# mapped right boundary 
string role     	# Role: current, backside, left, right

#--OPTIONAL--
#int32 lane_id 		# lane id from xodr
#bool is_junction	# true if is on a junction 
#float lane_width	# horizontal size of the road

#string type		# mapped type of lanelet
