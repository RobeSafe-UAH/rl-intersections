// Auto-generated. Do not edit!

// (in-package carla_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CarlaTrafficLightStatus = require('./CarlaTrafficLightStatus.js');

//-----------------------------------------------------------

class CarlaTrafficLightStatusList {
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
    // Serializes a message object of type CarlaTrafficLightStatusList
    // Serialize message field [traffic_lights]
    // Serialize the length for message field [traffic_lights]
    bufferOffset = _serializer.uint32(obj.traffic_lights.length, buffer, bufferOffset);
    obj.traffic_lights.forEach((val) => {
      bufferOffset = CarlaTrafficLightStatus.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CarlaTrafficLightStatusList
    let len;
    let data = new CarlaTrafficLightStatusList(null);
    // Deserialize message field [traffic_lights]
    // Deserialize array length for message field [traffic_lights]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.traffic_lights = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.traffic_lights[i] = CarlaTrafficLightStatus.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 5 * object.traffic_lights.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carla_msgs/CarlaTrafficLightStatusList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '99769ac9a785c6de87ed86d7bb4a653a';
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
    CarlaTrafficLightStatus[] traffic_lights
    
    ================================================================================
    MSG: carla_msgs/CarlaTrafficLightStatus
    #
    # Copyright (c) 2020 Intel Corporation.
    #
    # This work is licensed under the terms of the MIT license.
    # For a copy, see <https://opensource.org/licenses/MIT>.
    #
    uint32 id
    
    uint8 RED=0
    uint8 YELLOW=1
    uint8 GREEN=2
    uint8 OFF=3
    uint8 UNKNOWN=4
    
    uint8 state
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CarlaTrafficLightStatusList(null);
    if (msg.traffic_lights !== undefined) {
      resolved.traffic_lights = new Array(msg.traffic_lights.length);
      for (let i = 0; i < resolved.traffic_lights.length; ++i) {
        resolved.traffic_lights[i] = CarlaTrafficLightStatus.Resolve(msg.traffic_lights[i]);
      }
    }
    else {
      resolved.traffic_lights = []
    }

    return resolved;
    }
};

module.exports = CarlaTrafficLightStatusList;
