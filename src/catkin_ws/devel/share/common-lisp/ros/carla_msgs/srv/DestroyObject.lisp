; Auto-generated. Do not edit!


(cl:in-package carla_msgs-srv)


;//! \htmlinclude DestroyObject-request.msg.html

(cl:defclass <DestroyObject-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0))
)

(cl:defclass DestroyObject-request (<DestroyObject-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DestroyObject-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DestroyObject-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-srv:<DestroyObject-request> is deprecated: use carla_msgs-srv:DestroyObject-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <DestroyObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:id-val is deprecated.  Use carla_msgs-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DestroyObject-request>) ostream)
  "Serializes a message object of type '<DestroyObject-request>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DestroyObject-request>) istream)
  "Deserializes a message object of type '<DestroyObject-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DestroyObject-request>)))
  "Returns string type for a service object of type '<DestroyObject-request>"
  "carla_msgs/DestroyObjectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DestroyObject-request)))
  "Returns string type for a service object of type 'DestroyObject-request"
  "carla_msgs/DestroyObjectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DestroyObject-request>)))
  "Returns md5sum for a message object of type '<DestroyObject-request>"
  "f66e2f1a2389241ede90395037adaed8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DestroyObject-request)))
  "Returns md5sum for a message object of type 'DestroyObject-request"
  "f66e2f1a2389241ede90395037adaed8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DestroyObject-request>)))
  "Returns full string definition for message of type '<DestroyObject-request>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%~%int32 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DestroyObject-request)))
  "Returns full string definition for message of type 'DestroyObject-request"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%~%int32 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DestroyObject-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DestroyObject-request>))
  "Converts a ROS message object to a list"
  (cl:list 'DestroyObject-request
    (cl:cons ':id (id msg))
))
;//! \htmlinclude DestroyObject-response.msg.html

(cl:defclass <DestroyObject-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass DestroyObject-response (<DestroyObject-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DestroyObject-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DestroyObject-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-srv:<DestroyObject-response> is deprecated: use carla_msgs-srv:DestroyObject-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <DestroyObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:success-val is deprecated.  Use carla_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DestroyObject-response>) ostream)
  "Serializes a message object of type '<DestroyObject-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DestroyObject-response>) istream)
  "Deserializes a message object of type '<DestroyObject-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DestroyObject-response>)))
  "Returns string type for a service object of type '<DestroyObject-response>"
  "carla_msgs/DestroyObjectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DestroyObject-response)))
  "Returns string type for a service object of type 'DestroyObject-response"
  "carla_msgs/DestroyObjectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DestroyObject-response>)))
  "Returns md5sum for a message object of type '<DestroyObject-response>"
  "f66e2f1a2389241ede90395037adaed8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DestroyObject-response)))
  "Returns md5sum for a message object of type 'DestroyObject-response"
  "f66e2f1a2389241ede90395037adaed8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DestroyObject-response>)))
  "Returns full string definition for message of type '<DestroyObject-response>"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DestroyObject-response)))
  "Returns full string definition for message of type 'DestroyObject-response"
  (cl:format cl:nil "bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DestroyObject-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DestroyObject-response>))
  "Converts a ROS message object to a list"
  (cl:list 'DestroyObject-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'DestroyObject)))
  'DestroyObject-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'DestroyObject)))
  'DestroyObject-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DestroyObject)))
  "Returns string type for a service object of type '<DestroyObject>"
  "carla_msgs/DestroyObject")