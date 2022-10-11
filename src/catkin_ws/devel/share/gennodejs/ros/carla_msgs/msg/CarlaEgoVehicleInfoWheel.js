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

class CarlaEgoVehicleInfoWheel {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tire_friction = null;
      this.damping_rate = null;
      this.max_steer_angle = null;
      this.radius = null;
      this.max_brake_torque = null;
      this.max_handbrake_torque = null;
      this.position = null;
    }
    else {
      if (initObj.hasOwnProperty('tire_friction')) {
        this.tire_friction = initObj.tire_friction
      }
      else {
        this.tire_friction = 0.0;
      }
      if (initObj.hasOwnProperty('damping_rate')) {
        this.damping_rate = initObj.damping_rate
      }
      else {
        this.damping_rate = 0.0;
      }
      if (initObj.hasOwnProperty('max_steer_angle')) {
        this.max_steer_angle = initObj.max_steer_angle
      }
      else {
        this.max_steer_angle = 0.0;
      }
      if (initObj.hasOwnProperty('radius')) {
        this.radius = initObj.radius
      }
      else {
        this.radius = 0.0;
      }
      if (initObj.hasOwnProperty('max_brake_torque')) {
        this.max_brake_torque = initObj.max_brake_torque
      }
      else {
        this.max_brake_torque = 0.0;
      }
      if (initObj.hasOwnProperty('max_handbrake_torque')) {
        this.max_handbrake_torque = initObj.max_handbrake_torque
      }
      else {
        this.max_handbrake_torque = 0.0;
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CarlaEgoVehicleInfoWheel
    // Serialize message field [tire_friction]
    bufferOffset = _serializer.float32(obj.tire_friction, buffer, bufferOffset);
    // Serialize message field [damping_rate]
    bufferOffset = _serializer.float32(obj.damping_rate, buffer, bufferOffset);
    // Serialize message field [max_steer_angle]
    bufferOffset = _serializer.float32(obj.max_steer_angle, buffer, bufferOffset);
    // Serialize message field [radius]
    bufferOffset = _serializer.float32(obj.radius, buffer, bufferOffset);
    // Serialize message field [max_brake_torque]
    bufferOffset = _serializer.float32(obj.max_brake_torque, buffer, bufferOffset);
    // Serialize message field [max_handbrake_torque]
    bufferOffset = _serializer.float32(obj.max_handbrake_torque, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CarlaEgoVehicleInfoWheel
    let len;
    let data = new CarlaEgoVehicleInfoWheel(null);
    // Deserialize message field [tire_friction]
    data.tire_friction = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [damping_rate]
    data.damping_rate = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_steer_angle]
    data.max_steer_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [radius]
    data.radius = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_brake_torque]
    data.max_brake_torque = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_handbrake_torque]
    data.max_handbrake_torque = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'carla_msgs/CarlaEgoVehicleInfoWheel';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '192cba6d0621954855f8c957508a83b4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    # Copyright (c) 2019-2020 Intel Corporation.
    #
    # This work is licensed under the terms of the MIT license.
    # For a copy, see <https://opensource.org/licenses/MIT>.
    #
    float32 tire_friction
    float32 damping_rate
    float32 max_steer_angle
    float32 radius
    float32 max_brake_torque
    float32 max_handbrake_torque
    geometry_msgs/Vector3 position
    
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
    const resolved = new CarlaEgoVehicleInfoWheel(null);
    if (msg.tire_friction !== undefined) {
      resolved.tire_friction = msg.tire_friction;
    }
    else {
      resolved.tire_friction = 0.0
    }

    if (msg.damping_rate !== undefined) {
      resolved.damping_rate = msg.damping_rate;
    }
    else {
      resolved.damping_rate = 0.0
    }

    if (msg.max_steer_angle !== undefined) {
      resolved.max_steer_angle = msg.max_steer_angle;
    }
    else {
      resolved.max_steer_angle = 0.0
    }

    if (msg.radius !== undefined) {
      resolved.radius = msg.radius;
    }
    else {
      resolved.radius = 0.0
    }

    if (msg.max_brake_torque !== undefined) {
      resolved.max_brake_torque = msg.max_brake_torque;
    }
    else {
      resolved.max_brake_torque = 0.0
    }

    if (msg.max_handbrake_torque !== undefined) {
      resolved.max_handbrake_torque = msg.max_handbrake_torque;
    }
    else {
      resolved.max_handbrake_torque = 0.0
    }

    if (msg.position !== undefined) {
      resolved.position = geometry_msgs.msg.Vector3.Resolve(msg.position)
    }
    else {
      resolved.position = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = CarlaEgoVehicleInfoWheel;
