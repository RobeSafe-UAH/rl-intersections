// Auto-generated. Do not edit!

// (in-package carla_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class CarlaWeatherParameters {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cloudiness = null;
      this.precipitation = null;
      this.precipitation_deposits = null;
      this.wind_intensity = null;
      this.fog_density = null;
      this.fog_distance = null;
      this.wetness = null;
      this.sun_azimuth_angle = null;
      this.sun_altitude_angle = null;
    }
    else {
      if (initObj.hasOwnProperty('cloudiness')) {
        this.cloudiness = initObj.cloudiness
      }
      else {
        this.cloudiness = 0.0;
      }
      if (initObj.hasOwnProperty('precipitation')) {
        this.precipitation = initObj.precipitation
      }
      else {
        this.precipitation = 0.0;
      }
      if (initObj.hasOwnProperty('precipitation_deposits')) {
        this.precipitation_deposits = initObj.precipitation_deposits
      }
      else {
        this.precipitation_deposits = 0.0;
      }
      if (initObj.hasOwnProperty('wind_intensity')) {
        this.wind_intensity = initObj.wind_intensity
      }
      else {
        this.wind_intensity = 0.0;
      }
      if (initObj.hasOwnProperty('fog_density')) {
        this.fog_density = initObj.fog_density
      }
      else {
        this.fog_density = 0.0;
      }
      if (initObj.hasOwnProperty('fog_distance')) {
        this.fog_distance = initObj.fog_distance
      }
      else {
        this.fog_distance = 0.0;
      }
      if (initObj.hasOwnProperty('wetness')) {
        this.wetness = initObj.wetness
      }
      else {
        this.wetness = 0.0;
      }
      if (initObj.hasOwnProperty('sun_azimuth_angle')) {
        this.sun_azimuth_angle = initObj.sun_azimuth_angle
      }
      else {
        this.sun_azimuth_angle = 0.0;
      }
      if (initObj.hasOwnProperty('sun_altitude_angle')) {
        this.sun_altitude_angle = initObj.sun_altitude_angle
      }
      else {
        this.sun_altitude_angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CarlaWeatherParameters
    // Serialize message field [cloudiness]
    bufferOffset = _serializer.float32(obj.cloudiness, buffer, bufferOffset);
    // Serialize message field [precipitation]
    bufferOffset = _serializer.float32(obj.precipitation, buffer, bufferOffset);
    // Serialize message field [precipitation_deposits]
    bufferOffset = _serializer.float32(obj.precipitation_deposits, buffer, bufferOffset);
    // Serialize message field [wind_intensity]
    bufferOffset = _serializer.float32(obj.wind_intensity, buffer, bufferOffset);
    // Serialize message field [fog_density]
    bufferOffset = _serializer.float32(obj.fog_density, buffer, bufferOffset);
    // Serialize message field [fog_distance]
    bufferOffset = _serializer.float32(obj.fog_distance, buffer, bufferOffset);
    // Serialize message field [wetness]
    bufferOffset = _serializer.float32(obj.wetness, buffer, bufferOffset);
    // Serialize message field [sun_azimuth_angle]
    bufferOffset = _serializer.float32(obj.sun_azimuth_angle, buffer, bufferOffset);
    // Serialize message field [sun_altitude_angle]
    bufferOffset = _serializer.float32(obj.sun_altitude_angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CarlaWeatherParameters
    let len;
    let data = new CarlaWeatherParameters(null);
    // Deserialize message field [cloudiness]
    data.cloudiness = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [precipitation]
    data.precipitation = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [precipitation_deposits]
    data.precipitation_deposits = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [wind_intensity]
    data.wind_intensity = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fog_density]
    data.fog_density = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [fog_distance]
    data.fog_distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [wetness]
    data.wetness = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sun_azimuth_angle]
    data.sun_azimuth_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [sun_altitude_angle]
    data.sun_altitude_angle = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carla_msgs/CarlaWeatherParameters';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bb273e4588ee8778c1dac74839d4709e';
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
    
    float32 cloudiness
    float32 precipitation
    float32 precipitation_deposits
    float32 wind_intensity
    float32 fog_density
    float32 fog_distance
    float32 wetness
    float32 sun_azimuth_angle
    float32 sun_altitude_angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CarlaWeatherParameters(null);
    if (msg.cloudiness !== undefined) {
      resolved.cloudiness = msg.cloudiness;
    }
    else {
      resolved.cloudiness = 0.0
    }

    if (msg.precipitation !== undefined) {
      resolved.precipitation = msg.precipitation;
    }
    else {
      resolved.precipitation = 0.0
    }

    if (msg.precipitation_deposits !== undefined) {
      resolved.precipitation_deposits = msg.precipitation_deposits;
    }
    else {
      resolved.precipitation_deposits = 0.0
    }

    if (msg.wind_intensity !== undefined) {
      resolved.wind_intensity = msg.wind_intensity;
    }
    else {
      resolved.wind_intensity = 0.0
    }

    if (msg.fog_density !== undefined) {
      resolved.fog_density = msg.fog_density;
    }
    else {
      resolved.fog_density = 0.0
    }

    if (msg.fog_distance !== undefined) {
      resolved.fog_distance = msg.fog_distance;
    }
    else {
      resolved.fog_distance = 0.0
    }

    if (msg.wetness !== undefined) {
      resolved.wetness = msg.wetness;
    }
    else {
      resolved.wetness = 0.0
    }

    if (msg.sun_azimuth_angle !== undefined) {
      resolved.sun_azimuth_angle = msg.sun_azimuth_angle;
    }
    else {
      resolved.sun_azimuth_angle = 0.0
    }

    if (msg.sun_altitude_angle !== undefined) {
      resolved.sun_altitude_angle = msg.sun_altitude_angle;
    }
    else {
      resolved.sun_altitude_angle = 0.0
    }

    return resolved;
    }
};

module.exports = CarlaWeatherParameters;
