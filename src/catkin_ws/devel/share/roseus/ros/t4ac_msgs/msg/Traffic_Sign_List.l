;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Traffic_Sign_List)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Traffic_Sign_List (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::TRAFFIC_SIGN_LIST")
  (make-package "T4AC_MSGS::TRAFFIC_SIGN_LIST"))

(in-package "ROS")
;;//! \htmlinclude Traffic_Sign_List.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::Traffic_Sign_List
  :super ros::object
  :slots (_header _traffic_sign_list ))

(defmethod t4ac_msgs::Traffic_Sign_List
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:traffic_sign_list __traffic_sign_list) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _traffic_sign_list __traffic_sign_list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:traffic_sign_list
   (&rest __traffic_sign_list)
   (if (keywordp (car __traffic_sign_list))
       (send* _traffic_sign_list __traffic_sign_list)
     (progn
       (if __traffic_sign_list (setq _traffic_sign_list (car __traffic_sign_list)))
       _traffic_sign_list)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/Traffic_Sign[] _traffic_sign_list
    (apply #'+ (send-all _traffic_sign_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/Traffic_Sign[] _traffic_sign_list
     (write-long (length _traffic_sign_list) s)
     (dolist (elem _traffic_sign_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/Traffic_Sign[] _traffic_sign_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _traffic_sign_list (let (r) (dotimes (i n) (push (instance t4ac_msgs::Traffic_Sign :init) r)) r))
     (dolist (elem- _traffic_sign_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::Traffic_Sign_List :md5sum-) "f887f4878752799f02c0c91e6dcb4d0a")
(setf (get t4ac_msgs::Traffic_Sign_List :datatype-) "t4ac_msgs/Traffic_Sign_List")
(setf (get t4ac_msgs::Traffic_Sign_List :definition-)
      "# Techs4AgeCar project

Header header                          # Frame and timestamp information

Traffic_Sign[] traffic_sign_list       # Currently observed traffic signs, including the involved lanes
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
MSG: t4ac_msgs/Traffic_Sign
# Techs4AgeCar project

string type                                    # Traffic Sign type
uint8[] lanes                                  # Lanes involved

float64   x1                                   # Top-left x coordinate
float64   y1                                   # Top-left y coordinate 
float64   x2                                   # Bottom-right x coordinate
float64   y2                                   # Bottom-right y coordinate 
geometry_msgs/PoseWithCovariance local_pose    # 3D Centroid x,y,z (Ego-vehicle frame)
geometry_msgs/PoseWithCovariance global_pose   # 3D Centroid x,y,z (Map frame)

float64  stop_line                             # Minimum distance at which the traffic light is 
                                               # fully observed. TODO: TAKE THIS STOP LINE FROM 
                                               # THE MAP AND ENSURE YOU OBSERVE THE CORRESPONDING
                                               # TRAFFIC LIGHT AT THIS POINT
================================================================================
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

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



(provide :t4ac_msgs/Traffic_Sign_List "f887f4878752799f02c0c91e6dcb4d0a")


