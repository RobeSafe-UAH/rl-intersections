;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::BEV_detections_list)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'BEV_detections_list (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::BEV_DETECTIONS_LIST")
  (make-package "T4AC_MSGS::BEV_DETECTIONS_LIST"))

(in-package "ROS")
;;//! \htmlinclude BEV_detections_list.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass t4ac_msgs::BEV_detections_list
  :super ros::object
  :slots (_header _front _back _left _right _bev_detections_list ))

(defmethod t4ac_msgs::BEV_detections_list
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:front __front) 0.0)
    ((:back __back) 0.0)
    ((:left __left) 0.0)
    ((:right __right) 0.0)
    ((:bev_detections_list __bev_detections_list) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _front (float __front))
   (setq _back (float __back))
   (setq _left (float __left))
   (setq _right (float __right))
   (setq _bev_detections_list __bev_detections_list)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:front
   (&optional __front)
   (if __front (setq _front __front)) _front)
  (:back
   (&optional __back)
   (if __back (setq _back __back)) _back)
  (:left
   (&optional __left)
   (if __left (setq _left __left)) _left)
  (:right
   (&optional __right)
   (if __right (setq _right __right)) _right)
  (:bev_detections_list
   (&rest __bev_detections_list)
   (if (keywordp (car __bev_detections_list))
       (send* _bev_detections_list __bev_detections_list)
     (progn
       (if __bev_detections_list (setq _bev_detections_list (car __bev_detections_list)))
       _bev_detections_list)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _front
    8
    ;; float64 _back
    8
    ;; float64 _left
    8
    ;; float64 _right
    8
    ;; t4ac_msgs/BEV_detection[] _bev_detections_list
    (apply #'+ (send-all _bev_detections_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _front
       (sys::poke _front (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _back
       (sys::poke _back (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _left
       (sys::poke _left (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _right
       (sys::poke _right (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; t4ac_msgs/BEV_detection[] _bev_detections_list
     (write-long (length _bev_detections_list) s)
     (dolist (elem _bev_detections_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _front
     (setq _front (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _back
     (setq _back (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _left
     (setq _left (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _right
     (setq _right (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; t4ac_msgs/BEV_detection[] _bev_detections_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bev_detections_list (let (r) (dotimes (i n) (push (instance t4ac_msgs::BEV_detection :init) r)) r))
     (dolist (elem- _bev_detections_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get t4ac_msgs::BEV_detections_list :md5sum-) "759bec6ecb814309c94289f28049e196")
(setf (get t4ac_msgs::BEV_detections_list :datatype-) "t4ac_msgs/BEV_detections_list")
(setf (get t4ac_msgs::BEV_detections_list :definition-)
      "# Techs4AgeCar project

Header header                       # Frame and timestamp information

float64 front                       # BEV grid size (front, back, left, right in meters)
float64 back
float64 left
float64 right

BEV_detection[] bev_detections_list # List of bev_obstacles

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: t4ac_msgs/BEV_detection
# Techs4AgeCar project

string type         # Object type
float64 score       # Object probability (0 to 1)
uint16 object_id    # Object ID 

float64   x         # BEV x centroid
float64   y         # BEV y centroid 
float64   vel_lin   # (Only Groundtruth) Linear velocity (Module of vx and vy)
float64   vel_ang   # (Only Groundtruth) Angular velocity (Z-axis)
float64[] tl_br     # 2D bbox top-left, bottom-right xy coordinates
float64[] x_corners # 3D bbox x coordinates of the corners
float64[] y_corners # 3D bbox y coordinates of the corners
float64   l         # BEV length of the object
float64   w         # BEV width of the object
float64   o         # Object orientation

bool safety_zone    # If true, the detection is very near the vehicle 
                    # Evaluate the predicted collision with this detection



")



(provide :t4ac_msgs/BEV_detections_list "759bec6ecb814309c94289f28049e196")


