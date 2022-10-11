;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::GT_3D_Object)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'GT_3D_Object (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::GT_3D_OBJECT")
  (make-package "T4AC_MSGS::GT_3D_OBJECT"))

(in-package "ROS")
;;//! \htmlinclude GT_3D_Object.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "VISION_MSGS"))
  (ros::roseus-add-msgs "vision_msgs"))


(defclass t4ac_msgs::GT_3D_Object
  :super ros::object
  :slots (_type _object_id _alpha _bounding_box_2D _position _dimensions _rotation_z _velocity _truncated _occluded ))

(defmethod t4ac_msgs::GT_3D_Object
  (:init
   (&key
    ((:type __type) "")
    ((:object_id __object_id) 0)
    ((:alpha __alpha) 0.0)
    ((:bounding_box_2D __bounding_box_2D) (instance vision_msgs::BoundingBox2D :init))
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:dimensions __dimensions) (instance geometry_msgs::Vector3 :init))
    ((:rotation_z __rotation_z) 0.0)
    ((:velocity __velocity) (instance geometry_msgs::Vector3 :init))
    ((:truncated __truncated) 0.0)
    ((:occluded __occluded) 0)
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _object_id (round __object_id))
   (setq _alpha (float __alpha))
   (setq _bounding_box_2D __bounding_box_2D)
   (setq _position __position)
   (setq _dimensions __dimensions)
   (setq _rotation_z (float __rotation_z))
   (setq _velocity __velocity)
   (setq _truncated (float __truncated))
   (setq _occluded (round __occluded))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:object_id
   (&optional __object_id)
   (if __object_id (setq _object_id __object_id)) _object_id)
  (:alpha
   (&optional __alpha)
   (if __alpha (setq _alpha __alpha)) _alpha)
  (:bounding_box_2D
   (&rest __bounding_box_2D)
   (if (keywordp (car __bounding_box_2D))
       (send* _bounding_box_2D __bounding_box_2D)
     (progn
       (if __bounding_box_2D (setq _bounding_box_2D (car __bounding_box_2D)))
       _bounding_box_2D)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:dimensions
   (&rest __dimensions)
   (if (keywordp (car __dimensions))
       (send* _dimensions __dimensions)
     (progn
       (if __dimensions (setq _dimensions (car __dimensions)))
       _dimensions)))
  (:rotation_z
   (&optional __rotation_z)
   (if __rotation_z (setq _rotation_z __rotation_z)) _rotation_z)
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:truncated
   (&optional __truncated)
   (if __truncated (setq _truncated __truncated)) _truncated)
  (:occluded
   (&optional __occluded)
   (if __occluded (setq _occluded __occluded)) _occluded)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; uint32 _object_id
    4
    ;; float32 _alpha
    4
    ;; vision_msgs/BoundingBox2D _bounding_box_2D
    (send _bounding_box_2D :serialization-length)
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; geometry_msgs/Vector3 _dimensions
    (send _dimensions :serialization-length)
    ;; float32 _rotation_z
    4
    ;; geometry_msgs/Vector3 _velocity
    (send _velocity :serialization-length)
    ;; float32 _truncated
    4
    ;; uint8 _occluded
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; uint32 _object_id
       (write-long _object_id s)
     ;; float32 _alpha
       (sys::poke _alpha (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; vision_msgs/BoundingBox2D _bounding_box_2D
       (send _bounding_box_2D :serialize s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; geometry_msgs/Vector3 _dimensions
       (send _dimensions :serialize s)
     ;; float32 _rotation_z
       (sys::poke _rotation_z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; geometry_msgs/Vector3 _velocity
       (send _velocity :serialize s)
     ;; float32 _truncated
       (sys::poke _truncated (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _occluded
       (write-byte _occluded s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32 _object_id
     (setq _object_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _alpha
     (setq _alpha (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; vision_msgs/BoundingBox2D _bounding_box_2D
     (send _bounding_box_2D :deserialize buf ptr-) (incf ptr- (send _bounding_box_2D :serialization-length))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; geometry_msgs/Vector3 _dimensions
     (send _dimensions :deserialize buf ptr-) (incf ptr- (send _dimensions :serialization-length))
   ;; float32 _rotation_z
     (setq _rotation_z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; geometry_msgs/Vector3 _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; float32 _truncated
     (setq _truncated (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _occluded
     (setq _occluded (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get t4ac_msgs::GT_3D_Object :md5sum-) "ca62318d44e5363ce4cf524c880fbfa2")
(setf (get t4ac_msgs::GT_3D_Object :datatype-) "t4ac_msgs/GT_3D_Object")
(setf (get t4ac_msgs::GT_3D_Object :definition-)
      "# Techs4AgeCar project

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



(provide :t4ac_msgs/GT_3D_Object "ca62318d44e5363ce4cf524c880fbfa2")


