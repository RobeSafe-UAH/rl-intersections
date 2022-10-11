;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Bounding_Box_2D)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Bounding_Box_2D (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::BOUNDING_BOX_2D")
  (make-package "T4AC_MSGS::BOUNDING_BOX_2D"))

(in-package "ROS")
;;//! \htmlinclude Bounding_Box_2D.msg.html


(defclass t4ac_msgs::Bounding_Box_2D
  :super ros::object
  :slots (_type _score _x1 _y1 _x2 _y2 ))

(defmethod t4ac_msgs::Bounding_Box_2D
  (:init
   (&key
    ((:type __type) "")
    ((:score __score) 0.0)
    ((:x1 __x1) 0.0)
    ((:y1 __y1) 0.0)
    ((:x2 __x2) 0.0)
    ((:y2 __y2) 0.0)
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _score (float __score))
   (setq _x1 (float __x1))
   (setq _y1 (float __y1))
   (setq _x2 (float __x2))
   (setq _y2 (float __y2))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
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
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; float64 _score
    8
    ;; float64 _x1
    8
    ;; float64 _y1
    8
    ;; float64 _x2
    8
    ;; float64 _y2
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
     ;; float64 _x1
       (sys::poke _x1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y1
       (sys::poke _y1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x2
       (sys::poke _x2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y2
       (sys::poke _y2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _score
     (setq _score (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x1
     (setq _x1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y1
     (setq _y1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x2
     (setq _x2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y2
     (setq _y2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get t4ac_msgs::Bounding_Box_2D :md5sum-) "d80b647e84e8d1257c9c2da6fc9509a4")
(setf (get t4ac_msgs::Bounding_Box_2D :datatype-) "t4ac_msgs/Bounding_Box_2D")
(setf (get t4ac_msgs::Bounding_Box_2D :definition-)
      "# Techs4AgeCar project

string type         # Object type
float64 score       # Object probability (0 to 1)

float64   x1        # Top-left x coordinate
float64   y1        # Top-left y coordinate 
float64   x2        # Bottom-right x coordinate
float64   y2        # Bottom-right y coordinate 
")



(provide :t4ac_msgs/Bounding_Box_2D "d80b647e84e8d1257c9c2da6fc9509a4")


