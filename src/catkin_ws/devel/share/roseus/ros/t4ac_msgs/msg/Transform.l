;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Transform)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Transform (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::TRANSFORM")
  (make-package "T4AC_MSGS::TRANSFORM"))

(in-package "ROS")
;;//! \htmlinclude Transform.msg.html


(defclass t4ac_msgs::Transform
  :super ros::object
  :slots (_location _rotation ))

(defmethod t4ac_msgs::Transform
  (:init
   (&key
    ((:location __location) (instance t4ac_msgs::Location :init))
    ((:rotation __rotation) (instance t4ac_msgs::Rotation :init))
    )
   (send-super :init)
   (setq _location __location)
   (setq _rotation __rotation)
   self)
  (:location
   (&rest __location)
   (if (keywordp (car __location))
       (send* _location __location)
     (progn
       (if __location (setq _location (car __location)))
       _location)))
  (:rotation
   (&rest __rotation)
   (if (keywordp (car __rotation))
       (send* _rotation __rotation)
     (progn
       (if __rotation (setq _rotation (car __rotation)))
       _rotation)))
  (:serialization-length
   ()
   (+
    ;; t4ac_msgs/Location _location
    (send _location :serialization-length)
    ;; t4ac_msgs/Rotation _rotation
    (send _rotation :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; t4ac_msgs/Location _location
       (send _location :serialize s)
     ;; t4ac_msgs/Rotation _rotation
       (send _rotation :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; t4ac_msgs/Location _location
     (send _location :deserialize buf ptr-) (incf ptr- (send _location :serialization-length))
   ;; t4ac_msgs/Rotation _rotation
     (send _rotation :deserialize buf ptr-) (incf ptr- (send _rotation :serialization-length))
   ;;
   self)
  )

(setf (get t4ac_msgs::Transform :md5sum-) "8dd6f45800a6e91772e60f284726d823")
(setf (get t4ac_msgs::Transform :datatype-) "t4ac_msgs/Transform")
(setf (get t4ac_msgs::Transform :definition-)
      "# T4ac Project

Location location
Rotation rotation
================================================================================
MSG: t4ac_msgs/Location
# T4ac Project 

float64 x
float64 y
float64 z
================================================================================
MSG: t4ac_msgs/Rotation
# T4ac Project 

float64 pitch
float64 yaw
float64 roll
")



(provide :t4ac_msgs/Transform "8dd6f45800a6e91772e60f284726d823")


