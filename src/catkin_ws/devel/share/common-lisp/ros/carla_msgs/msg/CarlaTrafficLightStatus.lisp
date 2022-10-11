; Auto-generated. Do not edit!


(cl:in-package carla_msgs-msg)


;//! \htmlinclude CarlaTrafficLightStatus.msg.html

(cl:defclass <CarlaTrafficLightStatus> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (state
    :reader state
    :initarg :state
    :type cl:fixnum
    :initform 0))
)

(cl:defclass CarlaTrafficLightStatus (<CarlaTrafficLightStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarlaTrafficLightStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarlaTrafficLightStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-msg:<CarlaTrafficLightStatus> is deprecated: use carla_msgs-msg:CarlaTrafficLightStatus instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <CarlaTrafficLightStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:id-val is deprecated.  Use carla_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <CarlaTrafficLightStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:state-val is deprecated.  Use carla_msgs-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<CarlaTrafficLightStatus>)))
    "Constants for message type '<CarlaTrafficLightStatus>"
  '((:RED . 0)
    (:YELLOW . 1)
    (:GREEN . 2)
    (:OFF . 3)
    (:UNKNOWN . 4))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'CarlaTrafficLightStatus)))
    "Constants for message type 'CarlaTrafficLightStatus"
  '((:RED . 0)
    (:YELLOW . 1)
    (:GREEN . 2)
    (:OFF . 3)
    (:UNKNOWN . 4))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarlaTrafficLightStatus>) ostream)
  "Serializes a message object of type '<CarlaTrafficLightStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarlaTrafficLightStatus>) istream)
  "Deserializes a message object of type '<CarlaTrafficLightStatus>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'state)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarlaTrafficLightStatus>)))
  "Returns string type for a message object of type '<CarlaTrafficLightStatus>"
  "carla_msgs/CarlaTrafficLightStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarlaTrafficLightStatus)))
  "Returns string type for a message object of type 'CarlaTrafficLightStatus"
  "carla_msgs/CarlaTrafficLightStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarlaTrafficLightStatus>)))
  "Returns md5sum for a message object of type '<CarlaTrafficLightStatus>"
  "efe41b78c4438f29488e7ecfe6631a9b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarlaTrafficLightStatus)))
  "Returns md5sum for a message object of type 'CarlaTrafficLightStatus"
  "efe41b78c4438f29488e7ecfe6631a9b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarlaTrafficLightStatus>)))
  "Returns full string definition for message of type '<CarlaTrafficLightStatus>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%uint32 id~%~%uint8 RED=0~%uint8 YELLOW=1~%uint8 GREEN=2~%uint8 OFF=3~%uint8 UNKNOWN=4~%~%uint8 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarlaTrafficLightStatus)))
  "Returns full string definition for message of type 'CarlaTrafficLightStatus"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%uint32 id~%~%uint8 RED=0~%uint8 YELLOW=1~%uint8 GREEN=2~%uint8 OFF=3~%uint8 UNKNOWN=4~%~%uint8 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarlaTrafficLightStatus>))
  (cl:+ 0
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarlaTrafficLightStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'CarlaTrafficLightStatus
    (cl:cons ':id (id msg))
    (cl:cons ':state (state msg))
))
