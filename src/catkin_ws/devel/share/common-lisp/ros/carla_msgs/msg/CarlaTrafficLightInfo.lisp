; Auto-generated. Do not edit!


(cl:in-package carla_msgs-msg)


;//! \htmlinclude CarlaTrafficLightInfo.msg.html

(cl:defclass <CarlaTrafficLightInfo> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (transform
    :reader transform
    :initarg :transform
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (trigger_volume
    :reader trigger_volume
    :initarg :trigger_volume
    :type carla_msgs-msg:CarlaBoundingBox
    :initform (cl:make-instance 'carla_msgs-msg:CarlaBoundingBox)))
)

(cl:defclass CarlaTrafficLightInfo (<CarlaTrafficLightInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarlaTrafficLightInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarlaTrafficLightInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-msg:<CarlaTrafficLightInfo> is deprecated: use carla_msgs-msg:CarlaTrafficLightInfo instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <CarlaTrafficLightInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:id-val is deprecated.  Use carla_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'transform-val :lambda-list '(m))
(cl:defmethod transform-val ((m <CarlaTrafficLightInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:transform-val is deprecated.  Use carla_msgs-msg:transform instead.")
  (transform m))

(cl:ensure-generic-function 'trigger_volume-val :lambda-list '(m))
(cl:defmethod trigger_volume-val ((m <CarlaTrafficLightInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:trigger_volume-val is deprecated.  Use carla_msgs-msg:trigger_volume instead.")
  (trigger_volume m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarlaTrafficLightInfo>) ostream)
  "Serializes a message object of type '<CarlaTrafficLightInfo>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'transform) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'trigger_volume) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarlaTrafficLightInfo>) istream)
  "Deserializes a message object of type '<CarlaTrafficLightInfo>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'transform) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'trigger_volume) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarlaTrafficLightInfo>)))
  "Returns string type for a message object of type '<CarlaTrafficLightInfo>"
  "carla_msgs/CarlaTrafficLightInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarlaTrafficLightInfo)))
  "Returns string type for a message object of type 'CarlaTrafficLightInfo"
  "carla_msgs/CarlaTrafficLightInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarlaTrafficLightInfo>)))
  "Returns md5sum for a message object of type '<CarlaTrafficLightInfo>"
  "c303b00d6ff9db591d60b1662aec9d48")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarlaTrafficLightInfo)))
  "Returns md5sum for a message object of type 'CarlaTrafficLightInfo"
  "c303b00d6ff9db591d60b1662aec9d48")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarlaTrafficLightInfo>)))
  "Returns full string definition for message of type '<CarlaTrafficLightInfo>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%uint32 id~%geometry_msgs/Pose transform~%CarlaBoundingBox trigger_volume # position is relative to transform~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: carla_msgs/CarlaBoundingBox~%#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%geometry_msgs/Vector3 center~%~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarlaTrafficLightInfo)))
  "Returns full string definition for message of type 'CarlaTrafficLightInfo"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%uint32 id~%geometry_msgs/Pose transform~%CarlaBoundingBox trigger_volume # position is relative to transform~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: carla_msgs/CarlaBoundingBox~%#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%geometry_msgs/Vector3 center~%~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarlaTrafficLightInfo>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'transform))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'trigger_volume))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarlaTrafficLightInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'CarlaTrafficLightInfo
    (cl:cons ':id (id msg))
    (cl:cons ':transform (transform msg))
    (cl:cons ':trigger_volume (trigger_volume msg))
))
