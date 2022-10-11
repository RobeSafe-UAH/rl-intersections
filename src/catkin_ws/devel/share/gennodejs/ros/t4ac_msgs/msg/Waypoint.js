// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Transform = require('./Transform.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Waypoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.id = null;
      this.transform = null;
      this.road_id = null;
      this.lane_id = null;
      this.junction = null;
      this.s = null;
      this.lane_width = null;
      this.lane_change = null;
      this.lane_type = null;
      this.right_lane_marking = null;
      this.left_lane_marking = null;
      this.vmax = null;
      this.vunit = null;
      this.nLanes = null;
      this.lanePosition = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('transform')) {
        this.transform = initObj.transform
      }
      else {
        this.transform = new Transform();
      }
      if (initObj.hasOwnProperty('road_id')) {
        this.road_id = initObj.road_id
      }
      else {
        this.road_id = 0;
      }
      if (initObj.hasOwnProperty('lane_id')) {
        this.lane_id = initObj.lane_id
      }
      else {
        this.lane_id = 0;
      }
      if (initObj.hasOwnProperty('junction')) {
        this.junction = initObj.junction
      }
      else {
        this.junction = 0;
      }
      if (initObj.hasOwnProperty('s')) {
        this.s = initObj.s
      }
      else {
        this.s = 0.0;
      }
      if (initObj.hasOwnProperty('lane_width')) {
        this.lane_width = initObj.lane_width
      }
      else {
        this.lane_width = 0.0;
      }
      if (initObj.hasOwnProperty('lane_change')) {
        this.lane_change = initObj.lane_change
      }
      else {
        this.lane_change = '';
      }
      if (initObj.hasOwnProperty('lane_type')) {
        this.lane_type = initObj.lane_type
      }
      else {
        this.lane_type = '';
      }
      if (initObj.hasOwnProperty('right_lane_marking')) {
        this.right_lane_marking = initObj.right_lane_marking
      }
      else {
        this.right_lane_marking = '';
      }
      if (initObj.hasOwnProperty('left_lane_marking')) {
        this.left_lane_marking = initObj.left_lane_marking
      }
      else {
        this.left_lane_marking = '';
      }
      if (initObj.hasOwnProperty('vmax')) {
        this.vmax = initObj.vmax
      }
      else {
        this.vmax = 0;
      }
      if (initObj.hasOwnProperty('vunit')) {
        this.vunit = initObj.vunit
      }
      else {
        this.vunit = '';
      }
      if (initObj.hasOwnProperty('nLanes')) {
        this.nLanes = initObj.nLanes
      }
      else {
        this.nLanes = 0;
      }
      if (initObj.hasOwnProperty('lanePosition')) {
        this.lanePosition = initObj.lanePosition
      }
      else {
        this.lanePosition = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Waypoint
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [transform]
    bufferOffset = Transform.serialize(obj.transform, buffer, bufferOffset);
    // Serialize message field [road_id]
    bufferOffset = _serializer.int32(obj.road_id, buffer, bufferOffset);
    // Serialize message field [lane_id]
    bufferOffset = _serializer.int32(obj.lane_id, buffer, bufferOffset);
    // Serialize message field [junction]
    bufferOffset = _serializer.int32(obj.junction, buffer, bufferOffset);
    // Serialize message field [s]
    bufferOffset = _serializer.float64(obj.s, buffer, bufferOffset);
    // Serialize message field [lane_width]
    bufferOffset = _serializer.float64(obj.lane_width, buffer, bufferOffset);
    // Serialize message field [lane_change]
    bufferOffset = _serializer.string(obj.lane_change, buffer, bufferOffset);
    // Serialize message field [lane_type]
    bufferOffset = _serializer.string(obj.lane_type, buffer, bufferOffset);
    // Serialize message field [right_lane_marking]
    bufferOffset = _serializer.string(obj.right_lane_marking, buffer, bufferOffset);
    // Serialize message field [left_lane_marking]
    bufferOffset = _serializer.string(obj.left_lane_marking, buffer, bufferOffset);
    // Serialize message field [vmax]
    bufferOffset = _serializer.int32(obj.vmax, buffer, bufferOffset);
    // Serialize message field [vunit]
    bufferOffset = _serializer.string(obj.vunit, buffer, bufferOffset);
    // Serialize message field [nLanes]
    bufferOffset = _serializer.int32(obj.nLanes, buffer, bufferOffset);
    // Serialize message field [lanePosition]
    bufferOffset = _serializer.int32(obj.lanePosition, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Waypoint
    let len;
    let data = new Waypoint(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [transform]
    data.transform = Transform.deserialize(buffer, bufferOffset);
    // Deserialize message field [road_id]
    data.road_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [lane_id]
    data.lane_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [junction]
    data.junction = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [s]
    data.s = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lane_width]
    data.lane_width = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [lane_change]
    data.lane_change = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [lane_type]
    data.lane_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [right_lane_marking]
    data.right_lane_marking = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [left_lane_marking]
    data.left_lane_marking = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [vmax]
    data.vmax = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [vunit]
    data.vunit = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [nLanes]
    data.nLanes = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [lanePosition]
    data.lanePosition = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.lane_change);
    length += _getByteLength(object.lane_type);
    length += _getByteLength(object.right_lane_marking);
    length += _getByteLength(object.left_lane_marking);
    length += _getByteLength(object.vunit);
    return length + 112;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Waypoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0077c4b075dc1aed9256fe7f551799fe';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # T4ac Project 
    
    Header header
    int32 id
    Transform transform
    int32 road_id
    int32 lane_id
    int32 junction
    float64 s
    float64 lane_width
    string lane_change
    string lane_type
    string right_lane_marking
    string left_lane_marking
    int32 vmax
    string vunit
    int32 nLanes
    int32 lanePosition
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
    MSG: t4ac_msgs/Transform
    # T4ac Project
    
    Location location
    Rotation rotation
    ================================================================================
    MSG: t4ac_msgs/Location
    # T4ac Project 
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: t4ac_msgs/Rotation
    # T4ac Project 
    
    float64 pitch
    float64 yaw
    float64 roll
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Waypoint(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.transform !== undefined) {
      resolved.transform = Transform.Resolve(msg.transform)
    }
    else {
      resolved.transform = new Transform()
    }

    if (msg.road_id !== undefined) {
      resolved.road_id = msg.road_id;
    }
    else {
      resolved.road_id = 0
    }

    if (msg.lane_id !== undefined) {
      resolved.lane_id = msg.lane_id;
    }
    else {
      resolved.lane_id = 0
    }

    if (msg.junction !== undefined) {
      resolved.junction = msg.junction;
    }
    else {
      resolved.junction = 0
    }

    if (msg.s !== undefined) {
      resolved.s = msg.s;
    }
    else {
      resolved.s = 0.0
    }

    if (msg.lane_width !== undefined) {
      resolved.lane_width = msg.lane_width;
    }
    else {
      resolved.lane_width = 0.0
    }

    if (msg.lane_change !== undefined) {
      resolved.lane_change = msg.lane_change;
    }
    else {
      resolved.lane_change = ''
    }

    if (msg.lane_type !== undefined) {
      resolved.lane_type = msg.lane_type;
    }
    else {
      resolved.lane_type = ''
    }

    if (msg.right_lane_marking !== undefined) {
      resolved.right_lane_marking = msg.right_lane_marking;
    }
    else {
      resolved.right_lane_marking = ''
    }

    if (msg.left_lane_marking !== undefined) {
      resolved.left_lane_marking = msg.left_lane_marking;
    }
    else {
      resolved.left_lane_marking = ''
    }

    if (msg.vmax !== undefined) {
      resolved.vmax = msg.vmax;
    }
    else {
      resolved.vmax = 0
    }

    if (msg.vunit !== undefined) {
      resolved.vunit = msg.vunit;
    }
    else {
      resolved.vunit = ''
    }

    if (msg.nLanes !== undefined) {
      resolved.nLanes = msg.nLanes;
    }
    else {
      resolved.nLanes = 0
    }

    if (msg.lanePosition !== undefined) {
      resolved.lanePosition = msg.lanePosition;
    }
    else {
      resolved.lanePosition = 0
    }

    return resolved;
    }
};

module.exports = Waypoint;
