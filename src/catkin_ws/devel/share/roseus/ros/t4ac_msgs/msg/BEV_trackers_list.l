;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::BEV_trackers_list)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'BEV_trackers_list (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::BEV_TRACKERS_LIST")
  (make-package "T4AC_MSGS::BEV_TRACKERS_LIST"))

(in-package "ROS")
;;//! \htmlinclude BEV_trackers_list.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::BEV_trackers_list
  :super ros::object
  :slots (_header _bev_trackers_list ))

(defmethod t4ac_msgs::BEV_trackers_list
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:bev_trackers_list __bev_trackers_list) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _bev_trackers_list __bev_trackers_list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:bev_trackers_list
   (&rest __bev_trackers_list)
   (if (keywordp (car __bev_trackers_list))
       (send* _bev_trackers_list __bev_trackers_list)
     (progn
       (if __bev_trackers_list (setq _bev_trackers_list (car __bev_trackers_list)))
       _bev_trackers_list)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/BEV_tracker[] _bev_trackers_list
    (apply #'+ (send-all _bev_trackers_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/BEV_tracker[] _bev_trackers_list
     (write-long (length _bev_trackers_list) s)
     (dolist (elem _bev_trackers_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/BEV_tracker[] _bev_trackers_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bev_trackers_list (let (r) (dotimes (i n) (push (instance t4ac_msgs::BEV_tracker :init) r)) r))
     (dolist (elem- _bev_trackers_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::BEV_trackers_list :md5sum-) "75647be9b87b8cac8b063a214b8fbc18")
(setf (get t4ac_msgs::BEV_trackers_list :datatype-) "t4ac_msgs/BEV_trackers_list")
(setf (get t4ac_msgs::BEV_trackers_list :definition-)
      "# Techs4AgeCar project

Header header                              # Frame and timestamp information

BEV_tracker[] bev_trackers_list  # List of tracked_obstacles

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
MSG: t4ac_msgs/BEV_tracker
# Techs4AgeCar project

string type      # Object type
uint16 object_id # Object ID

float64   x      # BEV x centroid
float64   y      # BEV y centroid 
float64   w      # BEV width of the object
float64   l      # BEV length of the object
float64   o      # Object orientation



")



(provide :t4ac_msgs/BEV_trackers_list "75647be9b87b8cac8b063a214b8fbc18")


