;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Obstacles_list)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Obstacles_list (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::OBSTACLES_LIST")
  (make-package "T4AC_MSGS::OBSTACLES_LIST"))

(in-package "ROS")
;;//! \htmlinclude Obstacles_list.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::Obstacles_list
  :super ros::object
  :slots (_header _obstacles_list ))

(defmethod t4ac_msgs::Obstacles_list
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:obstacles_list __obstacles_list) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _obstacles_list __obstacles_list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:obstacles_list
   (&rest __obstacles_list)
   (if (keywordp (car __obstacles_list))
       (send* _obstacles_list __obstacles_list)
     (progn
       (if __obstacles_list (setq _obstacles_list (car __obstacles_list)))
       _obstacles_list)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/Obstacle[] _obstacles_list
    (apply #'+ (send-all _obstacles_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/Obstacle[] _obstacles_list
     (write-long (length _obstacles_list) s)
     (dolist (elem _obstacles_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/Obstacle[] _obstacles_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _obstacles_list (let (r) (dotimes (i n) (push (instance t4ac_msgs::Obstacle :init) r)) r))
     (dolist (elem- _obstacles_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::Obstacles_list :md5sum-) "c5382525edc2a5ee0a08af26c50c5e4c")
(setf (get t4ac_msgs::Obstacles_list :datatype-) "t4ac_msgs/Obstacles_list")
(setf (get t4ac_msgs::Obstacles_list :definition-)
      "# Techs4AgeCar project

Header header

Obstacle[] obstacles_list # List of obstacles

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
MSG: t4ac_msgs/Obstacle
# Techs4AgeCar project

Header header

geometry_msgs/Pose pose		# Pose at the center of mass
float64 dist2ego            # Distance to ego-vehicle
geometry_msgs/Twist twist	# Velocity at the center of mass
geometry_msgs/Polygon shape	# Box containing the obstacle
int64 road_id			# Road_id in which the obstacle is
string type			# Obstacle type if it is known (car, pedestrian, sign, etc)

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
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Polygon
#A specification of a polygon where the first and last points are assumed to be connected
Point32[] points

================================================================================
MSG: geometry_msgs/Point32
# This contains the position of a point in free space(with 32 bits of precision).
# It is recommeded to use Point wherever possible instead of Point32.  
# 
# This recommendation is to promote interoperability.  
#
# This message is designed to take up less space when sending
# lots of points at once, as in the case of a PointCloud.  

float32 x
float32 y
float32 z
")



(provide :t4ac_msgs/Obstacles_list "c5382525edc2a5ee0a08af26c50c5e4c")


