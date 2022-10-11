;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::CarlaTrafficLightStatus)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'CarlaTrafficLightStatus (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS")
  (make-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))

(in-package "ROS")
;;//! \htmlinclude CarlaTrafficLightStatus.msg.html


(intern "*RED*" (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(shadow '*RED* (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(defconstant carla_msgs::CarlaTrafficLightStatus::*RED* 0)
(intern "*YELLOW*" (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(shadow '*YELLOW* (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(defconstant carla_msgs::CarlaTrafficLightStatus::*YELLOW* 1)
(intern "*GREEN*" (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(shadow '*GREEN* (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(defconstant carla_msgs::CarlaTrafficLightStatus::*GREEN* 2)
(intern "*OFF*" (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(shadow '*OFF* (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(defconstant carla_msgs::CarlaTrafficLightStatus::*OFF* 3)
(intern "*UNKNOWN*" (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(shadow '*UNKNOWN* (find-package "CARLA_MSGS::CARLATRAFFICLIGHTSTATUS"))
(defconstant carla_msgs::CarlaTrafficLightStatus::*UNKNOWN* 4)

(defun carla_msgs::CarlaTrafficLightStatus-to-symbol (const)
  (cond
        ((= const 0) 'carla_msgs::CarlaTrafficLightStatus::*RED*)
        ((= const 1) 'carla_msgs::CarlaTrafficLightStatus::*YELLOW*)
        ((= const 2) 'carla_msgs::CarlaTrafficLightStatus::*GREEN*)
        ((= const 3) 'carla_msgs::CarlaTrafficLightStatus::*OFF*)
        ((= const 4) 'carla_msgs::CarlaTrafficLightStatus::*UNKNOWN*)
        (t nil)))

(defclass carla_msgs::CarlaTrafficLightStatus
  :super ros::object
  :slots (_id _state ))

(defmethod carla_msgs::CarlaTrafficLightStatus
  (:init
   (&key
    ((:id __id) 0)
    ((:state __state) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _state (round __state))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:serialization-length
   ()
   (+
    ;; uint32 _id
    4
    ;; uint8 _state
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _id
       (write-long _id s)
     ;; uint8 _state
       (write-byte _state s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _state
     (setq _state (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get carla_msgs::CarlaTrafficLightStatus :md5sum-) "efe41b78c4438f29488e7ecfe6631a9b")
(setf (get carla_msgs::CarlaTrafficLightStatus :datatype-) "carla_msgs/CarlaTrafficLightStatus")
(setf (get carla_msgs::CarlaTrafficLightStatus :definition-)
      "#
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



(provide :carla_msgs/CarlaTrafficLightStatus "efe41b78c4438f29488e7ecfe6631a9b")


