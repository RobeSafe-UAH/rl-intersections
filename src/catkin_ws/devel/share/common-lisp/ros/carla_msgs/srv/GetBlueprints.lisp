; Auto-generated. Do not edit!


(cl:in-package carla_msgs-srv)


;//! \htmlinclude GetBlueprints-request.msg.html

(cl:defclass <GetBlueprints-request> (roslisp-msg-protocol:ros-message)
  ((filter
    :reader filter
    :initarg :filter
    :type cl:string
    :initform ""))
)

(cl:defclass GetBlueprints-request (<GetBlueprints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBlueprints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBlueprints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-srv:<GetBlueprints-request> is deprecated: use carla_msgs-srv:GetBlueprints-request instead.")))

(cl:ensure-generic-function 'filter-val :lambda-list '(m))
(cl:defmethod filter-val ((m <GetBlueprints-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:filter-val is deprecated.  Use carla_msgs-srv:filter instead.")
  (filter m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBlueprints-request>) ostream)
  "Serializes a message object of type '<GetBlueprints-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filter))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filter))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBlueprints-request>) istream)
  "Deserializes a message object of type '<GetBlueprints-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filter) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filter) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBlueprints-request>)))
  "Returns string type for a service object of type '<GetBlueprints-request>"
  "carla_msgs/GetBlueprintsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBlueprints-request)))
  "Returns string type for a service object of type 'GetBlueprints-request"
  "carla_msgs/GetBlueprintsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBlueprints-request>)))
  "Returns md5sum for a message object of type '<GetBlueprints-request>"
  "8c8fca221e4d3a2dbeec92f6b3d2eda4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBlueprints-request)))
  "Returns md5sum for a message object of type 'GetBlueprints-request"
  "8c8fca221e4d3a2dbeec92f6b3d2eda4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBlueprints-request>)))
  "Returns full string definition for message of type '<GetBlueprints-request>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%string filter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBlueprints-request)))
  "Returns full string definition for message of type 'GetBlueprints-request"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%string filter~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBlueprints-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filter))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBlueprints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBlueprints-request
    (cl:cons ':filter (filter msg))
))
;//! \htmlinclude GetBlueprints-response.msg.html

(cl:defclass <GetBlueprints-response> (roslisp-msg-protocol:ros-message)
  ((blueprints
    :reader blueprints
    :initarg :blueprints
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass GetBlueprints-response (<GetBlueprints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetBlueprints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetBlueprints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-srv:<GetBlueprints-response> is deprecated: use carla_msgs-srv:GetBlueprints-response instead.")))

(cl:ensure-generic-function 'blueprints-val :lambda-list '(m))
(cl:defmethod blueprints-val ((m <GetBlueprints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:blueprints-val is deprecated.  Use carla_msgs-srv:blueprints instead.")
  (blueprints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetBlueprints-response>) ostream)
  "Serializes a message object of type '<GetBlueprints-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'blueprints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'blueprints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetBlueprints-response>) istream)
  "Deserializes a message object of type '<GetBlueprints-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'blueprints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'blueprints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetBlueprints-response>)))
  "Returns string type for a service object of type '<GetBlueprints-response>"
  "carla_msgs/GetBlueprintsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBlueprints-response)))
  "Returns string type for a service object of type 'GetBlueprints-response"
  "carla_msgs/GetBlueprintsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetBlueprints-response>)))
  "Returns md5sum for a message object of type '<GetBlueprints-response>"
  "8c8fca221e4d3a2dbeec92f6b3d2eda4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetBlueprints-response)))
  "Returns md5sum for a message object of type 'GetBlueprints-response"
  "8c8fca221e4d3a2dbeec92f6b3d2eda4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetBlueprints-response>)))
  "Returns full string definition for message of type '<GetBlueprints-response>"
  (cl:format cl:nil "string[] blueprints~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetBlueprints-response)))
  "Returns full string definition for message of type 'GetBlueprints-response"
  (cl:format cl:nil "string[] blueprints~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetBlueprints-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'blueprints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetBlueprints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetBlueprints-response
    (cl:cons ':blueprints (blueprints msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetBlueprints)))
  'GetBlueprints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetBlueprints)))
  'GetBlueprints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetBlueprints)))
  "Returns string type for a service object of type '<GetBlueprints>"
  "carla_msgs/GetBlueprints")