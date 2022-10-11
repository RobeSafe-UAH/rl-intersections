;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::CarControl)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'CarControl (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::CARCONTROL")
  (make-package "T4AC_MSGS::CARCONTROL"))

(in-package "ROS")
;;//! \htmlinclude CarControl.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::CarControl
  :super ros::object
  :slots (_header _velocity _steer ))

(defmethod t4ac_msgs::CarControl
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:velocity __velocity) 0.0)
    ((:steer __steer) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _velocity (float __velocity))
   (setq _steer (float __steer))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:steer
   (&optional __steer)
   (if __steer (setq _steer __steer)) _steer)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _velocity
    8
    ;; float64 _steer
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _velocity
       (sys::poke _velocity (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _steer
       (sys::poke _steer (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _velocity
     (setq _velocity (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _steer
     (setq _steer (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get t4ac_msgs::CarControl :md5sum-) "593bf145fceaee9e80fa4f5142286ff5")
(setf (get t4ac_msgs::CarControl :datatype-) "t4ac_msgs/CarControl")
(setf (get t4ac_msgs::CarControl :definition-)
      "# Techs4AgeCar Project

# Car control command

Header header
float64 velocity            # forward velocity (m/s), negative is reverse
float64 steer               # steer in m-1 in front wheel 

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :t4ac_msgs/CarControl "593bf145fceaee9e80fa4f5142286ff5")


