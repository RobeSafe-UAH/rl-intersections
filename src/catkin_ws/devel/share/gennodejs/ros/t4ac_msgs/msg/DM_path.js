// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DM_posestamped = require('./DM_posestamped.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DM_path {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.poses = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('poses')) {
        this.poses = initObj.poses
      }
      else {
        this.poses = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DM_path
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [poses]
    // Serialize the length for message field [poses]
    bufferOffset = _serializer.uint32(obj.poses.length, buffer, bufferOffset);
    obj.poses.forEach((val) => {
      bufferOffset = DM_posestamped.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DM_path
    let len;
    let data = new DM_path(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [poses]
    // Deserialize array length for message field [poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.poses[i] = DM_posestamped.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.poses.forEach((val) => {
      length += DM_posestamped.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/DM_path';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e85a0bd101b7748691d86afd9e4c40f4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # T4ac Project 
    
    Header header
    DM_posestamped[] poses
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
    MSG: t4ac_msgs/DM_posestamped
    # T4ac Project
    
    Header header
    DM_pose pose
    ================================================================================
    MSG: t4ac_msgs/DM_pose
    # T4ac Project 
    
    geometry_msgs/Point position
    geometry_msgs/Quaternion orientation
    string lane_change  # can be right, left or both 
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DM_path(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.poses !== undefined) {
      resolved.poses = new Array(msg.poses.length);
      for (let i = 0; i < resolved.poses.length; ++i) {
        resolved.poses[i] = DM_posestamped.Resolve(msg.poses[i]);
      }
    }
    else {
      resolved.poses = []
    }

    return resolved;
    }
};

module.exports = DM_path;
