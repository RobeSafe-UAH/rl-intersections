;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Bounding_Box_2D_list)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Bounding_Box_2D_list (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::BOUNDING_BOX_2D_LIST")
  (make-package "T4AC_MSGS::BOUNDING_BOX_2D_LIST"))

(in-package "ROS")
;;//! \htmlinclude Bounding_Box_2D_list.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::Bounding_Box_2D_list
  :super ros::object
  :slots (_header _bounding_box_2D_list ))

(defmethod t4ac_msgs::Bounding_Box_2D_list
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:bounding_box_2D_list __bounding_box_2D_list) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _bounding_box_2D_list __bounding_box_2D_list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:bounding_box_2D_list
   (&rest __bounding_box_2D_list)
   (if (keywordp (car __bounding_box_2D_list))
       (send* _bounding_box_2D_list __bounding_box_2D_list)
     (progn
       (if __bounding_box_2D_list (setq _bounding_box_2D_list (car __bounding_box_2D_list)))
       _bounding_box_2D_list)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/Bounding_Box_2D[] _bounding_box_2D_list
    (apply #'+ (send-all _bounding_box_2D_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/Bounding_Box_2D[] _bounding_box_2D_list
     (write-long (length _bounding_box_2D_list) s)
     (dolist (elem _bounding_box_2D_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/Bounding_Box_2D[] _bounding_box_2D_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bounding_box_2D_list (let (r) (dotimes (i n) (push (instance t4ac_msgs::Bounding_Box_2D :init) r)) r))
     (dolist (elem- _bounding_box_2D_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::Bounding_Box_2D_list :md5sum-) "1ba56b4d1710c06cbc5c52ee8160ea10")
(setf (get t4ac_msgs::Bounding_Box_2D_list :datatype-) "t4ac_msgs/Bounding_Box_2D_list")
(setf (get t4ac_msgs::Bounding_Box_2D_list :definition-)
      "# Techs4AgeCar project

Header header                          # Frame and timestamp information

Bounding_Box_2D[] bounding_box_2D_list # List of bev_obstacles
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
MSG: t4ac_msgs/Bounding_Box_2D
# Techs4AgeCar project

string type         # Object type
float64 score       # Object probability (0 to 1)

float64   x1        # Top-left x coordinate
float64   y1        # Top-left y coordinate 
float64   x2        # Bottom-right x coordinate
float64   y2        # Bottom-right y coordinate 
")



(provide :t4ac_msgs/Bounding_Box_2D_list "1ba56b4d1710c06cbc5c52ee8160ea10")


