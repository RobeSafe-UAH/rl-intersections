# Techs4AgeCar project

Header header

geometry_msgs/Pose pose		# Pose at the center of mass
float64 dist2ego            # Distance to ego-vehicle
geometry_msgs/Twist twist	# Velocity at the center of mass
geometry_msgs/Polygon shape	# Box containing the obstacle
int64 road_id			# Road_id in which the obstacle is
string type			# Obstacle type if it is known (car, pedestrian, sign, etc)
