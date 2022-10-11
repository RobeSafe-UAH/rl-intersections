;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Path)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Path (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::PATH")
  (make-package "T4AC_MSGS::PATH"))

(in-package "ROS")
;;//! \htmlinclude Path.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::Path
  :super ros::object
  :slots (_header _waypoints ))

(defmethod t4ac_msgs::Path
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:waypoints __waypoints) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _waypoints __waypoints)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:waypoints
   (&rest __waypoints)
   (if (keywordp (car __waypoints))
       (send* _waypoints __waypoints)
     (progn
       (if __waypoints (setq _waypoints (car __waypoints)))
       _waypoints)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/Waypoint[] _waypoints
    (apply #'+ (send-all _waypoints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/Waypoint[] _waypoints
     (write-long (length _waypoints) s)
     (dolist (elem _waypoints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/Waypoint[] _waypoints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _waypoints (let (r) (dotimes (i n) (push (instance t4ac_msgs::Waypoint :init) r)) r))
     (dolist (elem- _waypoints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::Path :md5sum-) "3a4b34812a4e41066c4833c8e14f72fa")
(setf (get t4ac_msgs::Path :datatype-) "t4ac_msgs/Path")
(setf (get t4ac_msgs::Path :definition-)
      "# T4ac Project 

Header header
Waypoint[] waypoints
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
MSG: t4ac_msgs/Waypoint
# T4ac Project 

Header header
int32 id
Transform transform
int32 road_id
int32 lane_id
int32 junction
float64 s
float64 lane_width
string lane_change
string lane_type
string right_lane_marking
string left_lane_marking
int32 vmax
string vunit
int32 nLanes
int32 lanePosition
================================================================================
MSG: t4ac_msgs/Transform
# T4ac Project

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



(provide :t4ac_msgs/Path "3a4b34812a4e41066c4833c8e14f72fa")


