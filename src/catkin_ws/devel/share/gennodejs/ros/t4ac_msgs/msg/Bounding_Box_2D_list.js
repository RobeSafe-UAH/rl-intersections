// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Bounding_Box_2D = require('./Bounding_Box_2D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Bounding_Box_2D_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.bounding_box_2D_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('bounding_box_2D_list')) {
        this.bounding_box_2D_list = initObj.bounding_box_2D_list
      }
      else {
        this.bounding_box_2D_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Bounding_Box_2D_list
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [bounding_box_2D_list]
    // Serialize the length for message field [bounding_box_2D_list]
    bufferOffset = _serializer.uint32(obj.bounding_box_2D_list.length, buffer, bufferOffset);
    obj.bounding_box_2D_list.forEach((val) => {
      bufferOffset = Bounding_Box_2D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Bounding_Box_2D_list
    let len;
    let data = new Bounding_Box_2D_list(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [bounding_box_2D_list]
    // Deserialize array length for message field [bounding_box_2D_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bounding_box_2D_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bounding_box_2D_list[i] = Bounding_Box_2D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.bounding_box_2D_list.forEach((val) => {
      length += Bounding_Box_2D.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Bounding_Box_2D_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1ba56b4d1710c06cbc5c52ee8160ea10';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    Header header                          # Frame and timestamp information
    
    Bounding_Box_2D[] bounding_box_2D_list # List of bev_obstacles
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
    MSG: t4ac_msgs/Bounding_Box_2D
    # Techs4AgeCar project
    
    string type         # Object type
    float64 score       # Object probability (0 to 1)
    
    float64   x1        # Top-left x coordinate
    float64   y1        # Top-left y coordinate 
    float64   x2        # Bottom-right x coordinate
    float64   y2        # Bottom-right y coordinate 
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Bounding_Box_2D_list(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.bounding_box_2D_list !== undefined) {
      resolved.bounding_box_2D_list = new Array(msg.bounding_box_2D_list.length);
      for (let i = 0; i < resolved.bounding_box_2D_list.length; ++i) {
        resolved.bounding_box_2D_list[i] = Bounding_Box_2D.Resolve(msg.bounding_box_2D_list[i]);
      }
    }
    else {
      resolved.bounding_box_2D_list = []
    }

    return resolved;
    }
};

module.exports = Bounding_Box_2D_list;
