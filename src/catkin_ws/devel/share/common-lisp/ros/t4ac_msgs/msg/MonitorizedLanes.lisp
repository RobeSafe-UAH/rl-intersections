; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude MonitorizedLanes.msg.html

(cl:defclass <MonitorizedLanes> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (lanes
    :reader lanes
    :initarg :lanes
    :type (cl:vector t4ac_msgs-msg:Lane)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:Lane :initial-element (cl:make-instance 't4ac_msgs-msg:Lane))))
)

(cl:defclass MonitorizedLanes (<MonitorizedLanes>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MonitorizedLanes>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MonitorizedLanes)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<MonitorizedLanes> is deprecated: use t4ac_msgs-msg:MonitorizedLanes instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MonitorizedLanes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'lanes-val :lambda-list '(m))
(cl:defmethod lanes-val ((m <MonitorizedLanes>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:lanes-val is deprecated.  Use t4ac_msgs-msg:lanes instead.")
  (lanes m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MonitorizedLanes>) ostream)
  "Serializes a message object of type '<MonitorizedLanes>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lanes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'lanes))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MonitorizedLanes>) istream)
  "Deserializes a message object of type '<MonitorizedLanes>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lanes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lanes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:Lane))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MonitorizedLanes>)))
  "Returns string type for a message object of type '<MonitorizedLanes>"
  "t4ac_msgs/MonitorizedLanes")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MonitorizedLanes)))
  "Returns string type for a message object of type 'MonitorizedLanes"
  "t4ac_msgs/MonitorizedLanes")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MonitorizedLanes>)))
  "Returns md5sum for a message object of type '<MonitorizedLanes>"
  "1a578abb53051333eb4739652f419713")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MonitorizedLanes)))
  "Returns md5sum for a message object of type 'MonitorizedLanes"
  "1a578abb53051333eb4739652f419713")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MonitorizedLanes>)))
  "Returns full string definition for message of type '<MonitorizedLanes>"
  (cl:format cl:nil "## Monitorized lanes ~%#~%# MonitorizedLanes is just a list of lanes around the vehicle~%~%Header header~%Lane[] lanes~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Lane~%## Lane definition (from the Carla library) in ROS message format~%#~%# Lanes are mapped using PythonAPI from Carla.~%# They are made up from one \"Way\" that determine its left and right bounds~%~%#uint8 speedlimit	# mapped max speed in km/h~%Way left		# mapped left boundary~%Way right		# mapped right boundary ~%string role     	# Role: current, backside, left, right~%~%#--OPTIONAL--~%#int32 lane_id 		# lane id from xodr~%#bool is_junction	# true if is on a junction ~%#float lane_width	# horizontal size of the road~%~%#string type		# mapped type of lanelet~%~%================================================================================~%MSG: t4ac_msgs/Way~%# Way definition ~%~%Node[] way	# list of nodes~%~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MonitorizedLanes)))
  "Returns full string definition for message of type 'MonitorizedLanes"
  (cl:format cl:nil "## Monitorized lanes ~%#~%# MonitorizedLanes is just a list of lanes around the vehicle~%~%Header header~%Lane[] lanes~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Lane~%## Lane definition (from the Carla library) in ROS message format~%#~%# Lanes are mapped using PythonAPI from Carla.~%# They are made up from one \"Way\" that determine its left and right bounds~%~%#uint8 speedlimit	# mapped max speed in km/h~%Way left		# mapped left boundary~%Way right		# mapped right boundary ~%string role     	# Role: current, backside, left, right~%~%#--OPTIONAL--~%#int32 lane_id 		# lane id from xodr~%#bool is_junction	# true if is on a junction ~%#float lane_width	# horizontal size of the road~%~%#string type		# mapped type of lanelet~%~%================================================================================~%MSG: t4ac_msgs/Way~%# Way definition ~%~%Node[] way	# list of nodes~%~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MonitorizedLanes>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lanes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MonitorizedLanes>))
  "Converts a ROS message object to a list"
  (cl:list 'MonitorizedLanes
    (cl:cons ':header (header msg))
    (cl:cons ':lanes (lanes msg))
))
