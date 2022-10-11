;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::MonitorizedLanes)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'MonitorizedLanes (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::MONITORIZEDLANES")
  (make-package "T4AC_MSGS::MONITORIZEDLANES"))

(in-package "ROS")
;;//! \htmlinclude MonitorizedLanes.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::MonitorizedLanes
  :super ros::object
  :slots (_header _lanes ))

(defmethod t4ac_msgs::MonitorizedLanes
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:lanes __lanes) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _lanes __lanes)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:lanes
   (&rest __lanes)
   (if (keywordp (car __lanes))
       (send* _lanes __lanes)
     (progn
       (if __lanes (setq _lanes (car __lanes)))
       _lanes)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/Lane[] _lanes
    (apply #'+ (send-all _lanes :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/Lane[] _lanes
     (write-long (length _lanes) s)
     (dolist (elem _lanes)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/Lane[] _lanes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _lanes (let (r) (dotimes (i n) (push (instance t4ac_msgs::Lane :init) r)) r))
     (dolist (elem- _lanes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::MonitorizedLanes :md5sum-) "1a578abb53051333eb4739652f419713")
(setf (get t4ac_msgs::MonitorizedLanes :datatype-) "t4ac_msgs/MonitorizedLanes")
(setf (get t4ac_msgs::MonitorizedLanes :definition-)
      "## Monitorized lanes 
#
# MonitorizedLanes is just a list of lanes around the vehicle

Header header
Lane[] lanes

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
MSG: t4ac_msgs/Lane
## Lane definition (from the Carla library) in ROS message format
#
# Lanes are mapped using PythonAPI from Carla.
# They are made up from one \"Way\" that determine its left and right bounds

#uint8 speedlimit	# mapped max speed in km/h
Way left		# mapped left boundary
Way right		# mapped right boundary 
string role     	# Role: current, backside, left, right

#--OPTIONAL--
#int32 lane_id 		# lane id from xodr
#bool is_junction	# true if is on a junction 
#float lane_width	# horizontal size of the road

#string type		# mapped type of lanelet

================================================================================
MSG: t4ac_msgs/Way
# Way definition 

Node[] way	# list of nodes


================================================================================
MSG: t4ac_msgs/Node
## Node definition 

float64 x	# X
float64 y	# Y
float64 z	# Z

")



(provide :t4ac_msgs/MonitorizedLanes "1a578abb53051333eb4739652f419713")


