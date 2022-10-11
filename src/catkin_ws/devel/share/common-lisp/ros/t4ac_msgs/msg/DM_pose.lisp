; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude DM_pose.msg.html

(cl:defclass <DM_pose> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (orientation
    :reader orientation
    :initarg :orientation
    :type geometry_msgs-msg:Quaternion
    :initform (cl:make-instance 'geometry_msgs-msg:Quaternion))
   (lane_change
    :reader lane_change
    :initarg :lane_change
    :type cl:string
    :initform ""))
)

(cl:defclass DM_pose (<DM_pose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DM_pose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DM_pose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<DM_pose> is deprecated: use t4ac_msgs-msg:DM_pose instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <DM_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:position-val is deprecated.  Use t4ac_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'orientation-val :lambda-list '(m))
(cl:defmethod orientation-val ((m <DM_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:orientation-val is deprecated.  Use t4ac_msgs-msg:orientation instead.")
  (orientation m))

(cl:ensure-generic-function 'lane_change-val :lambda-list '(m))
(cl:defmethod lane_change-val ((m <DM_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:lane_change-val is deprecated.  Use t4ac_msgs-msg:lane_change instead.")
  (lane_change m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DM_pose>) ostream)
  "Serializes a message object of type '<DM_pose>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'orientation) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'lane_change))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'lane_change))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DM_pose>) istream)
  "Deserializes a message object of type '<DM_pose>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'orientation) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lane_change) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'lane_change) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DM_pose>)))
  "Returns string type for a message object of type '<DM_pose>"
  "t4ac_msgs/DM_pose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DM_pose)))
  "Returns string type for a message object of type 'DM_pose"
  "t4ac_msgs/DM_pose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DM_pose>)))
  "Returns md5sum for a message object of type '<DM_pose>"
  "32b4ffd6b3679d075a01f2573356ab46")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DM_pose)))
  "Returns md5sum for a message object of type 'DM_pose"
  "32b4ffd6b3679d075a01f2573356ab46")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DM_pose>)))
  "Returns full string definition for message of type '<DM_pose>"
  (cl:format cl:nil "# T4ac Project ~%~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%string lane_change  # can be right, left or both ~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DM_pose)))
  "Returns full string definition for message of type 'DM_pose"
  (cl:format cl:nil "# T4ac Project ~%~%geometry_msgs/Point position~%geometry_msgs/Quaternion orientation~%string lane_change  # can be right, left or both ~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DM_pose>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'orientation))
     4 (cl:length (cl:slot-value msg 'lane_change))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DM_pose>))
  "Converts a ROS message object to a list"
  (cl:list 'DM_pose
    (cl:cons ':position (position msg))
    (cl:cons ':orientation (orientation msg))
    (cl:cons ':lane_change (lane_change msg))
))
