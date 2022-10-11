; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Transform.msg.html

(cl:defclass <Transform> (roslisp-msg-protocol:ros-message)
  ((location
    :reader location
    :initarg :location
    :type t4ac_msgs-msg:Location
    :initform (cl:make-instance 't4ac_msgs-msg:Location))
   (rotation
    :reader rotation
    :initarg :rotation
    :type t4ac_msgs-msg:Rotation
    :initform (cl:make-instance 't4ac_msgs-msg:Rotation)))
)

(cl:defclass Transform (<Transform>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Transform>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Transform)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Transform> is deprecated: use t4ac_msgs-msg:Transform instead.")))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <Transform>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:location-val is deprecated.  Use t4ac_msgs-msg:location instead.")
  (location m))

(cl:ensure-generic-function 'rotation-val :lambda-list '(m))
(cl:defmethod rotation-val ((m <Transform>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:rotation-val is deprecated.  Use t4ac_msgs-msg:rotation instead.")
  (rotation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Transform>) ostream)
  "Serializes a message object of type '<Transform>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'location) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rotation) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Transform>) istream)
  "Deserializes a message object of type '<Transform>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'location) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rotation) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Transform>)))
  "Returns string type for a message object of type '<Transform>"
  "t4ac_msgs/Transform")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Transform)))
  "Returns string type for a message object of type 'Transform"
  "t4ac_msgs/Transform")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Transform>)))
  "Returns md5sum for a message object of type '<Transform>"
  "8dd6f45800a6e91772e60f284726d823")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Transform)))
  "Returns md5sum for a message object of type 'Transform"
  "8dd6f45800a6e91772e60f284726d823")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Transform>)))
  "Returns full string definition for message of type '<Transform>"
  (cl:format cl:nil "# T4ac Project~%~%Location location~%Rotation rotation~%================================================================================~%MSG: t4ac_msgs/Location~%# T4ac Project ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: t4ac_msgs/Rotation~%# T4ac Project ~%~%float64 pitch~%float64 yaw~%float64 roll~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Transform)))
  "Returns full string definition for message of type 'Transform"
  (cl:format cl:nil "# T4ac Project~%~%Location location~%Rotation rotation~%================================================================================~%MSG: t4ac_msgs/Location~%# T4ac Project ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: t4ac_msgs/Rotation~%# T4ac Project ~%~%float64 pitch~%float64 yaw~%float64 roll~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Transform>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'location))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rotation))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Transform>))
  "Converts a ROS message object to a list"
  (cl:list 'Transform
    (cl:cons ':location (location msg))
    (cl:cons ':rotation (rotation msg))
))
