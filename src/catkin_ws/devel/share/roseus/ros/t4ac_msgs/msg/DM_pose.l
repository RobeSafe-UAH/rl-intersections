;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::DM_pose)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'DM_pose (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::DM_POSE")
  (make-package "T4AC_MSGS::DM_POSE"))

(in-package "ROS")
;;//! \htmlinclude DM_pose.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass t4ac_msgs::DM_pose
  :super ros::object
  :slots (_position _orientation _lane_change ))

(defmethod t4ac_msgs::DM_pose
  (:init
   (&key
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:orientation __orientation) (instance geometry_msgs::Quaternion :init))
    ((:lane_change __lane_change) "")
    )
   (send-super :init)
   (setq _position __position)
   (setq _orientation __orientation)
   (setq _lane_change (string __lane_change))
   self)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:lane_change
   (&optional __lane_change)
   (if __lane_change (setq _lane_change __lane_change)) _lane_change)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; geometry_msgs/Quaternion _orientation
    (send _orientation :serialization-length)
    ;; string _lane_change
    4 (length _lane_change)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; geometry_msgs/Quaternion _orientation
       (send _orientation :serialize s)
     ;; string _lane_change
       (write-long (length _lane_change) s) (princ _lane_change s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; geometry_msgs/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; string _lane_change
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _lane_change (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get t4ac_msgs::DM_pose :md5sum-) "32b4ffd6b3679d075a01f2573356ab46")
(setf (get t4ac_msgs::DM_pose :datatype-) "t4ac_msgs/DM_pose")
(setf (get t4ac_msgs::DM_pose :definition-)
      "# T4ac Project 

geometry_msgs/Point position
geometry_msgs/Quaternion orientation
string lane_change  # can be right, left or both 
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :t4ac_msgs/DM_pose "32b4ffd6b3679d075a01f2573356ab46")


