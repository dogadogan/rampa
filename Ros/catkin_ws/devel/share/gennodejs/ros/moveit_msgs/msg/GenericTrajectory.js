// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CartesianTrajectory = require('./CartesianTrajectory.js');
let trajectory_msgs = _finder('trajectory_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class GenericTrajectory {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.joint_trajectory = null;
      this.cartesian_trajectory = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('joint_trajectory')) {
        this.joint_trajectory = initObj.joint_trajectory
      }
      else {
        this.joint_trajectory = [];
      }
      if (initObj.hasOwnProperty('cartesian_trajectory')) {
        this.cartesian_trajectory = initObj.cartesian_trajectory
      }
      else {
        this.cartesian_trajectory = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GenericTrajectory
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [joint_trajectory]
    // Serialize the length for message field [joint_trajectory]
    bufferOffset = _serializer.uint32(obj.joint_trajectory.length, buffer, bufferOffset);
    obj.joint_trajectory.forEach((val) => {
      bufferOffset = trajectory_msgs.msg.JointTrajectory.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [cartesian_trajectory]
    // Serialize the length for message field [cartesian_trajectory]
    bufferOffset = _serializer.uint32(obj.cartesian_trajectory.length, buffer, bufferOffset);
    obj.cartesian_trajectory.forEach((val) => {
      bufferOffset = CartesianTrajectory.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GenericTrajectory
    let len;
    let data = new GenericTrajectory(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [joint_trajectory]
    // Deserialize array length for message field [joint_trajectory]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.joint_trajectory = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.joint_trajectory[i] = trajectory_msgs.msg.JointTrajectory.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [cartesian_trajectory]
    // Deserialize array length for message field [cartesian_trajectory]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.cartesian_trajectory = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.cartesian_trajectory[i] = CartesianTrajectory.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.joint_trajectory.forEach((val) => {
      length += trajectory_msgs.msg.JointTrajectory.getMessageSize(val);
    });
    object.cartesian_trajectory.forEach((val) => {
      length += CartesianTrajectory.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/GenericTrajectory';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd68b5c73072efa2012238a77e49c2c58';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # A generic trajectory message that may either encode a joint- or cartesian-space trajectory, or both
    # Trajectories encoded in this message are considered semantically equivalent
    Header header
    trajectory_msgs/JointTrajectory[] joint_trajectory
    moveit_msgs/CartesianTrajectory[] cartesian_trajectory
    
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
    MSG: trajectory_msgs/JointTrajectory
    Header header
    string[] joint_names
    JointTrajectoryPoint[] points
    
    ================================================================================
    MSG: trajectory_msgs/JointTrajectoryPoint
    # Each trajectory point specifies either positions[, velocities[, accelerations]]
    # or positions[, effort] for the trajectory to be executed.
    # All specified values are in the same order as the joint names in JointTrajectory.msg
    
    float64[] positions
    float64[] velocities
    float64[] accelerations
    float64[] effort
    duration time_from_start
    
    ================================================================================
    MSG: moveit_msgs/CartesianTrajectory
    # This message describes the trajectory of a tracked frame in task-space
    Header header
    
    # The name of the Cartesian frame being tracked with respect to the base frame provided in header.frame_id
    string tracked_frame
    
    CartesianTrajectoryPoint[] points
    
    ================================================================================
    MSG: moveit_msgs/CartesianTrajectoryPoint
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
    const resolved = new GenericTrajectory(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.joint_trajectory !== undefined) {
      resolved.joint_trajectory = new Array(msg.joint_trajectory.length);
      for (let i = 0; i < resolved.joint_trajectory.length; ++i) {
        resolved.joint_trajectory[i] = trajectory_msgs.msg.JointTrajectory.Resolve(msg.joint_trajectory[i]);
      }
    }
    else {
      resolved.joint_trajectory = []
    }

    if (msg.cartesian_trajectory !== undefined) {
      resolved.cartesian_trajectory = new Array(msg.cartesian_trajectory.length);
      for (let i = 0; i < resolved.cartesian_trajectory.length; ++i) {
        resolved.cartesian_trajectory[i] = CartesianTrajectory.Resolve(msg.cartesian_trajectory[i]);
      }
    }
    else {
      resolved.cartesian_trajectory = []
    }

    return resolved;
    }
};

module.exports = GenericTrajectory;
