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
let Landmark = require('./Landmark.js');

//-----------------------------------------------------------

class RegulatoryElement {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.id = null;
      this.location = null;
      this.distance = null;
      this.affecting_roads = null;
      this.landmarks = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
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
      if (initObj.hasOwnProperty('affecting_roads')) {
        this.affecting_roads = initObj.affecting_roads
      }
      else {
        this.affecting_roads = [];
      }
      if (initObj.hasOwnProperty('landmarks')) {
        this.landmarks = initObj.landmarks
      }
      else {
        this.landmarks = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RegulatoryElement
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [location]
    bufferOffset = Node.serialize(obj.location, buffer, bufferOffset);
    // Serialize message field [distance]
    bufferOffset = _serializer.float64(obj.distance, buffer, bufferOffset);
    // Serialize message field [affecting_roads]
    bufferOffset = _arraySerializer.string(obj.affecting_roads, buffer, bufferOffset, null);
    // Serialize message field [landmarks]
    // Serialize the length for message field [landmarks]
    bufferOffset = _serializer.uint32(obj.landmarks.length, buffer, bufferOffset);
    obj.landmarks.forEach((val) => {
      bufferOffset = Landmark.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RegulatoryElement
    let len;
    let data = new RegulatoryElement(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [location]
    data.location = Node.deserialize(buffer, bufferOffset);
    // Deserialize message field [distance]
    data.distance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [affecting_roads]
    data.affecting_roads = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [landmarks]
    // Deserialize array length for message field [landmarks]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.landmarks = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.landmarks[i] = Landmark.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    length += _getByteLength(object.id);
    object.affecting_roads.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.landmarks.forEach((val) => {
      length += Landmark.getMessageSize(val);
    });
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/RegulatoryElement';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4683a17004de77e66d22587d1460f95a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new RegulatoryElement(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

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

    if (msg.affecting_roads !== undefined) {
      resolved.affecting_roads = msg.affecting_roads;
    }
    else {
      resolved.affecting_roads = []
    }

    if (msg.landmarks !== undefined) {
      resolved.landmarks = new Array(msg.landmarks.length);
      for (let i = 0; i < resolved.landmarks.length; ++i) {
        resolved.landmarks[i] = Landmark.Resolve(msg.landmarks[i]);
      }
    }
    else {
      resolved.landmarks = []
    }

    return resolved;
    }
};

module.exports = RegulatoryElement;
