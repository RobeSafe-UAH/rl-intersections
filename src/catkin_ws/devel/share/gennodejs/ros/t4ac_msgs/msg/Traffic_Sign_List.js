// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Traffic_Sign = require('./Traffic_Sign.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Traffic_Sign_List {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.traffic_sign_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('traffic_sign_list')) {
        this.traffic_sign_list = initObj.traffic_sign_list
      }
      else {
        this.traffic_sign_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Traffic_Sign_List
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [traffic_sign_list]
    // Serialize the length for message field [traffic_sign_list]
    bufferOffset = _serializer.uint32(obj.traffic_sign_list.length, buffer, bufferOffset);
    obj.traffic_sign_list.forEach((val) => {
      bufferOffset = Traffic_Sign.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Traffic_Sign_List
    let len;
    let data = new Traffic_Sign_List(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [traffic_sign_list]
    // Deserialize array length for message field [traffic_sign_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.traffic_sign_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.traffic_sign_list[i] = Traffic_Sign.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.traffic_sign_list.forEach((val) => {
      length += Traffic_Sign.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Traffic_Sign_List';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f887f4878752799f02c0c91e6dcb4d0a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    Header header                          # Frame and timestamp information
    
    Traffic_Sign[] traffic_sign_list       # Currently observed traffic signs, including the involved lanes
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
    MSG: t4ac_msgs/Traffic_Sign
    # Techs4AgeCar project
    
    string type                                    # Traffic Sign type
    uint8[] lanes                                  # Lanes involved
    
    float64   x1                                   # Top-left x coordinate
    float64   y1                                   # Top-left y coordinate 
    float64   x2                                   # Bottom-right x coordinate
    float64   y2                                   # Bottom-right y coordinate 
    geometry_msgs/PoseWithCovariance local_pose    # 3D Centroid x,y,z (Ego-vehicle frame)
    geometry_msgs/PoseWithCovariance global_pose   # 3D Centroid x,y,z (Map frame)
    
    float64  stop_line                             # Minimum distance at which the traffic light is 
                                                   # fully observed. TODO: TAKE THIS STOP LINE FROM 
                                                   # THE MAP AND ENSURE YOU OBSERVE THE CORRESPONDING
                                                   # TRAFFIC LIGHT AT THIS POINT
    ================================================================================
    MSG: geometry_msgs/PoseWithCovariance
    # This represents a pose in free space with uncertainty.
    
    Pose pose
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
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
    const resolved = new Traffic_Sign_List(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.traffic_sign_list !== undefined) {
      resolved.traffic_sign_list = new Array(msg.traffic_sign_list.length);
      for (let i = 0; i < resolved.traffic_sign_list.length; ++i) {
        resolved.traffic_sign_list[i] = Traffic_Sign.Resolve(msg.traffic_sign_list[i]);
      }
    }
    else {
      resolved.traffic_sign_list = []
    }

    return resolved;
    }
};

module.exports = Traffic_Sign_List;
