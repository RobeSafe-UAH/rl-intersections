;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::DestroyObject)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'DestroyObject (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::DESTROYOBJECT")
  (make-package "CARLA_MSGS::DESTROYOBJECT"))
(unless (find-package "CARLA_MSGS::DESTROYOBJECTREQUEST")
  (make-package "CARLA_MSGS::DESTROYOBJECTREQUEST"))
(unless (find-package "CARLA_MSGS::DESTROYOBJECTRESPONSE")
  (make-package "CARLA_MSGS::DESTROYOBJECTRESPONSE"))

(in-package "ROS")





(defclass carla_msgs::DestroyObjectRequest
  :super ros::object
  :slots (_id ))

(defmethod carla_msgs::DestroyObjectRequest
  (:init
   (&key
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass carla_msgs::DestroyObjectResponse
  :super ros::object
  :slots (_success ))

(defmethod carla_msgs::DestroyObjectResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass carla_msgs::DestroyObject
  :super ros::object
  :slots ())

(setf (get carla_msgs::DestroyObject :md5sum-) "f66e2f1a2389241ede90395037adaed8")
(setf (get carla_msgs::DestroyObject :datatype-) "carla_msgs/DestroyObject")
(setf (get carla_msgs::DestroyObject :request) carla_msgs::DestroyObjectRequest)
(setf (get carla_msgs::DestroyObject :response) carla_msgs::DestroyObjectResponse)

(defmethod carla_msgs::DestroyObjectRequest
  (:response () (instance carla_msgs::DestroyObjectResponse :init)))

(setf (get carla_msgs::DestroyObjectRequest :md5sum-) "f66e2f1a2389241ede90395037adaed8")
(setf (get carla_msgs::DestroyObjectRequest :datatype-) "carla_msgs/DestroyObjectRequest")
(setf (get carla_msgs::DestroyObjectRequest :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#

int32 id
---
bool success

")

(setf (get carla_msgs::DestroyObjectResponse :md5sum-) "f66e2f1a2389241ede90395037adaed8")
(setf (get carla_msgs::DestroyObjectResponse :datatype-) "carla_msgs/DestroyObjectResponse")
(setf (get carla_msgs::DestroyObjectResponse :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#

int32 id
---
bool success

")



(provide :carla_msgs/DestroyObject "f66e2f1a2389241ede90395037adaed8")


