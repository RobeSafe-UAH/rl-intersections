; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Bounding_Box_3D_list.msg.html

(cl:defclass <Bounding_Box_3D_list> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bounding_box_3d_list
    :reader bounding_box_3d_list
    :initarg :bounding_box_3d_list
    :type (cl:vector t4ac_msgs-msg:Bounding_Box_3D)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:Bounding_Box_3D :initial-element (cl:make-instance 't4ac_msgs-msg:Bounding_Box_3D))))
)

(cl:defclass Bounding_Box_3D_list (<Bounding_Box_3D_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Bounding_Box_3D_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Bounding_Box_3D_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Bounding_Box_3D_list> is deprecated: use t4ac_msgs-msg:Bounding_Box_3D_list instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Bounding_Box_3D_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bounding_box_3d_list-val :lambda-list '(m))
(cl:defmethod bounding_box_3d_list-val ((m <Bounding_Box_3D_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:bounding_box_3d_list-val is deprecated.  Use t4ac_msgs-msg:bounding_box_3d_list instead.")
  (bounding_box_3d_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Bounding_Box_3D_list>) ostream)
  "Serializes a message object of type '<Bounding_Box_3D_list>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bounding_box_3d_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bounding_box_3d_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Bounding_Box_3D_list>) istream)
  "Deserializes a message object of type '<Bounding_Box_3D_list>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bounding_box_3d_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bounding_box_3d_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:Bounding_Box_3D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Bounding_Box_3D_list>)))
  "Returns string type for a message object of type '<Bounding_Box_3D_list>"
  "t4ac_msgs/Bounding_Box_3D_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Bounding_Box_3D_list)))
  "Returns string type for a message object of type 'Bounding_Box_3D_list"
  "t4ac_msgs/Bounding_Box_3D_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Bounding_Box_3D_list>)))
  "Returns md5sum for a message object of type '<Bounding_Box_3D_list>"
  "68148d914255b67811779dc40b20532f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Bounding_Box_3D_list)))
  "Returns md5sum for a message object of type 'Bounding_Box_3D_list"
  "68148d914255b67811779dc40b20532f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Bounding_Box_3D_list>)))
  "Returns full string definition for message of type '<Bounding_Box_3D_list>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                          # Frame and timestamp information~%~%Bounding_Box_3D[] bounding_box_3d_list # List of 3D Bounding Boxes ~%                                       # (may include their velocity)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Bounding_Box_3D~%# Techs4AgeCar project~%~%string                           type         # Object type~%float64                          score        # Object probability (0 to 1)~%~%geometry_msgs/PoseWithCovariance pose         # Centroid x,y,z, yaw (Laser frame)~%float64                          l            # Object length (Originally along x-laser frame)~%float64                          w            # Object width (Originally along y-laser frame)~%float64                          h            # Object height (z-laser frame)~%Node[]                           corners_3d   # 3D bbox coordinates (x,y,z ; Laser frame)~%float64                          vel_lin      # Absolute global linear velocity~%float64                          vel_ang      # Absolute global angular velocity~%~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Bounding_Box_3D_list)))
  "Returns full string definition for message of type 'Bounding_Box_3D_list"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                          # Frame and timestamp information~%~%Bounding_Box_3D[] bounding_box_3d_list # List of 3D Bounding Boxes ~%                                       # (may include their velocity)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Bounding_Box_3D~%# Techs4AgeCar project~%~%string                           type         # Object type~%float64                          score        # Object probability (0 to 1)~%~%geometry_msgs/PoseWithCovariance pose         # Centroid x,y,z, yaw (Laser frame)~%float64                          l            # Object length (Originally along x-laser frame)~%float64                          w            # Object width (Originally along y-laser frame)~%float64                          h            # Object height (z-laser frame)~%Node[]                           corners_3d   # 3D bbox coordinates (x,y,z ; Laser frame)~%float64                          vel_lin      # Absolute global linear velocity~%float64                          vel_ang      # Absolute global angular velocity~%~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Bounding_Box_3D_list>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bounding_box_3d_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Bounding_Box_3D_list>))
  "Converts a ROS message object to a list"
  (cl:list 'Bounding_Box_3D_list
    (cl:cons ':header (header msg))
    (cl:cons ':bounding_box_3d_list (bounding_box_3d_list msg))
))
