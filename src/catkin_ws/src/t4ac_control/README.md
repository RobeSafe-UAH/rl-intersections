# Linear–Quadratic Regulator Controller

## Overview

This ROS package receives as input a set of waypoints and produces control commands for road vehicles to follow these waypoints. 
A spline interpolator generates a smooth path and a speed profiler calculates fordward velocity from a maximum speed specification and the radius of curvature of the path. Lateral control is based on an optimal LQR controller that is easy to adjust. The controller incorporates a delay compensator to minimize the effect of position readings and actuation delays.

## Authors

Rodrigo Gutiérrez Moreno\
Elena López Guillén

## Requierements

  * ROS noetic
  * t4ac_msgs

### Inputs and Outputs

![Control](https://user-images.githubusercontent.com/60657571/165482801-efec07d5-4ee1-4277-a613-9d3ca38c8cff.png)

| Topics | Type | Message Format | Description |
| ------------- | ------------- | ----------------- | --------------|
| _/t4ac/planning/route  | Subscriber | t4ac_msgs/Path | Trajectory waypoints
| _/t4ac/localization/pose_  | Subscriber | nav_msgs/Odometry | Absolute position of the vehicle
| _/t4ac/decision_making/speed  | Subscriber | std_msgs/Float64 | Input to modify linear velocity
| _/t4ac/decision_making/run_start | Subscriber | std_msgs/Bool | Start signal
| _/t4ac/perception/monitors/traffic_sign_list_ | Subscriber | t4ac_msgs/Traffic_Sign_List | List of traffic signs
| _/t4ac/control/spline_  | Publisher | nav_msgs/Path | Interpolated path for display purposes
| _/t4ac/control/points_spline_  | Publisher | visualization_msgs/Marker | Decimated waypoints for spline calculation, with minimum distance between points given by min_dist parameter. Useful for visualization purposes
| _/t4ac/control/reference_pose_  | Publisher | geometry_msgs/PoseStamped | Reference pose for control
| _/t4ac/control/predicted_pose_  | Publisher | geometry_msgs/PoseStamped | Pose predicted by the delay compensator to calculate reference pose
| _/t4ac/control/cmd_vel_  | Publisher | t4ac_msgs/CarControl | Linear and angular velocity command
| _/t4ac/control/rc_  | Publisher | std_msgs/Float64 | Curvature radius

 
## Parameters

| Param | Data type | Description |
| ------------- | ------------- | --------------|
| _N_max_  | int | Maximum number of input waypoints
| _min_dist_  |double | Minimum distance between waypoints
| _rc_min_  |double | Minimum curvature radius
| _n_ret_vel_  | double | Number of delays
| _sample_time_  | double | Sampling period of the control system
| _tl_stop_dist_  | double | Traffic light stop distance
| _q11_  | double | parameter of the LQR lateral controller
| _q22_  | double | parameter of the LQR lateral controller
| _r11_  | double | parameter of the LQR lateral controller

## Description
 
  * _trajectoryCallback:_ generates spline from waypoints in the trajectory received.
  * _odometryCallback:_ receive the localization of the ego vehicle.
  * _runStartCallback:_ bool signal to start driving.
  * _velGeneration:_ generates the velocity profiler.
  * _externalSpeedCallback:_ receives the external linear speed cmd.
  * _timerCallback :_ LQR algorithm, calculate speed and steer cmd.\

The vehicle do not moves until it receives a trajectory, a localization and a start signal.

## Results 

Refer to bibliography.

## Future Works

  * Refactoring.
  * Migrate the traffic light method to the decision making module.

## Bibliography

Gutiérrez, R.; López-Guillén, E.; Bergasa, L.M.; Barea, R.; Pérez, Ó.; Gómez-Huélamo, C.; Arango, F.; del Egido, J.; López-Fernández, J. A Waypoint Tracking Controller for Autonomous Road Vehicles Using ROS Framework. Sensors 2020, 20, 4062. https://doi.org/10.3390/s20144062
