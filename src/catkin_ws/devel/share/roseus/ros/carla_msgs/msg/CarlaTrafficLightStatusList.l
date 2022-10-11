;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::CarlaTrafficLightStatusList)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'CarlaTrafficLightStatusList (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUSLIST")
  (make-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUSLIST"))

(in-package "ROS")
;;//! \htmlinclude CarlaTrafficLightStatusList.msg.html


(defclass carla_msgs::CarlaTrafficLightStatusList
  :super ros::object
  :slots (_traffic_lights ))

(defmethod carla_msgs::CarlaTrafficLightStatusList
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
    ;; carla_msgs/CarlaTrafficLightStatus[] _traffic_lights
    (apply #'+ (send-all _traffic_lights :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; carla_msgs/CarlaTrafficLightStatus[] _traffic_lights
     (write-long (length _traffic_lights) s)
     (dolist (elem _traffic_lights)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; carla_msgs/CarlaTrafficLightStatus[] _traffic_lights
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _traffic_lights (let (r) (dotimes (i n) (push (instance carla_msgs::CarlaTrafficLightStatus :init) r)) r))
     (dolist (elem- _traffic_lights)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get carla_msgs::CarlaTrafficLightStatusList :md5sum-) "99769ac9a785c6de87ed86d7bb4a653a")
(setf (get carla_msgs::CarlaTrafficLightStatusList :datatype-) "carla_msgs/CarlaTrafficLightStatusList")
(setf (get carla_msgs::CarlaTrafficLightStatusList :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
CarlaTrafficLightStatus[] traffic_lights

================================================================================
MSG: carla_msgs/CarlaTrafficLightStatus
#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
uint32 id

uint8 RED=0
uint8 YELLOW=1
uint8 GREEN=2
uint8 OFF=3
uint8 UNKNOWN=4

uint8 state

")



(provide :carla_msgs/CarlaTrafficLightStatusList "99769ac9a785c6de87ed86d7bb4a653a")


