// Auto-generated. Do not edit!

// (in-package carla_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CarlaTrafficLightInfo = require('./CarlaTrafficLightInfo.js');

//-----------------------------------------------------------

class CarlaTrafficLightInfoList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.traffic_lights = null;
    }
    else {
      if (initObj.hasOwnProperty('traffic_lights')) {
        this.traffic_lights = initObj.traffic_lights
      }
      else {
        this.traffic_lights = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CarlaTrafficLightInfoList
    // Serialize message field [traffic_lights]
    // Serialize the length for message field [traffic_lights]
    bufferOffset = _serializer.uint32(obj.traffic_lights.length, buffer, bufferOffset);
    obj.traffic_lights.forEach((val) => {
      bufferOffset = CarlaTrafficLightInfo.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CarlaTrafficLightInfoList
    let len;
    let data = new CarlaTrafficLightInfoList(null);
    // Deserialize message field [traffic_lights]
    // Deserialize array length for message field [traffic_lights]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.traffic_lights = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.traffic_lights[i] = CarlaTrafficLightInfo.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 108 * object.traffic_lights.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carla_msgs/CarlaTrafficLightInfoList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd1e03fe534c61bfaafc4dfce64de368a';
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
    CarlaTrafficLightInfo[] traffic_lights
    
    ================================================================================
    MSG: carla_msgs/CarlaTrafficLightInfo
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
    const resolved = new CarlaTrafficLightInfoList(null);
    if (msg.traffic_lights !== undefined) {
      resolved.traffic_lights = new Array(msg.traffic_lights.length);
      for (let i = 0; i < resolved.traffic_lights.length; ++i) {
        resolved.traffic_lights[i] = CarlaTrafficLightInfo.Resolve(msg.traffic_lights[i]);
      }
    }
    else {
      resolved.traffic_lights = []
    }

    return resolved;
    }
};

module.exports = CarlaTrafficLightInfoList;
