// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class JointLimits {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_name = null;
      this.has_position_limits = null;
      this.min_position = null;
      this.max_position = null;
      this.has_velocity_limits = null;
      this.max_velocity = null;
      this.has_acceleration_limits = null;
      this.max_acceleration = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_name')) {
        this.joint_name = initObj.joint_name
      }
      else {
        this.joint_name = '';
      }
      if (initObj.hasOwnProperty('has_position_limits')) {
        this.has_position_limits = initObj.has_position_limits
      }
      else {
        this.has_position_limits = false;
      }
      if (initObj.hasOwnProperty('min_position')) {
        this.min_position = initObj.min_position
      }
      else {
        this.min_position = 0.0;
      }
      if (initObj.hasOwnProperty('max_position')) {
        this.max_position = initObj.max_position
      }
      else {
        this.max_position = 0.0;
      }
      if (initObj.hasOwnProperty('has_velocity_limits')) {
        this.has_velocity_limits = initObj.has_velocity_limits
      }
      else {
        this.has_velocity_limits = false;
      }
      if (initObj.hasOwnProperty('max_velocity')) {
        this.max_velocity = initObj.max_velocity
      }
      else {
        this.max_velocity = 0.0;
      }
      if (initObj.hasOwnProperty('has_acceleration_limits')) {
        this.has_acceleration_limits = initObj.has_acceleration_limits
      }
      else {
        this.has_acceleration_limits = false;
      }
      if (initObj.hasOwnProperty('max_acceleration')) {
        this.max_acceleration = initObj.max_acceleration
      }
      else {
        this.max_acceleration = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointLimits
    // Serialize message field [joint_name]
    bufferOffset = _serializer.string(obj.joint_name, buffer, bufferOffset);
    // Serialize message field [has_position_limits]
    bufferOffset = _serializer.bool(obj.has_position_limits, buffer, bufferOffset);
    // Serialize message field [min_position]
    bufferOffset = _serializer.float64(obj.min_position, buffer, bufferOffset);
    // Serialize message field [max_position]
    bufferOffset = _serializer.float64(obj.max_position, buffer, bufferOffset);
    // Serialize message field [has_velocity_limits]
    bufferOffset = _serializer.bool(obj.has_velocity_limits, buffer, bufferOffset);
    // Serialize message field [max_velocity]
    bufferOffset = _serializer.float64(obj.max_velocity, buffer, bufferOffset);
    // Serialize message field [has_acceleration_limits]
    bufferOffset = _serializer.bool(obj.has_acceleration_limits, buffer, bufferOffset);
    // Serialize message field [max_acceleration]
    bufferOffset = _serializer.float64(obj.max_acceleration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointLimits
    let len;
    let data = new JointLimits(null);
    // Deserialize message field [joint_name]
    data.joint_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [has_position_limits]
    data.has_position_limits = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [min_position]
    data.min_position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_position]
    data.max_position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [has_velocity_limits]
    data.has_velocity_limits = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [max_velocity]
    data.max_velocity = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [has_acceleration_limits]
    data.has_acceleration_limits = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [max_acceleration]
    data.max_acceleration = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.joint_name);
    return length + 39;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/JointLimits';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8ca618c7329ea46142cbc864a2efe856';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new JointLimits(null);
    if (msg.joint_name !== undefined) {
      resolved.joint_name = msg.joint_name;
    }
    else {
      resolved.joint_name = ''
    }

    if (msg.has_position_limits !== undefined) {
      resolved.has_position_limits = msg.has_position_limits;
    }
    else {
      resolved.has_position_limits = false
    }

    if (msg.min_position !== undefined) {
      resolved.min_position = msg.min_position;
    }
    else {
      resolved.min_position = 0.0
    }

    if (msg.max_position !== undefined) {
      resolved.max_position = msg.max_position;
    }
    else {
      resolved.max_position = 0.0
    }

    if (msg.has_velocity_limits !== undefined) {
      resolved.has_velocity_limits = msg.has_velocity_limits;
    }
    else {
      resolved.has_velocity_limits = false
    }

    if (msg.max_velocity !== undefined) {
      resolved.max_velocity = msg.max_velocity;
    }
    else {
      resolved.max_velocity = 0.0
    }

    if (msg.has_acceleration_limits !== undefined) {
      resolved.has_acceleration_limits = msg.has_acceleration_limits;
    }
    else {
      resolved.has_acceleration_limits = false
    }

    if (msg.max_acceleration !== undefined) {
      resolved.max_acceleration = msg.max_acceleration;
    }
    else {
      resolved.max_acceleration = 0.0
    }

    return resolved;
    }
};

module.exports = JointLimits;
