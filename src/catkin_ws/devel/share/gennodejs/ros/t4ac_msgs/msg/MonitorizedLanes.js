// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Lane = require('./Lane.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MonitorizedLanes {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.lanes = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('lanes')) {
        this.lanes = initObj.lanes
      }
      else {
        this.lanes = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MonitorizedLanes
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [lanes]
    // Serialize the length for message field [lanes]
    bufferOffset = _serializer.uint32(obj.lanes.length, buffer, bufferOffset);
    obj.lanes.forEach((val) => {
      bufferOffset = Lane.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MonitorizedLanes
    let len;
    let data = new MonitorizedLanes(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [lanes]
    // Deserialize array length for message field [lanes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.lanes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.lanes[i] = Lane.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.lanes.forEach((val) => {
      length += Lane.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/MonitorizedLanes';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1a578abb53051333eb4739652f419713';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ## Monitorized lanes 
    #
    # MonitorizedLanes is just a list of lanes around the vehicle
    
    Header header
    Lane[] lanes
    
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
    MSG: t4ac_msgs/Lane
    ## Lane definition (from the Carla library) in ROS message format
    #
    # Lanes are mapped using PythonAPI from Carla.
    # They are made up from one "Way" that determine its left and right bounds
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MonitorizedLanes(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.lanes !== undefined) {
      resolved.lanes = new Array(msg.lanes.length);
      for (let i = 0; i < resolved.lanes.length; ++i) {
        resolved.lanes[i] = Lane.Resolve(msg.lanes[i]);
      }
    }
    else {
      resolved.lanes = []
    }

    return resolved;
    }
};

module.exports = MonitorizedLanes;
