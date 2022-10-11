; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Traffic_Sign_List.msg.html

(cl:defclass <Traffic_Sign_List> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (traffic_sign_list
    :reader traffic_sign_list
    :initarg :traffic_sign_list
    :type (cl:vector t4ac_msgs-msg:Traffic_Sign)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:Traffic_Sign :initial-element (cl:make-instance 't4ac_msgs-msg:Traffic_Sign))))
)

(cl:defclass Traffic_Sign_List (<Traffic_Sign_List>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Traffic_Sign_List>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Traffic_Sign_List)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Traffic_Sign_List> is deprecated: use t4ac_msgs-msg:Traffic_Sign_List instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Traffic_Sign_List>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'traffic_sign_list-val :lambda-list '(m))
(cl:defmethod traffic_sign_list-val ((m <Traffic_Sign_List>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:traffic_sign_list-val is deprecated.  Use t4ac_msgs-msg:traffic_sign_list instead.")
  (traffic_sign_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Traffic_Sign_List>) ostream)
  "Serializes a message object of type '<Traffic_Sign_List>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'traffic_sign_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'traffic_sign_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Traffic_Sign_List>) istream)
  "Deserializes a message object of type '<Traffic_Sign_List>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'traffic_sign_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'traffic_sign_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:Traffic_Sign))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Traffic_Sign_List>)))
  "Returns string type for a message object of type '<Traffic_Sign_List>"
  "t4ac_msgs/Traffic_Sign_List")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Traffic_Sign_List)))
  "Returns string type for a message object of type 'Traffic_Sign_List"
  "t4ac_msgs/Traffic_Sign_List")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Traffic_Sign_List>)))
  "Returns md5sum for a message object of type '<Traffic_Sign_List>"
  "f887f4878752799f02c0c91e6dcb4d0a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Traffic_Sign_List)))
  "Returns md5sum for a message object of type 'Traffic_Sign_List"
  "f887f4878752799f02c0c91e6dcb4d0a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Traffic_Sign_List>)))
  "Returns full string definition for message of type '<Traffic_Sign_List>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                          # Frame and timestamp information~%~%Traffic_Sign[] traffic_sign_list       # Currently observed traffic signs, including the involved lanes~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Traffic_Sign~%# Techs4AgeCar project~%~%string type                                    # Traffic Sign type~%uint8[] lanes                                  # Lanes involved~%~%float64   x1                                   # Top-left x coordinate~%float64   y1                                   # Top-left y coordinate ~%float64   x2                                   # Bottom-right x coordinate~%float64   y2                                   # Bottom-right y coordinate ~%geometry_msgs/PoseWithCovariance local_pose    # 3D Centroid x,y,z (Ego-vehicle frame)~%geometry_msgs/PoseWithCovariance global_pose   # 3D Centroid x,y,z (Map frame)~%~%float64  stop_line                             # Minimum distance at which the traffic light is ~%                                               # fully observed. TODO: TAKE THIS STOP LINE FROM ~%                                               # THE MAP AND ENSURE YOU OBSERVE THE CORRESPONDING~%                                               # TRAFFIC LIGHT AT THIS POINT~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Traffic_Sign_List)))
  "Returns full string definition for message of type 'Traffic_Sign_List"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                          # Frame and timestamp information~%~%Traffic_Sign[] traffic_sign_list       # Currently observed traffic signs, including the involved lanes~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Traffic_Sign~%# Techs4AgeCar project~%~%string type                                    # Traffic Sign type~%uint8[] lanes                                  # Lanes involved~%~%float64   x1                                   # Top-left x coordinate~%float64   y1                                   # Top-left y coordinate ~%float64   x2                                   # Bottom-right x coordinate~%float64   y2                                   # Bottom-right y coordinate ~%geometry_msgs/PoseWithCovariance local_pose    # 3D Centroid x,y,z (Ego-vehicle frame)~%geometry_msgs/PoseWithCovariance global_pose   # 3D Centroid x,y,z (Map frame)~%~%float64  stop_line                             # Minimum distance at which the traffic light is ~%                                               # fully observed. TODO: TAKE THIS STOP LINE FROM ~%                                               # THE MAP AND ENSURE YOU OBSERVE THE CORRESPONDING~%                                               # TRAFFIC LIGHT AT THIS POINT~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Traffic_Sign_List>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'traffic_sign_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Traffic_Sign_List>))
  "Converts a ROS message object to a list"
  (cl:list 'Traffic_Sign_List
    (cl:cons ':header (header msg))
    (cl:cons ':traffic_sign_list (traffic_sign_list msg))
))
