// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Location = require('./Location.js');
let Rotation = require('./Rotation.js');

//-----------------------------------------------------------

class Transform {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.location = null;
      this.rotation = null;
    }
    else {
      if (initObj.hasOwnProperty('location')) {
        this.location = initObj.location
      }
      else {
        this.location = new Location();
      }
      if (initObj.hasOwnProperty('rotation')) {
        this.rotation = initObj.rotation
      }
      else {
        this.rotation = new Rotation();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Transform
    // Serialize message field [location]
    bufferOffset = Location.serialize(obj.location, buffer, bufferOffset);
    // Serialize message field [rotation]
    bufferOffset = Rotation.serialize(obj.rotation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Transform
    let len;
    let data = new Transform(null);
    // Deserialize message field [location]
    data.location = Location.deserialize(buffer, bufferOffset);
    // Deserialize message field [rotation]
    data.rotation = Rotation.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Transform';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8dd6f45800a6e91772e60f284726d823';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Transform(null);
    if (msg.location !== undefined) {
      resolved.location = Location.Resolve(msg.location)
    }
    else {
      resolved.location = new Location()
    }

    if (msg.rotation !== undefined) {
      resolved.rotation = Rotation.Resolve(msg.rotation)
    }
    else {
      resolved.rotation = new Rotation()
    }

    return resolved;
    }
};

module.exports = Transform;
