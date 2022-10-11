// Auto-generated. Do not edit!

// (in-package carla_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class CarlaBoundingBox {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.center = null;
      this.size = null;
    }
    else {
      if (initObj.hasOwnProperty('center')) {
        this.center = initObj.center
      }
      else {
        this.center = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('size')) {
        this.size = initObj.size
      }
      else {
        this.size = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CarlaBoundingBox
    // Serialize message field [center]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.center, buffer, bufferOffset);
    // Serialize message field [size]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.size, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CarlaBoundingBox
    let len;
    let data = new CarlaBoundingBox(null);
    // Deserialize message field [center]
    data.center = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [size]
    data.size = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carla_msgs/CarlaBoundingBox';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '17746d0996c54d9b8b0dfe6f3cd0b588';
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
    geometry_msgs/Vector3 center
    
    geometry_msgs/Vector3 size
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CarlaBoundingBox(null);
    if (msg.center !== undefined) {
      resolved.center = geometry_msgs.msg.Vector3.Resolve(msg.center)
    }
    else {
      resolved.center = new geometry_msgs.msg.Vector3()
    }

    if (msg.size !== undefined) {
      resolved.size = geometry_msgs.msg.Vector3.Resolve(msg.size)
    }
    else {
      resolved.size = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = CarlaBoundingBox;
