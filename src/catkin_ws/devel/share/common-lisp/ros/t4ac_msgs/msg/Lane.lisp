; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Lane.msg.html

(cl:defclass <Lane> (roslisp-msg-protocol:ros-message)
  ((left
    :reader left
    :initarg :left
    :type t4ac_msgs-msg:Way
    :initform (cl:make-instance 't4ac_msgs-msg:Way))
   (right
    :reader right
    :initarg :right
    :type t4ac_msgs-msg:Way
    :initform (cl:make-instance 't4ac_msgs-msg:Way))
   (role
    :reader role
    :initarg :role
    :type cl:string
    :initform ""))
)

(cl:defclass Lane (<Lane>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Lane>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Lane)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Lane> is deprecated: use t4ac_msgs-msg:Lane instead.")))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <Lane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:left-val is deprecated.  Use t4ac_msgs-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <Lane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:right-val is deprecated.  Use t4ac_msgs-msg:right instead.")
  (right m))

(cl:ensure-generic-function 'role-val :lambda-list '(m))
(cl:defmethod role-val ((m <Lane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:role-val is deprecated.  Use t4ac_msgs-msg:role instead.")
  (role m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Lane>) ostream)
  "Serializes a message object of type '<Lane>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'left) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'right) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'role))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'role))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Lane>) istream)
  "Deserializes a message object of type '<Lane>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'left) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'right) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'role) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'role) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Lane>)))
  "Returns string type for a message object of type '<Lane>"
  "t4ac_msgs/Lane")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Lane)))
  "Returns string type for a message object of type 'Lane"
  "t4ac_msgs/Lane")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Lane>)))
  "Returns md5sum for a message object of type '<Lane>"
  "392f655a22f5ea3284af2c1a7aca7f99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Lane)))
  "Returns md5sum for a message object of type 'Lane"
  "392f655a22f5ea3284af2c1a7aca7f99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Lane>)))
  "Returns full string definition for message of type '<Lane>"
  (cl:format cl:nil "## Lane definition (from the Carla library) in ROS message format~%#~%# Lanes are mapped using PythonAPI from Carla.~%# They are made up from one \"Way\" that determine its left and right bounds~%~%#uint8 speedlimit	# mapped max speed in km/h~%Way left		# mapped left boundary~%Way right		# mapped right boundary ~%string role     	# Role: current, backside, left, right~%~%#--OPTIONAL--~%#int32 lane_id 		# lane id from xodr~%#bool is_junction	# true if is on a junction ~%#float lane_width	# horizontal size of the road~%~%#string type		# mapped type of lanelet~%~%================================================================================~%MSG: t4ac_msgs/Way~%# Way definition ~%~%Node[] way	# list of nodes~%~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Lane)))
  "Returns full string definition for message of type 'Lane"
  (cl:format cl:nil "## Lane definition (from the Carla library) in ROS message format~%#~%# Lanes are mapped using PythonAPI from Carla.~%# They are made up from one \"Way\" that determine its left and right bounds~%~%#uint8 speedlimit	# mapped max speed in km/h~%Way left		# mapped left boundary~%Way right		# mapped right boundary ~%string role     	# Role: current, backside, left, right~%~%#--OPTIONAL--~%#int32 lane_id 		# lane id from xodr~%#bool is_junction	# true if is on a junction ~%#float lane_width	# horizontal size of the road~%~%#string type		# mapped type of lanelet~%~%================================================================================~%MSG: t4ac_msgs/Way~%# Way definition ~%~%Node[] way	# list of nodes~%~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Lane>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'left))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'right))
     4 (cl:length (cl:slot-value msg 'role))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Lane>))
  "Converts a ROS message object to a list"
  (cl:list 'Lane
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
    (cl:cons ':role (role msg))
))
