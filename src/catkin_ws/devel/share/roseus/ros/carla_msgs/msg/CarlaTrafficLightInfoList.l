;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::CarlaTrafficLightInfoList)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'CarlaTrafficLightInfoList (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::CARLATRAFFICLIGHTINFOLIST")
  (make-package "CARLA_MSGS::CARLATRAFFICLIGHTINFOLIST"))

(in-package "ROS")
;;//! \htmlinclude CarlaTrafficLightInfoList.msg.html


(defclass carla_msgs::CarlaTrafficLightInfoList
  :super ros::object
  :slots (_traffic_lights ))

(defmethod carla_msgs::CarlaTrafficLightInfoList
  (:init
   (&key
    ((:traffic_lights __traffic_lights) ())
    )
   (send-super :init)
   (setq _traffic_lights __traffic_lights)
   self)
  (:traffic_lights
   (&rest __traffic_lights)
   (if (keywordp (car __traffic_lights))
       (send* _traffic_lights __traffic_lights)
     (progn
       (if __traffic_lights (setq _traffic_lights (car __traffic_lights)))
       _traffic_lights)))
  (:serialization-length
   ()
   (+
    ;; carla_msgs/CarlaTrafficLightInfo[] _traffic_lights
    (apply #'+ (send-all _traffic_lights :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; carla_msgs/CarlaTrafficLightInfo[] _traffic_lights
     (write-long (length _traffic_lights) s)
     (dolist (elem _traffic_lights)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; carla_msgs/CarlaTrafficLightInfo[] _traffic_lights
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _traffic_lights (let (r) (dotimes (i n) (push (instance carla_msgs::CarlaTrafficLightInfo :init) r)) r))
     (dolist (elem- _traffic_lights)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get carla_msgs::CarlaTrafficLightInfoList :md5sum-) "d1e03fe534c61bfaafc4dfce64de368a")
(setf (get carla_msgs::CarlaTrafficLightInfoList :datatype-) "carla_msgs/CarlaTrafficLightInfoList")
(setf (get carla_msgs::CarlaTrafficLightInfoList :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
CarlaTrafficLightInfo[] traffic_lights

================================================================================
MSG: carla_msgs/CarlaTrafficLightInfo
#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
uint32 id
geometry_msgs/Pose transform
CarlaBoundingBox trigger_volume # position is relative to transform
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: carla_msgs/CarlaBoundingBox
#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
geometry_msgs/Vector3 center

geometry_msgs/Vector3 size

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :carla_msgs/CarlaTrafficLightInfoList "d1e03fe534c61bfaafc4dfce64de368a")


