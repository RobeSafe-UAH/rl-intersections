;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::GT_3D_Object_list)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'GT_3D_Object_list (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::GT_3D_OBJECT_LIST")
  (make-package "T4AC_MSGS::GT_3D_OBJECT_LIST"))

(in-package "ROS")
;;//! \htmlinclude GT_3D_Object_list.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::GT_3D_Object_list
  :super ros::object
  :slots (_header _gt_3d_object_list ))

(defmethod t4ac_msgs::GT_3D_Object_list
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:gt_3d_object_list __gt_3d_object_list) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _gt_3d_object_list __gt_3d_object_list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:gt_3d_object_list
   (&rest __gt_3d_object_list)
   (if (keywordp (car __gt_3d_object_list))
       (send* _gt_3d_object_list __gt_3d_object_list)
     (progn
       (if __gt_3d_object_list (setq _gt_3d_object_list (car __gt_3d_object_list)))
       _gt_3d_object_list)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; t4ac_msgs/GT_3D_Object[] _gt_3d_object_list
    (apply #'+ (send-all _gt_3d_object_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; t4ac_msgs/GT_3D_Object[] _gt_3d_object_list
     (write-long (length _gt_3d_object_list) s)
     (dolist (elem _gt_3d_object_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; t4ac_msgs/GT_3D_Object[] _gt_3d_object_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gt_3d_object_list (let (r) (dotimes (i n) (push (instance t4ac_msgs::GT_3D_Object :init) r)) r))
     (dolist (elem- _gt_3d_object_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::GT_3D_Object_list :md5sum-) "13a224db64e6563b6b9b60a32f1db87e")
(setf (get t4ac_msgs::GT_3D_Object_list :datatype-) "t4ac_msgs/GT_3D_Object_list")
(setf (get t4ac_msgs::GT_3D_Object_list :definition-)
      "# Techs4AgeCar project

Header header                           # Frame and timestamp information
GT_3D_Object[] gt_3d_object_list        # List of GT 3D Objects
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
MSG: t4ac_msgs/GT_3D_Object
# Techs4AgeCar project

string type                                 # Object type if it is known (car, pedestrian, truck, etc)
uint32 object_id                            # Id assign to an object
float32 alpha                               # Observation angle of object
vision_msgs/BoundingBox2D bounding_box_2D   # Object 2D bounding box
geometry_msgs/Point position                # Center of the object
geometry_msgs/Vector3 dimensions            # Object dimensions (l, w, h)
float32 rotation_z                          # Object rotation along z axis
geometry_msgs/Vector3 velocity              # Velocity of the object related to the ego vehicle
float32 truncated                           # Float from 0 (non-truncated) to 1 (truncated), where truncated refers to the object leaving image boundaries
uint8 occluded                              # Integer (0,1,2,3) indicating occlusion state: 0 = fully visible, 1 = partly occluded, 2 = largely occluded, 3 = not visible to the camera
================================================================================
MSG: vision_msgs/BoundingBox2D
# A 2D bounding box that can be rotated about its center.
# All dimensions are in pixels, but represented using floating-point
#   values to allow sub-pixel precision. If an exact pixel crop is required
#   for a rotated bounding box, it can be calculated using Bresenham's line
#   algorithm.

# The 2D position (in pixels) and orientation of the bounding box center.
geometry_msgs/Pose2D center

# The size (in pixels) of the bounding box surrounding the object relative
#   to the pose of its center.
float64 size_x
float64 size_y

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

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
")



(provide :t4ac_msgs/GT_3D_Object_list "13a224db64e6563b6b9b60a32f1db87e")


