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

class Landmark {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.location = null;
      this.distance = null;
      this.affecting_road = null;
    }
    else {
      if (initObj.hasOwnProperty('location')) {
        this.location = initObj.location
      }
      else {
        this.location = new Node();
      }
      if (initObj.hasOwnProperty('distance')) {
        this.distance = initObj.distance
      }
      else {
        this.distance = 0.0;
      }
      if (initObj.hasOwnProperty('affecting_road')) {
        this.affecting_road = initObj.affecting_road
      }
      else {
        this.affecting_road = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Landmark
    // Serialize message field [location]
    bufferOffset = Node.serialize(obj.location, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    // Serialize message field [affecting_road]
    bufferOffset = _serializer.string(obj.affecting_road, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Landmark
    let len;
    let data = new Landmark(null);
    // Deserialize message field [location]
    data.location = Node.deserialize(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [affecting_road]
    data.affecting_road = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.affecting_road);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Landmark';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0379807a041d75b407e703bdf19b973a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ### Landmark definition ###
    
    Node location
    float64 distance
    string affecting_road
    
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
    const resolved = new Landmark(null);
    if (msg.location !== undefined) {
      resolved.location = Node.Resolve(msg.location)
    }
    else {
      resolved.location = new Node()
    }

    if (msg.distance !== undefined) {
      resolved.distance = msg.distance;
    }
    else {
      resolved.distance = 0.0
    }

    if (msg.affecting_road !== undefined) {
      resolved.affecting_road = msg.affecting_road;
    }
    else {
      resolved.affecting_road = ''
    }

    return resolved;
    }
};

module.exports = Landmark;
