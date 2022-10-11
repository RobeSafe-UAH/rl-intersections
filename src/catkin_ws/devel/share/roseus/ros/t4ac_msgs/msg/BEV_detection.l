;; Auto-generated. Do not edit!


(when (boundp 't4ac_msgs::BEV_detection)
  (if (not (find-package "T4AC_MSGS"))
    (make-package "T4AC_MSGS"))
  (shadow 'BEV_detection (find-package "T4AC_MSGS")))
(unless (find-package "T4AC_MSGS::BEV_DETECTION")
  (make-package "T4AC_MSGS::BEV_DETECTION"))

(in-package "ROS")
;;//! \htmlinclude BEV_detection.msg.html


(defclass t4ac_msgs::BEV_detection
  :super ros::object
  :slots (_type _score _object_id _x _y _vel_lin _vel_ang _tl_br _x_corners _y_corners _l _w _o _safety_zone ))

(defmethod t4ac_msgs::BEV_detection
  (:init
   (&key
    ((:type __type) "")
    ((:score __score) 0.0)
    ((:object_id __object_id) 0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:vel_lin __vel_lin) 0.0)
    ((:vel_ang __vel_ang) 0.0)
    ((:tl_br __tl_br) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:x_corners __x_corners) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:y_corners __y_corners) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:l __l) 0.0)
    ((:w __w) 0.0)
    ((:o __o) 0.0)
    ((:safety_zone __safety_zone) nil)
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _score (float __score))
   (setq _object_id (round __object_id))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _vel_lin (float __vel_lin))
   (setq _vel_ang (float __vel_ang))
   (setq _tl_br __tl_br)
   (setq _x_corners __x_corners)
   (setq _y_corners __y_corners)
   (setq _l (float __l))
   (setq _w (float __w))
   (setq _o (float __o))
   (setq _safety_zone __safety_zone)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:score
   (&optional __score)
   (if __score (setq _score __score)) _score)
  (:object_id
   (&optional __object_id)
   (if __object_id (setq _object_id __object_id)) _object_id)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:vel_lin
   (&optional __vel_lin)
   (if __vel_lin (setq _vel_lin __vel_lin)) _vel_lin)
  (:vel_ang
   (&optional __vel_ang)
   (if __vel_ang (setq _vel_ang __vel_ang)) _vel_ang)
  (:tl_br
   (&optional __tl_br)
   (if __tl_br (setq _tl_br __tl_br)) _tl_br)
  (:x_corners
   (&optional __x_corners)
   (if __x_corners (setq _x_corners __x_corners)) _x_corners)
  (:y_corners
   (&optional __y_corners)
   (if __y_corners (setq _y_corners __y_corners)) _y_corners)
  (:l
   (&optional __l)
   (if __l (setq _l __l)) _l)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:o
   (&optional __o)
   (if __o (setq _o __o)) _o)
  (:safety_zone
   (&optional (__safety_zone :null))
   (if (not (eq __safety_zone :null)) (setq _safety_zone __safety_zone)) _safety_zone)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; float64 _score
    8
    ;; uint16 _object_id
    2
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _vel_lin
    8
    ;; float64 _vel_ang
    8
    ;; float64[] _tl_br
    (* 8    (length _tl_br)) 4
    ;; float64[] _x_corners
    (* 8    (length _x_corners)) 4
    ;; float64[] _y_corners
    (* 8    (length _y_corners)) 4
    ;; float64 _l
    8
    ;; float64 _w
    8
    ;; float64 _o
    8
    ;; bool _safety_zone
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; float64 _score
       (sys::poke _score (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16 _object_id
       (write-word _object_id s)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vel_lin
       (sys::poke _vel_lin (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vel_ang
       (sys::poke _vel_ang (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[] _tl_br
     (write-long (length _tl_br) s)
     (dotimes (i (length _tl_br))
       (sys::poke (elt _tl_br i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _x_corners
     (write-long (length _x_corners) s)
     (dotimes (i (length _x_corners))
       (sys::poke (elt _x_corners i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _y_corners
     (write-long (length _y_corners) s)
     (dotimes (i (length _y_corners))
       (sys::poke (elt _y_corners i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _l
       (sys::poke _l (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _w
       (sys::poke _w (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _o
       (sys::poke _o (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _safety_zone
       (if _safety_zone (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float64 _score
     (setq _score (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16 _object_id
     (setq _object_id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vel_lin
     (setq _vel_lin (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vel_ang
     (setq _vel_ang (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[] _tl_br
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tl_br (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tl_br i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _x_corners
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _x_corners (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _x_corners i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _y_corners
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _y_corners (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _y_corners i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _l
     (setq _l (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _w
     (setq _w (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _o
     (setq _o (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _safety_zone
     (setq _safety_zone (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get t4ac_msgs::BEV_detection :md5sum-) "6e7e32ae5122e513b61afaaf47d1cdc1")
(setf (get t4ac_msgs::BEV_detection :datatype-) "t4ac_msgs/BEV_detection")
(setf (get t4ac_msgs::BEV_detection :definition-)
      "# Techs4AgeCar project

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



(provide :t4ac_msgs/BEV_detection "6e7e32ae5122e513b61afaaf47d1cdc1")


