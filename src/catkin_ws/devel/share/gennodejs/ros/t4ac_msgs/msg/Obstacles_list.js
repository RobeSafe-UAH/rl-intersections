// Auto-generated. Do not edit!

// (in-package t4ac_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Obstacle = require('./Obstacle.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Obstacles_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.obstacles_list = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('obstacles_list')) {
        this.obstacles_list = initObj.obstacles_list
      }
      else {
        this.obstacles_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Obstacles_list
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [obstacles_list]
    // Serialize the length for message field [obstacles_list]
    bufferOffset = _serializer.uint32(obj.obstacles_list.length, buffer, bufferOffset);
    obj.obstacles_list.forEach((val) => {
      bufferOffset = Obstacle.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Obstacles_list
    let len;
    let data = new Obstacles_list(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [obstacles_list]
    // Deserialize array length for message field [obstacles_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.obstacles_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.obstacles_list[i] = Obstacle.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.obstacles_list.forEach((val) => {
      length += Obstacle.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 't4ac_msgs/Obstacles_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c5382525edc2a5ee0a08af26c50c5e4c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Techs4AgeCar project
    
    Header header
    
    Obstacle[] obstacles_list # List of obstacles
    
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
    MSG: t4ac_msgs/Obstacle
    # Techs4AgeCar project
    
    Header header
    
    geometry_msgs/Pose pose		# Pose at the center of mass
    float64 dist2ego            # Distance to ego-vehicle
    geometry_msgs/Twist twist	# Velocity at the center of mass
    geometry_msgs/Polygon shape	# Box containing the obstacle
    int64 road_id			# Road_id in which the obstacle is
    string type			# Obstacle type if it is known (car, pedestrian, sign, etc)
    
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
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
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
    ================================================================================
    MSG: geometry_msgs/Polygon
    #A specification of a polygon where the first and last points are assumed to be connected
    Point32[] points
    
    ================================================================================
    MSG: geometry_msgs/Point32
    # This contains the position of a point in free space(with 32 bits of precision).
    # It is recommeded to use Point wherever possible instead of Point32.  
    # 
    # This recommendation is to promote interoperability.  
    #
    # This message is designed to take up less space when sending
    # lots of points at once, as in the case of a PointCloud.  
    
    float32 x
    float32 y
    float32 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Obstacles_list(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.obstacles_list !== undefined) {
      resolved.obstacles_list = new Array(msg.obstacles_list.length);
      for (let i = 0; i < resolved.obstacles_list.length; ++i) {
        resolved.obstacles_list[i] = Obstacle.Resolve(msg.obstacles_list[i]);
      }
    }
    else {
      resolved.obstacles_list = []
    }

    return resolved;
    }
};

module.exports = Obstacles_list;
