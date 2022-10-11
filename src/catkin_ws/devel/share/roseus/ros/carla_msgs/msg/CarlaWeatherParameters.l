;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::CarlaWeatherParameters)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'CarlaWeatherParameters (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::CARLAWEATHERPARAMETERS")
  (make-package "CARLA_MSGS::CARLAWEATHERPARAMETERS"))

(in-package "ROS")
;;//! \htmlinclude CarlaWeatherParameters.msg.html


(defclass carla_msgs::CarlaWeatherParameters
  :super ros::object
  :slots (_cloudiness _precipitation _precipitation_deposits _wind_intensity _fog_density _fog_distance _wetness _sun_azimuth_angle _sun_altitude_angle ))

(defmethod carla_msgs::CarlaWeatherParameters
  (:init
   (&key
    ((:cloudiness __cloudiness) 0.0)
    ((:precipitation __precipitation) 0.0)
    ((:precipitation_deposits __precipitation_deposits) 0.0)
    ((:wind_intensity __wind_intensity) 0.0)
    ((:fog_density __fog_density) 0.0)
    ((:fog_distance __fog_distance) 0.0)
    ((:wetness __wetness) 0.0)
    ((:sun_azimuth_angle __sun_azimuth_angle) 0.0)
    ((:sun_altitude_angle __sun_altitude_angle) 0.0)
    )
   (send-super :init)
   (setq _cloudiness (float __cloudiness))
   (setq _precipitation (float __precipitation))
   (setq _precipitation_deposits (float __precipitation_deposits))
   (setq _wind_intensity (float __wind_intensity))
   (setq _fog_density (float __fog_density))
   (setq _fog_distance (float __fog_distance))
   (setq _wetness (float __wetness))
   (setq _sun_azimuth_angle (float __sun_azimuth_angle))
   (setq _sun_altitude_angle (float __sun_altitude_angle))
   self)
  (:cloudiness
   (&optional __cloudiness)
   (if __cloudiness (setq _cloudiness __cloudiness)) _cloudiness)
  (:precipitation
   (&optional __precipitation)
   (if __precipitation (setq _precipitation __precipitation)) _precipitation)
  (:precipitation_deposits
   (&optional __precipitation_deposits)
   (if __precipitation_deposits (setq _precipitation_deposits __precipitation_deposits)) _precipitation_deposits)
  (:wind_intensity
   (&optional __wind_intensity)
   (if __wind_intensity (setq _wind_intensity __wind_intensity)) _wind_intensity)
  (:fog_density
   (&optional __fog_density)
   (if __fog_density (setq _fog_density __fog_density)) _fog_density)
  (:fog_distance
   (&optional __fog_distance)
   (if __fog_distance (setq _fog_distance __fog_distance)) _fog_distance)
  (:wetness
   (&optional __wetness)
   (if __wetness (setq _wetness __wetness)) _wetness)
  (:sun_azimuth_angle
   (&optional __sun_azimuth_angle)
   (if __sun_azimuth_angle (setq _sun_azimuth_angle __sun_azimuth_angle)) _sun_azimuth_angle)
  (:sun_altitude_angle
   (&optional __sun_altitude_angle)
   (if __sun_altitude_angle (setq _sun_altitude_angle __sun_altitude_angle)) _sun_altitude_angle)
  (:serialization-length
   ()
   (+
    ;; float32 _cloudiness
    4
    ;; float32 _precipitation
    4
    ;; float32 _precipitation_deposits
    4
    ;; float32 _wind_intensity
    4
    ;; float32 _fog_density
    4
    ;; float32 _fog_distance
    4
    ;; float32 _wetness
    4
    ;; float32 _sun_azimuth_angle
    4
    ;; float32 _sun_altitude_angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _cloudiness
       (sys::poke _cloudiness (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _precipitation
       (sys::poke _precipitation (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _precipitation_deposits
       (sys::poke _precipitation_deposits (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wind_intensity
       (sys::poke _wind_intensity (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fog_density
       (sys::poke _fog_density (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _fog_distance
       (sys::poke _fog_distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _wetness
       (sys::poke _wetness (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sun_azimuth_angle
       (sys::poke _sun_azimuth_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _sun_altitude_angle
       (sys::poke _sun_altitude_angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _cloudiness
     (setq _cloudiness (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _precipitation
     (setq _precipitation (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _precipitation_deposits
     (setq _precipitation_deposits (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wind_intensity
     (setq _wind_intensity (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fog_density
     (setq _fog_density (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _fog_distance
     (setq _fog_distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _wetness
     (setq _wetness (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sun_azimuth_angle
     (setq _sun_azimuth_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _sun_altitude_angle
     (setq _sun_altitude_angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get carla_msgs::CarlaWeatherParameters :md5sum-) "bb273e4588ee8778c1dac74839d4709e")
(setf (get carla_msgs::CarlaWeatherParameters :datatype-) "carla_msgs/CarlaWeatherParameters")
(setf (get carla_msgs::CarlaWeatherParameters :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#

float32 cloudiness
float32 precipitation
float32 precipitation_deposits
float32 wind_intensity
float32 fog_density
float32 fog_distance
float32 wetness
float32 sun_azimuth_angle
float32 sun_altitude_angle

")



(provide :carla_msgs/CarlaWeatherParameters "bb273e4588ee8778c1dac74839d4709e")


