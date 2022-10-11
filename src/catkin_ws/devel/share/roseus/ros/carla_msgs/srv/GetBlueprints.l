;; Auto-generated. Do not edit!


(when (boundp 'carla_msgs::GetBlueprints)
  (if (not (find-package "CARLA_MSGS"))
    (make-package "CARLA_MSGS"))
  (shadow 'GetBlueprints (find-package "CARLA_MSGS")))
(unless (find-package "CARLA_MSGS::GETBLUEPRINTS")
  (make-package "CARLA_MSGS::GETBLUEPRINTS"))
(unless (find-package "CARLA_MSGS::GETBLUEPRINTSREQUEST")
  (make-package "CARLA_MSGS::GETBLUEPRINTSREQUEST"))
(unless (find-package "CARLA_MSGS::GETBLUEPRINTSRESPONSE")
  (make-package "CARLA_MSGS::GETBLUEPRINTSRESPONSE"))

(in-package "ROS")





(defclass carla_msgs::GetBlueprintsRequest
  :super ros::object
  :slots (_filter ))

(defmethod carla_msgs::GetBlueprintsRequest
  (:init
   (&key
    ((:filter __filter) "")
    )
   (send-super :init)
   (setq _filter (string __filter))
   self)
  (:filter
   (&optional __filter)
   (if __filter (setq _filter __filter)) _filter)
  (:serialization-length
   ()
   (+
    ;; string _filter
    4 (length _filter)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _filter
       (write-long (length _filter) s) (princ _filter s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _filter
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _filter (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass carla_msgs::GetBlueprintsResponse
  :super ros::object
  :slots (_blueprints ))

(defmethod carla_msgs::GetBlueprintsResponse
  (:init
   (&key
    ((:blueprints __blueprints) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _blueprints __blueprints)
   self)
  (:blueprints
   (&optional __blueprints)
   (if __blueprints (setq _blueprints __blueprints)) _blueprints)
  (:serialization-length
   ()
   (+
    ;; string[] _blueprints
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _blueprints)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _blueprints
     (write-long (length _blueprints) s)
     (dolist (elem _blueprints)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _blueprints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _blueprints (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _blueprints i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass carla_msgs::GetBlueprints
  :super ros::object
  :slots ())

(setf (get carla_msgs::GetBlueprints :md5sum-) "8c8fca221e4d3a2dbeec92f6b3d2eda4")
(setf (get carla_msgs::GetBlueprints :datatype-) "carla_msgs/GetBlueprints")
(setf (get carla_msgs::GetBlueprints :request) carla_msgs::GetBlueprintsRequest)
(setf (get carla_msgs::GetBlueprints :response) carla_msgs::GetBlueprintsResponse)

(defmethod carla_msgs::GetBlueprintsRequest
  (:response () (instance carla_msgs::GetBlueprintsResponse :init)))

(setf (get carla_msgs::GetBlueprintsRequest :md5sum-) "8c8fca221e4d3a2dbeec92f6b3d2eda4")
(setf (get carla_msgs::GetBlueprintsRequest :datatype-) "carla_msgs/GetBlueprintsRequest")
(setf (get carla_msgs::GetBlueprintsRequest :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
string filter
---
string[] blueprints

")

(setf (get carla_msgs::GetBlueprintsResponse :md5sum-) "8c8fca221e4d3a2dbeec92f6b3d2eda4")
(setf (get carla_msgs::GetBlueprintsResponse :datatype-) "carla_msgs/GetBlueprintsResponse")
(setf (get carla_msgs::GetBlueprintsResponse :definition-)
      "#
# Copyright (c) 2020 Intel Corporation.
#
# This work is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.
#
string filter
---
string[] blueprints

")



(provide :carla_msgs/GetBlueprints "8c8fca221e4d3a2dbeec92f6b3d2eda4")


