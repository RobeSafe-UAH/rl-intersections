; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Traffic_Sign.msg.html

(cl:defclass <Traffic_Sign> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:string
    :initform "")
   (lanes
    :reader lanes
    :initarg :lanes
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (x1
    :reader x1
    :initarg :x1
    :type cl:float
    :initform 0.0)
   (y1
    :reader y1
    :initarg :y1
    :type cl:float
    :initform 0.0)
   (x2
    :reader x2
    :initarg :x2
    :type cl:float
    :initform 0.0)
   (y2
    :reader y2
    :initarg :y2
    :type cl:float
    :initform 0.0)
   (local_pose
    :reader local_pose
    :initarg :local_pose
    :type geometry_msgs-msg:PoseWithCovariance
    :initform (cl:make-instance 'geometry_msgs-msg:PoseWithCovariance))
   (global_pose
    :reader global_pose
    :initarg :global_pose
    :type geometry_msgs-msg:PoseWithCovariance
    :initform (cl:make-instance 'geometry_msgs-msg:PoseWithCovariance))
   (stop_line
    :reader stop_line
    :initarg :stop_line
    :type cl:float
    :initform 0.0))
)

(cl:defclass Traffic_Sign (<Traffic_Sign>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Traffic_Sign>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Traffic_Sign)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Traffic_Sign> is deprecated: use t4ac_msgs-msg:Traffic_Sign instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:type-val is deprecated.  Use t4ac_msgs-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'lanes-val :lambda-list '(m))
(cl:defmethod lanes-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:lanes-val is deprecated.  Use t4ac_msgs-msg:lanes instead.")
  (lanes m))

(cl:ensure-generic-function 'x1-val :lambda-list '(m))
(cl:defmethod x1-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:x1-val is deprecated.  Use t4ac_msgs-msg:x1 instead.")
  (x1 m))

(cl:ensure-generic-function 'y1-val :lambda-list '(m))
(cl:defmethod y1-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:y1-val is deprecated.  Use t4ac_msgs-msg:y1 instead.")
  (y1 m))

(cl:ensure-generic-function 'x2-val :lambda-list '(m))
(cl:defmethod x2-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:x2-val is deprecated.  Use t4ac_msgs-msg:x2 instead.")
  (x2 m))

(cl:ensure-generic-function 'y2-val :lambda-list '(m))
(cl:defmethod y2-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:y2-val is deprecated.  Use t4ac_msgs-msg:y2 instead.")
  (y2 m))

(cl:ensure-generic-function 'local_pose-val :lambda-list '(m))
(cl:defmethod local_pose-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:local_pose-val is deprecated.  Use t4ac_msgs-msg:local_pose instead.")
  (local_pose m))

(cl:ensure-generic-function 'global_pose-val :lambda-list '(m))
(cl:defmethod global_pose-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:global_pose-val is deprecated.  Use t4ac_msgs-msg:global_pose instead.")
  (global_pose m))

(cl:ensure-generic-function 'stop_line-val :lambda-list '(m))
(cl:defmethod stop_line-val ((m <Traffic_Sign>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:stop_line-val is deprecated.  Use t4ac_msgs-msg:stop_line instead.")
  (stop_line m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Traffic_Sign>) ostream)
  "Serializes a message object of type '<Traffic_Sign>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'lanes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream))
   (cl:slot-value msg 'lanes))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'local_pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'global_pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'stop_line))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Traffic_Sign>) istream)
  "Deserializes a message object of type '<Traffic_Sign>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'lanes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'lanes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x2) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y2) (roslisp-utils:decode-double-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'local_pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'global_pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'stop_line) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Traffic_Sign>)))
  "Returns string type for a message object of type '<Traffic_Sign>"
  "t4ac_msgs/Traffic_Sign")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Traffic_Sign)))
  "Returns string type for a message object of type 'Traffic_Sign"
  "t4ac_msgs/Traffic_Sign")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Traffic_Sign>)))
  "Returns md5sum for a message object of type '<Traffic_Sign>"
  "f266b8af366a609a7c528b57f35853d1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Traffic_Sign)))
  "Returns md5sum for a message object of type 'Traffic_Sign"
  "f266b8af366a609a7c528b57f35853d1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Traffic_Sign>)))
  "Returns full string definition for message of type '<Traffic_Sign>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%string type                                    # Traffic Sign type~%uint8[] lanes                                  # Lanes involved~%~%float64   x1                                   # Top-left x coordinate~%float64   y1                                   # Top-left y coordinate ~%float64   x2                                   # Bottom-right x coordinate~%float64   y2                                   # Bottom-right y coordinate ~%geometry_msgs/PoseWithCovariance local_pose    # 3D Centroid x,y,z (Ego-vehicle frame)~%geometry_msgs/PoseWithCovariance global_pose   # 3D Centroid x,y,z (Map frame)~%~%float64  stop_line                             # Minimum distance at which the traffic light is ~%                                               # fully observed. TODO: TAKE THIS STOP LINE FROM ~%                                               # THE MAP AND ENSURE YOU OBSERVE THE CORRESPONDING~%                                               # TRAFFIC LIGHT AT THIS POINT~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Traffic_Sign)))
  "Returns full string definition for message of type 'Traffic_Sign"
  (cl:format cl:nil "# Techs4AgeCar project~%~%string type                                    # Traffic Sign type~%uint8[] lanes                                  # Lanes involved~%~%float64   x1                                   # Top-left x coordinate~%float64   y1                                   # Top-left y coordinate ~%float64   x2                                   # Bottom-right x coordinate~%float64   y2                                   # Bottom-right y coordinate ~%geometry_msgs/PoseWithCovariance local_pose    # 3D Centroid x,y,z (Ego-vehicle frame)~%geometry_msgs/PoseWithCovariance global_pose   # 3D Centroid x,y,z (Map frame)~%~%float64  stop_line                             # Minimum distance at which the traffic light is ~%                                               # fully observed. TODO: TAKE THIS STOP LINE FROM ~%                                               # THE MAP AND ENSURE YOU OBSERVE THE CORRESPONDING~%                                               # TRAFFIC LIGHT AT THIS POINT~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Traffic_Sign>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'lanes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
     8
     8
     8
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'local_pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'global_pose))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Traffic_Sign>))
  "Converts a ROS message object to a list"
  (cl:list 'Traffic_Sign
    (cl:cons ':type (type msg))
    (cl:cons ':lanes (lanes msg))
    (cl:cons ':x1 (x1 msg))
    (cl:cons ':y1 (y1 msg))
    (cl:cons ':x2 (x2 msg))
    (cl:cons ':y2 (y2 msg))
    (cl:cons ':local_pose (local_pose msg))
    (cl:cons ':global_pose (global_pose msg))
    (cl:cons ':stop_line (stop_line msg))
))
