; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Obstacles_list.msg.html

(cl:defclass <Obstacles_list> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (obstacles_list
    :reader obstacles_list
    :initarg :obstacles_list
    :type (cl:vector t4ac_msgs-msg:Obstacle)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:Obstacle :initial-element (cl:make-instance 't4ac_msgs-msg:Obstacle))))
)

(cl:defclass Obstacles_list (<Obstacles_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Obstacles_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Obstacles_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Obstacles_list> is deprecated: use t4ac_msgs-msg:Obstacles_list instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Obstacles_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'obstacles_list-val :lambda-list '(m))
(cl:defmethod obstacles_list-val ((m <Obstacles_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:obstacles_list-val is deprecated.  Use t4ac_msgs-msg:obstacles_list instead.")
  (obstacles_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Obstacles_list>) ostream)
  "Serializes a message object of type '<Obstacles_list>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'obstacles_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'obstacles_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Obstacles_list>) istream)
  "Deserializes a message object of type '<Obstacles_list>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'obstacles_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'obstacles_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:Obstacle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Obstacles_list>)))
  "Returns string type for a message object of type '<Obstacles_list>"
  "t4ac_msgs/Obstacles_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacles_list)))
  "Returns string type for a message object of type 'Obstacles_list"
  "t4ac_msgs/Obstacles_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Obstacles_list>)))
  "Returns md5sum for a message object of type '<Obstacles_list>"
  "c5382525edc2a5ee0a08af26c50c5e4c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Obstacles_list)))
  "Returns md5sum for a message object of type 'Obstacles_list"
  "c5382525edc2a5ee0a08af26c50c5e4c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Obstacles_list>)))
  "Returns full string definition for message of type '<Obstacles_list>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header~%~%Obstacle[] obstacles_list # List of obstacles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Obstacle~%# Techs4AgeCar project~%~%Header header~%~%geometry_msgs/Pose pose		# Pose at the center of mass~%float64 dist2ego            # Distance to ego-vehicle~%geometry_msgs/Twist twist	# Velocity at the center of mass~%geometry_msgs/Polygon shape	# Box containing the obstacle~%int64 road_id			# Road_id in which the obstacle is~%string type			# Obstacle type if it is known (car, pedestrian, sign, etc)~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Obstacles_list)))
  "Returns full string definition for message of type 'Obstacles_list"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header~%~%Obstacle[] obstacles_list # List of obstacles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Obstacle~%# Techs4AgeCar project~%~%Header header~%~%geometry_msgs/Pose pose		# Pose at the center of mass~%float64 dist2ego            # Distance to ego-vehicle~%geometry_msgs/Twist twist	# Velocity at the center of mass~%geometry_msgs/Polygon shape	# Box containing the obstacle~%int64 road_id			# Road_id in which the obstacle is~%string type			# Obstacle type if it is known (car, pedestrian, sign, etc)~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Polygon~%#A specification of a polygon where the first and last points are assumed to be connected~%Point32[] points~%~%================================================================================~%MSG: geometry_msgs/Point32~%# This contains the position of a point in free space(with 32 bits of precision).~%# It is recommeded to use Point wherever possible instead of Point32.  ~%# ~%# This recommendation is to promote interoperability.  ~%#~%# This message is designed to take up less space when sending~%# lots of points at once, as in the case of a PointCloud.  ~%~%float32 x~%float32 y~%float32 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Obstacles_list>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'obstacles_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Obstacles_list>))
  "Converts a ROS message object to a list"
  (cl:list 'Obstacles_list
    (cl:cons ':header (header msg))
    (cl:cons ':obstacles_list (obstacles_list msg))
))
