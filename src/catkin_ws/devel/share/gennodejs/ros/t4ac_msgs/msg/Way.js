// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Node = require('./Node.js');

//-----------------------------------------------------------

class Way {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.way = null;
    }
    else {
      if (initObj.hasOwnProperty('way')) {
        this.way = initObj.way
      }
      else {
        this.way = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Way
    // Serialize message field [way]
    // Serialize the length for message field [way]
    bufferOffset = _serializer.uint32(obj.way.length, buffer, bufferOffset);
    obj.way.forEach((val) => {
      bufferOffset = Node.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Way
    let len;
    let data = new Way(null);
    // Deserialize message field [way]
    // Deserialize array length for message field [way]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.way = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.way[i] = Node.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.way.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Way';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '633945be8abb5aeffbfc923f66470e22';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Way(null);
    if (msg.way !== undefined) {
      resolved.way = new Array(msg.way.length);
      for (let i = 0; i < resolved.way.length; ++i) {
        resolved.way[i] = Node.Resolve(msg.way[i]);
      }
    }
    else {
      resolved.way = []
    }

    return resolved;
    }
};

module.exports = Way;
