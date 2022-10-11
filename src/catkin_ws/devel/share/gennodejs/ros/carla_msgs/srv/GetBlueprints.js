// Auto-generated. Do not edit!

// (in-package carla_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetBlueprintsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.filter = null;
    }
    else {
      if (initObj.hasOwnProperty('filter')) {
        this.filter = initObj.filter
      }
      else {
        this.filter = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetBlueprintsRequest
    // Serialize message field [filter]
    bufferOffset = _serializer.string(obj.filter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetBlueprintsRequest
    let len;
    let data = new GetBlueprintsRequest(null);
    // Deserialize message field [filter]
    data.filter = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.filter);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'carla_msgs/GetBlueprintsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0665b698518980c549ffcc60283b661c';
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
    string filter
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetBlueprintsRequest(null);
    if (msg.filter !== undefined) {
      resolved.filter = msg.filter;
    }
    else {
      resolved.filter = ''
    }

    return resolved;
    }
};

class GetBlueprintsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.blueprints = null;
    }
    else {
      if (initObj.hasOwnProperty('blueprints')) {
        this.blueprints = initObj.blueprints
      }
      else {
        this.blueprints = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetBlueprintsResponse
    // Serialize message field [blueprints]
    bufferOffset = _arraySerializer.string(obj.blueprints, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetBlueprintsResponse
    let len;
    let data = new GetBlueprintsResponse(null);
    // Deserialize message field [blueprints]
    data.blueprints = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.blueprints.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'carla_msgs/GetBlueprintsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '878cac0b77601336a2c3267a758e0e31';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] blueprints
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetBlueprintsResponse(null);
    if (msg.blueprints !== undefined) {
      resolved.blueprints = msg.blueprints;
    }
    else {
      resolved.blueprints = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetBlueprintsRequest,
  Response: GetBlueprintsResponse,
  md5sum() { return '8c8fca221e4d3a2dbeec92f6b3d2eda4'; },
  datatype() { return 'carla_msgs/GetBlueprints'; }
};
