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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Bounding_Box_3D {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.score = null;
      this.pose = null;
      this.l = null;
      this.w = null;
      this.h = null;
      this.corners_3d = null;
      this.vel_lin = null;
      this.vel_ang = null;
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
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.PoseWithCovariance();
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
      if (initObj.hasOwnProperty('h')) {
        this.h = initObj.h
      }
      else {
        this.h = 0.0;
      }
      if (initObj.hasOwnProperty('corners_3d')) {
        this.corners_3d = initObj.corners_3d
      }
      else {
        this.corners_3d = [];
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Bounding_Box_3D
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [score]
    bufferOffset = _serializer.float64(obj.score, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.PoseWithCovariance.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [l]
    bufferOffset = _serializer.float64(obj.l, buffer, bufferOffset);
    // Serialize message field [w]
    bufferOffset = _serializer.float64(obj.w, buffer, bufferOffset);
    // Serialize message field [h]
    bufferOffset = _serializer.float64(obj.h, buffer, bufferOffset);
    // Serialize message field [corners_3d]
    // Serialize the length for message field [corners_3d]
    bufferOffset = _serializer.uint32(obj.corners_3d.length, buffer, bufferOffset);
    obj.corners_3d.forEach((val) => {
      bufferOffset = Node.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [vel_lin]
    bufferOffset = _serializer.float64(obj.vel_lin, buffer, bufferOffset);
    // Serialize message field [vel_ang]
    bufferOffset = _serializer.float64(obj.vel_ang, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Bounding_Box_3D
    let len;
    let data = new Bounding_Box_3D(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [score]
    data.score = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.PoseWithCovariance.deserialize(buffer, bufferOffset);
    // Deserialize message field [l]
    data.l = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [w]
    data.w = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [h]
    data.h = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [corners_3d]
    // Deserialize array length for message field [corners_3d]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.corners_3d = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.corners_3d[i] = Node.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [vel_lin]
    data.vel_lin = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vel_ang]
    data.vel_ang = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    length += 24 * object.corners_3d.length;
    return length + 400;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Bounding_Box_3D';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8498b5ba07dec6489238ee817db1326';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    string                           type         # Object type
    float64                          score        # Object probability (0 to 1)
    
    geometry_msgs/PoseWithCovariance pose         # Centroid x,y,z, yaw (Laser frame)
    float64                          l            # Object length (Originally along x-laser frame)
    float64                          w            # Object width (Originally along y-laser frame)
    float64                          h            # Object height (z-laser frame)
    Node[]                           corners_3d   # 3D bbox coordinates (x,y,z ; Laser frame)
    float64                          vel_lin      # Absolute global linear velocity
    float64                          vel_ang      # Absolute global angular velocity
    
    
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
    const resolved = new Bounding_Box_3D(null);
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

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.PoseWithCovariance.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.PoseWithCovariance()
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

    if (msg.h !== undefined) {
      resolved.h = msg.h;
    }
    else {
      resolved.h = 0.0
    }

    if (msg.corners_3d !== undefined) {
      resolved.corners_3d = new Array(msg.corners_3d.length);
      for (let i = 0; i < resolved.corners_3d.length; ++i) {
        resolved.corners_3d[i] = Node.Resolve(msg.corners_3d[i]);
      }
    }
    else {
      resolved.corners_3d = []
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

    return resolved;
    }
};

module.exports = Bounding_Box_3D;
