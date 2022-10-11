; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude RegulatoryElement.msg.html

(cl:defclass <RegulatoryElement> (roslisp-msg-protocol:ros-message)
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
   (location
    :reader location
    :initarg :location
    :type t4ac_msgs-msg:Node
    :initform (cl:make-instance 't4ac_msgs-msg:Node))
   (distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0)
   (affecting_roads
    :reader affecting_roads
    :initarg :affecting_roads
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (landmarks
    :reader landmarks
    :initarg :landmarks
    :type (cl:vector t4ac_msgs-msg:Landmark)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:Landmark :initial-element (cl:make-instance 't4ac_msgs-msg:Landmark))))
)

(cl:defclass RegulatoryElement (<RegulatoryElement>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RegulatoryElement>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RegulatoryElement)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<RegulatoryElement> is deprecated: use t4ac_msgs-msg:RegulatoryElement instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <RegulatoryElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:type-val is deprecated.  Use t4ac_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <RegulatoryElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:id-val is deprecated.  Use t4ac_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <RegulatoryElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:location-val is deprecated.  Use t4ac_msgs-msg:location instead.")
  (location m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <RegulatoryElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:distance-val is deprecated.  Use t4ac_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'affecting_roads-val :lambda-list '(m))
(cl:defmethod affecting_roads-val ((m <RegulatoryElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:affecting_roads-val is deprecated.  Use t4ac_msgs-msg:affecting_roads instead.")
  (affecting_roads m))

(cl:ensure-generic-function 'landmarks-val :lambda-list '(m))
(cl:defmethod landmarks-val ((m <RegulatoryElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:landmarks-val is deprecated.  Use t4ac_msgs-msg:landmarks instead.")
  (landmarks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RegulatoryElement>) ostream)
  "Serializes a message object of type '<RegulatoryElement>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'affecting_roads))))
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
   (cl:slot-value msg 'affecting_roads))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'landmarks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'landmarks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RegulatoryElement>) istream)
  "Deserializes a message object of type '<RegulatoryElement>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'affecting_roads) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'affecting_roads)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'landmarks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'landmarks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:Landmark))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RegulatoryElement>)))
  "Returns string type for a message object of type '<RegulatoryElement>"
  "t4ac_msgs/RegulatoryElement")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RegulatoryElement)))
  "Returns string type for a message object of type 'RegulatoryElement"
  "t4ac_msgs/RegulatoryElement")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RegulatoryElement>)))
  "Returns md5sum for a message object of type '<RegulatoryElement>"
  "4683a17004de77e66d22587d1460f95a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RegulatoryElement)))
  "Returns md5sum for a message object of type 'RegulatoryElement"
  "4683a17004de77e66d22587d1460f95a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RegulatoryElement>)))
  "Returns full string definition for message of type '<RegulatoryElement>"
  (cl:format cl:nil "### Regulatory Element definition ###~%~%string type~%string id~%Node location~%float64 distance~%string[] affecting_roads~%Landmark[] landmarks~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%================================================================================~%MSG: t4ac_msgs/Landmark~%### Landmark definition ###~%~%Node location~%float64 distance~%string affecting_road~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RegulatoryElement)))
  "Returns full string definition for message of type 'RegulatoryElement"
  (cl:format cl:nil "### Regulatory Element definition ###~%~%string type~%string id~%Node location~%float64 distance~%string[] affecting_roads~%Landmark[] landmarks~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%================================================================================~%MSG: t4ac_msgs/Landmark~%### Landmark definition ###~%~%Node location~%float64 distance~%string affecting_road~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RegulatoryElement>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:length (cl:slot-value msg 'id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'affecting_roads) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'landmarks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RegulatoryElement>))
  "Converts a ROS message object to a list"
  (cl:list 'RegulatoryElement
    (cl:cons ':type (type msg))
    (cl:cons ':id (id msg))
    (cl:cons ':location (location msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':affecting_roads (affecting_roads msg))
    (cl:cons ':landmarks (landmarks msg))
))
