// Auto-generated. Do not edit!

// (in-package carla_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let diagnostic_msgs = _finder('diagnostic_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SpawnObjectRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.id = null;
      this.attributes = null;
      this.transform = null;
      this.attach_to = null;
      this.random_pose = null;
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
      if (initObj.hasOwnProperty('attributes')) {
        this.attributes = initObj.attributes
      }
      else {
        this.attributes = [];
      }
      if (initObj.hasOwnProperty('transform')) {
        this.transform = initObj.transform
      }
      else {
        this.transform = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('attach_to')) {
        this.attach_to = initObj.attach_to
      }
      else {
        this.attach_to = 0;
      }
      if (initObj.hasOwnProperty('random_pose')) {
        this.random_pose = initObj.random_pose
      }
      else {
        this.random_pose = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SpawnObjectRequest
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [attributes]
    // Serialize the length for message field [attributes]
    bufferOffset = _serializer.uint32(obj.attributes.length, buffer, bufferOffset);
    obj.attributes.forEach((val) => {
      bufferOffset = diagnostic_msgs.msg.KeyValue.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [transform]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.transform, buffer, bufferOffset);
    // Serialize message field [attach_to]
    bufferOffset = _serializer.uint32(obj.attach_to, buffer, bufferOffset);
    // Serialize message field [random_pose]
    bufferOffset = _serializer.bool(obj.random_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SpawnObjectRequest
    let len;
    let data = new SpawnObjectRequest(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [attributes]
    // Deserialize array length for message field [attributes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.attributes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.attributes[i] = diagnostic_msgs.msg.KeyValue.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [transform]
    data.transform = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [attach_to]
    data.attach_to = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [random_pose]
    data.random_pose = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    length += _getByteLength(object.id);
    object.attributes.forEach((val) => {
      length += diagnostic_msgs.msg.KeyValue.getMessageSize(val);
    });
    return length + 73;
  }

  static datatype() {
    // Returns string type for a service object
    return 'carla_msgs/SpawnObjectRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '692b34e8d779943f044d478da31f4ec5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    # Copyright (c) 2020 Intel Corporation.
    #
    # This work is licensed under the terms of the MIT license.
    # For a copy, see <https://opensource.org/licenses/MIT>.
    #
    
    string type
    string id
    diagnostic_msgs/KeyValue[] attributes
    geometry_msgs/Pose transform
    uint32 attach_to
    bool random_pose
    
    ================================================================================
    MSG: diagnostic_msgs/KeyValue
    string key # what to label this value when viewing
    string value # a value to track over time
    
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
    const resolved = new SpawnObjectRequest(null);
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

    if (msg.attributes !== undefined) {
      resolved.attributes = new Array(msg.attributes.length);
      for (let i = 0; i < resolved.attributes.length; ++i) {
        resolved.attributes[i] = diagnostic_msgs.msg.KeyValue.Resolve(msg.attributes[i]);
      }
    }
    else {
      resolved.attributes = []
    }

    if (msg.transform !== undefined) {
      resolved.transform = geometry_msgs.msg.Pose.Resolve(msg.transform)
    }
    else {
      resolved.transform = new geometry_msgs.msg.Pose()
    }

    if (msg.attach_to !== undefined) {
      resolved.attach_to = msg.attach_to;
    }
    else {
      resolved.attach_to = 0
    }

    if (msg.random_pose !== undefined) {
      resolved.random_pose = msg.random_pose;
    }
    else {
      resolved.random_pose = false
    }

    return resolved;
    }
};

class SpawnObjectResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.error_string = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('error_string')) {
        this.error_string = initObj.error_string
      }
      else {
        this.error_string = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SpawnObjectResponse
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [error_string]
    bufferOffset = _serializer.string(obj.error_string, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SpawnObjectResponse
    let len;
    let data = new SpawnObjectResponse(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [error_string]
    data.error_string = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.error_string);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'carla_msgs/SpawnObjectResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f798581edfd6f070fc21a36822b41531';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    string error_string
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SpawnObjectResponse(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.error_string !== undefined) {
      resolved.error_string = msg.error_string;
    }
    else {
      resolved.error_string = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SpawnObjectRequest,
  Response: SpawnObjectResponse,
  md5sum() { return 'e33e3f6271c805c5651cbf682dacbcbd'; },
  datatype() { return 'carla_msgs/SpawnObject'; }
};
