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

class JointConstraint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_name = null;
      this.position = null;
      this.tolerance_above = null;
      this.tolerance_below = null;
      this.weight = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_name')) {
        this.joint_name = initObj.joint_name
      }
      else {
        this.joint_name = '';
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = 0.0;
      }
      if (initObj.hasOwnProperty('tolerance_above')) {
        this.tolerance_above = initObj.tolerance_above
      }
      else {
        this.tolerance_above = 0.0;
      }
      if (initObj.hasOwnProperty('tolerance_below')) {
        this.tolerance_below = initObj.tolerance_below
      }
      else {
        this.tolerance_below = 0.0;
      }
      if (initObj.hasOwnProperty('weight')) {
        this.weight = initObj.weight
      }
      else {
        this.weight = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointConstraint
    // Serialize message field [joint_name]
    bufferOffset = _serializer.string(obj.joint_name, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = _serializer.float64(obj.position, buffer, bufferOffset);
    // Serialize message field [tolerance_above]
    bufferOffset = _serializer.float64(obj.tolerance_above, buffer, bufferOffset);
    // Serialize message field [tolerance_below]
    bufferOffset = _serializer.float64(obj.tolerance_below, buffer, bufferOffset);
    // Serialize message field [weight]
    bufferOffset = _serializer.float64(obj.weight, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointConstraint
    let len;
    let data = new JointConstraint(null);
    // Deserialize message field [joint_name]
    data.joint_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tolerance_above]
    data.tolerance_above = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tolerance_below]
    data.tolerance_below = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [weight]
    data.weight = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.joint_name);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/JointConstraint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c02a15146bec0ce13564807805b008f0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Constrain the position of a joint to be within a certain bound
    string joint_name
    
    # the bound to be achieved is [position - tolerance_below, position + tolerance_above]
    float64 position
    float64 tolerance_above
    float64 tolerance_below
    
    # A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
    float64 weight
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointConstraint(null);
    if (msg.joint_name !== undefined) {
      resolved.joint_name = msg.joint_name;
    }
    else {
      resolved.joint_name = ''
    }

    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = 0.0
    }

    if (msg.tolerance_above !== undefined) {
      resolved.tolerance_above = msg.tolerance_above;
    }
    else {
      resolved.tolerance_above = 0.0
    }

    if (msg.tolerance_below !== undefined) {
      resolved.tolerance_below = msg.tolerance_below;
    }
    else {
      resolved.tolerance_below = 0.0
    }

    if (msg.weight !== undefined) {
      resolved.weight = msg.weight;
    }
    else {
      resolved.weight = 0.0
    }

    return resolved;
    }
};

module.exports = JointConstraint;
