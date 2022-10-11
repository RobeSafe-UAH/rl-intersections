;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Traffic_Sign)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Traffic_Sign (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::TRAFFIC_SIGN")
  (make-package "T4AC_MSGS::TRAFFIC_SIGN"))

(in-package "ROS")
;;//! \htmlinclude Traffic_Sign.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass t4ac_msgs::Traffic_Sign
  :super ros::object
  :slots (_type _lanes _x1 _y1 _x2 _y2 _local_pose _global_pose _stop_line ))

(defmethod t4ac_msgs::Traffic_Sign
  (:init
   (&key
    ((:type __type) "")
    ((:lanes __lanes) (make-array 0 :initial-element 0 :element-type :char))
    ((:x1 __x1) 0.0)
    ((:y1 __y1) 0.0)
    ((:x2 __x2) 0.0)
    ((:y2 __y2) 0.0)
    ((:local_pose __local_pose) (instance geometry_msgs::PoseWithCovariance :init))
    ((:global_pose __global_pose) (instance geometry_msgs::PoseWithCovariance :init))
    ((:stop_line __stop_line) 0.0)
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _lanes __lanes)
   (setq _x1 (float __x1))
   (setq _y1 (float __y1))
   (setq _x2 (float __x2))
   (setq _y2 (float __y2))
   (setq _local_pose __local_pose)
   (setq _global_pose __global_pose)
   (setq _stop_line (float __stop_line))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:lanes
   (&optional __lanes)
   (if __lanes (setq _lanes __lanes)) _lanes)
  (:x1
   (&optional __x1)
   (if __x1 (setq _x1 __x1)) _x1)
  (:y1
   (&optional __y1)
   (if __y1 (setq _y1 __y1)) _y1)
  (:x2
   (&optional __x2)
   (if __x2 (setq _x2 __x2)) _x2)
  (:y2
   (&optional __y2)
   (if __y2 (setq _y2 __y2)) _y2)
  (:local_pose
   (&rest __local_pose)
   (if (keywordp (car __local_pose))
       (send* _local_pose __local_pose)
     (progn
       (if __local_pose (setq _local_pose (car __local_pose)))
       _local_pose)))
  (:global_pose
   (&rest __global_pose)
   (if (keywordp (car __global_pose))
       (send* _global_pose __global_pose)
     (progn
       (if __global_pose (setq _global_pose (car __global_pose)))
       _global_pose)))
  (:stop_line
   (&optional __stop_line)
   (if __stop_line (setq _stop_line __stop_line)) _stop_line)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; uint8[] _lanes
    (* 1    (length _lanes)) 4
    ;; float64 _x1
    8
    ;; float64 _y1
    8
    ;; float64 _x2
    8
    ;; float64 _y2
    8
    ;; geometry_msgs/PoseWithCovariance _local_pose
    (send _local_pose :serialization-length)
    ;; geometry_msgs/PoseWithCovariance _global_pose
    (send _global_pose :serialization-length)
    ;; float64 _stop_line
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; uint8[] _lanes
     (write-long (length _lanes) s)
     (princ _lanes s)
     ;; float64 _x1
       (sys::poke _x1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y1
       (sys::poke _y1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x2
       (sys::poke _x2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y2
       (sys::poke _y2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/PoseWithCovariance _local_pose
       (send _local_pose :serialize s)
     ;; geometry_msgs/PoseWithCovariance _global_pose
       (send _global_pose :serialize s)
     ;; float64 _stop_line
       (sys::poke _stop_line (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint8[] _lanes
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _lanes (make-array n :element-type :char))
     (replace _lanes buf :start2 ptr-) (incf ptr- n))
   ;; float64 _x1
     (setq _x1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y1
     (setq _y1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x2
     (setq _x2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y2
     (setq _y2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/PoseWithCovariance _local_pose
     (send _local_pose :deserialize buf ptr-) (incf ptr- (send _local_pose :serialization-length))
   ;; geometry_msgs/PoseWithCovariance _global_pose
     (send _global_pose :deserialize buf ptr-) (incf ptr- (send _global_pose :serialization-length))
   ;; float64 _stop_line
     (setq _stop_line (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get t4ac_msgs::Traffic_Sign :md5sum-) "f266b8af366a609a7c528b57f35853d1")
(setf (get t4ac_msgs::Traffic_Sign :datatype-) "t4ac_msgs/Traffic_Sign")
(setf (get t4ac_msgs::Traffic_Sign :definition-)
      "# Techs4AgeCar project

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



(provide :t4ac_msgs/Traffic_Sign "f266b8af366a609a7c528b57f35853d1")


