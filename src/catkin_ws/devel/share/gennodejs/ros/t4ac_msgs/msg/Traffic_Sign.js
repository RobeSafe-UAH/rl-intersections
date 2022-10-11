// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Traffic_Sign {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.lanes = null;
      this.x1 = null;
      this.y1 = null;
      this.x2 = null;
      this.y2 = null;
      this.local_pose = null;
      this.global_pose = null;
      this.stop_line = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('lanes')) {
        this.lanes = initObj.lanes
      }
      else {
        this.lanes = [];
      }
      if (initObj.hasOwnProperty('x1')) {
        this.x1 = initObj.x1
      }
      else {
        this.x1 = 0.0;
      }
      if (initObj.hasOwnProperty('y1')) {
        this.y1 = initObj.y1
      }
      else {
        this.y1 = 0.0;
      }
      if (initObj.hasOwnProperty('x2')) {
        this.x2 = initObj.x2
      }
      else {
        this.x2 = 0.0;
      }
      if (initObj.hasOwnProperty('y2')) {
        this.y2 = initObj.y2
      }
      else {
        this.y2 = 0.0;
      }
      if (initObj.hasOwnProperty('local_pose')) {
        this.local_pose = initObj.local_pose
      }
      else {
        this.local_pose = new geometry_msgs.msg.PoseWithCovariance();
      }
      if (initObj.hasOwnProperty('global_pose')) {
        this.global_pose = initObj.global_pose
      }
      else {
        this.global_pose = new geometry_msgs.msg.PoseWithCovariance();
      }
      if (initObj.hasOwnProperty('stop_line')) {
        this.stop_line = initObj.stop_line
      }
      else {
        this.stop_line = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Traffic_Sign
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [lanes]
    bufferOffset = _arraySerializer.uint8(obj.lanes, buffer, bufferOffset, null);
    // Serialize message field [x1]
    bufferOffset = _serializer.float64(obj.x1, buffer, bufferOffset);
    // Serialize message field [y1]
    bufferOffset = _serializer.float64(obj.y1, buffer, bufferOffset);
    // Serialize message field [x2]
    bufferOffset = _serializer.float64(obj.x2, buffer, bufferOffset);
    // Serialize message field [y2]
    bufferOffset = _serializer.float64(obj.y2, buffer, bufferOffset);
    // Serialize message field [local_pose]
    bufferOffset = geometry_msgs.msg.PoseWithCovariance.serialize(obj.local_pose, buffer, bufferOffset);
    // Serialize message field [global_pose]
    bufferOffset = geometry_msgs.msg.PoseWithCovariance.serialize(obj.global_pose, buffer, bufferOffset);
    // Serialize message field [stop_line]
    bufferOffset = _serializer.float64(obj.stop_line, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Traffic_Sign
    let len;
    let data = new Traffic_Sign(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [lanes]
    data.lanes = _arrayDeserializer.uint8(buffer, bufferOffset, null)
    // Deserialize message field [x1]
    data.x1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y1]
    data.y1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x2]
    data.x2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y2]
    data.y2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [local_pose]
    data.local_pose = geometry_msgs.msg.PoseWithCovariance.deserialize(buffer, bufferOffset);
    // Deserialize message field [global_pose]
    data.global_pose = geometry_msgs.msg.PoseWithCovariance.deserialize(buffer, bufferOffset);
    // Deserialize message field [stop_line]
    data.stop_line = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    length += object.lanes.length;
    return length + 736;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Traffic_Sign';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f266b8af366a609a7c528b57f35853d1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    string type                                    # Traffic Sign type
    uint8[] lanes                                  # Lanes involved
    
    float64   x1                                   # Top-left x coordinate
    float64   y1                                   # Top-left y coordinate 
    float64   x2                                   # Bottom-right x coordinate
    float64   y2                                   # Bottom-right y coordinate 
    geometry_msgs/PoseWithCovariance local_pose    # 3D Centroid x,y,z (Ego-vehicle frame)
    geometry_msgs/PoseWithCovariance global_pose   # 3D Centroid x,y,z (Map frame)
    
    float64  stop_line                             # Minimum distance at which the traffic light is 
                                                   # fully observed. TODO: TAKE THIS STOP LINE FROM 
                                                   # THE MAP AND ENSURE YOU OBSERVE THE CORRESPONDING
                                                   # TRAFFIC LIGHT AT THIS POINT
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Traffic_Sign(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    if (msg.lanes !== undefined) {
      resolved.lanes = msg.lanes;
    }
    else {
      resolved.lanes = []
    }

    if (msg.x1 !== undefined) {
      resolved.x1 = msg.x1;
    }
    else {
      resolved.x1 = 0.0
    }

    if (msg.y1 !== undefined) {
      resolved.y1 = msg.y1;
    }
    else {
      resolved.y1 = 0.0
    }

    if (msg.x2 !== undefined) {
      resolved.x2 = msg.x2;
    }
    else {
      resolved.x2 = 0.0
    }

    if (msg.y2 !== undefined) {
      resolved.y2 = msg.y2;
    }
    else {
      resolved.y2 = 0.0
    }

    if (msg.local_pose !== undefined) {
      resolved.local_pose = geometry_msgs.msg.PoseWithCovariance.Resolve(msg.local_pose)
    }
    else {
      resolved.local_pose = new geometry_msgs.msg.PoseWithCovariance()
    }

    if (msg.global_pose !== undefined) {
      resolved.global_pose = geometry_msgs.msg.PoseWithCovariance.Resolve(msg.global_pose)
    }
    else {
      resolved.global_pose = new geometry_msgs.msg.PoseWithCovariance()
    }

    if (msg.stop_line !== undefined) {
      resolved.stop_line = msg.stop_line;
    }
    else {
      resolved.stop_line = 0.0
    }

    return resolved;
    }
};

module.exports = Traffic_Sign;
