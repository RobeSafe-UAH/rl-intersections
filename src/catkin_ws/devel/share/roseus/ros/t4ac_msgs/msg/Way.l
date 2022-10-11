;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Way)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Way (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::WAY")
  (make-package "T4AC_MSGS::WAY"))

(in-package "ROS")
;;//! \htmlinclude Way.msg.html


(defclass t4ac_msgs::Way
  :super ros::object
  :slots (_way ))

(defmethod t4ac_msgs::Way
  (:init
   (&key
    ((:way __way) ())
    )
   (send-super :init)
   (setq _way __way)
   self)
  (:way
   (&rest __way)
   (if (keywordp (car __way))
       (send* _way __way)
     (progn
       (if __way (setq _way (car __way)))
       _way)))
  (:serialization-length
   ()
   (+
    ;; t4ac_msgs/Node[] _way
    (apply #'+ (send-all _way :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; t4ac_msgs/Node[] _way
     (write-long (length _way) s)
     (dolist (elem _way)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; t4ac_msgs/Node[] _way
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _way (let (r) (dotimes (i n) (push (instance t4ac_msgs::Node :init) r)) r))
     (dolist (elem- _way)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::Way :md5sum-) "633945be8abb5aeffbfc923f66470e22")
(setf (get t4ac_msgs::Way :datatype-) "t4ac_msgs/Way")
(setf (get t4ac_msgs::Way :definition-)
      "# Way definition 

Node[] way	# list of nodes


================================================================================
MSG: t4ac_msgs/Node
## Node definition 

float64 x	# X
float64 y	# Y
float64 z	# Z

")



(provide :t4ac_msgs/Way "633945be8abb5aeffbfc923f66470e22")


