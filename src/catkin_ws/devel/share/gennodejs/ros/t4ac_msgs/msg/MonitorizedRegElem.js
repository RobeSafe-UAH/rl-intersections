// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RegulatoryElement = require('./RegulatoryElement.js');

//-----------------------------------------------------------

class MonitorizedRegElem {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reg_elems = null;
    }
    else {
      if (initObj.hasOwnProperty('reg_elems')) {
        this.reg_elems = initObj.reg_elems
      }
      else {
        this.reg_elems = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MonitorizedRegElem
    // Serialize message field [reg_elems]
    // Serialize the length for message field [reg_elems]
    bufferOffset = _serializer.uint32(obj.reg_elems.length, buffer, bufferOffset);
    obj.reg_elems.forEach((val) => {
      bufferOffset = RegulatoryElement.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MonitorizedRegElem
    let len;
    let data = new MonitorizedRegElem(null);
    // Deserialize message field [reg_elems]
    // Deserialize array length for message field [reg_elems]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.reg_elems = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.reg_elems[i] = RegulatoryElement.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.reg_elems.forEach((val) => {
      length += RegulatoryElement.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/MonitorizedRegElem';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2d4b678817b5a00f2a9678518f83388b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ### Monitorized Regulatory Elements definition ###
    
    RegulatoryElement[] reg_elems
    ================================================================================
    MSG: t4ac_msgs/RegulatoryElement
    ### Regulatory Element definition ###
    
    string type
    string id
    Node location
    float64 distance
    string[] affecting_roads
    Landmark[] landmarks
    ================================================================================
    MSG: t4ac_msgs/Node
    ## Node definition 
    
    float64 x	# X
    float64 y	# Y
    float64 z	# Z
    
    ================================================================================
    MSG: t4ac_msgs/Landmark
    ### Landmark definition ###
    
    Node location
    float64 distance
    string affecting_road
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MonitorizedRegElem(null);
    if (msg.reg_elems !== undefined) {
      resolved.reg_elems = new Array(msg.reg_elems.length);
      for (let i = 0; i < resolved.reg_elems.length; ++i) {
        resolved.reg_elems[i] = RegulatoryElement.Resolve(msg.reg_elems[i]);
      }
    }
    else {
      resolved.reg_elems = []
    }

    return resolved;
    }
};

module.exports = MonitorizedRegElem;
