;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::SpawnObject)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'SpawnObject (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::SPAWNOBJECT")
  (make-package "CARLA_MSGS::SPAWNOBJECT"))
(unless (find-package "CARLA_MSGS::SPAWNOBJECTREQUEST")
  (make-package "CARLA_MSGS::SPAWNOBJECTREQUEST"))
(unless (find-package "CARLA_MSGS::SPAWNOBJECTRESPONSE")
  (make-package "CARLA_MSGS::SPAWNOBJECTRESPONSE"))

(in-package "ROS")

(if (not (find-package "DIAGNOSTIC_MSGS"))
  (ros::roseus-add-msgs "diagnostic_msgs"))
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass carla_msgs::SpawnObjectRequest
  :super ros::object
  :slots (_type _id _attributes _transform _attach_to _random_pose ))

(defmethod carla_msgs::SpawnObjectRequest
  (:init
   (&key
    ((:type __type) "")
    ((:id __id) "")
    ((:attributes __attributes) ())
    ((:transform __transform) (instance geometry_msgs::Pose :init))
    ((:attach_to __attach_to) 0)
    ((:random_pose __random_pose) nil)
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _id (string __id))
   (setq _attributes __attributes)
   (setq _transform __transform)
   (setq _attach_to (round __attach_to))
   (setq _random_pose __random_pose)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:attributes
   (&rest __attributes)
   (if (keywordp (car __attributes))
       (send* _attributes __attributes)
     (progn
       (if __attributes (setq _attributes (car __attributes)))
       _attributes)))
  (:transform
   (&rest __transform)
   (if (keywordp (car __transform))
       (send* _transform __transform)
     (progn
       (if __transform (setq _transform (car __transform)))
       _transform)))
  (:attach_to
   (&optional __attach_to)
   (if __attach_to (setq _attach_to __attach_to)) _attach_to)
  (:random_pose
   (&optional (__random_pose :null))
   (if (not (eq __random_pose :null)) (setq _random_pose __random_pose)) _random_pose)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; string _id
    4 (length _id)
    ;; diagnostic_msgs/KeyValue[] _attributes
    (apply #'+ (send-all _attributes :serialization-length)) 4
    ;; geometry_msgs/Pose _transform
    (send _transform :serialization-length)
    ;; uint32 _attach_to
    4
    ;; bool _random_pose
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; diagnostic_msgs/KeyValue[] _attributes
     (write-long (length _attributes) s)
     (dolist (elem _attributes)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Pose _transform
       (send _transform :serialize s)
     ;; uint32 _attach_to
       (write-long _attach_to s)
     ;; bool _random_pose
       (if _random_pose (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; diagnostic_msgs/KeyValue[] _attributes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _attributes (let (r) (dotimes (i n) (push (instance diagnostic_msgs::KeyValue :init) r)) r))
     (dolist (elem- _attributes)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Pose _transform
     (send _transform :deserialize buf ptr-) (incf ptr- (send _transform :serialization-length))
   ;; uint32 _attach_to
     (setq _attach_to (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; bool _random_pose
     (setq _random_pose (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass carla_msgs::SpawnObjectResponse
  :super ros::object
  :slots (_id _error_string ))

(defmethod carla_msgs::SpawnObjectResponse
  (:init
   (&key
    ((:id __id) 0)
    ((:error_string __error_string) "")
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _error_string (string __error_string))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:error_string
   (&optional __error_string)
   (if __error_string (setq _error_string __error_string)) _error_string)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; string _error_string
    4 (length _error_string)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; string _error_string
       (write-long (length _error_string) s) (princ _error_string s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _error_string
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _error_string (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass carla_msgs::SpawnObject
  :super ros::object
  :slots ())

(setf (get carla_msgs::SpawnObject :md5sum-) "e33e3f6271c805c5651cbf682dacbcbd")
(setf (get carla_msgs::SpawnObject :datatype-) "carla_msgs/SpawnObject")
(setf (get carla_msgs::SpawnObject :request) carla_msgs::SpawnObjectRequest)
(setf (get carla_msgs::SpawnObject :response) carla_msgs::SpawnObjectResponse)

(defmethod carla_msgs::SpawnObjectRequest
  (:response () (instance carla_msgs::SpawnObjectResponse :init)))

(setf (get carla_msgs::SpawnObjectRequest :md5sum-) "e33e3f6271c805c5651cbf682dacbcbd")
(setf (get carla_msgs::SpawnObjectRequest :datatype-) "carla_msgs/SpawnObjectRequest")
(setf (get carla_msgs::SpawnObjectRequest :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#

string type
string id
diagnostic_msgs/KeyValue[] attributes
geometry_msgs/Pose transform
uint32 attach_to
bool random_pose

================================================================================
MSG: diagnostic_msgs/KeyValue
string key # what to label this value when viewing
string value # a value to track over time

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
---
int32 id
string error_string

")

(setf (get carla_msgs::SpawnObjectResponse :md5sum-) "e33e3f6271c805c5651cbf682dacbcbd")
(setf (get carla_msgs::SpawnObjectResponse :datatype-) "carla_msgs/SpawnObjectResponse")
(setf (get carla_msgs::SpawnObjectResponse :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#

string type
string id
diagnostic_msgs/KeyValue[] attributes
geometry_msgs/Pose transform
uint32 attach_to
bool random_pose

================================================================================
MSG: diagnostic_msgs/KeyValue
string key # what to label this value when viewing
string value # a value to track over time

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
---
int32 id
string error_string

")



(provide :carla_msgs/SpawnObject "e33e3f6271c805c5651cbf682dacbcbd")


