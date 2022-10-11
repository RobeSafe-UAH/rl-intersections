; Auto-generated. Do not edit!


(cl:in-package carla_msgs-srv)


;//! \htmlinclude SpawnObject-request.msg.html

(cl:defclass <SpawnObject-request> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (attributes
    :reader attributes
    :initarg :attributes
    :type (cl:vector diagnostic_msgs-msg:KeyValue)
   :initform (cl:make-array 0 :element-type 'diagnostic_msgs-msg:KeyValue :initial-element (cl:make-instance 'diagnostic_msgs-msg:KeyValue)))
   (transform
    :reader transform
    :initarg :transform
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (attach_to
    :reader attach_to
    :initarg :attach_to
    :type cl:integer
    :initform 0)
   (random_pose
    :reader random_pose
    :initarg :random_pose
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SpawnObject-request (<SpawnObject-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpawnObject-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpawnObject-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-srv:<SpawnObject-request> is deprecated: use carla_msgs-srv:SpawnObject-request instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <SpawnObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:type-val is deprecated.  Use carla_msgs-srv:type instead.")
  (type m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SpawnObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:id-val is deprecated.  Use carla_msgs-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'attributes-val :lambda-list '(m))
(cl:defmethod attributes-val ((m <SpawnObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:attributes-val is deprecated.  Use carla_msgs-srv:attributes instead.")
  (attributes m))

(cl:ensure-generic-function 'transform-val :lambda-list '(m))
(cl:defmethod transform-val ((m <SpawnObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:transform-val is deprecated.  Use carla_msgs-srv:transform instead.")
  (transform m))

(cl:ensure-generic-function 'attach_to-val :lambda-list '(m))
(cl:defmethod attach_to-val ((m <SpawnObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:attach_to-val is deprecated.  Use carla_msgs-srv:attach_to instead.")
  (attach_to m))

(cl:ensure-generic-function 'random_pose-val :lambda-list '(m))
(cl:defmethod random_pose-val ((m <SpawnObject-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:random_pose-val is deprecated.  Use carla_msgs-srv:random_pose instead.")
  (random_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpawnObject-request>) ostream)
  "Serializes a message object of type '<SpawnObject-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'attributes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'attributes))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'transform) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'attach_to)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'attach_to)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'attach_to)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'attach_to)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'random_pose) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpawnObject-request>) istream)
  "Deserializes a message object of type '<SpawnObject-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'attributes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'attributes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'diagnostic_msgs-msg:KeyValue))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'transform) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'attach_to)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'attach_to)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'attach_to)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'attach_to)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'random_pose) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpawnObject-request>)))
  "Returns string type for a service object of type '<SpawnObject-request>"
  "carla_msgs/SpawnObjectRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpawnObject-request)))
  "Returns string type for a service object of type 'SpawnObject-request"
  "carla_msgs/SpawnObjectRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpawnObject-request>)))
  "Returns md5sum for a message object of type '<SpawnObject-request>"
  "e33e3f6271c805c5651cbf682dacbcbd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpawnObject-request)))
  "Returns md5sum for a message object of type 'SpawnObject-request"
  "e33e3f6271c805c5651cbf682dacbcbd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpawnObject-request>)))
  "Returns full string definition for message of type '<SpawnObject-request>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%~%string type~%string id~%diagnostic_msgs/KeyValue[] attributes~%geometry_msgs/Pose transform~%uint32 attach_to~%bool random_pose~%~%================================================================================~%MSG: diagnostic_msgs/KeyValue~%string key # what to label this value when viewing~%string value # a value to track over time~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpawnObject-request)))
  "Returns full string definition for message of type 'SpawnObject-request"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%~%string type~%string id~%diagnostic_msgs/KeyValue[] attributes~%geometry_msgs/Pose transform~%uint32 attach_to~%bool random_pose~%~%================================================================================~%MSG: diagnostic_msgs/KeyValue~%string key # what to label this value when viewing~%string value # a value to track over time~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpawnObject-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:length (cl:slot-value msg 'id))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'attributes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'transform))
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpawnObject-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SpawnObject-request
    (cl:cons ':type (type msg))
    (cl:cons ':id (id msg))
    (cl:cons ':attributes (attributes msg))
    (cl:cons ':transform (transform msg))
    (cl:cons ':attach_to (attach_to msg))
    (cl:cons ':random_pose (random_pose msg))
))
;//! \htmlinclude SpawnObject-response.msg.html

(cl:defclass <SpawnObject-response> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (error_string
    :reader error_string
    :initarg :error_string
    :type cl:string
    :initform ""))
)

(cl:defclass SpawnObject-response (<SpawnObject-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpawnObject-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpawnObject-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-srv:<SpawnObject-response> is deprecated: use carla_msgs-srv:SpawnObject-response instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SpawnObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:id-val is deprecated.  Use carla_msgs-srv:id instead.")
  (id m))

(cl:ensure-generic-function 'error_string-val :lambda-list '(m))
(cl:defmethod error_string-val ((m <SpawnObject-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-srv:error_string-val is deprecated.  Use carla_msgs-srv:error_string instead.")
  (error_string m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpawnObject-response>) ostream)
  "Serializes a message object of type '<SpawnObject-response>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'error_string))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'error_string))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpawnObject-response>) istream)
  "Deserializes a message object of type '<SpawnObject-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error_string) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'error_string) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpawnObject-response>)))
  "Returns string type for a service object of type '<SpawnObject-response>"
  "carla_msgs/SpawnObjectResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpawnObject-response)))
  "Returns string type for a service object of type 'SpawnObject-response"
  "carla_msgs/SpawnObjectResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpawnObject-response>)))
  "Returns md5sum for a message object of type '<SpawnObject-response>"
  "e33e3f6271c805c5651cbf682dacbcbd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpawnObject-response)))
  "Returns md5sum for a message object of type 'SpawnObject-response"
  "e33e3f6271c805c5651cbf682dacbcbd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpawnObject-response>)))
  "Returns full string definition for message of type '<SpawnObject-response>"
  (cl:format cl:nil "int32 id~%string error_string~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpawnObject-response)))
  "Returns full string definition for message of type 'SpawnObject-response"
  (cl:format cl:nil "int32 id~%string error_string~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpawnObject-response>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'error_string))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpawnObject-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SpawnObject-response
    (cl:cons ':id (id msg))
    (cl:cons ':error_string (error_string msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SpawnObject)))
  'SpawnObject-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SpawnObject)))
  'SpawnObject-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpawnObject)))
  "Returns string type for a service object of type '<SpawnObject>"
  "carla_msgs/SpawnObject")