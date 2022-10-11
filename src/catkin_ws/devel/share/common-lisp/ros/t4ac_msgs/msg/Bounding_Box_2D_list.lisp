; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Bounding_Box_2D_list.msg.html

(cl:defclass <Bounding_Box_2D_list> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (bounding_box_2D_list
    :reader bounding_box_2D_list
    :initarg :bounding_box_2D_list
    :type (cl:vector t4ac_msgs-msg:Bounding_Box_2D)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:Bounding_Box_2D :initial-element (cl:make-instance 't4ac_msgs-msg:Bounding_Box_2D))))
)

(cl:defclass Bounding_Box_2D_list (<Bounding_Box_2D_list>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Bounding_Box_2D_list>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Bounding_Box_2D_list)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Bounding_Box_2D_list> is deprecated: use t4ac_msgs-msg:Bounding_Box_2D_list instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Bounding_Box_2D_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'bounding_box_2D_list-val :lambda-list '(m))
(cl:defmethod bounding_box_2D_list-val ((m <Bounding_Box_2D_list>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:bounding_box_2D_list-val is deprecated.  Use t4ac_msgs-msg:bounding_box_2D_list instead.")
  (bounding_box_2D_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Bounding_Box_2D_list>) ostream)
  "Serializes a message object of type '<Bounding_Box_2D_list>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bounding_box_2D_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bounding_box_2D_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Bounding_Box_2D_list>) istream)
  "Deserializes a message object of type '<Bounding_Box_2D_list>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bounding_box_2D_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bounding_box_2D_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:Bounding_Box_2D))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Bounding_Box_2D_list>)))
  "Returns string type for a message object of type '<Bounding_Box_2D_list>"
  "t4ac_msgs/Bounding_Box_2D_list")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Bounding_Box_2D_list)))
  "Returns string type for a message object of type 'Bounding_Box_2D_list"
  "t4ac_msgs/Bounding_Box_2D_list")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Bounding_Box_2D_list>)))
  "Returns md5sum for a message object of type '<Bounding_Box_2D_list>"
  "1ba56b4d1710c06cbc5c52ee8160ea10")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Bounding_Box_2D_list)))
  "Returns md5sum for a message object of type 'Bounding_Box_2D_list"
  "1ba56b4d1710c06cbc5c52ee8160ea10")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Bounding_Box_2D_list>)))
  "Returns full string definition for message of type '<Bounding_Box_2D_list>"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                          # Frame and timestamp information~%~%Bounding_Box_2D[] bounding_box_2D_list # List of bev_obstacles~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Bounding_Box_2D~%# Techs4AgeCar project~%~%string type         # Object type~%float64 score       # Object probability (0 to 1)~%~%float64   x1        # Top-left x coordinate~%float64   y1        # Top-left y coordinate ~%float64   x2        # Bottom-right x coordinate~%float64   y2        # Bottom-right y coordinate ~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Bounding_Box_2D_list)))
  "Returns full string definition for message of type 'Bounding_Box_2D_list"
  (cl:format cl:nil "# Techs4AgeCar project~%~%Header header                          # Frame and timestamp information~%~%Bounding_Box_2D[] bounding_box_2D_list # List of bev_obstacles~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Bounding_Box_2D~%# Techs4AgeCar project~%~%string type         # Object type~%float64 score       # Object probability (0 to 1)~%~%float64   x1        # Top-left x coordinate~%float64   y1        # Top-left y coordinate ~%float64   x2        # Bottom-right x coordinate~%float64   y2        # Bottom-right y coordinate ~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Bounding_Box_2D_list>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bounding_box_2D_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Bounding_Box_2D_list>))
  "Converts a ROS message object to a list"
  (cl:list 'Bounding_Box_2D_list
    (cl:cons ':header (header msg))
    (cl:cons ':bounding_box_2D_list (bounding_box_2D_list msg))
))
