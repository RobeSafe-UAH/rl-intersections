;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::BEV_tracker)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'BEV_tracker (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::BEV_TRACKER")
  (make-package "T4AC_MSGS::BEV_TRACKER"))

(in-package "ROS")
;;//! \htmlinclude BEV_tracker.msg.html


(defclass t4ac_msgs::BEV_tracker
  :super ros::object
  :slots (_type _object_id _x _y _w _l _o ))

(defmethod t4ac_msgs::BEV_tracker
  (:init
   (&key
    ((:type __type) "")
    ((:object_id __object_id) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:w __w) 0.0)
    ((:l __l) 0.0)
    ((:o __o) 0.0)
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _object_id (round __object_id))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _w (float __w))
   (setq _l (float __l))
   (setq _o (float __o))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:object_id
   (&optional __object_id)
   (if __object_id (setq _object_id __object_id)) _object_id)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:l
   (&optional __l)
   (if __l (setq _l __l)) _l)
  (:o
   (&optional __o)
   (if __o (setq _o __o)) _o)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; uint16 _object_id
    2
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _w
    8
    ;; float64 _l
    8
    ;; float64 _o
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; uint16 _object_id
       (write-word _object_id s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _w
       (sys::poke _w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _l
       (sys::poke _l (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _o
       (sys::poke _o (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _object_id
     (setq _object_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _w
     (setq _w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _l
     (setq _l (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _o
     (setq _o (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get t4ac_msgs::BEV_tracker :md5sum-) "c5b962defcda9cb823d2edafcdf55aca")
(setf (get t4ac_msgs::BEV_tracker :datatype-) "t4ac_msgs/BEV_tracker")
(setf (get t4ac_msgs::BEV_tracker :definition-)
      "# Techs4AgeCar project

string type      # Object type
uint16 object_id # Object ID

float64   x      # BEV x centroid
float64   y      # BEV y centroid 
float64   w      # BEV width of the object
float64   l      # BEV length of the object
float64   o      # Object orientation



")



(provide :t4ac_msgs/BEV_tracker "c5b962defcda9cb823d2edafcdf55aca")


