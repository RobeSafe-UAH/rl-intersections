// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BEV_detection = require('./BEV_detection.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BEV_detections_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.front = null;
      this.back = null;
      this.left = null;
      this.right = null;
      this.bev_detections_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('front')) {
        this.front = initObj.front
      }
      else {
        this.front = 0.0;
      }
      if (initObj.hasOwnProperty('back')) {
        this.back = initObj.back
      }
      else {
        this.back = 0.0;
      }
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = 0.0;
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = 0.0;
      }
      if (initObj.hasOwnProperty('bev_detections_list')) {
        this.bev_detections_list = initObj.bev_detections_list
      }
      else {
        this.bev_detections_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BEV_detections_list
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [front]
    bufferOffset = _serializer.float64(obj.front, buffer, bufferOffset);
    // Serialize message field [back]
    bufferOffset = _serializer.float64(obj.back, buffer, bufferOffset);
    // Serialize message field [left]
    bufferOffset = _serializer.float64(obj.left, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = _serializer.float64(obj.right, buffer, bufferOffset);
    // Serialize message field [bev_detections_list]
    // Serialize the length for message field [bev_detections_list]
    bufferOffset = _serializer.uint32(obj.bev_detections_list.length, buffer, bufferOffset);
    obj.bev_detections_list.forEach((val) => {
      bufferOffset = BEV_detection.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BEV_detections_list
    let len;
    let data = new BEV_detections_list(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [front]
    data.front = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [back]
    data.back = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [left]
    data.left = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [bev_detections_list]
    // Deserialize array length for message field [bev_detections_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bev_detections_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bev_detections_list[i] = BEV_detection.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.bev_detections_list.forEach((val) => {
      length += BEV_detection.getMessageSize(val);
    });
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/BEV_detections_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '759bec6ecb814309c94289f28049e196';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
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
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BEV_detections_list(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.front !== undefined) {
      resolved.front = msg.front;
    }
    else {
      resolved.front = 0.0
    }

    if (msg.back !== undefined) {
      resolved.back = msg.back;
    }
    else {
      resolved.back = 0.0
    }

    if (msg.left !== undefined) {
      resolved.left = msg.left;
    }
    else {
      resolved.left = 0.0
    }

    if (msg.right !== undefined) {
      resolved.right = msg.right;
    }
    else {
      resolved.right = 0.0
    }

    if (msg.bev_detections_list !== undefined) {
      resolved.bev_detections_list = new Array(msg.bev_detections_list.length);
      for (let i = 0; i < resolved.bev_detections_list.length; ++i) {
        resolved.bev_detections_list[i] = BEV_detection.Resolve(msg.bev_detections_list[i]);
      }
    }
    else {
      resolved.bev_detections_list = []
    }

    return resolved;
    }
};

module.exports = BEV_detections_list;
