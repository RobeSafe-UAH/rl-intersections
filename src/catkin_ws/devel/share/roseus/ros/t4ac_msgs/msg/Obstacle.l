;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Obstacle)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Obstacle (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::OBSTACLE")
  (make-package "T4AC_MSGS::OBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude Obstacle.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::Obstacle
  :super ros::object
  :slots (_header _pose _dist2ego _twist _shape _road_id _type ))

(defmethod t4ac_msgs::Obstacle
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:dist2ego __dist2ego) 0.0)
    ((:twist __twist) (instance geometry_msgs::Twist :init))
    ((:shape __shape) (instance geometry_msgs::Polygon :init))
    ((:road_id __road_id) 0)
    ((:type __type) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _pose __pose)
   (setq _dist2ego (float __dist2ego))
   (setq _twist __twist)
   (setq _shape __shape)
   (setq _road_id (round __road_id))
   (setq _type (string __type))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:dist2ego
   (&optional __dist2ego)
   (if __dist2ego (setq _dist2ego __dist2ego)) _dist2ego)
  (:twist
   (&rest __twist)
   (if (keywordp (car __twist))
       (send* _twist __twist)
     (progn
       (if __twist (setq _twist (car __twist)))
       _twist)))
  (:shape
   (&rest __shape)
   (if (keywordp (car __shape))
       (send* _shape __shape)
     (progn
       (if __shape (setq _shape (car __shape)))
       _shape)))
  (:road_id
   (&optional __road_id)
   (if __road_id (setq _road_id __road_id)) _road_id)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float64 _dist2ego
    8
    ;; geometry_msgs/Twist _twist
    (send _twist :serialization-length)
    ;; geometry_msgs/Polygon _shape
    (send _shape :serialization-length)
    ;; int64 _road_id
    8
    ;; string _type
    4 (length _type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float64 _dist2ego
       (sys::poke _dist2ego (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/Twist _twist
       (send _twist :serialize s)
     ;; geometry_msgs/Polygon _shape
       (send _shape :serialize s)
     ;; int64 _road_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _road_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _road_id) (= (length (_road_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_road_id . bv) 0) 0) s)
              (write-long (ash (elt (_road_id . bv) 1) -1) s))
             ((and (class _road_id) (= (length (_road_id . bv)) 1)) ;; big1
              (write-long (elt (_road_id . bv) 0) s)
              (write-long (if (>= _road_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _road_id s)(write-long (if (>= _road_id 0) 0 #xffffffff) s)))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float64 _dist2ego
     (setq _dist2ego (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/Twist _twist
     (send _twist :deserialize buf ptr-) (incf ptr- (send _twist :serialization-length))
   ;; geometry_msgs/Polygon _shape
     (send _shape :deserialize buf ptr-) (incf ptr- (send _shape :serialization-length))
   ;; int64 _road_id
#+(or :alpha :irix6 :x86_64)
      (setf _road_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _road_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get t4ac_msgs::Obstacle :md5sum-) "3e4174cc429855439ab5bc32a913375d")
(setf (get t4ac_msgs::Obstacle :datatype-) "t4ac_msgs/Obstacle")
(setf (get t4ac_msgs::Obstacle :definition-)
      "# Techs4AgeCar project

Header header

geometry_msgs/Pose pose		# Pose at the center of mass
float64 dist2ego            # Distance to ego-vehicle
geometry_msgs/Twist twist	# Velocity at the center of mass
geometry_msgs/Polygon shape	# Box containing the obstacle
int64 road_id			# Road_id in which the obstacle is
string type			# Obstacle type if it is known (car, pedestrian, sign, etc)

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



(provide :t4ac_msgs/Obstacle "3e4174cc429855439ab5bc32a913375d")


