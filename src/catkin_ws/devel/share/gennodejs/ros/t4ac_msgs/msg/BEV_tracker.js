// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class BEV_tracker {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.object_id = null;
      this.x = null;
      this.y = null;
      this.w = null;
      this.l = null;
      this.o = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('object_id')) {
        this.object_id = initObj.object_id
      }
      else {
        this.object_id = 0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0.0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0.0;
      }
      if (initObj.hasOwnProperty('w')) {
        this.w = initObj.w
      }
      else {
        this.w = 0.0;
      }
      if (initObj.hasOwnProperty('l')) {
        this.l = initObj.l
      }
      else {
        this.l = 0.0;
      }
      if (initObj.hasOwnProperty('o')) {
        this.o = initObj.o
      }
      else {
        this.o = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BEV_tracker
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [object_id]
    bufferOffset = _serializer.uint16(obj.object_id, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [w]
    bufferOffset = _serializer.float64(obj.w, buffer, bufferOffset);
    // Serialize message field [l]
    bufferOffset = _serializer.float64(obj.l, buffer, bufferOffset);
    // Serialize message field [o]
    bufferOffset = _serializer.float64(obj.o, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BEV_tracker
    let len;
    let data = new BEV_tracker(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [object_id]
    data.object_id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [w]
    data.w = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [l]
    data.l = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [o]
    data.o = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    return length + 46;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/BEV_tracker';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c5b962defcda9cb823d2edafcdf55aca';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new BEV_tracker(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    if (msg.object_id !== undefined) {
      resolved.object_id = msg.object_id;
    }
    else {
      resolved.object_id = 0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0.0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0.0
    }

    if (msg.w !== undefined) {
      resolved.w = msg.w;
    }
    else {
      resolved.w = 0.0
    }

    if (msg.l !== undefined) {
      resolved.l = msg.l;
    }
    else {
      resolved.l = 0.0
    }

    if (msg.o !== undefined) {
      resolved.o = msg.o;
    }
    else {
      resolved.o = 0.0
    }

    return resolved;
    }
};

module.exports = BEV_tracker;
