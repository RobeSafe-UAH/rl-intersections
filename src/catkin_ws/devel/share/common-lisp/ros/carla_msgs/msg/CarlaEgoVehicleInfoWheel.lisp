; Auto-generated. Do not edit!


(cl:in-package carla_msgs-msg)


;//! \htmlinclude CarlaEgoVehicleInfoWheel.msg.html

(cl:defclass <CarlaEgoVehicleInfoWheel> (roslisp-msg-protocol:ros-message)
  ((tire_friction
    :reader tire_friction
    :initarg :tire_friction
    :type cl:float
    :initform 0.0)
   (damping_rate
    :reader damping_rate
    :initarg :damping_rate
    :type cl:float
    :initform 0.0)
   (max_steer_angle
    :reader max_steer_angle
    :initarg :max_steer_angle
    :type cl:float
    :initform 0.0)
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (max_brake_torque
    :reader max_brake_torque
    :initarg :max_brake_torque
    :type cl:float
    :initform 0.0)
   (max_handbrake_torque
    :reader max_handbrake_torque
    :initarg :max_handbrake_torque
    :type cl:float
    :initform 0.0)
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass CarlaEgoVehicleInfoWheel (<CarlaEgoVehicleInfoWheel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarlaEgoVehicleInfoWheel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarlaEgoVehicleInfoWheel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-msg:<CarlaEgoVehicleInfoWheel> is deprecated: use carla_msgs-msg:CarlaEgoVehicleInfoWheel instead.")))

(cl:ensure-generic-function 'tire_friction-val :lambda-list '(m))
(cl:defmethod tire_friction-val ((m <CarlaEgoVehicleInfoWheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:tire_friction-val is deprecated.  Use carla_msgs-msg:tire_friction instead.")
  (tire_friction m))

(cl:ensure-generic-function 'damping_rate-val :lambda-list '(m))
(cl:defmethod damping_rate-val ((m <CarlaEgoVehicleInfoWheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:damping_rate-val is deprecated.  Use carla_msgs-msg:damping_rate instead.")
  (damping_rate m))

(cl:ensure-generic-function 'max_steer_angle-val :lambda-list '(m))
(cl:defmethod max_steer_angle-val ((m <CarlaEgoVehicleInfoWheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:max_steer_angle-val is deprecated.  Use carla_msgs-msg:max_steer_angle instead.")
  (max_steer_angle m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <CarlaEgoVehicleInfoWheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:radius-val is deprecated.  Use carla_msgs-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'max_brake_torque-val :lambda-list '(m))
(cl:defmethod max_brake_torque-val ((m <CarlaEgoVehicleInfoWheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:max_brake_torque-val is deprecated.  Use carla_msgs-msg:max_brake_torque instead.")
  (max_brake_torque m))

(cl:ensure-generic-function 'max_handbrake_torque-val :lambda-list '(m))
(cl:defmethod max_handbrake_torque-val ((m <CarlaEgoVehicleInfoWheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:max_handbrake_torque-val is deprecated.  Use carla_msgs-msg:max_handbrake_torque instead.")
  (max_handbrake_torque m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <CarlaEgoVehicleInfoWheel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:position-val is deprecated.  Use carla_msgs-msg:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarlaEgoVehicleInfoWheel>) ostream)
  "Serializes a message object of type '<CarlaEgoVehicleInfoWheel>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tire_friction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'damping_rate))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_steer_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_brake_torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_handbrake_torque))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarlaEgoVehicleInfoWheel>) istream)
  "Deserializes a message object of type '<CarlaEgoVehicleInfoWheel>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tire_friction) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'damping_rate) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_steer_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_brake_torque) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_handbrake_torque) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarlaEgoVehicleInfoWheel>)))
  "Returns string type for a message object of type '<CarlaEgoVehicleInfoWheel>"
  "carla_msgs/CarlaEgoVehicleInfoWheel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarlaEgoVehicleInfoWheel)))
  "Returns string type for a message object of type 'CarlaEgoVehicleInfoWheel"
  "carla_msgs/CarlaEgoVehicleInfoWheel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarlaEgoVehicleInfoWheel>)))
  "Returns md5sum for a message object of type '<CarlaEgoVehicleInfoWheel>"
  "192cba6d0621954855f8c957508a83b4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarlaEgoVehicleInfoWheel)))
  "Returns md5sum for a message object of type 'CarlaEgoVehicleInfoWheel"
  "192cba6d0621954855f8c957508a83b4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarlaEgoVehicleInfoWheel>)))
  "Returns full string definition for message of type '<CarlaEgoVehicleInfoWheel>"
  (cl:format cl:nil "#~%# Copyright (c) 2019-2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%float32 tire_friction~%float32 damping_rate~%float32 max_steer_angle~%float32 radius~%float32 max_brake_torque~%float32 max_handbrake_torque~%geometry_msgs/Vector3 position~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarlaEgoVehicleInfoWheel)))
  "Returns full string definition for message of type 'CarlaEgoVehicleInfoWheel"
  (cl:format cl:nil "#~%# Copyright (c) 2019-2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%float32 tire_friction~%float32 damping_rate~%float32 max_steer_angle~%float32 radius~%float32 max_brake_torque~%float32 max_handbrake_torque~%geometry_msgs/Vector3 position~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarlaEgoVehicleInfoWheel>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarlaEgoVehicleInfoWheel>))
  "Converts a ROS message object to a list"
  (cl:list 'CarlaEgoVehicleInfoWheel
    (cl:cons ':tire_friction (tire_friction msg))
    (cl:cons ':damping_rate (damping_rate msg))
    (cl:cons ':max_steer_angle (max_steer_angle msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':max_brake_torque (max_brake_torque msg))
    (cl:cons ':max_handbrake_torque (max_handbrake_torque msg))
    (cl:cons ':position (position msg))
))
