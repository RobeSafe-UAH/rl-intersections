; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude MonitorizedRegElem.msg.html

(cl:defclass <MonitorizedRegElem> (roslisp-msg-protocol:ros-message)
  ((reg_elems
    :reader reg_elems
    :initarg :reg_elems
    :type (cl:vector t4ac_msgs-msg:RegulatoryElement)
   :initform (cl:make-array 0 :element-type 't4ac_msgs-msg:RegulatoryElement :initial-element (cl:make-instance 't4ac_msgs-msg:RegulatoryElement))))
)

(cl:defclass MonitorizedRegElem (<MonitorizedRegElem>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MonitorizedRegElem>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MonitorizedRegElem)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<MonitorizedRegElem> is deprecated: use t4ac_msgs-msg:MonitorizedRegElem instead.")))

(cl:ensure-generic-function 'reg_elems-val :lambda-list '(m))
(cl:defmethod reg_elems-val ((m <MonitorizedRegElem>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:reg_elems-val is deprecated.  Use t4ac_msgs-msg:reg_elems instead.")
  (reg_elems m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MonitorizedRegElem>) ostream)
  "Serializes a message object of type '<MonitorizedRegElem>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'reg_elems))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'reg_elems))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MonitorizedRegElem>) istream)
  "Deserializes a message object of type '<MonitorizedRegElem>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'reg_elems) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'reg_elems)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 't4ac_msgs-msg:RegulatoryElement))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MonitorizedRegElem>)))
  "Returns string type for a message object of type '<MonitorizedRegElem>"
  "t4ac_msgs/MonitorizedRegElem")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MonitorizedRegElem)))
  "Returns string type for a message object of type 'MonitorizedRegElem"
  "t4ac_msgs/MonitorizedRegElem")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MonitorizedRegElem>)))
  "Returns md5sum for a message object of type '<MonitorizedRegElem>"
  "2d4b678817b5a00f2a9678518f83388b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MonitorizedRegElem)))
  "Returns md5sum for a message object of type 'MonitorizedRegElem"
  "2d4b678817b5a00f2a9678518f83388b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MonitorizedRegElem>)))
  "Returns full string definition for message of type '<MonitorizedRegElem>"
  (cl:format cl:nil "### Monitorized Regulatory Elements definition ###~%~%RegulatoryElement[] reg_elems~%================================================================================~%MSG: t4ac_msgs/RegulatoryElement~%### Regulatory Element definition ###~%~%string type~%string id~%Node location~%float64 distance~%string[] affecting_roads~%Landmark[] landmarks~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%================================================================================~%MSG: t4ac_msgs/Landmark~%### Landmark definition ###~%~%Node location~%float64 distance~%string affecting_road~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MonitorizedRegElem)))
  "Returns full string definition for message of type 'MonitorizedRegElem"
  (cl:format cl:nil "### Monitorized Regulatory Elements definition ###~%~%RegulatoryElement[] reg_elems~%================================================================================~%MSG: t4ac_msgs/RegulatoryElement~%### Regulatory Element definition ###~%~%string type~%string id~%Node location~%float64 distance~%string[] affecting_roads~%Landmark[] landmarks~%================================================================================~%MSG: t4ac_msgs/Node~%## Node definition ~%~%float64 x	# X~%float64 y	# Y~%float64 z	# Z~%~%================================================================================~%MSG: t4ac_msgs/Landmark~%### Landmark definition ###~%~%Node location~%float64 distance~%string affecting_road~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MonitorizedRegElem>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'reg_elems) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MonitorizedRegElem>))
  "Converts a ROS message object to a list"
  (cl:list 'MonitorizedRegElem
    (cl:cons ':reg_elems (reg_elems msg))
))
