// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let JointLimits = require('./JointLimits.js');

//-----------------------------------------------------------

class KinematicSolverInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_names = null;
      this.limits = null;
      this.link_names = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_names')) {
        this.joint_names = initObj.joint_names
      }
      else {
        this.joint_names = [];
      }
      if (initObj.hasOwnProperty('limits')) {
        this.limits = initObj.limits
      }
      else {
        this.limits = [];
      }
      if (initObj.hasOwnProperty('link_names')) {
        this.link_names = initObj.link_names
      }
      else {
        this.link_names = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type KinematicSolverInfo
    // Serialize message field [joint_names]
    bufferOffset = _arraySerializer.string(obj.joint_names, buffer, bufferOffset, null);
    // Serialize message field [limits]
    // Serialize the length for message field [limits]
    bufferOffset = _serializer.uint32(obj.limits.length, buffer, bufferOffset);
    obj.limits.forEach((val) => {
      bufferOffset = JointLimits.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [link_names]
    bufferOffset = _arraySerializer.string(obj.link_names, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type KinematicSolverInfo
    let len;
    let data = new KinematicSolverInfo(null);
    // Deserialize message field [joint_names]
    data.joint_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [limits]
    // Deserialize array length for message field [limits]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.limits = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.limits[i] = JointLimits.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [link_names]
    data.link_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joint_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.limits.forEach((val) => {
      length += JointLimits.getMessageSize(val);
    });
    object.link_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/KinematicSolverInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cc048557c0f9795c392dd80f8bb00489';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # A list of joints in the kinematic tree
    string[] joint_names
    # A list of joint limits corresponding to the joint names
    moveit_msgs/JointLimits[] limits
    # A list of links that the kinematics node provides solutions for
    string[] link_names
    
    ================================================================================
    MSG: moveit_msgs/JointLimits
    # This message contains information about limits of a particular joint (or control dimension)
    string joint_name
    
    # true if the joint has position limits
    bool has_position_limits
    
    # min and max position limits
    float64 min_position
    float64 max_position
    
    # true if joint has velocity limits
    bool has_velocity_limits
    
    # max velocity limit
    float64 max_velocity
    # min_velocity is assumed to be -max_velocity
    
    # true if joint has acceleration limits
    bool has_acceleration_limits
    # max acceleration limit
    float64 max_acceleration
    # min_acceleration is assumed to be -max_acceleration
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new KinematicSolverInfo(null);
    if (msg.joint_names !== undefined) {
      resolved.joint_names = msg.joint_names;
    }
    else {
      resolved.joint_names = []
    }

    if (msg.limits !== undefined) {
      resolved.limits = new Array(msg.limits.length);
      for (let i = 0; i < resolved.limits.length; ++i) {
        resolved.limits[i] = JointLimits.Resolve(msg.limits[i]);
      }
    }
    else {
      resolved.limits = []
    }

    if (msg.link_names !== undefined) {
      resolved.link_names = msg.link_names;
    }
    else {
      resolved.link_names = []
    }

    return resolved;
    }
};

module.exports = KinematicSolverInfo;
