; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude BEV_trackers_list.msg.html

(cl:defclass <BEV_trackers_list> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bev_trackers_list
    :reader bev_trackers_list
    :initarg :bev_trackers_list
    :type (cl:vector t4ac_msgs-msg:BEV_tracker)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:BEV_tracker :initial-element (cl:make-instance 't4ac_msgs-msg:BEV_tracker))))
)

(cl:defclass BEV_trackers_list (<BEV_trackers_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BEV_trackers_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BEV_trackers_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<BEV_trackers_list> is deprecated: use t4ac_msgs-msg:BEV_trackers_list instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BEV_trackers_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bev_trackers_list-val :lambda-list '(m))
(cl:defmethod bev_trackers_list-val ((m <BEV_trackers_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:bev_trackers_list-val is deprecated.  Use t4ac_msgs-msg:bev_trackers_list instead.")
  (bev_trackers_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BEV_trackers_list>) ostream)
  "Serializes a message object of type '<BEV_trackers_list>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bev_trackers_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bev_trackers_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BEV_trackers_list>) istream)
  "Deserializes a message object of type '<BEV_trackers_list>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bev_trackers_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bev_trackers_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:BEV_tracker))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BEV_trackers_list>)))
  "Returns string type for a message object of type '<BEV_trackers_list>"
  "t4ac_msgs/BEV_trackers_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BEV_trackers_list)))
  "Returns string type for a message object of type 'BEV_trackers_list"
  "t4ac_msgs/BEV_trackers_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BEV_trackers_list>)))
  "Returns md5sum for a message object of type '<BEV_trackers_list>"
  "75647be9b87b8cac8b063a214b8fbc18")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BEV_trackers_list)))
  "Returns md5sum for a message object of type 'BEV_trackers_list"
  "75647be9b87b8cac8b063a214b8fbc18")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BEV_trackers_list>)))
  "Returns full string definition for message of type '<BEV_trackers_list>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                              # Frame and timestamp information~%~%BEV_tracker[] bev_trackers_list  # List of tracked_obstacles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/BEV_tracker~%# Techs4AgeCar project~%~%string type      # Object type~%uint16 object_id # Object ID~%~%float64   x      # BEV x centroid~%float64   y      # BEV y centroid ~%float64   w      # BEV width of the object~%float64   l      # BEV length of the object~%float64   o      # Object orientation~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BEV_trackers_list)))
  "Returns full string definition for message of type 'BEV_trackers_list"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                              # Frame and timestamp information~%~%BEV_tracker[] bev_trackers_list  # List of tracked_obstacles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/BEV_tracker~%# Techs4AgeCar project~%~%string type      # Object type~%uint16 object_id # Object ID~%~%float64   x      # BEV x centroid~%float64   y      # BEV y centroid ~%float64   w      # BEV width of the object~%float64   l      # BEV length of the object~%float64   o      # Object orientation~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BEV_trackers_list>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bev_trackers_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BEV_trackers_list>))
  "Converts a ROS message object to a list"
  (cl:list 'BEV_trackers_list
    (cl:cons ':header (header msg))
    (cl:cons ':bev_trackers_list (bev_trackers_list msg))
))
