// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Way = require('./Way.js');

//-----------------------------------------------------------

class Lane {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left = null;
      this.right = null;
      this.role = null;
    }
    else {
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = new Way();
      }
      if (initObj.hasOwnProperty('right')) {
        this.right = initObj.right
      }
      else {
        this.right = new Way();
      }
      if (initObj.hasOwnProperty('role')) {
        this.role = initObj.role
      }
      else {
        this.role = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Lane
    // Serialize message field [left]
    bufferOffset = Way.serialize(obj.left, buffer, bufferOffset);
    // Serialize message field [right]
    bufferOffset = Way.serialize(obj.right, buffer, bufferOffset);
    // Serialize message field [role]
    bufferOffset = _serializer.string(obj.role, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Lane
    let len;
    let data = new Lane(null);
    // Deserialize message field [left]
    data.left = Way.deserialize(buffer, bufferOffset);
    // Deserialize message field [right]
    data.right = Way.deserialize(buffer, bufferOffset);
    // Deserialize message field [role]
    data.role = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Way.getMessageSize(object.left);
    length += Way.getMessageSize(object.right);
    length += _getByteLength(object.role);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Lane';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '392f655a22f5ea3284af2c1a7aca7f99';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ## Lane definition (from the Carla library) in ROS message format
    #
    # Lanes are mapped using PythonAPI from Carla.
    # They are made up from one "Way" that determine its left and right bounds
    
    #uint8 speedlimit	# mapped max speed in km/h
    Way left		# mapped left boundary
    Way right		# mapped right boundary 
    string role     	# Role: current, backside, left, right
    
    #--OPTIONAL--
    #int32 lane_id 		# lane id from xodr
    #bool is_junction	# true if is on a junction 
    #float lane_width	# horizontal size of the road
    
    #string type		# mapped type of lanelet
    
    ================================================================================
    MSG: t4ac_msgs/Way
    # Way definition 
    
    Node[] way	# list of nodes
    
    
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
    const resolved = new Lane(null);
    if (msg.left !== undefined) {
      resolved.left = Way.Resolve(msg.left)
    }
    else {
      resolved.left = new Way()
    }

    if (msg.right !== undefined) {
      resolved.right = Way.Resolve(msg.right)
    }
    else {
      resolved.right = new Way()
    }

    if (msg.role !== undefined) {
      resolved.role = msg.role;
    }
    else {
      resolved.role = ''
    }

    return resolved;
    }
};

module.exports = Lane;
