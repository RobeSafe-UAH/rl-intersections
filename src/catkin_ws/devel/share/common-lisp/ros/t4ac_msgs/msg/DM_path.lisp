; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude DM_path.msg.html

(cl:defclass <DM_path> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (poses
    :reader poses
    :initarg :poses
    :type (cl:vector t4ac_msgs-msg:DM_posestamped)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:DM_posestamped :initial-element (cl:make-instance 't4ac_msgs-msg:DM_posestamped))))
)

(cl:defclass DM_path (<DM_path>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DM_path>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DM_path)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<DM_path> is deprecated: use t4ac_msgs-msg:DM_path instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <DM_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'poses-val :lambda-list '(m))
(cl:defmethod poses-val ((m <DM_path>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:poses-val is deprecated.  Use t4ac_msgs-msg:poses instead.")
  (poses m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DM_path>) ostream)
  "Serializes a message object of type '<DM_path>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'poses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'poses))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DM_path>) istream)
  "Deserializes a message object of type '<DM_path>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'poses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'poses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:DM_posestamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DM_path>)))
  "Returns string type for a message object of type '<DM_path>"
  "t4ac_msgs/DM_path")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DM_path)))
  "Returns string type for a message object of type 'DM_path"
  "t4ac_msgs/DM_path")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DM_path>)))
  "Returns md5sum for a message object of type '<DM_path>"
  "e85a0bd101b7748691d86afd9e4c40f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DM_path)))
  "Returns md5sum for a message object of type 'DM_path"
  "e85a0bd101b7748691d86afd9e4c40f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DM_path>)))
  "Returns full string definition for message of type '<DM_path>"
  (cl:format cl:nil "# T4ac Project ~%~%Header header~%DM_posestamped[] poses~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/DM_posestamped~%# T4ac Project~%~%Header header~%DM_pose pose~%================================================================================~%MSG: t4ac_msgs/DM_pose~%# T4ac Project ~%~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%string lane_change  # can be right, left or both ~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DM_path)))
  "Returns full string definition for message of type 'DM_path"
  (cl:format cl:nil "# T4ac Project ~%~%Header header~%DM_posestamped[] poses~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/DM_posestamped~%# T4ac Project~%~%Header header~%DM_pose pose~%================================================================================~%MSG: t4ac_msgs/DM_pose~%# T4ac Project ~%~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%string lane_change  # can be right, left or both ~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DM_path>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'poses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DM_path>))
  "Converts a ROS message object to a list"
  (cl:list 'DM_path
    (cl:cons ':header (header msg))
    (cl:cons ':poses (poses msg))
))
