; Auto-generated. Do not edit!


(cl:in-package carla_msgs-msg)


;//! \htmlinclude CarlaTrafficLightInfoList.msg.html

(cl:defclass <CarlaTrafficLightInfoList> (roslisp-msg-protocol:ros-message)
  ((traffic_lights
    :reader traffic_lights
    :initarg :traffic_lights
    :type (cl:vector carla_msgs-msg:CarlaTrafficLightInfo)
   :initform (cl:make-array 0 :element-type 'carla_msgs-msg:CarlaTrafficLightInfo :initial-element (cl:make-instance 'carla_msgs-msg:CarlaTrafficLightInfo))))
)

(cl:defclass CarlaTrafficLightInfoList (<CarlaTrafficLightInfoList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarlaTrafficLightInfoList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarlaTrafficLightInfoList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-msg:<CarlaTrafficLightInfoList> is deprecated: use carla_msgs-msg:CarlaTrafficLightInfoList instead.")))

(cl:ensure-generic-function 'traffic_lights-val :lambda-list '(m))
(cl:defmethod traffic_lights-val ((m <CarlaTrafficLightInfoList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:traffic_lights-val is deprecated.  Use carla_msgs-msg:traffic_lights instead.")
  (traffic_lights m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarlaTrafficLightInfoList>) ostream)
  "Serializes a message object of type '<CarlaTrafficLightInfoList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'traffic_lights))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'traffic_lights))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarlaTrafficLightInfoList>) istream)
  "Deserializes a message object of type '<CarlaTrafficLightInfoList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'traffic_lights) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'traffic_lights)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'carla_msgs-msg:CarlaTrafficLightInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarlaTrafficLightInfoList>)))
  "Returns string type for a message object of type '<CarlaTrafficLightInfoList>"
  "carla_msgs/CarlaTrafficLightInfoList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarlaTrafficLightInfoList)))
  "Returns string type for a message object of type 'CarlaTrafficLightInfoList"
  "carla_msgs/CarlaTrafficLightInfoList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarlaTrafficLightInfoList>)))
  "Returns md5sum for a message object of type '<CarlaTrafficLightInfoList>"
  "d1e03fe534c61bfaafc4dfce64de368a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarlaTrafficLightInfoList)))
  "Returns md5sum for a message object of type 'CarlaTrafficLightInfoList"
  "d1e03fe534c61bfaafc4dfce64de368a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarlaTrafficLightInfoList>)))
  "Returns full string definition for message of type '<CarlaTrafficLightInfoList>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%CarlaTrafficLightInfo[] traffic_lights~%~%================================================================================~%MSG: carla_msgs/CarlaTrafficLightInfo~%#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%uint32 id~%geometry_msgs/Pose transform~%CarlaBoundingBox trigger_volume # position is relative to transform~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: carla_msgs/CarlaBoundingBox~%#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%geometry_msgs/Vector3 center~%~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarlaTrafficLightInfoList)))
  "Returns full string definition for message of type 'CarlaTrafficLightInfoList"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%CarlaTrafficLightInfo[] traffic_lights~%~%================================================================================~%MSG: carla_msgs/CarlaTrafficLightInfo~%#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%uint32 id~%geometry_msgs/Pose transform~%CarlaBoundingBox trigger_volume # position is relative to transform~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: carla_msgs/CarlaBoundingBox~%#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%geometry_msgs/Vector3 center~%~%geometry_msgs/Vector3 size~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarlaTrafficLightInfoList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'traffic_lights) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarlaTrafficLightInfoList>))
  "Converts a ROS message object to a list"
  (cl:list 'CarlaTrafficLightInfoList
    (cl:cons ':traffic_lights (traffic_lights msg))
))
