;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Bounding_Box_3D)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Bounding_Box_3D (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::BOUNDING_BOX_3D")
  (make-package "T4AC_MSGS::BOUNDING_BOX_3D"))

(in-package "ROS")
;;//! \htmlinclude Bounding_Box_3D.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass t4ac_msgs::Bounding_Box_3D
  :super ros::object
  :slots (_type _score _pose _l _w _h _corners_3d _vel_lin _vel_ang ))

(defmethod t4ac_msgs::Bounding_Box_3D
  (:init
   (&key
    ((:type __type) "")
    ((:score __score) 0.0)
    ((:pose __pose) (instance geometry_msgs::PoseWithCovariance :init))
    ((:l __l) 0.0)
    ((:w __w) 0.0)
    ((:h __h) 0.0)
    ((:corners_3d __corners_3d) ())
    ((:vel_lin __vel_lin) 0.0)
    ((:vel_ang __vel_ang) 0.0)
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _score (float __score))
   (setq _pose __pose)
   (setq _l (float __l))
   (setq _w (float __w))
   (setq _h (float __h))
   (setq _corners_3d __corners_3d)
   (setq _vel_lin (float __vel_lin))
   (setq _vel_ang (float __vel_ang))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:l
   (&optional __l)
   (if __l (setq _l __l)) _l)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:corners_3d
   (&rest __corners_3d)
   (if (keywordp (car __corners_3d))
       (send* _corners_3d __corners_3d)
     (progn
       (if __corners_3d (setq _corners_3d (car __corners_3d)))
       _corners_3d)))
  (:vel_lin
   (&optional __vel_lin)
   (if __vel_lin (setq _vel_lin __vel_lin)) _vel_lin)
  (:vel_ang
   (&optional __vel_ang)
   (if __vel_ang (setq _vel_ang __vel_ang)) _vel_ang)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; float64 _score
    8
    ;; geometry_msgs/PoseWithCovariance _pose
    (send _pose :serialization-length)
    ;; float64 _l
    8
    ;; float64 _w
    8
    ;; float64 _h
    8
    ;; t4ac_msgs/Node[] _corners_3d
    (apply #'+ (send-all _corners_3d :serialization-length)) 4
    ;; float64 _vel_lin
    8
    ;; float64 _vel_ang
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; float64 _score
       (sys::poke _score (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/PoseWithCovariance _pose
       (send _pose :serialize s)
     ;; float64 _l
       (sys::poke _l (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _w
       (sys::poke _w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h
       (sys::poke _h (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; t4ac_msgs/Node[] _corners_3d
     (write-long (length _corners_3d) s)
     (dolist (elem _corners_3d)
       (send elem :serialize s)
       )
     ;; float64 _vel_lin
       (sys::poke _vel_lin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vel_ang
       (sys::poke _vel_ang (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _score
     (setq _score (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/PoseWithCovariance _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float64 _l
     (setq _l (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _w
     (setq _w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h
     (setq _h (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; t4ac_msgs/Node[] _corners_3d
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _corners_3d (let (r) (dotimes (i n) (push (instance t4ac_msgs::Node :init) r)) r))
     (dolist (elem- _corners_3d)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64 _vel_lin
     (setq _vel_lin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vel_ang
     (setq _vel_ang (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get t4ac_msgs::Bounding_Box_3D :md5sum-) "c8498b5ba07dec6489238ee817db1326")
(setf (get t4ac_msgs::Bounding_Box_3D :datatype-) "t4ac_msgs/Bounding_Box_3D")
(setf (get t4ac_msgs::Bounding_Box_3D :definition-)
      "# Techs4AgeCar project

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



(provide :t4ac_msgs/Bounding_Box_3D "c8498b5ba07dec6489238ee817db1326")


