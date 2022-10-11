;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::RegulatoryElement)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'RegulatoryElement (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::REGULATORYELEMENT")
  (make-package "T4AC_MSGS::REGULATORYELEMENT"))

(in-package "ROS")
;;//! \htmlinclude RegulatoryElement.msg.html


(defclass t4ac_msgs::RegulatoryElement
  :super ros::object
  :slots (_type _id _location _distance _affecting_roads _landmarks ))

(defmethod t4ac_msgs::RegulatoryElement
  (:init
   (&key
    ((:type __type) "")
    ((:id __id) "")
    ((:location __location) (instance t4ac_msgs::Node :init))
    ((:distance __distance) 0.0)
    ((:affecting_roads __affecting_roads) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:landmarks __landmarks) ())
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _id (string __id))
   (setq _location __location)
   (setq _distance (float __distance))
   (setq _affecting_roads __affecting_roads)
   (setq _landmarks __landmarks)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
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
  (:affecting_roads
   (&optional __affecting_roads)
   (if __affecting_roads (setq _affecting_roads __affecting_roads)) _affecting_roads)
  (:landmarks
   (&rest __landmarks)
   (if (keywordp (car __landmarks))
       (send* _landmarks __landmarks)
     (progn
       (if __landmarks (setq _landmarks (car __landmarks)))
       _landmarks)))
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; string _id
    4 (length _id)
    ;; t4ac_msgs/Node _location
    (send _location :serialization-length)
    ;; float64 _distance
    8
    ;; string[] _affecting_roads
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _affecting_roads)) 4
    ;; t4ac_msgs/Landmark[] _landmarks
    (apply #'+ (send-all _landmarks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; t4ac_msgs/Node _location
       (send _location :serialize s)
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; string[] _affecting_roads
     (write-long (length _affecting_roads) s)
     (dolist (elem _affecting_roads)
       (write-long (length elem) s) (princ elem s)
       )
     ;; t4ac_msgs/Landmark[] _landmarks
     (write-long (length _landmarks) s)
     (dolist (elem _landmarks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; t4ac_msgs/Node _location
     (send _location :deserialize buf ptr-) (incf ptr- (send _location :serialization-length))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; string[] _affecting_roads
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _affecting_roads (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _affecting_roads i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; t4ac_msgs/Landmark[] _landmarks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _landmarks (let (r) (dotimes (i n) (push (instance t4ac_msgs::Landmark :init) r)) r))
     (dolist (elem- _landmarks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::RegulatoryElement :md5sum-) "4683a17004de77e66d22587d1460f95a")
(setf (get t4ac_msgs::RegulatoryElement :datatype-) "t4ac_msgs/RegulatoryElement")
(setf (get t4ac_msgs::RegulatoryElement :definition-)
      "### Regulatory Element definition ###

string type
string id
Node location
float64 distance
string[] affecting_roads
Landmark[] landmarks
================================================================================
MSG: t4ac_msgs/Node
## Node definition 

float64 x	# X
float64 y	# Y
float64 z	# Z

================================================================================
MSG: t4ac_msgs/Landmark
### Landmark definition ###

Node location
float64 distance
string affecting_road

")



(provide :t4ac_msgs/RegulatoryElement "4683a17004de77e66d22587d1460f95a")


