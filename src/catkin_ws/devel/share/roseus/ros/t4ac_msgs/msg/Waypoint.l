;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Waypoint)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Waypoint (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::WAYPOINT")
  (make-package "T4AC_MSGS::WAYPOINT"))

(in-package "ROS")
;;//! \htmlinclude Waypoint.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::Waypoint
  :super ros::object
  :slots (_header _id _transform _road_id _lane_id _junction _s _lane_width _lane_change _lane_type _right_lane_marking _left_lane_marking _vmax _vunit _nLanes _lanePosition ))

(defmethod t4ac_msgs::Waypoint
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:id __id) 0)
    ((:transform __transform) (instance t4ac_msgs::Transform :init))
    ((:road_id __road_id) 0)
    ((:lane_id __lane_id) 0)
    ((:junction __junction) 0)
    ((:s __s) 0.0)
    ((:lane_width __lane_width) 0.0)
    ((:lane_change __lane_change) "")
    ((:lane_type __lane_type) "")
    ((:right_lane_marking __right_lane_marking) "")
    ((:left_lane_marking __left_lane_marking) "")
    ((:vmax __vmax) 0)
    ((:vunit __vunit) "")
    ((:nLanes __nLanes) 0)
    ((:lanePosition __lanePosition) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _id (round __id))
   (setq _transform __transform)
   (setq _road_id (round __road_id))
   (setq _lane_id (round __lane_id))
   (setq _junction (round __junction))
   (setq _s (float __s))
   (setq _lane_width (float __lane_width))
   (setq _lane_change (string __lane_change))
   (setq _lane_type (string __lane_type))
   (setq _right_lane_marking (string __right_lane_marking))
   (setq _left_lane_marking (string __left_lane_marking))
   (setq _vmax (round __vmax))
   (setq _vunit (string __vunit))
   (setq _nLanes (round __nLanes))
   (setq _lanePosition (round __lanePosition))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:transform
   (&rest __transform)
   (if (keywordp (car __transform))
       (send* _transform __transform)
     (progn
       (if __transform (setq _transform (car __transform)))
       _transform)))
  (:road_id
   (&optional __road_id)
   (if __road_id (setq _road_id __road_id)) _road_id)
  (:lane_id
   (&optional __lane_id)
   (if __lane_id (setq _lane_id __lane_id)) _lane_id)
  (:junction
   (&optional __junction)
   (if __junction (setq _junction __junction)) _junction)
  (:s
   (&optional __s)
   (if __s (setq _s __s)) _s)
  (:lane_width
   (&optional __lane_width)
   (if __lane_width (setq _lane_width __lane_width)) _lane_width)
  (:lane_change
   (&optional __lane_change)
   (if __lane_change (setq _lane_change __lane_change)) _lane_change)
  (:lane_type
   (&optional __lane_type)
   (if __lane_type (setq _lane_type __lane_type)) _lane_type)
  (:right_lane_marking
   (&optional __right_lane_marking)
   (if __right_lane_marking (setq _right_lane_marking __right_lane_marking)) _right_lane_marking)
  (:left_lane_marking
   (&optional __left_lane_marking)
   (if __left_lane_marking (setq _left_lane_marking __left_lane_marking)) _left_lane_marking)
  (:vmax
   (&optional __vmax)
   (if __vmax (setq _vmax __vmax)) _vmax)
  (:vunit
   (&optional __vunit)
   (if __vunit (setq _vunit __vunit)) _vunit)
  (:nLanes
   (&optional __nLanes)
   (if __nLanes (setq _nLanes __nLanes)) _nLanes)
  (:lanePosition
   (&optional __lanePosition)
   (if __lanePosition (setq _lanePosition __lanePosition)) _lanePosition)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _id
    4
    ;; t4ac_msgs/Transform _transform
    (send _transform :serialization-length)
    ;; int32 _road_id
    4
    ;; int32 _lane_id
    4
    ;; int32 _junction
    4
    ;; float64 _s
    8
    ;; float64 _lane_width
    8
    ;; string _lane_change
    4 (length _lane_change)
    ;; string _lane_type
    4 (length _lane_type)
    ;; string _right_lane_marking
    4 (length _right_lane_marking)
    ;; string _left_lane_marking
    4 (length _left_lane_marking)
    ;; int32 _vmax
    4
    ;; string _vunit
    4 (length _vunit)
    ;; int32 _nLanes
    4
    ;; int32 _lanePosition
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _id
       (write-long _id s)
     ;; t4ac_msgs/Transform _transform
       (send _transform :serialize s)
     ;; int32 _road_id
       (write-long _road_id s)
     ;; int32 _lane_id
       (write-long _lane_id s)
     ;; int32 _junction
       (write-long _junction s)
     ;; float64 _s
       (sys::poke _s (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _lane_width
       (sys::poke _lane_width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _lane_change
       (write-long (length _lane_change) s) (princ _lane_change s)
     ;; string _lane_type
       (write-long (length _lane_type) s) (princ _lane_type s)
     ;; string _right_lane_marking
       (write-long (length _right_lane_marking) s) (princ _right_lane_marking s)
     ;; string _left_lane_marking
       (write-long (length _left_lane_marking) s) (princ _left_lane_marking s)
     ;; int32 _vmax
       (write-long _vmax s)
     ;; string _vunit
       (write-long (length _vunit) s) (princ _vunit s)
     ;; int32 _nLanes
       (write-long _nLanes s)
     ;; int32 _lanePosition
       (write-long _lanePosition s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; t4ac_msgs/Transform _transform
     (send _transform :deserialize buf ptr-) (incf ptr- (send _transform :serialization-length))
   ;; int32 _road_id
     (setq _road_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lane_id
     (setq _lane_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _junction
     (setq _junction (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _s
     (setq _s (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _lane_width
     (setq _lane_width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _lane_change
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _lane_change (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _lane_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _lane_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _right_lane_marking
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _right_lane_marking (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _left_lane_marking
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _left_lane_marking (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _vmax
     (setq _vmax (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _vunit
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _vunit (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _nLanes
     (setq _nLanes (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _lanePosition
     (setq _lanePosition (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get t4ac_msgs::Waypoint :md5sum-) "0077c4b075dc1aed9256fe7f551799fe")
(setf (get t4ac_msgs::Waypoint :datatype-) "t4ac_msgs/Waypoint")
(setf (get t4ac_msgs::Waypoint :definition-)
      "# T4ac Project 

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



(provide :t4ac_msgs/Waypoint "0077c4b075dc1aed9256fe7f551799fe")


