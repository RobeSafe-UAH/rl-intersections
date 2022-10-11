;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Bounding_Box_3D_list)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Bounding_Box_3D_list (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::BOUNDING_BOX_3D_LIST")
  (make-package "T4AC_MSGS::BOUNDING_BOX_3D_LIST"))

(in-package "ROS")
;;//! \htmlinclude Bounding_Box_3D_list.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::Bounding_Box_3D_list
  :super ros::object
  :slots (_header _bounding_box_3d_list ))

(defmethod t4ac_msgs::Bounding_Box_3D_list
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:bounding_box_3d_list __bounding_box_3d_list) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _bounding_box_3d_list __bounding_box_3d_list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:bounding_box_3d_list
   (&rest __bounding_box_3d_list)
   (if (keywordp (car __bounding_box_3d_list))
       (send* _bounding_box_3d_list __bounding_box_3d_list)
     (progn
       (if __bounding_box_3d_list (setq _bounding_box_3d_list (car __bounding_box_3d_list)))
       _bounding_box_3d_list)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/Bounding_Box_3D[] _bounding_box_3d_list
    (apply #'+ (send-all _bounding_box_3d_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/Bounding_Box_3D[] _bounding_box_3d_list
     (write-long (length _bounding_box_3d_list) s)
     (dolist (elem _bounding_box_3d_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/Bounding_Box_3D[] _bounding_box_3d_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bounding_box_3d_list (let (r) (dotimes (i n) (push (instance t4ac_msgs::Bounding_Box_3D :init) r)) r))
     (dolist (elem- _bounding_box_3d_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::Bounding_Box_3D_list :md5sum-) "68148d914255b67811779dc40b20532f")
(setf (get t4ac_msgs::Bounding_Box_3D_list :datatype-) "t4ac_msgs/Bounding_Box_3D_list")
(setf (get t4ac_msgs::Bounding_Box_3D_list :definition-)
      "# Techs4AgeCar project

Header header                          # Frame and timestamp information

Bounding_Box_3D[] bounding_box_3d_list # List of 3D Bounding Boxes 
                                       # (may include their velocity)

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
MSG: t4ac_msgs/Bounding_Box_3D
# Techs4AgeCar project

string                           type         # Object type
float64                          score        # Object probability (0 to 1)

geometry_msgs/PoseWithCovariance pose         # Centroid x,y,z, yaw (Laser frame)
float64                          l            # Object length (Originally along x-laser frame)
float64                          w            # Object width (Originally along y-laser frame)
float64                          h            # Object height (z-laser frame)
Node[]                           corners_3d   # 3D bbox coordinates (x,y,z ; Laser frame)
float64                          vel_lin      # Absolute global linear velocity
float64                          vel_ang      # Absolute global angular velocity


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

================================================================================
MSG: t4ac_msgs/Node
## Node definition 

float64 x	# X
float64 y	# Y
float64 z	# Z

")



(provide :t4ac_msgs/Bounding_Box_3D_list "68148d914255b67811779dc40b20532f")


