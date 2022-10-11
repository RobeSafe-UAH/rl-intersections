; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude BEV_detections_list.msg.html

(cl:defclass <BEV_detections_list> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (front
    :reader front
    :initarg :front
    :type cl:float
    :initform 0.0)
   (back
    :reader back
    :initarg :back
    :type cl:float
    :initform 0.0)
   (left
    :reader left
    :initarg :left
    :type cl:float
    :initform 0.0)
   (right
    :reader right
    :initarg :right
    :type cl:float
    :initform 0.0)
   (bev_detections_list
    :reader bev_detections_list
    :initarg :bev_detections_list
    :type (cl:vector t4ac_msgs-msg:BEV_detection)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:BEV_detection :initial-element (cl:make-instance 't4ac_msgs-msg:BEV_detection))))
)

(cl:defclass BEV_detections_list (<BEV_detections_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BEV_detections_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BEV_detections_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<BEV_detections_list> is deprecated: use t4ac_msgs-msg:BEV_detections_list instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <BEV_detections_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'front-val :lambda-list '(m))
(cl:defmethod front-val ((m <BEV_detections_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:front-val is deprecated.  Use t4ac_msgs-msg:front instead.")
  (front m))

(cl:ensure-generic-function 'back-val :lambda-list '(m))
(cl:defmethod back-val ((m <BEV_detections_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:back-val is deprecated.  Use t4ac_msgs-msg:back instead.")
  (back m))

(cl:ensure-generic-function 'left-val :lambda-list '(m))
(cl:defmethod left-val ((m <BEV_detections_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:left-val is deprecated.  Use t4ac_msgs-msg:left instead.")
  (left m))

(cl:ensure-generic-function 'right-val :lambda-list '(m))
(cl:defmethod right-val ((m <BEV_detections_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:right-val is deprecated.  Use t4ac_msgs-msg:right instead.")
  (right m))

(cl:ensure-generic-function 'bev_detections_list-val :lambda-list '(m))
(cl:defmethod bev_detections_list-val ((m <BEV_detections_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:bev_detections_list-val is deprecated.  Use t4ac_msgs-msg:bev_detections_list instead.")
  (bev_detections_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BEV_detections_list>) ostream)
  "Serializes a message object of type '<BEV_detections_list>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'front))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'back))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'left))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'right))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bev_detections_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bev_detections_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BEV_detections_list>) istream)
  "Deserializes a message object of type '<BEV_detections_list>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'front) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'back) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'left) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'right) (roslisp-utils:decode-double-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bev_detections_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bev_detections_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:BEV_detection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BEV_detections_list>)))
  "Returns string type for a message object of type '<BEV_detections_list>"
  "t4ac_msgs/BEV_detections_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BEV_detections_list)))
  "Returns string type for a message object of type 'BEV_detections_list"
  "t4ac_msgs/BEV_detections_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BEV_detections_list>)))
  "Returns md5sum for a message object of type '<BEV_detections_list>"
  "759bec6ecb814309c94289f28049e196")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BEV_detections_list)))
  "Returns md5sum for a message object of type 'BEV_detections_list"
  "759bec6ecb814309c94289f28049e196")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BEV_detections_list>)))
  "Returns full string definition for message of type '<BEV_detections_list>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                       # Frame and timestamp information~%~%float64 front                       # BEV grid size (front, back, left, right in meters)~%float64 back~%float64 left~%float64 right~%~%BEV_detection[] bev_detections_list # List of bev_obstacles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/BEV_detection~%# Techs4AgeCar project~%~%string type         # Object type~%float64 score       # Object probability (0 to 1)~%uint16 object_id    # Object ID ~%~%float64   x         # BEV x centroid~%float64   y         # BEV y centroid ~%float64   vel_lin   # (Only Groundtruth) Linear velocity (Module of vx and vy)~%float64   vel_ang   # (Only Groundtruth) Angular velocity (Z-axis)~%float64[] tl_br     # 2D bbox top-left, bottom-right xy coordinates~%float64[] x_corners # 3D bbox x coordinates of the corners~%float64[] y_corners # 3D bbox y coordinates of the corners~%float64   l         # BEV length of the object~%float64   w         # BEV width of the object~%float64   o         # Object orientation~%~%bool safety_zone    # If true, the detection is very near the vehicle ~%                    # Evaluate the predicted collision with this detection~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BEV_detections_list)))
  "Returns full string definition for message of type 'BEV_detections_list"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                       # Frame and timestamp information~%~%float64 front                       # BEV grid size (front, back, left, right in meters)~%float64 back~%float64 left~%float64 right~%~%BEV_detection[] bev_detections_list # List of bev_obstacles~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/BEV_detection~%# Techs4AgeCar project~%~%string type         # Object type~%float64 score       # Object probability (0 to 1)~%uint16 object_id    # Object ID ~%~%float64   x         # BEV x centroid~%float64   y         # BEV y centroid ~%float64   vel_lin   # (Only Groundtruth) Linear velocity (Module of vx and vy)~%float64   vel_ang   # (Only Groundtruth) Angular velocity (Z-axis)~%float64[] tl_br     # 2D bbox top-left, bottom-right xy coordinates~%float64[] x_corners # 3D bbox x coordinates of the corners~%float64[] y_corners # 3D bbox y coordinates of the corners~%float64   l         # BEV length of the object~%float64   w         # BEV width of the object~%float64   o         # Object orientation~%~%bool safety_zone    # If true, the detection is very near the vehicle ~%                    # Evaluate the predicted collision with this detection~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BEV_detections_list>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bev_detections_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BEV_detections_list>))
  "Converts a ROS message object to a list"
  (cl:list 'BEV_detections_list
    (cl:cons ':header (header msg))
    (cl:cons ':front (front msg))
    (cl:cons ':back (back msg))
    (cl:cons ':left (left msg))
    (cl:cons ':right (right msg))
    (cl:cons ':bev_detections_list (bev_detections_list msg))
))
