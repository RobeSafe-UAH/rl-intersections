// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Bounding_Box_3D = require('./Bounding_Box_3D.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Bounding_Box_3D_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.bounding_box_3d_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('bounding_box_3d_list')) {
        this.bounding_box_3d_list = initObj.bounding_box_3d_list
      }
      else {
        this.bounding_box_3d_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Bounding_Box_3D_list
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [bounding_box_3d_list]
    // Serialize the length for message field [bounding_box_3d_list]
    bufferOffset = _serializer.uint32(obj.bounding_box_3d_list.length, buffer, bufferOffset);
    obj.bounding_box_3d_list.forEach((val) => {
      bufferOffset = Bounding_Box_3D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Bounding_Box_3D_list
    let len;
    let data = new Bounding_Box_3D_list(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [bounding_box_3d_list]
    // Deserialize array length for message field [bounding_box_3d_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bounding_box_3d_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bounding_box_3d_list[i] = Bounding_Box_3D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.bounding_box_3d_list.forEach((val) => {
      length += Bounding_Box_3D.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Bounding_Box_3D_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68148d914255b67811779dc40b20532f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    Header header                          # Frame and timestamp information
    
    Bounding_Box_3D[] bounding_box_3d_list # List of 3D Bounding Boxes 
                                           # (may include their velocity)
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: t4ac_msgs/Bounding_Box_3D
    # Techs4AgeCar project
    
    string                           type         # Object type
    float64                          score        # Object probability (0 to 1)
    
    geometry_msgs/PoseWithCovariance pose         # Centroid x,y,z, yaw (Laser frame)
    float64                          l            # Object length (Originally along x-laser frame)
    float64                          w            # Object width (Originally along y-laser frame)
    float64                          h            # Object height (z-laser frame)
    Node[]                           corners_3d   # 3D bbox coordinates (x,y,z ; Laser frame)
    float64                          vel_lin      # Absolute global linear velocity
    float64                          vel_ang      # Absolute global angular velocity
    
    
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
    const resolved = new Bounding_Box_3D_list(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.bounding_box_3d_list !== undefined) {
      resolved.bounding_box_3d_list = new Array(msg.bounding_box_3d_list.length);
      for (let i = 0; i < resolved.bounding_box_3d_list.length; ++i) {
        resolved.bounding_box_3d_list[i] = Bounding_Box_3D.Resolve(msg.bounding_box_3d_list[i]);
      }
    }
    else {
      resolved.bounding_box_3d_list = []
    }

    return resolved;
    }
};

module.exports = Bounding_Box_3D_list;
