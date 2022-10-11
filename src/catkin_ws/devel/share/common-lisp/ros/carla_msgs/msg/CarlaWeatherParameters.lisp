; Auto-generated. Do not edit!


(cl:in-package carla_msgs-msg)


;//! \htmlinclude CarlaWeatherParameters.msg.html

(cl:defclass <CarlaWeatherParameters> (roslisp-msg-protocol:ros-message)
  ((cloudiness
    :reader cloudiness
    :initarg :cloudiness
    :type cl:float
    :initform 0.0)
   (precipitation
    :reader precipitation
    :initarg :precipitation
    :type cl:float
    :initform 0.0)
   (precipitation_deposits
    :reader precipitation_deposits
    :initarg :precipitation_deposits
    :type cl:float
    :initform 0.0)
   (wind_intensity
    :reader wind_intensity
    :initarg :wind_intensity
    :type cl:float
    :initform 0.0)
   (fog_density
    :reader fog_density
    :initarg :fog_density
    :type cl:float
    :initform 0.0)
   (fog_distance
    :reader fog_distance
    :initarg :fog_distance
    :type cl:float
    :initform 0.0)
   (wetness
    :reader wetness
    :initarg :wetness
    :type cl:float
    :initform 0.0)
   (sun_azimuth_angle
    :reader sun_azimuth_angle
    :initarg :sun_azimuth_angle
    :type cl:float
    :initform 0.0)
   (sun_altitude_angle
    :reader sun_altitude_angle
    :initarg :sun_altitude_angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass CarlaWeatherParameters (<CarlaWeatherParameters>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CarlaWeatherParameters>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CarlaWeatherParameters)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name carla_msgs-msg:<CarlaWeatherParameters> is deprecated: use carla_msgs-msg:CarlaWeatherParameters instead.")))

(cl:ensure-generic-function 'cloudiness-val :lambda-list '(m))
(cl:defmethod cloudiness-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:cloudiness-val is deprecated.  Use carla_msgs-msg:cloudiness instead.")
  (cloudiness m))

(cl:ensure-generic-function 'precipitation-val :lambda-list '(m))
(cl:defmethod precipitation-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:precipitation-val is deprecated.  Use carla_msgs-msg:precipitation instead.")
  (precipitation m))

(cl:ensure-generic-function 'precipitation_deposits-val :lambda-list '(m))
(cl:defmethod precipitation_deposits-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:precipitation_deposits-val is deprecated.  Use carla_msgs-msg:precipitation_deposits instead.")
  (precipitation_deposits m))

(cl:ensure-generic-function 'wind_intensity-val :lambda-list '(m))
(cl:defmethod wind_intensity-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:wind_intensity-val is deprecated.  Use carla_msgs-msg:wind_intensity instead.")
  (wind_intensity m))

(cl:ensure-generic-function 'fog_density-val :lambda-list '(m))
(cl:defmethod fog_density-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:fog_density-val is deprecated.  Use carla_msgs-msg:fog_density instead.")
  (fog_density m))

(cl:ensure-generic-function 'fog_distance-val :lambda-list '(m))
(cl:defmethod fog_distance-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:fog_distance-val is deprecated.  Use carla_msgs-msg:fog_distance instead.")
  (fog_distance m))

(cl:ensure-generic-function 'wetness-val :lambda-list '(m))
(cl:defmethod wetness-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:wetness-val is deprecated.  Use carla_msgs-msg:wetness instead.")
  (wetness m))

(cl:ensure-generic-function 'sun_azimuth_angle-val :lambda-list '(m))
(cl:defmethod sun_azimuth_angle-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:sun_azimuth_angle-val is deprecated.  Use carla_msgs-msg:sun_azimuth_angle instead.")
  (sun_azimuth_angle m))

(cl:ensure-generic-function 'sun_altitude_angle-val :lambda-list '(m))
(cl:defmethod sun_altitude_angle-val ((m <CarlaWeatherParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader carla_msgs-msg:sun_altitude_angle-val is deprecated.  Use carla_msgs-msg:sun_altitude_angle instead.")
  (sun_altitude_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CarlaWeatherParameters>) ostream)
  "Serializes a message object of type '<CarlaWeatherParameters>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'cloudiness))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'precipitation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'precipitation_deposits))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wind_intensity))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fog_density))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'fog_distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'wetness))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sun_azimuth_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'sun_altitude_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CarlaWeatherParameters>) istream)
  "Deserializes a message object of type '<CarlaWeatherParameters>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'cloudiness) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'precipitation) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'precipitation_deposits) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wind_intensity) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fog_density) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'fog_distance) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wetness) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sun_azimuth_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'sun_altitude_angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CarlaWeatherParameters>)))
  "Returns string type for a message object of type '<CarlaWeatherParameters>"
  "carla_msgs/CarlaWeatherParameters")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CarlaWeatherParameters)))
  "Returns string type for a message object of type 'CarlaWeatherParameters"
  "carla_msgs/CarlaWeatherParameters")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CarlaWeatherParameters>)))
  "Returns md5sum for a message object of type '<CarlaWeatherParameters>"
  "bb273e4588ee8778c1dac74839d4709e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CarlaWeatherParameters)))
  "Returns md5sum for a message object of type 'CarlaWeatherParameters"
  "bb273e4588ee8778c1dac74839d4709e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CarlaWeatherParameters>)))
  "Returns full string definition for message of type '<CarlaWeatherParameters>"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%~%float32 cloudiness~%float32 precipitation~%float32 precipitation_deposits~%float32 wind_intensity~%float32 fog_density~%float32 fog_distance~%float32 wetness~%float32 sun_azimuth_angle~%float32 sun_altitude_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CarlaWeatherParameters)))
  "Returns full string definition for message of type 'CarlaWeatherParameters"
  (cl:format cl:nil "#~%# Copyright (c) 2020 Intel Corporation.~%#~%# This work is licensed under the terms of the MIT license.~%# For a copy, see <https://opensource.org/licenses/MIT>.~%#~%~%float32 cloudiness~%float32 precipitation~%float32 precipitation_deposits~%float32 wind_intensity~%float32 fog_density~%float32 fog_distance~%float32 wetness~%float32 sun_azimuth_angle~%float32 sun_altitude_angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CarlaWeatherParameters>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CarlaWeatherParameters>))
  "Converts a ROS message object to a list"
  (cl:list 'CarlaWeatherParameters
    (cl:cons ':cloudiness (cloudiness msg))
    (cl:cons ':precipitation (precipitation msg))
    (cl:cons ':precipitation_deposits (precipitation_deposits msg))
    (cl:cons ':wind_intensity (wind_intensity msg))
    (cl:cons ':fog_density (fog_density msg))
    (cl:cons ':fog_distance (fog_distance msg))
    (cl:cons ':wetness (wetness msg))
    (cl:cons ':sun_azimuth_angle (sun_azimuth_angle msg))
    (cl:cons ':sun_altitude_angle (sun_altitude_angle msg))
))
