;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::MonitorizedRegElem)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'MonitorizedRegElem (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::MONITORIZEDREGELEM")
  (make-package "T4AC_MSGS::MONITORIZEDREGELEM"))

(in-package "ROS")
;;//! \htmlinclude MonitorizedRegElem.msg.html


(defclass t4ac_msgs::MonitorizedRegElem
  :super ros::object
  :slots (_reg_elems ))

(defmethod t4ac_msgs::MonitorizedRegElem
  (:init
   (&key
    ((:reg_elems __reg_elems) ())
    )
   (send-super :init)
   (setq _reg_elems __reg_elems)
   self)
  (:reg_elems
   (&rest __reg_elems)
   (if (keywordp (car __reg_elems))
       (send* _reg_elems __reg_elems)
     (progn
       (if __reg_elems (setq _reg_elems (car __reg_elems)))
       _reg_elems)))
  (:serialization-length
   ()
   (+
    ;; t4ac_msgs/RegulatoryElement[] _reg_elems
    (apply #'+ (send-all _reg_elems :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; t4ac_msgs/RegulatoryElement[] _reg_elems
     (write-long (length _reg_elems) s)
     (dolist (elem _reg_elems)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; t4ac_msgs/RegulatoryElement[] _reg_elems
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _reg_elems (let (r) (dotimes (i n) (push (instance t4ac_msgs::RegulatoryElement :init) r)) r))
     (dolist (elem- _reg_elems)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::MonitorizedRegElem :md5sum-) "2d4b678817b5a00f2a9678518f83388b")
(setf (get t4ac_msgs::MonitorizedRegElem :datatype-) "t4ac_msgs/MonitorizedRegElem")
(setf (get t4ac_msgs::MonitorizedRegElem :definition-)
      "### Monitorized Regulatory Elements definition ###

RegulatoryElement[] reg_elems
================================================================================
MSG: t4ac_msgs/RegulatoryElement
### Regulatory Element definition ###

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



(provide :t4ac_msgs/MonitorizedRegElem "2d4b678817b5a00f2a9678518f83388b")


