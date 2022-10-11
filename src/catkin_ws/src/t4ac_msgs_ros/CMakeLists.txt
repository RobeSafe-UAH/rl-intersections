cmake_minimum_required(VERSION 2.8.3)
project(t4ac_msgs)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  std_msgs
  geometry_msgs
  vision_msgs
)

set(CMAKE_CXX_FLAGS "-std=c++11 -O2 -Wall ${CMAKE_CXX_FLAGS}")

add_message_files(FILES
  BEV_detection.msg
  BEV_detections_list.msg
  BEV_tracker.msg
  BEV_trackers_list.msg
  Bounding_Box_2D.msg
  Bounding_Box_2D_list.msg
  Bounding_Box_3D.msg
  Bounding_Box_3D_list.msg
  GT_3D_Object.msg
  GT_3D_Object_list.msg
  Obstacle.msg
  Obstacles_list.msg
  CarControl.msg
  Node.msg
  Way.msg
  Lane.msg 
  MonitorizedLanes.msg
  MonitorizedRegElem.msg
  RegulatoryElement.msg
  Landmark.msg
  DM_path.msg
  DM_pose.msg
  DM_posestamped.msg
  Location.msg
  Rotation.msg
  Traffic_Sign.msg
  Traffic_Sign_List.msg
  Transform.msg
  Waypoint.msg
  Path.msg
)

generate_messages(DEPENDENCIES
  std_msgs
  geometry_msgs
  vision_msgs
)

catkin_package(CATKIN_DEPENDS
  message_runtime
  std_msgs
  geometry_msgs
  vision_msgs
)
