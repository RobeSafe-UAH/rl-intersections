// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let vision_msgs = _finder('vision_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GT_3D_Object {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.object_id = null;
      this.alpha = null;
      this.bounding_box_2D = null;
      this.position = null;
      this.dimensions = null;
      this.rotation_z = null;
      this.velocity = null;
      this.truncated = null;
      this.occluded = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = '';
      }
      if (initObj.hasOwnProperty('object_id')) {
        this.object_id = initObj.object_id
      }
      else {
        this.object_id = 0;
      }
      if (initObj.hasOwnProperty('alpha')) {
        this.alpha = initObj.alpha
      }
      else {
        this.alpha = 0.0;
      }
      if (initObj.hasOwnProperty('bounding_box_2D')) {
        this.bounding_box_2D = initObj.bounding_box_2D
      }
      else {
        this.bounding_box_2D = new vision_msgs.msg.BoundingBox2D();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('dimensions')) {
        this.dimensions = initObj.dimensions
      }
      else {
        this.dimensions = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('rotation_z')) {
        this.rotation_z = initObj.rotation_z
      }
      else {
        this.rotation_z = 0.0;
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('truncated')) {
        this.truncated = initObj.truncated
      }
      else {
        this.truncated = 0.0;
      }
      if (initObj.hasOwnProperty('occluded')) {
        this.occluded = initObj.occluded
      }
      else {
        this.occluded = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GT_3D_Object
    // Serialize message field [type]
    bufferOffset = _serializer.string(obj.type, buffer, bufferOffset);
    // Serialize message field [object_id]
    bufferOffset = _serializer.uint32(obj.object_id, buffer, bufferOffset);
    // Serialize message field [alpha]
    bufferOffset = _serializer.float32(obj.alpha, buffer, bufferOffset);
    // Serialize message field [bounding_box_2D]
    bufferOffset = vision_msgs.msg.BoundingBox2D.serialize(obj.bounding_box_2D, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [dimensions]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.dimensions, buffer, bufferOffset);
    // Serialize message field [rotation_z]
    bufferOffset = _serializer.float32(obj.rotation_z, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [truncated]
    bufferOffset = _serializer.float32(obj.truncated, buffer, bufferOffset);
    // Serialize message field [occluded]
    bufferOffset = _serializer.uint8(obj.occluded, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GT_3D_Object
    let len;
    let data = new GT_3D_Object(null);
    // Deserialize message field [type]
    data.type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [object_id]
    data.object_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [alpha]
    data.alpha = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bounding_box_2D]
    data.bounding_box_2D = vision_msgs.msg.BoundingBox2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [dimensions]
    data.dimensions = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [rotation_z]
    data.rotation_z = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [truncated]
    data.truncated = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [occluded]
    data.occluded = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.type);
    return length + 133;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/GT_3D_Object';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ca62318d44e5363ce4cf524c880fbfa2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new GT_3D_Object(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = ''
    }

    if (msg.object_id !== undefined) {
      resolved.object_id = msg.object_id;
    }
    else {
      resolved.object_id = 0
    }

    if (msg.alpha !== undefined) {
      resolved.alpha = msg.alpha;
    }
    else {
      resolved.alpha = 0.0
    }

    if (msg.bounding_box_2D !== undefined) {
      resolved.bounding_box_2D = vision_msgs.msg.BoundingBox2D.Resolve(msg.bounding_box_2D)
    }
    else {
      resolved.bounding_box_2D = new vision_msgs.msg.BoundingBox2D()
    }

    if (msg.position !== undefined) {
      resolved.position = geometry_msgs.msg.Point.Resolve(msg.position)
    }
    else {
      resolved.position = new geometry_msgs.msg.Point()
    }

    if (msg.dimensions !== undefined) {
      resolved.dimensions = geometry_msgs.msg.Vector3.Resolve(msg.dimensions)
    }
    else {
      resolved.dimensions = new geometry_msgs.msg.Vector3()
    }

    if (msg.rotation_z !== undefined) {
      resolved.rotation_z = msg.rotation_z;
    }
    else {
      resolved.rotation_z = 0.0
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = geometry_msgs.msg.Vector3.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new geometry_msgs.msg.Vector3()
    }

    if (msg.truncated !== undefined) {
      resolved.truncated = msg.truncated;
    }
    else {
      resolved.truncated = 0.0
    }

    if (msg.occluded !== undefined) {
      resolved.occluded = msg.occluded;
    }
    else {
      resolved.occluded = 0
    }

    return resolved;
    }
};

module.exports = GT_3D_Object;
