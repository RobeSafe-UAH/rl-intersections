; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Way.msg.html

(cl:defclass <Way> (roslisp-msg-protocol:ros-message)
  ((way
    :reader way
    :initarg :way
    :type (cl:vector t4ac_msgs-msg:Node)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:Node :initial-element (cl:make-instance 't4ac_msgs-msg:Node))))
)

(cl:defclass Way (<Way>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Way>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Way)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Way> is deprecated: use t4ac_msgs-msg:Way instead.")))

(cl:ensure-generic-function 'way-val :lambda-list '(m))
(cl:defmethod way-val ((m <Way>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:way-val is deprecated.  Use t4ac_msgs-msg:way instead.")
  (way m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Way>) ostream)
  "Serializes a message object of type '<Way>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'way))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'way))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Way>) istream)
  "Deserializes a message object of type '<Way>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'way) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'way)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:Node))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Way>)))
  "Returns string type for a message object of type '<Way>"
  "t4ac_msgs/Way")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Way)))
  "Returns string type for a message object of type 'Way"
  "t4ac_msgs/Way")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Way>)))
  "Returns md5sum for a message object of type '<Way>"
  "633945be8abb5aeffbfc923f66470e22")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Way)))
  "Returns md5sum for a message object of type 'Way"
  "633945be8abb5aeffbfc923f66470e22")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Way>)))
  "Returns full string definition for message of type '<Way>"
  (cl:format cl:nil "# Way definition ~%~%Node[] way	# list of nodes~%~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Way)))
  "Returns full string definition for message of type 'Way"
  (cl:format cl:nil "# Way definition ~%~%Node[] way	# list of nodes~%~%~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Way>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'way) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Way>))
  "Converts a ROS message object to a list"
  (cl:list 'Way
    (cl:cons ':way (way msg))
))
