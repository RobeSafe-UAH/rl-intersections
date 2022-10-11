; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Path.msg.html

(cl:defclass <Path> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (waypoints
    :reader waypoints
    :initarg :waypoints
    :type (cl:vector t4ac_msgs-msg:Waypoint)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:Waypoint :initial-element (cl:make-instance 't4ac_msgs-msg:Waypoint))))
)

(cl:defclass Path (<Path>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Path>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Path)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Path> is deprecated: use t4ac_msgs-msg:Path instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'waypoints-val :lambda-list '(m))
(cl:defmethod waypoints-val ((m <Path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:waypoints-val is deprecated.  Use t4ac_msgs-msg:waypoints instead.")
  (waypoints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Path>) ostream)
  "Serializes a message object of type '<Path>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'waypoints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'waypoints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Path>) istream)
  "Deserializes a message object of type '<Path>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'waypoints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'waypoints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:Waypoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Path>)))
  "Returns string type for a message object of type '<Path>"
  "t4ac_msgs/Path")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Path)))
  "Returns string type for a message object of type 'Path"
  "t4ac_msgs/Path")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Path>)))
  "Returns md5sum for a message object of type '<Path>"
  "3a4b34812a4e41066c4833c8e14f72fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Path)))
  "Returns md5sum for a message object of type 'Path"
  "3a4b34812a4e41066c4833c8e14f72fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Path>)))
  "Returns full string definition for message of type '<Path>"
  (cl:format cl:nil "# T4ac Project ~%~%Header header~%Waypoint[] waypoints~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Waypoint~%# T4ac Project ~%~%Header header~%int32 id~%Transform transform~%int32 road_id~%int32 lane_id~%int32 junction~%float64 s~%float64 lane_width~%string lane_change~%string lane_type~%string right_lane_marking~%string left_lane_marking~%int32 vmax~%string vunit~%int32 nLanes~%int32 lanePosition~%================================================================================~%MSG: t4ac_msgs/Transform~%# T4ac Project~%~%Location location~%Rotation rotation~%================================================================================~%MSG: t4ac_msgs/Location~%# T4ac Project ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: t4ac_msgs/Rotation~%# T4ac Project ~%~%float64 pitch~%float64 yaw~%float64 roll~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Path)))
  "Returns full string definition for message of type 'Path"
  (cl:format cl:nil "# T4ac Project ~%~%Header header~%Waypoint[] waypoints~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Waypoint~%# T4ac Project ~%~%Header header~%int32 id~%Transform transform~%int32 road_id~%int32 lane_id~%int32 junction~%float64 s~%float64 lane_width~%string lane_change~%string lane_type~%string right_lane_marking~%string left_lane_marking~%int32 vmax~%string vunit~%int32 nLanes~%int32 lanePosition~%================================================================================~%MSG: t4ac_msgs/Transform~%# T4ac Project~%~%Location location~%Rotation rotation~%================================================================================~%MSG: t4ac_msgs/Location~%# T4ac Project ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: t4ac_msgs/Rotation~%# T4ac Project ~%~%float64 pitch~%float64 yaw~%float64 roll~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Path>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'waypoints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Path>))
  "Converts a ROS message object to a list"
  (cl:list 'Path
    (cl:cons ':header (header msg))
    (cl:cons ':waypoints (waypoints msg))
))
