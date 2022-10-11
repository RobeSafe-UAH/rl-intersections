; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Landmark.msg.html

(cl:defclass <Landmark> (roslisp-msg-protocol:ros-message)
  ((location
    :reader location
    :initarg :location
    :type t4ac_msgs-msg:Node
    :initform (cl:make-instance 't4ac_msgs-msg:Node))
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (affecting_road
    :reader affecting_road
    :initarg :affecting_road
    :type cl:string
    :initform ""))
)

(cl:defclass Landmark (<Landmark>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Landmark>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Landmark)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Landmark> is deprecated: use t4ac_msgs-msg:Landmark instead.")))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <Landmark>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:location-val is deprecated.  Use t4ac_msgs-msg:location instead.")
  (location m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <Landmark>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:distance-val is deprecated.  Use t4ac_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'affecting_road-val :lambda-list '(m))
(cl:defmethod affecting_road-val ((m <Landmark>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:affecting_road-val is deprecated.  Use t4ac_msgs-msg:affecting_road instead.")
  (affecting_road m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Landmark>) ostream)
  "Serializes a message object of type '<Landmark>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'location) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'affecting_road))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'affecting_road))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Landmark>) istream)
  "Deserializes a message object of type '<Landmark>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'location) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'affecting_road) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'affecting_road) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Landmark>)))
  "Returns string type for a message object of type '<Landmark>"
  "t4ac_msgs/Landmark")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Landmark)))
  "Returns string type for a message object of type 'Landmark"
  "t4ac_msgs/Landmark")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Landmark>)))
  "Returns md5sum for a message object of type '<Landmark>"
  "0379807a041d75b407e703bdf19b973a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Landmark)))
  "Returns md5sum for a message object of type 'Landmark"
  "0379807a041d75b407e703bdf19b973a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Landmark>)))
  "Returns full string definition for message of type '<Landmark>"
  (cl:format cl:nil "### Landmark definition ###~%~%Node location~%float64 distance~%string affecting_road~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Landmark)))
  "Returns full string definition for message of type 'Landmark"
  (cl:format cl:nil "### Landmark definition ###~%~%Node location~%float64 distance~%string affecting_road~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Landmark>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
     8
     4 (cl:length (cl:slot-value msg 'affecting_road))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Landmark>))
  "Converts a ROS message object to a list"
  (cl:list 'Landmark
    (cl:cons ':location (location msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':affecting_road (affecting_road msg))
))
