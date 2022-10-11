# Install script for directory: /home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/docker_robesafe/tesis/src/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/carla_msgs/srv" TYPE FILE FILES
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/srv/SpawnObject.srv"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/srv/DestroyObject.srv"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/srv/GetBlueprints.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/carla_msgs/msg" TYPE FILE FILES
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaBoundingBox.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaEgoVehicleControl.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaEgoVehicleStatus.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaEgoVehicleInfoWheel.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaEgoVehicleInfo.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaCollisionEvent.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaLaneInvasionEvent.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaWorldInfo.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaActorInfo.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaActorList.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaControl.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaStatus.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaTrafficLightInfo.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaTrafficLightInfoList.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaTrafficLightStatus.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaTrafficLightStatusList.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaWalkerControl.msg"
    "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/msg/CarlaWeatherParameters.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/carla_msgs/cmake" TYPE FILE FILES "/home/docker_robesafe/tesis/src/catkin_ws/build/ros-carla-msgs/catkin_generated/installspace/carla_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/docker_robesafe/tesis/src/catkin_ws/devel/include/carla_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/docker_robesafe/tesis/src/catkin_ws/devel/share/roseus/ros/carla_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/docker_robesafe/tesis/src/catkin_ws/devel/share/common-lisp/ros/carla_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/docker_robesafe/tesis/src/catkin_ws/devel/share/gennodejs/ros/carla_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/docker_robesafe/tesis/src/catkin_ws/devel/lib/python3/dist-packages/carla_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/docker_robesafe/tesis/src/catkin_ws/devel/lib/python3/dist-packages/carla_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/docker_robesafe/tesis/src/catkin_ws/build/ros-carla-msgs/catkin_generated/installspace/carla_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/carla_msgs/cmake" TYPE FILE FILES "/home/docker_robesafe/tesis/src/catkin_ws/build/ros-carla-msgs/catkin_generated/installspace/carla_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/carla_msgs/cmake" TYPE FILE FILES
    "/home/docker_robesafe/tesis/src/catkin_ws/build/ros-carla-msgs/catkin_generated/installspace/carla_msgsConfig.cmake"
    "/home/docker_robesafe/tesis/src/catkin_ws/build/ros-carla-msgs/catkin_generated/installspace/carla_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/carla_msgs" TYPE FILE FILES "/home/docker_robesafe/tesis/src/catkin_ws/src/ros-carla-msgs/package.xml")
endif()

