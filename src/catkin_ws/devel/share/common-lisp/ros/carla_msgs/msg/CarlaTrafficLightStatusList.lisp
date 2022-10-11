; Auto-generated. Do not edit!


(cl:in-package carla_msgs-msg)


;//! \htmlinclude CarlaTrafficLightStatusList.msg.html

(cl:defclass <CarlaTrafficLightStatusList> (roslisp-msg-protocol:ros-message)
  ((traffic_lights
    :reader traffic_lights
    :initarg :traffic_lights
    :type (cl:vector carla_msgs-msg:CarlaTrafficLightStatus)
   :initform (cl:make-array 0 :element-type 'carla_msgs-msg:CarlaTrafficLightStatus :initial-element (cl:make-instance 'carla_msgs-msg:CarlaTrafficLightStatus))))
)

(cl:defclass CarlaTrafficLightStatusList (<CarlaTrafficLightStatusList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarlaTrafficLightStatusList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarlaTrafficLightStatusList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-msg:<CarlaTrafficLightStatusList> is deprecated: use carla_msgs-msg:CarlaTrafficLightStatusList instead.")))

(cl:ensure-generic-function 'traffic_lights-val :lambda-list '(m))
(cl:defmethod traffic_lights-val ((m <CarlaTrafficLightStatusList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:traffic_lights-val is deprecated.  Use carla_msgs-msg:traffic_lights instead.")
  (traffic_lights m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarlaTrafficLightStatusList>) ostream)
  "Serializes a message object of type '<CarlaTrafficLightStatusList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'traffic_lights))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'traffic_lights))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarlaTrafficLightStatusList>) istream)
  "Deserializes a message object of type '<CarlaTrafficLightStatusList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'traffic_lights) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'traffic_lights)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'carla_msgs-msg:CarlaTrafficLightStatus))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarlaTrafficLightStatusList>)))
  "Returns string type for a message object of type '<CarlaTrafficLightStatusList>"
  "carla_msgs/CarlaTrafficLightStatusList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarlaTrafficLightStatusList)))
  "Returns string type for a message object of type 'CarlaTrafficLightStatusList"
  "carla_msgs/CarlaTrafficLightStatusList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarlaTrafficLightStatusList>)))
  "Returns md5sum for a message object of type '<CarlaTrafficLightStatusList>"
  "99769ac9a785c6de87ed86d7bb4a653a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarlaTrafficLightStatusList)))
  "Returns md5sum for a message object of type 'CarlaTrafficLightStatusList"
  "99769ac9a785c6de87ed86d7bb4a653a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarlaTrafficLightStatusList>)))
  "Returns full string definition for message of type '<CarlaTrafficLightStatusList>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%CarlaTrafficLightStatus[] traffic_lights~%~%================================================================================~%MSG: carla_msgs/CarlaTrafficLightStatus~%#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%uint32 id~%~%uint8 RED=0~%uint8 YELLOW=1~%uint8 GREEN=2~%uint8 OFF=3~%uint8 UNKNOWN=4~%~%uint8 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarlaTrafficLightStatusList)))
  "Returns full string definition for message of type 'CarlaTrafficLightStatusList"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%CarlaTrafficLightStatus[] traffic_lights~%~%================================================================================~%MSG: carla_msgs/CarlaTrafficLightStatus~%#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%uint32 id~%~%uint8 RED=0~%uint8 YELLOW=1~%uint8 GREEN=2~%uint8 OFF=3~%uint8 UNKNOWN=4~%~%uint8 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarlaTrafficLightStatusList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'traffic_lights) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarlaTrafficLightStatusList>))
  "Converts a ROS message object to a list"
  (cl:list 'CarlaTrafficLightStatusList
    (cl:cons ':traffic_lights (traffic_lights msg))
))
