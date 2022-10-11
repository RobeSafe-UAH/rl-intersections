; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude GT_3D_Object_list.msg.html

(cl:defclass <GT_3D_Object_list> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (gt_3d_object_list
    :reader gt_3d_object_list
    :initarg :gt_3d_object_list
    :type (cl:vector t4ac_msgs-msg:GT_3D_Object)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:GT_3D_Object :initial-element (cl:make-instance 't4ac_msgs-msg:GT_3D_Object))))
)

(cl:defclass GT_3D_Object_list (<GT_3D_Object_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GT_3D_Object_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GT_3D_Object_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<GT_3D_Object_list> is deprecated: use t4ac_msgs-msg:GT_3D_Object_list instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GT_3D_Object_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'gt_3d_object_list-val :lambda-list '(m))
(cl:defmethod gt_3d_object_list-val ((m <GT_3D_Object_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:gt_3d_object_list-val is deprecated.  Use t4ac_msgs-msg:gt_3d_object_list instead.")
  (gt_3d_object_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GT_3D_Object_list>) ostream)
  "Serializes a message object of type '<GT_3D_Object_list>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'gt_3d_object_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'gt_3d_object_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GT_3D_Object_list>) istream)
  "Deserializes a message object of type '<GT_3D_Object_list>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'gt_3d_object_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'gt_3d_object_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:GT_3D_Object))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GT_3D_Object_list>)))
  "Returns string type for a message object of type '<GT_3D_Object_list>"
  "t4ac_msgs/GT_3D_Object_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GT_3D_Object_list)))
  "Returns string type for a message object of type 'GT_3D_Object_list"
  "t4ac_msgs/GT_3D_Object_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GT_3D_Object_list>)))
  "Returns md5sum for a message object of type '<GT_3D_Object_list>"
  "13a224db64e6563b6b9b60a32f1db87e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GT_3D_Object_list)))
  "Returns md5sum for a message object of type 'GT_3D_Object_list"
  "13a224db64e6563b6b9b60a32f1db87e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GT_3D_Object_list>)))
  "Returns full string definition for message of type '<GT_3D_Object_list>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                           # Frame and timestamp information~%GT_3D_Object[] gt_3d_object_list        # List of GT 3D Objects~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/GT_3D_Object~%# Techs4AgeCar project~%~%string type                                 # Object type if it is known (car, pedestrian, truck, etc)~%uint32 object_id                            # Id assign to an object~%float32 alpha                               # Observation angle of object~%vision_msgs/BoundingBox2D bounding_box_2D   # Object 2D bounding box~%geometry_msgs/Point position                # Center of the object~%geometry_msgs/Vector3 dimensions            # Object dimensions (l, w, h)~%float32 rotation_z                          # Object rotation along z axis~%geometry_msgs/Vector3 velocity              # Velocity of the object related to the ego vehicle~%float32 truncated                           # Float from 0 (non-truncated) to 1 (truncated), where truncated refers to the object leaving image boundaries~%uint8 occluded                              # Integer (0,1,2,3) indicating occlusion state: 0 = fully visible, 1 = partly occluded, 2 = largely occluded, 3 = not visible to the camera~%================================================================================~%MSG: vision_msgs/BoundingBox2D~%# A 2D bounding box that can be rotated about its center.~%# All dimensions are in pixels, but represented using floating-point~%#   values to allow sub-pixel precision. If an exact pixel crop is required~%#   for a rotated bounding box, it can be calculated using Bresenham's line~%#   algorithm.~%~%# The 2D position (in pixels) and orientation of the bounding box center.~%geometry_msgs/Pose2D center~%~%# The size (in pixels) of the bounding box surrounding the object relative~%#   to the pose of its center.~%float64 size_x~%float64 size_y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GT_3D_Object_list)))
  "Returns full string definition for message of type 'GT_3D_Object_list"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                           # Frame and timestamp information~%GT_3D_Object[] gt_3d_object_list        # List of GT 3D Objects~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/GT_3D_Object~%# Techs4AgeCar project~%~%string type                                 # Object type if it is known (car, pedestrian, truck, etc)~%uint32 object_id                            # Id assign to an object~%float32 alpha                               # Observation angle of object~%vision_msgs/BoundingBox2D bounding_box_2D   # Object 2D bounding box~%geometry_msgs/Point position                # Center of the object~%geometry_msgs/Vector3 dimensions            # Object dimensions (l, w, h)~%float32 rotation_z                          # Object rotation along z axis~%geometry_msgs/Vector3 velocity              # Velocity of the object related to the ego vehicle~%float32 truncated                           # Float from 0 (non-truncated) to 1 (truncated), where truncated refers to the object leaving image boundaries~%uint8 occluded                              # Integer (0,1,2,3) indicating occlusion state: 0 = fully visible, 1 = partly occluded, 2 = largely occluded, 3 = not visible to the camera~%================================================================================~%MSG: vision_msgs/BoundingBox2D~%# A 2D bounding box that can be rotated about its center.~%# All dimensions are in pixels, but represented using floating-point~%#   values to allow sub-pixel precision. If an exact pixel crop is required~%#   for a rotated bounding box, it can be calculated using Bresenham's line~%#   algorithm.~%~%# The 2D position (in pixels) and orientation of the bounding box center.~%geometry_msgs/Pose2D center~%~%# The size (in pixels) of the bounding box surrounding the object relative~%#   to the pose of its center.~%float64 size_x~%float64 size_y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GT_3D_Object_list>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'gt_3d_object_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GT_3D_Object_list>))
  "Converts a ROS message object to a list"
  (cl:list 'GT_3D_Object_list
    (cl:cons ':header (header msg))
    (cl:cons ':gt_3d_object_list (gt_3d_object_list msg))
))
