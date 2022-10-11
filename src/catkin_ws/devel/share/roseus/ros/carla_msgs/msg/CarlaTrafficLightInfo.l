;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::CarlaTrafficLightInfo)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'CarlaTrafficLightInfo (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::CARLATRAFFICLIGHTINFO")
  (make-package "CARLA_MSGS::CARLATRAFFICLIGHTINFO"))

(in-package "ROS")
;;//! \htmlinclude CarlaTrafficLightInfo.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass carla_msgs::CarlaTrafficLightInfo
  :super ros::object
  :slots (_id _transform _trigger_volume ))

(defmethod carla_msgs::CarlaTrafficLightInfo
  (:init
   (&key
    ((:id __id) 0)
    ((:transform __transform) (instance geometry_msgs::Pose :init))
    ((:trigger_volume __trigger_volume) (instance carla_msgs::CarlaBoundingBox :init))
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _transform __transform)
   (setq _trigger_volume __trigger_volume)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:transform
   (&rest __transform)
   (if (keywordp (car __transform))
       (send* _transform __transform)
     (progn
       (if __transform (setq _transform (car __transform)))
       _transform)))
  (:trigger_volume
   (&rest __trigger_volume)
   (if (keywordp (car __trigger_volume))
       (send* _trigger_volume __trigger_volume)
     (progn
       (if __trigger_volume (setq _trigger_volume (car __trigger_volume)))
       _trigger_volume)))
  (:serialization-length
   ()
   (+
    ;; uint32 _id
    4
    ;; geometry_msgs/Pose _transform
    (send _transform :serialization-length)
    ;; carla_msgs/CarlaBoundingBox _trigger_volume
    (send _trigger_volume :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _id
       (write-long _id s)
     ;; geometry_msgs/Pose _transform
       (send _transform :serialize s)
     ;; carla_msgs/CarlaBoundingBox _trigger_volume
       (send _trigger_volume :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Pose _transform
     (send _transform :deserialize buf ptr-) (incf ptr- (send _transform :serialization-length))
   ;; carla_msgs/CarlaBoundingBox _trigger_volume
     (send _trigger_volume :deserialize buf ptr-) (incf ptr- (send _trigger_volume :serialization-length))
   ;;
   self)
  )

(setf (get carla_msgs::CarlaTrafficLightInfo :md5sum-) "c303b00d6ff9db591d60b1662aec9d48")
(setf (get carla_msgs::CarlaTrafficLightInfo :datatype-) "carla_msgs/CarlaTrafficLightInfo")
(setf (get carla_msgs::CarlaTrafficLightInfo :definition-)
      "#
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



(provide :carla_msgs/CarlaTrafficLightInfo "c303b00d6ff9db591d60b1662aec9d48")


