;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::DM_posestamped)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'DM_posestamped (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::DM_POSESTAMPED")
  (make-package "T4AC_MSGS::DM_POSESTAMPED"))

(in-package "ROS")
;;//! \htmlinclude DM_posestamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::DM_posestamped
  :super ros::object
  :slots (_header _pose ))

(defmethod t4ac_msgs::DM_posestamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance t4ac_msgs::DM_pose :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/DM_pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/DM_pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/DM_pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(setf (get t4ac_msgs::DM_posestamped :md5sum-) "74ec6b5a856c06afff73c472464844fa")
(setf (get t4ac_msgs::DM_posestamped :datatype-) "t4ac_msgs/DM_posestamped")
(setf (get t4ac_msgs::DM_posestamped :definition-)
      "# T4ac Project

Header header
DM_pose pose
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

================================================================================
MSG: t4ac_msgs/DM_pose
# T4ac Project 

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



(provide :t4ac_msgs/DM_posestamped "74ec6b5a856c06afff73c472464844fa")


