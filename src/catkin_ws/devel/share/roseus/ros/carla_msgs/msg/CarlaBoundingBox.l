;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::CarlaBoundingBox)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'CarlaBoundingBox (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::CARLABOUNDINGBOX")
  (make-package "CARLA_MSGS::CARLABOUNDINGBOX"))

(in-package "ROS")
;;//! \htmlinclude CarlaBoundingBox.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass carla_msgs::CarlaBoundingBox
  :super ros::object
  :slots (_center _size ))

(defmethod carla_msgs::CarlaBoundingBox
  (:init
   (&key
    ((:center __center) (instance geometry_msgs::Vector3 :init))
    ((:size __size) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _center __center)
   (setq _size __size)
   self)
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:size
   (&rest __size)
   (if (keywordp (car __size))
       (send* _size __size)
     (progn
       (if __size (setq _size (car __size)))
       _size)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _center
    (send _center :serialization-length)
    ;; geometry_msgs/Vector3 _size
    (send _size :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _center
       (send _center :serialize s)
     ;; geometry_msgs/Vector3 _size
       (send _size :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; geometry_msgs/Vector3 _size
     (send _size :deserialize buf ptr-) (incf ptr- (send _size :serialization-length))
   ;;
   self)
  )

(setf (get carla_msgs::CarlaBoundingBox :md5sum-) "17746d0996c54d9b8b0dfe6f3cd0b588")
(setf (get carla_msgs::CarlaBoundingBox :datatype-) "carla_msgs/CarlaBoundingBox")
(setf (get carla_msgs::CarlaBoundingBox :definition-)
      "#
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



(provide :carla_msgs/CarlaBoundingBox "17746d0996c54d9b8b0dfe6f3cd0b588")


