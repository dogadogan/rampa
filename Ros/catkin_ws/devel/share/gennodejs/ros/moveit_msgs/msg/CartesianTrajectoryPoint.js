// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CartesianPoint = require('./CartesianPoint.js');

//-----------------------------------------------------------

class CartesianTrajectoryPoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.point = null;
      this.time_from_start = null;
    }
    else {
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = new CartesianPoint();
      }
      if (initObj.hasOwnProperty('time_from_start')) {
        this.time_from_start = initObj.time_from_start
      }
      else {
        this.time_from_start = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CartesianTrajectoryPoint
    // Serialize message field [point]
    bufferOffset = CartesianPoint.serialize(obj.point, buffer, bufferOffset);
    // Serialize message field [time_from_start]
    bufferOffset = _serializer.duration(obj.time_from_start, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CartesianTrajectoryPoint
    let len;
    let data = new CartesianTrajectoryPoint(null);
    // Deserialize message field [point]
    data.point = CartesianPoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [time_from_start]
    data.time_from_start = _deserializer.duration(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 160;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/CartesianTrajectoryPoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e996ea294f646e6911b3e85e624f5acf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,
    # following the pattern of the JointTrajectory message
    CartesianPoint point
    
    duration time_from_start
    
    ================================================================================
    MSG: moveit_msgs/CartesianPoint
    # This message defines a point in a cartesian trajectory
    geometry_msgs/Pose pose
    geometry_msgs/Twist velocity
    geometry_msgs/Accel acceleration
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
    MSG: geometry_msgs/Accel
    # This expresses acceleration in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CartesianTrajectoryPoint(null);
    if (msg.point !== undefined) {
      resolved.point = CartesianPoint.Resolve(msg.point)
    }
    else {
      resolved.point = new CartesianPoint()
    }

    if (msg.time_from_start !== undefined) {
      resolved.time_from_start = msg.time_from_start;
    }
    else {
      resolved.time_from_start = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = CartesianTrajectoryPoint;
