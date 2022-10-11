;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::CarlaEgoVehicleInfoWheel)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'CarlaEgoVehicleInfoWheel (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::CARLAEGOVEHICLEINFOWHEEL")
  (make-package "CARLA_MSGS::CARLAEGOVEHICLEINFOWHEEL"))

(in-package "ROS")
;;//! \htmlinclude CarlaEgoVehicleInfoWheel.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass carla_msgs::CarlaEgoVehicleInfoWheel
  :super ros::object
  :slots (_tire_friction _damping_rate _max_steer_angle _radius _max_brake_torque _max_handbrake_torque _position ))

(defmethod carla_msgs::CarlaEgoVehicleInfoWheel
  (:init
   (&key
    ((:tire_friction __tire_friction) 0.0)
    ((:damping_rate __damping_rate) 0.0)
    ((:max_steer_angle __max_steer_angle) 0.0)
    ((:radius __radius) 0.0)
    ((:max_brake_torque __max_brake_torque) 0.0)
    ((:max_handbrake_torque __max_handbrake_torque) 0.0)
    ((:position __position) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _tire_friction (float __tire_friction))
   (setq _damping_rate (float __damping_rate))
   (setq _max_steer_angle (float __max_steer_angle))
   (setq _radius (float __radius))
   (setq _max_brake_torque (float __max_brake_torque))
   (setq _max_handbrake_torque (float __max_handbrake_torque))
   (setq _position __position)
   self)
  (:tire_friction
   (&optional __tire_friction)
   (if __tire_friction (setq _tire_friction __tire_friction)) _tire_friction)
  (:damping_rate
   (&optional __damping_rate)
   (if __damping_rate (setq _damping_rate __damping_rate)) _damping_rate)
  (:max_steer_angle
   (&optional __max_steer_angle)
   (if __max_steer_angle (setq _max_steer_angle __max_steer_angle)) _max_steer_angle)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:max_brake_torque
   (&optional __max_brake_torque)
   (if __max_brake_torque (setq _max_brake_torque __max_brake_torque)) _max_brake_torque)
  (:max_handbrake_torque
   (&optional __max_handbrake_torque)
   (if __max_handbrake_torque (setq _max_handbrake_torque __max_handbrake_torque)) _max_handbrake_torque)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:serialization-length
   ()
   (+
    ;; float32 _tire_friction
    4
    ;; float32 _damping_rate
    4
    ;; float32 _max_steer_angle
    4
    ;; float32 _radius
    4
    ;; float32 _max_brake_torque
    4
    ;; float32 _max_handbrake_torque
    4
    ;; geometry_msgs/Vector3 _position
    (send _position :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _tire_friction
       (sys::poke _tire_friction (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _damping_rate
       (sys::poke _damping_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_steer_angle
       (sys::poke _max_steer_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_brake_torque
       (sys::poke _max_brake_torque (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_handbrake_torque
       (sys::poke _max_handbrake_torque (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Vector3 _position
       (send _position :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _tire_friction
     (setq _tire_friction (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _damping_rate
     (setq _damping_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_steer_angle
     (setq _max_steer_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_brake_torque
     (setq _max_brake_torque (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_handbrake_torque
     (setq _max_handbrake_torque (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;;
   self)
  )

(setf (get carla_msgs::CarlaEgoVehicleInfoWheel :md5sum-) "192cba6d0621954855f8c957508a83b4")
(setf (get carla_msgs::CarlaEgoVehicleInfoWheel :datatype-) "carla_msgs/CarlaEgoVehicleInfoWheel")
(setf (get carla_msgs::CarlaEgoVehicleInfoWheel :definition-)
      "#
# Copyright (c) 2019-2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
float32 tire_friction
float32 damping_rate
float32 max_steer_angle
float32 radius
float32 max_brake_torque
float32 max_handbrake_torque
geometry_msgs/Vector3 position

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



(provide :carla_msgs/CarlaEgoVehicleInfoWheel "192cba6d0621954855f8c957508a83b4")


