// Auto-generated. Do not edit!

// (in-package carla_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CarlaBoundingBox = require('./CarlaBoundingBox.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class CarlaTrafficLightInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.transform = null;
      this.trigger_volume = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('transform')) {
        this.transform = initObj.transform
      }
      else {
        this.transform = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('trigger_volume')) {
        this.trigger_volume = initObj.trigger_volume
      }
      else {
        this.trigger_volume = new CarlaBoundingBox();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CarlaTrafficLightInfo
    // Serialize message field [id]
    bufferOffset = _serializer.uint32(obj.id, buffer, bufferOffset);
    // Serialize message field [transform]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.transform, buffer, bufferOffset);
    // Serialize message field [trigger_volume]
    bufferOffset = CarlaBoundingBox.serialize(obj.trigger_volume, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CarlaTrafficLightInfo
    let len;
    let data = new CarlaTrafficLightInfo(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [transform]
    data.transform = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [trigger_volume]
    data.trigger_volume = CarlaBoundingBox.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 108;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carla_msgs/CarlaTrafficLightInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c303b00d6ff9db591d60b1662aec9d48';
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
    uint32 id
    geometry_msgs/Pose transform
    CarlaBoundingBox trigger_volume # position is relative to transform
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
    MSG: carla_msgs/CarlaBoundingBox
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
    const resolved = new CarlaTrafficLightInfo(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.transform !== undefined) {
      resolved.transform = geometry_msgs.msg.Pose.Resolve(msg.transform)
    }
    else {
      resolved.transform = new geometry_msgs.msg.Pose()
    }

    if (msg.trigger_volume !== undefined) {
      resolved.trigger_volume = CarlaBoundingBox.Resolve(msg.trigger_volume)
    }
    else {
      resolved.trigger_volume = new CarlaBoundingBox()
    }

    return resolved;
    }
};

module.exports = CarlaTrafficLightInfo;
