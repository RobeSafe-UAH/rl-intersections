// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let BEV_tracker = require('./BEV_tracker.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class BEV_trackers_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.bev_trackers_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('bev_trackers_list')) {
        this.bev_trackers_list = initObj.bev_trackers_list
      }
      else {
        this.bev_trackers_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BEV_trackers_list
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [bev_trackers_list]
    // Serialize the length for message field [bev_trackers_list]
    bufferOffset = _serializer.uint32(obj.bev_trackers_list.length, buffer, bufferOffset);
    obj.bev_trackers_list.forEach((val) => {
      bufferOffset = BEV_tracker.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BEV_trackers_list
    let len;
    let data = new BEV_trackers_list(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [bev_trackers_list]
    // Deserialize array length for message field [bev_trackers_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bev_trackers_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bev_trackers_list[i] = BEV_tracker.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.bev_trackers_list.forEach((val) => {
      length += BEV_tracker.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/BEV_trackers_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '75647be9b87b8cac8b063a214b8fbc18';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    Header header                              # Frame and timestamp information
    
    BEV_tracker[] bev_trackers_list  # List of tracked_obstacles
    
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
    MSG: t4ac_msgs/BEV_tracker
    # Techs4AgeCar project
    
    string type      # Object type
    uint16 object_id # Object ID
    
    float64   x      # BEV x centroid
    float64   y      # BEV y centroid 
    float64   w      # BEV width of the object
    float64   l      # BEV length of the object
    float64   o      # Object orientation
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BEV_trackers_list(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.bev_trackers_list !== undefined) {
      resolved.bev_trackers_list = new Array(msg.bev_trackers_list.length);
      for (let i = 0; i < resolved.bev_trackers_list.length; ++i) {
        resolved.bev_trackers_list[i] = BEV_tracker.Resolve(msg.bev_trackers_list[i]);
      }
    }
    else {
      resolved.bev_trackers_list = []
    }

    return resolved;
    }
};

module.exports = BEV_trackers_list;
