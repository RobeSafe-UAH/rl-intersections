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

class BEV_detection {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.score = null;
      this.object_id = null;
      this.x = null;
      this.y = null;
      this.vel_lin = null;
      this.vel_ang = null;
      this.tl_br = null;
      this.x_corners = null;
      this.y_corners = null;
      this.l = null;
      this.w = null;
      this.o = null;
      this.safety_zone = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('score')) {
        this.score = initObj.score
      }
      else {
        this.score = 0.0;
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
      if (initObj.hasOwnProperty('vel_lin')) {
        this.vel_lin = initObj.vel_lin
      }
      else {
        this.vel_lin = 0.0;
      }
      if (initObj.hasOwnProperty('vel_ang')) {
        this.vel_ang = initObj.vel_ang
      }
      else {
        this.vel_ang = 0.0;
      }
      if (initObj.hasOwnProperty('tl_br')) {
        this.tl_br = initObj.tl_br
      }
      else {
        this.tl_br = [];
      }
      if (initObj.hasOwnProperty('x_corners')) {
        this.x_corners = initObj.x_corners
      }
      else {
        this.x_corners = [];
      }
      if (initObj.hasOwnProperty('y_corners')) {
        this.y_corners = initObj.y_corners
      }
      else {
        this.y_corners = [];
      }
      if (initObj.hasOwnProperty('l')) {
        this.l = initObj.l
      }
      else {
        this.l = 0.0;
      }
      if (initObj.hasOwnProperty('w')) {
        this.w = initObj.w
      }
      else {
        this.w = 0.0;
      }
      if (initObj.hasOwnProperty('o')) {
        this.o = initObj.o
      }
      else {
        this.o = 0.0;
      }
      if (initObj.hasOwnProperty('safety_zone')) {
        this.safety_zone = initObj.safety_zone
      }
      else {
        this.safety_zone = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BEV_detection
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float64(obj.score, buffer, bufferOffset);
    // Serialize message field [object_id]
    bufferOffset = _serializer.uint16(obj.object_id, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.float64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.float64(obj.y, buffer, bufferOffset);
    // Serialize message field [vel_lin]
    bufferOffset = _serializer.float64(obj.vel_lin, buffer, bufferOffset);
    // Serialize message field [vel_ang]
    bufferOffset = _serializer.float64(obj.vel_ang, buffer, bufferOffset);
    // Serialize message field [tl_br]
    bufferOffset = _arraySerializer.float64(obj.tl_br, buffer, bufferOffset, null);
    // Serialize message field [x_corners]
    bufferOffset = _arraySerializer.float64(obj.x_corners, buffer, bufferOffset, null);
    // Serialize message field [y_corners]
    bufferOffset = _arraySerializer.float64(obj.y_corners, buffer, bufferOffset, null);
    // Serialize message field [l]
    bufferOffset = _serializer.float64(obj.l, buffer, bufferOffset);
    // Serialize message field [w]
    bufferOffset = _serializer.float64(obj.w, buffer, bufferOffset);
    // Serialize message field [o]
    bufferOffset = _serializer.float64(obj.o, buffer, bufferOffset);
    // Serialize message field [safety_zone]
    bufferOffset = _serializer.bool(obj.safety_zone, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BEV_detection
    let len;
    let data = new BEV_detection(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [object_id]
    data.object_id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vel_lin]
    data.vel_lin = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vel_ang]
    data.vel_ang = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tl_br]
    data.tl_br = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [x_corners]
    data.x_corners = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [y_corners]
    data.y_corners = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [l]
    data.l = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [w]
    data.w = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [o]
    data.o = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [safety_zone]
    data.safety_zone = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    length += 8 * object.tl_br.length;
    length += 8 * object.x_corners.length;
    length += 8 * object.y_corners.length;
    return length + 83;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/BEV_detection';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6e7e32ae5122e513b61afaaf47d1cdc1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    string type         # Object type
    float64 score       # Object probability (0 to 1)
    uint16 object_id    # Object ID 
    
    float64   x         # BEV x centroid
    float64   y         # BEV y centroid 
    float64   vel_lin   # (Only Groundtruth) Linear velocity (Module of vx and vy)
    float64   vel_ang   # (Only Groundtruth) Angular velocity (Z-axis)
    float64[] tl_br     # 2D bbox top-left, bottom-right xy coordinates
    float64[] x_corners # 3D bbox x coordinates of the corners
    float64[] y_corners # 3D bbox y coordinates of the corners
    float64   l         # BEV length of the object
    float64   w         # BEV width of the object
    float64   o         # Object orientation
    
    bool safety_zone    # If true, the detection is very near the vehicle 
                        # Evaluate the predicted collision with this detection
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BEV_detection(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    if (msg.score !== undefined) {
      resolved.score = msg.score;
    }
    else {
      resolved.score = 0.0
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

    if (msg.vel_lin !== undefined) {
      resolved.vel_lin = msg.vel_lin;
    }
    else {
      resolved.vel_lin = 0.0
    }

    if (msg.vel_ang !== undefined) {
      resolved.vel_ang = msg.vel_ang;
    }
    else {
      resolved.vel_ang = 0.0
    }

    if (msg.tl_br !== undefined) {
      resolved.tl_br = msg.tl_br;
    }
    else {
      resolved.tl_br = []
    }

    if (msg.x_corners !== undefined) {
      resolved.x_corners = msg.x_corners;
    }
    else {
      resolved.x_corners = []
    }

    if (msg.y_corners !== undefined) {
      resolved.y_corners = msg.y_corners;
    }
    else {
      resolved.y_corners = []
    }

    if (msg.l !== undefined) {
      resolved.l = msg.l;
    }
    else {
      resolved.l = 0.0
    }

    if (msg.w !== undefined) {
      resolved.w = msg.w;
    }
    else {
      resolved.w = 0.0
    }

    if (msg.o !== undefined) {
      resolved.o = msg.o;
    }
    else {
      resolved.o = 0.0
    }

    if (msg.safety_zone !== undefined) {
      resolved.safety_zone = msg.safety_zone;
    }
    else {
      resolved.safety_zone = false
    }

    return resolved;
    }
};

module.exports = BEV_detection;
