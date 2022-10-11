;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::DM_path)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'DM_path (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::DM_PATH")
  (make-package "T4AC_MSGS::DM_PATH"))

(in-package "ROS")
;;//! \htmlinclude DM_path.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::DM_path
  :super ros::object
  :slots (_header _poses ))

(defmethod t4ac_msgs::DM_path
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:poses __poses) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _poses __poses)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:poses
   (&rest __poses)
   (if (keywordp (car __poses))
       (send* _poses __poses)
     (progn
       (if __poses (setq _poses (car __poses)))
       _poses)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/DM_posestamped[] _poses
    (apply #'+ (send-all _poses :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/DM_posestamped[] _poses
     (write-long (length _poses) s)
     (dolist (elem _poses)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/DM_posestamped[] _poses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _poses (let (r) (dotimes (i n) (push (instance t4ac_msgs::DM_posestamped :init) r)) r))
     (dolist (elem- _poses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::DM_path :md5sum-) "e85a0bd101b7748691d86afd9e4c40f4")
(setf (get t4ac_msgs::DM_path :datatype-) "t4ac_msgs/DM_path")
(setf (get t4ac_msgs::DM_path :definition-)
      "# T4ac Project 

Header header
DM_posestamped[] poses
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
MSG: t4ac_msgs/DM_posestamped
# T4ac Project

Header header
DM_pose pose
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



(provide :t4ac_msgs/DM_path "e85a0bd101b7748691d86afd9e4c40f4")


