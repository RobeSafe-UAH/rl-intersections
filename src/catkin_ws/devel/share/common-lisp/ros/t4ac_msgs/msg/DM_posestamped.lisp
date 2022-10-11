; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude DM_posestamped.msg.html

(cl:defclass <DM_posestamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (pose
    :reader pose
    :initarg :pose
    :type t4ac_msgs-msg:DM_pose
    :initform (cl:make-instance 't4ac_msgs-msg:DM_pose)))
)

(cl:defclass DM_posestamped (<DM_posestamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DM_posestamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DM_posestamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<DM_posestamped> is deprecated: use t4ac_msgs-msg:DM_posestamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DM_posestamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <DM_posestamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:pose-val is deprecated.  Use t4ac_msgs-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DM_posestamped>) ostream)
  "Serializes a message object of type '<DM_posestamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DM_posestamped>) istream)
  "Deserializes a message object of type '<DM_posestamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DM_posestamped>)))
  "Returns string type for a message object of type '<DM_posestamped>"
  "t4ac_msgs/DM_posestamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DM_posestamped)))
  "Returns string type for a message object of type 'DM_posestamped"
  "t4ac_msgs/DM_posestamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DM_posestamped>)))
  "Returns md5sum for a message object of type '<DM_posestamped>"
  "74ec6b5a856c06afff73c472464844fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DM_posestamped)))
  "Returns md5sum for a message object of type 'DM_posestamped"
  "74ec6b5a856c06afff73c472464844fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DM_posestamped>)))
  "Returns full string definition for message of type '<DM_posestamped>"
  (cl:format cl:nil "# T4ac Project~%~%Header header~%DM_pose pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/DM_pose~%# T4ac Project ~%~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%string lane_change  # can be right, left or both ~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DM_posestamped)))
  "Returns full string definition for message of type 'DM_posestamped"
  (cl:format cl:nil "# T4ac Project~%~%Header header~%DM_pose pose~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/DM_pose~%# T4ac Project ~%~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%string lane_change  # can be right, left or both ~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DM_posestamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DM_posestamped>))
  "Converts a ROS message object to a list"
  (cl:list 'DM_posestamped
    (cl:cons ':header (header msg))
    (cl:cons ':pose (pose msg))
))
