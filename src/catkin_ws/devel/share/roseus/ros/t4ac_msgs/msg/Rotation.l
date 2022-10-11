;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Rotation)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Rotation (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::ROTATION")
  (make-package "T4AC_MSGS::ROTATION"))

(in-package "ROS")
;;//! \htmlinclude Rotation.msg.html


(defclass t4ac_msgs::Rotation
  :super ros::object
  :slots (_pitch _yaw _roll ))

(defmethod t4ac_msgs::Rotation
  (:init
   (&key
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:roll __roll) 0.0)
    )
   (send-super :init)
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _roll (float __roll))
   self)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:serialization-length
   ()
   (+
    ;; float64 _pitch
    8
    ;; float64 _yaw
    8
    ;; float64 _roll
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pitch
     (setq _pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _roll
     (setq _roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get t4ac_msgs::Rotation :md5sum-) "6b33b81f528b84606cf372e61b6ef5ea")
(setf (get t4ac_msgs::Rotation :datatype-) "t4ac_msgs/Rotation")
(setf (get t4ac_msgs::Rotation :definition-)
      "# T4ac Project 

float64 pitch
float64 yaw
float64 roll
")



(provide :t4ac_msgs/Rotation "6b33b81f528b84606cf372e61b6ef5ea")


