; Auto-generated. Do not edit!


(cl:in-package t4ac_msgs-msg)


;//! \htmlinclude Waypoint.msg.html

(cl:defclass <Waypoint> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (transform
    :reader transform
    :initarg :transform
    :type t4ac_msgs-msg:Transform
    :initform (cl:make-instance 't4ac_msgs-msg:Transform))
   (road_id
    :reader road_id
    :initarg :road_id
    :type cl:integer
    :initform 0)
   (lane_id
    :reader lane_id
    :initarg :lane_id
    :type cl:integer
    :initform 0)
   (junction
    :reader junction
    :initarg :junction
    :type cl:integer
    :initform 0)
   (s
    :reader s
    :initarg :s
    :type cl:float
    :initform 0.0)
   (lane_width
    :reader lane_width
    :initarg :lane_width
    :type cl:float
    :initform 0.0)
   (lane_change
    :reader lane_change
    :initarg :lane_change
    :type cl:string
    :initform "")
   (lane_type
    :reader lane_type
    :initarg :lane_type
    :type cl:string
    :initform "")
   (right_lane_marking
    :reader right_lane_marking
    :initarg :right_lane_marking
    :type cl:string
    :initform "")
   (left_lane_marking
    :reader left_lane_marking
    :initarg :left_lane_marking
    :type cl:string
    :initform "")
   (vmax
    :reader vmax
    :initarg :vmax
    :type cl:integer
    :initform 0)
   (vunit
    :reader vunit
    :initarg :vunit
    :type cl:string
    :initform "")
   (nLanes
    :reader nLanes
    :initarg :nLanes
    :type cl:integer
    :initform 0)
   (lanePosition
    :reader lanePosition
    :initarg :lanePosition
    :type cl:integer
    :initform 0))
)

(cl:defclass Waypoint (<Waypoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Waypoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Waypoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name t4ac_msgs-msg:<Waypoint> is deprecated: use t4ac_msgs-msg:Waypoint instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:header-val is deprecated.  Use t4ac_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:id-val is deprecated.  Use t4ac_msgs-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'transform-val :lambda-list '(m))
(cl:defmethod transform-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:transform-val is deprecated.  Use t4ac_msgs-msg:transform instead.")
  (transform m))

(cl:ensure-generic-function 'road_id-val :lambda-list '(m))
(cl:defmethod road_id-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:road_id-val is deprecated.  Use t4ac_msgs-msg:road_id instead.")
  (road_id m))

(cl:ensure-generic-function 'lane_id-val :lambda-list '(m))
(cl:defmethod lane_id-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:lane_id-val is deprecated.  Use t4ac_msgs-msg:lane_id instead.")
  (lane_id m))

(cl:ensure-generic-function 'junction-val :lambda-list '(m))
(cl:defmethod junction-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:junction-val is deprecated.  Use t4ac_msgs-msg:junction instead.")
  (junction m))

(cl:ensure-generic-function 's-val :lambda-list '(m))
(cl:defmethod s-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:s-val is deprecated.  Use t4ac_msgs-msg:s instead.")
  (s m))

(cl:ensure-generic-function 'lane_width-val :lambda-list '(m))
(cl:defmethod lane_width-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:lane_width-val is deprecated.  Use t4ac_msgs-msg:lane_width instead.")
  (lane_width m))

(cl:ensure-generic-function 'lane_change-val :lambda-list '(m))
(cl:defmethod lane_change-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:lane_change-val is deprecated.  Use t4ac_msgs-msg:lane_change instead.")
  (lane_change m))

(cl:ensure-generic-function 'lane_type-val :lambda-list '(m))
(cl:defmethod lane_type-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:lane_type-val is deprecated.  Use t4ac_msgs-msg:lane_type instead.")
  (lane_type m))

(cl:ensure-generic-function 'right_lane_marking-val :lambda-list '(m))
(cl:defmethod right_lane_marking-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:right_lane_marking-val is deprecated.  Use t4ac_msgs-msg:right_lane_marking instead.")
  (right_lane_marking m))

(cl:ensure-generic-function 'left_lane_marking-val :lambda-list '(m))
(cl:defmethod left_lane_marking-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:left_lane_marking-val is deprecated.  Use t4ac_msgs-msg:left_lane_marking instead.")
  (left_lane_marking m))

(cl:ensure-generic-function 'vmax-val :lambda-list '(m))
(cl:defmethod vmax-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:vmax-val is deprecated.  Use t4ac_msgs-msg:vmax instead.")
  (vmax m))

(cl:ensure-generic-function 'vunit-val :lambda-list '(m))
(cl:defmethod vunit-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:vunit-val is deprecated.  Use t4ac_msgs-msg:vunit instead.")
  (vunit m))

(cl:ensure-generic-function 'nLanes-val :lambda-list '(m))
(cl:defmethod nLanes-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:nLanes-val is deprecated.  Use t4ac_msgs-msg:nLanes instead.")
  (nLanes m))

(cl:ensure-generic-function 'lanePosition-val :lambda-list '(m))
(cl:defmethod lanePosition-val ((m <Waypoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader t4ac_msgs-msg:lanePosition-val is deprecated.  Use t4ac_msgs-msg:lanePosition instead.")
  (lanePosition m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Waypoint>) ostream)
  "Serializes a message object of type '<Waypoint>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'transform) ostream)
  (cl:let* ((signed (cl:slot-value msg 'road_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lane_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'junction)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 's))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'lane_width))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'lane_change))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'lane_change))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'lane_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'lane_type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'right_lane_marking))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'right_lane_marking))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'left_lane_marking))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'left_lane_marking))
  (cl:let* ((signed (cl:slot-value msg 'vmax)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'vunit))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'vunit))
  (cl:let* ((signed (cl:slot-value msg 'nLanes)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'lanePosition)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Waypoint>) istream)
  "Deserializes a message object of type '<Waypoint>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'transform) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'road_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lane_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'junction) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 's) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'lane_width) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lane_change) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'lane_change) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lane_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'lane_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'right_lane_marking) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'right_lane_marking) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'left_lane_marking) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'left_lane_marking) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vmax) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'vunit) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'vunit) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nLanes) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'lanePosition) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Waypoint>)))
  "Returns string type for a message object of type '<Waypoint>"
  "t4ac_msgs/Waypoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Waypoint)))
  "Returns string type for a message object of type 'Waypoint"
  "t4ac_msgs/Waypoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Waypoint>)))
  "Returns md5sum for a message object of type '<Waypoint>"
  "0077c4b075dc1aed9256fe7f551799fe")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Waypoint)))
  "Returns md5sum for a message object of type 'Waypoint"
  "0077c4b075dc1aed9256fe7f551799fe")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Waypoint>)))
  "Returns full string definition for message of type '<Waypoint>"
  (cl:format cl:nil "# T4ac Project ~%~%Header header~%int32 id~%Transform transform~%int32 road_id~%int32 lane_id~%int32 junction~%float64 s~%float64 lane_width~%string lane_change~%string lane_type~%string right_lane_marking~%string left_lane_marking~%int32 vmax~%string vunit~%int32 nLanes~%int32 lanePosition~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Transform~%# T4ac Project~%~%Location location~%Rotation rotation~%================================================================================~%MSG: t4ac_msgs/Location~%# T4ac Project ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: t4ac_msgs/Rotation~%# T4ac Project ~%~%float64 pitch~%float64 yaw~%float64 roll~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Waypoint)))
  "Returns full string definition for message of type 'Waypoint"
  (cl:format cl:nil "# T4ac Project ~%~%Header header~%int32 id~%Transform transform~%int32 road_id~%int32 lane_id~%int32 junction~%float64 s~%float64 lane_width~%string lane_change~%string lane_type~%string right_lane_marking~%string left_lane_marking~%int32 vmax~%string vunit~%int32 nLanes~%int32 lanePosition~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: t4ac_msgs/Transform~%# T4ac Project~%~%Location location~%Rotation rotation~%================================================================================~%MSG: t4ac_msgs/Location~%# T4ac Project ~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: t4ac_msgs/Rotation~%# T4ac Project ~%~%float64 pitch~%float64 yaw~%float64 roll~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Waypoint>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'transform))
     4
     4
     4
     8
     8
     4 (cl:length (cl:slot-value msg 'lane_change))
     4 (cl:length (cl:slot-value msg 'lane_type))
     4 (cl:length (cl:slot-value msg 'right_lane_marking))
     4 (cl:length (cl:slot-value msg 'left_lane_marking))
     4
     4 (cl:length (cl:slot-value msg 'vunit))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Waypoint>))
  "Converts a ROS message object to a list"
  (cl:list 'Waypoint
    (cl:cons ':header (header msg))
    (cl:cons ':id (id msg))
    (cl:cons ':transform (transform msg))
    (cl:cons ':road_id (road_id msg))
    (cl:cons ':lane_id (lane_id msg))
    (cl:cons ':junction (junction msg))
    (cl:cons ':s (s msg))
    (cl:cons ':lane_width (lane_width msg))
    (cl:cons ':lane_change (lane_change msg))
    (cl:cons ':lane_type (lane_type msg))
    (cl:cons ':right_lane_marking (right_lane_marking msg))
    (cl:cons ':left_lane_marking (left_lane_marking msg))
    (cl:cons ':vmax (vmax msg))
    (cl:cons ':vunit (vunit msg))
    (cl:cons ':nLanes (nLanes msg))
    (cl:cons ':lanePosition (lanePosition msg))
))
