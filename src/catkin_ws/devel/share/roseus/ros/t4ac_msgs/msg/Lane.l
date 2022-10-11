;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::Lane)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'Lane (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::LANE")
  (make-package "T4AC_MSGS::LANE"))

(in-package "ROS")
;;//! \htmlinclude Lane.msg.html


(defclass t4ac_msgs::Lane
  :super ros::object
  :slots (_left _right _role ))

(defmethod t4ac_msgs::Lane
  (:init
   (&key
    ((:left __left) (instance t4ac_msgs::Way :init))
    ((:right __right) (instance t4ac_msgs::Way :init))
    ((:role __role) "")
    )
   (send-super :init)
   (setq _left __left)
   (setq _right __right)
   (setq _role (string __role))
   self)
  (:left
   (&rest __left)
   (if (keywordp (car __left))
       (send* _left __left)
     (progn
       (if __left (setq _left (car __left)))
       _left)))
  (:right
   (&rest __right)
   (if (keywordp (car __right))
       (send* _right __right)
     (progn
       (if __right (setq _right (car __right)))
       _right)))
  (:role
   (&optional __role)
   (if __role (setq _role __role)) _role)
  (:serialization-length
   ()
   (+
    ;; t4ac_msgs/Way _left
    (send _left :serialization-length)
    ;; t4ac_msgs/Way _right
    (send _right :serialization-length)
    ;; string _role
    4 (length _role)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; t4ac_msgs/Way _left
       (send _left :serialize s)
     ;; t4ac_msgs/Way _right
       (send _right :serialize s)
     ;; string _role
       (write-long (length _role) s) (princ _role s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; t4ac_msgs/Way _left
     (send _left :deserialize buf ptr-) (incf ptr- (send _left :serialization-length))
   ;; t4ac_msgs/Way _right
     (send _right :deserialize buf ptr-) (incf ptr- (send _right :serialization-length))
   ;; string _role
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _role (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get t4ac_msgs::Lane :md5sum-) "392f655a22f5ea3284af2c1a7aca7f99")
(setf (get t4ac_msgs::Lane :datatype-) "t4ac_msgs/Lane")
(setf (get t4ac_msgs::Lane :definition-)
      "## Lane definition (from the Carla library) in ROS message format
#
# Lanes are mapped using PythonAPI from Carla.
# They are made up from one \"Way\" that determine its left and right bounds

#uint8 speedlimit	# mapped max speed in km/h
Way left		# mapped left boundary
Way right		# mapped right boundary 
string role     	# Role: current, backside, left, right

#--OPTIONAL--
#int32 lane_id 		# lane id from xodr
#bool is_junction	# true if is on a junction 
#float lane_width	# horizontal size of the road

#string type		# mapped type of lanelet

================================================================================
MSG: t4ac_msgs/Way
# Way definition 

Node[] way	# list of nodes


================================================================================
MSG: t4ac_msgs/Node
## Node definition 

float64 x	# X
float64 y	# Y
float64 z	# Z

")



(provide :t4ac_msgs/Lane "392f655a22f5ea3284af2c1a7aca7f99")


