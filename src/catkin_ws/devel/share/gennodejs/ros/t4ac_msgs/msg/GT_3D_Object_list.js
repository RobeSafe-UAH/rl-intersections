// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GT_3D_Object = require('./GT_3D_Object.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class GT_3D_Object_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.gt_3d_object_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('gt_3d_object_list')) {
        this.gt_3d_object_list = initObj.gt_3d_object_list
      }
      else {
        this.gt_3d_object_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GT_3D_Object_list
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [gt_3d_object_list]
    // Serialize the length for message field [gt_3d_object_list]
    bufferOffset = _serializer.uint32(obj.gt_3d_object_list.length, buffer, bufferOffset);
    obj.gt_3d_object_list.forEach((val) => {
      bufferOffset = GT_3D_Object.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GT_3D_Object_list
    let len;
    let data = new GT_3D_Object_list(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [gt_3d_object_list]
    // Deserialize array length for message field [gt_3d_object_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.gt_3d_object_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.gt_3d_object_list[i] = GT_3D_Object.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.gt_3d_object_list.forEach((val) => {
      length += GT_3D_Object.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/GT_3D_Object_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '13a224db64e6563b6b9b60a32f1db87e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    Header header                           # Frame and timestamp information
    GT_3D_Object[] gt_3d_object_list        # List of GT 3D Objects
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
    MSG: t4ac_msgs/GT_3D_Object
    # Techs4AgeCar project
    
    string type                                 # Object type if it is known (car, pedestrian, truck, etc)
    uint32 object_id                            # Id assign to an object
    float32 alpha                               # Observation angle of object
    vision_msgs/BoundingBox2D bounding_box_2D   # Object 2D bounding box
    geometry_msgs/Point position                # Center of the object
    geometry_msgs/Vector3 dimensions            # Object dimensions (l, w, h)
    float32 rotation_z                          # Object rotation along z axis
    geometry_msgs/Vector3 velocity              # Velocity of the object related to the ego vehicle
    float32 truncated                           # Float from 0 (non-truncated) to 1 (truncated), where truncated refers to the object leaving image boundaries
    uint8 occluded                              # Integer (0,1,2,3) indicating occlusion state: 0 = fully visible, 1 = partly occluded, 2 = largely occluded, 3 = not visible to the camera
    ================================================================================
    MSG: vision_msgs/BoundingBox2D
    # A 2D bounding box that can be rotated about its center.
    # All dimensions are in pixels, but represented using floating-point
    #   values to allow sub-pixel precision. If an exact pixel crop is required
    #   for a rotated bounding box, it can be calculated using Bresenham's line
    #   algorithm.
    
    # The 2D position (in pixels) and orientation of the bounding box center.
    geometry_msgs/Pose2D center
    
    # The size (in pixels) of the bounding box surrounding the object relative
    #   to the pose of its center.
    float64 size_x
    float64 size_y
    
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # Deprecated
    # Please use the full 3D pose.
    
    # In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.
    
    # If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.
    
    
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
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
    const resolved = new GT_3D_Object_list(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.gt_3d_object_list !== undefined) {
      resolved.gt_3d_object_list = new Array(msg.gt_3d_object_list.length);
      for (let i = 0; i < resolved.gt_3d_object_list.length; ++i) {
        resolved.gt_3d_object_list[i] = GT_3D_Object.Resolve(msg.gt_3d_object_list[i]);
      }
    }
    else {
      resolved.gt_3d_object_list = []
    }

    return resolved;
    }
};

module.exports = GT_3D_Object_list;
