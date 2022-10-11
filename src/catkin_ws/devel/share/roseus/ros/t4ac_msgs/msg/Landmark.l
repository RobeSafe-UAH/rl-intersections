;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Landmark)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Landmark (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::LANDMARK")
  (make-package "T4AC_MSGS::LANDMARK"))

(in-package "ROS")
;;//! \htmlinclude Landmark.msg.html


(defclass t4ac_msgs::Landmark
  :super ros::object
  :slots (_location _distance _affecting_road ))

(defmethod t4ac_msgs::Landmark
  (:init
   (&key
    ((:location __location) (instance t4ac_msgs::Node :init))
    ((:distance __distance) 0.0)
    ((:affecting_road __affecting_road) "")
    )
   (send-super :init)
   (setq _location __location)
   (setq _distance (float __distance))
   (setq _affecting_road (string __affecting_road))
   self)
  (:location
   (&rest __location)
   (if (keywordp (car __location))
       (send* _location __location)
     (progn
       (if __location (setq _location (car __location)))
       _location)))
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:affecting_road
   (&optional __affecting_road)
   (if __affecting_road (setq _affecting_road __affecting_road)) _affecting_road)
  (:serialization-length
   ()
   (+
    ;; t4ac_msgs/Node _location
    (send _location :serialization-length)
    ;; float64 _distance
    8
    ;; string _affecting_road
    4 (length _affecting_road)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; t4ac_msgs/Node _location
       (send _location :serialize s)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string _affecting_road
       (write-long (length _affecting_road) s) (princ _affecting_road s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; t4ac_msgs/Node _location
     (send _location :deserialize buf ptr-) (incf ptr- (send _location :serialization-length))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string _affecting_road
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _affecting_road (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get t4ac_msgs::Landmark :md5sum-) "0379807a041d75b407e703bdf19b973a")
(setf (get t4ac_msgs::Landmark :datatype-) "t4ac_msgs/Landmark")
(setf (get t4ac_msgs::Landmark :definition-)
      "### Landmark definition ###

Node location
float64 distance
string affecting_road

================================================================================
MSG: t4ac_msgs/Node
## Node definition 

float64 x	# X
float64 y	# Y
float64 z	# Z

")



(provide :t4ac_msgs/Landmark "0379807a041d75b407e703bdf19b973a")


