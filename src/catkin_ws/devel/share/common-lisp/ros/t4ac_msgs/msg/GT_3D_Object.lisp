; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude GT_3D_Object.msg.html

(cl:defclass <GT_3D_Object> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (object_id
    :reader object_id
    :initarg :object_id
    :type cl:integer
    :initform 0)
   (alpha
    :reader alpha
    :initarg :alpha
    :type cl:float
    :initform 0.0)
   (bounding_box_2D
    :reader bounding_box_2D
    :initarg :bounding_box_2D
    :type vision_msgs-msg:BoundingBox2D
    :initform (cl:make-instance 'vision_msgs-msg:BoundingBox2D))
   (position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (dimensions
    :reader dimensions
    :initarg :dimensions
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (rotation_z
    :reader rotation_z
    :initarg :rotation_z
    :type cl:float
    :initform 0.0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (truncated
    :reader truncated
    :initarg :truncated
    :type cl:float
    :initform 0.0)
   (occluded
    :reader occluded
    :initarg :occluded
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GT_3D_Object (<GT_3D_Object>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GT_3D_Object>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GT_3D_Object)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<GT_3D_Object> is deprecated: use t4ac_msgs-msg:GT_3D_Object instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:type-val is deprecated.  Use t4ac_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'object_id-val :lambda-list '(m))
(cl:defmethod object_id-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:object_id-val is deprecated.  Use t4ac_msgs-msg:object_id instead.")
  (object_id m))

(cl:ensure-generic-function 'alpha-val :lambda-list '(m))
(cl:defmethod alpha-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:alpha-val is deprecated.  Use t4ac_msgs-msg:alpha instead.")
  (alpha m))

(cl:ensure-generic-function 'bounding_box_2D-val :lambda-list '(m))
(cl:defmethod bounding_box_2D-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:bounding_box_2D-val is deprecated.  Use t4ac_msgs-msg:bounding_box_2D instead.")
  (bounding_box_2D m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:position-val is deprecated.  Use t4ac_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'dimensions-val :lambda-list '(m))
(cl:defmethod dimensions-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:dimensions-val is deprecated.  Use t4ac_msgs-msg:dimensions instead.")
  (dimensions m))

(cl:ensure-generic-function 'rotation_z-val :lambda-list '(m))
(cl:defmethod rotation_z-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:rotation_z-val is deprecated.  Use t4ac_msgs-msg:rotation_z instead.")
  (rotation_z m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:velocity-val is deprecated.  Use t4ac_msgs-msg:velocity instead.")
  (velocity m))

(cl:ensure-generic-function 'truncated-val :lambda-list '(m))
(cl:defmethod truncated-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:truncated-val is deprecated.  Use t4ac_msgs-msg:truncated instead.")
  (truncated m))

(cl:ensure-generic-function 'occluded-val :lambda-list '(m))
(cl:defmethod occluded-val ((m <GT_3D_Object>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:occluded-val is deprecated.  Use t4ac_msgs-msg:occluded instead.")
  (occluded m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GT_3D_Object>) ostream)
  "Serializes a message object of type '<GT_3D_Object>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'object_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'object_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'object_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'object_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'alpha))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bounding_box_2D) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'dimensions) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rotation_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'velocity) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'truncated))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'occluded)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GT_3D_Object>) istream)
  "Deserializes a message object of type '<GT_3D_Object>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'object_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'object_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'object_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'object_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'alpha) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bounding_box_2D) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'dimensions) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rotation_z) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'velocity) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'truncated) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'occluded)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GT_3D_Object>)))
  "Returns string type for a message object of type '<GT_3D_Object>"
  "t4ac_msgs/GT_3D_Object")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GT_3D_Object)))
  "Returns string type for a message object of type 'GT_3D_Object"
  "t4ac_msgs/GT_3D_Object")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GT_3D_Object>)))
  "Returns md5sum for a message object of type '<GT_3D_Object>"
  "ca62318d44e5363ce4cf524c880fbfa2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GT_3D_Object)))
  "Returns md5sum for a message object of type 'GT_3D_Object"
  "ca62318d44e5363ce4cf524c880fbfa2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GT_3D_Object>)))
  "Returns full string definition for message of type '<GT_3D_Object>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%string type                                 # Object type if it is known (car, pedestrian, truck, etc)~%uint32 object_id                            # Id assign to an object~%float32 alpha                               # Observation angle of object~%vision_msgs/BoundingBox2D bounding_box_2D   # Object 2D bounding box~%geometry_msgs/Point position                # Center of the object~%geometry_msgs/Vector3 dimensions            # Object dimensions (l, w, h)~%float32 rotation_z                          # Object rotation along z axis~%geometry_msgs/Vector3 velocity              # Velocity of the object related to the ego vehicle~%float32 truncated                           # Float from 0 (non-truncated) to 1 (truncated), where truncated refers to the object leaving image boundaries~%uint8 occluded                              # Integer (0,1,2,3) indicating occlusion state: 0 = fully visible, 1 = partly occluded, 2 = largely occluded, 3 = not visible to the camera~%================================================================================~%MSG: vision_msgs/BoundingBox2D~%# A 2D bounding box that can be rotated about its center.~%# All dimensions are in pixels, but represented using floating-point~%#   values to allow sub-pixel precision. If an exact pixel crop is required~%#   for a rotated bounding box, it can be calculated using Bresenham's line~%#   algorithm.~%~%# The 2D position (in pixels) and orientation of the bounding box center.~%geometry_msgs/Pose2D center~%~%# The size (in pixels) of the bounding box surrounding the object relative~%#   to the pose of its center.~%float64 size_x~%float64 size_y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GT_3D_Object)))
  "Returns full string definition for message of type 'GT_3D_Object"
  (cl:format cl:nil "# Techs4AgeCar project~%~%string type                                 # Object type if it is known (car, pedestrian, truck, etc)~%uint32 object_id                            # Id assign to an object~%float32 alpha                               # Observation angle of object~%vision_msgs/BoundingBox2D bounding_box_2D   # Object 2D bounding box~%geometry_msgs/Point position                # Center of the object~%geometry_msgs/Vector3 dimensions            # Object dimensions (l, w, h)~%float32 rotation_z                          # Object rotation along z axis~%geometry_msgs/Vector3 velocity              # Velocity of the object related to the ego vehicle~%float32 truncated                           # Float from 0 (non-truncated) to 1 (truncated), where truncated refers to the object leaving image boundaries~%uint8 occluded                              # Integer (0,1,2,3) indicating occlusion state: 0 = fully visible, 1 = partly occluded, 2 = largely occluded, 3 = not visible to the camera~%================================================================================~%MSG: vision_msgs/BoundingBox2D~%# A 2D bounding box that can be rotated about its center.~%# All dimensions are in pixels, but represented using floating-point~%#   values to allow sub-pixel precision. If an exact pixel crop is required~%#   for a rotated bounding box, it can be calculated using Bresenham's line~%#   algorithm.~%~%# The 2D position (in pixels) and orientation of the bounding box center.~%geometry_msgs/Pose2D center~%~%# The size (in pixels) of the bounding box surrounding the object relative~%#   to the pose of its center.~%float64 size_x~%float64 size_y~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GT_3D_Object>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bounding_box_2D))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'dimensions))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'velocity))
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GT_3D_Object>))
  "Converts a ROS message object to a list"
  (cl:list 'GT_3D_Object
    (cl:cons ':type (type msg))
    (cl:cons ':object_id (object_id msg))
    (cl:cons ':alpha (alpha msg))
    (cl:cons ':bounding_box_2D (bounding_box_2D msg))
    (cl:cons ':position (position msg))
    (cl:cons ':dimensions (dimensions msg))
    (cl:cons ':rotation_z (rotation_z msg))
    (cl:cons ':velocity (velocity msg))
    (cl:cons ':truncated (truncated msg))
    (cl:cons ':occluded (occluded msg))
))
