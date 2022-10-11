; Auto-generated. Do not edit!


(cl:in-package carla_msgs-msg)


;//! \htmlinclude CarlaBoundingBox.msg.html

(cl:defclass <CarlaBoundingBox> (roslisp-msg-protocol:ros-message)
  ((center
    :reader center
    :initarg :center
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (size
    :reader size
    :initarg :size
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass CarlaBoundingBox (<CarlaBoundingBox>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarlaBoundingBox>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarlaBoundingBox)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-msg:<CarlaBoundingBox> is deprecated: use carla_msgs-msg:CarlaBoundingBox instead.")))

(cl:ensure-generic-function 'center-val :lambda-list '(m))
(cl:defmethod center-val ((m <CarlaBoundingBox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:center-val is deprecated.  Use carla_msgs-msg:center instead.")
  (center m))

(cl:ensure-generic-function 'size-val :lambda-list '(m))
(cl:defmethod size-val ((m <CarlaBoundingBox>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:size-val is deprecated.  Use carla_msgs-msg:size instead.")
  (size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarlaBoundingBox>) ostream)
  "Serializes a message object of type '<CarlaBoundingBox>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'center) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'size) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarlaBoundingBox>) istream)
  "Deserializes a message object of type '<CarlaBoundingBox>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'center) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'size) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarlaBoundingBox>)))
  "Returns string type for a message object of type '<CarlaBoundingBox>"
  "carla_msgs/CarlaBoundingBox")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarlaBoundingBox)))
  "Returns string type for a message object of type 'CarlaBoundingBox"
  "carla_msgs/CarlaBoundingBox")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarlaBoundingBox>)))
  "Returns md5sum for a message object of type '<CarlaBoundingBox>"
  "17746d0996c54d9b8b0dfe6f3cd0b588")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarlaBoundingBox)))
  "Returns md5sum for a message object of type 'CarlaBoundingBox"
  "17746d0996c54d9b8b0dfe6f3cd0b588")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarlaBoundingBox>)))
  "Returns full string definition for message of type '<CarlaBoundingBox>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%geometry_msgs/Vector3 center~%~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarlaBoundingBox)))
  "Returns full string definition for message of type 'CarlaBoundingBox"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%geometry_msgs/Vector3 center~%~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarlaBoundingBox>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'center))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'size))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarlaBoundingBox>))
  "Converts a ROS message object to a list"
  (cl:list 'CarlaBoundingBox
    (cl:cons ':center (center msg))
    (cl:cons ':size (size msg))
))
