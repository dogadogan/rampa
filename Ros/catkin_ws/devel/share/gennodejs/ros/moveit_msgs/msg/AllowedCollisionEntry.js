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

class AllowedCollisionEntry {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.enabled = null;
    }
    else {
      if (initObj.hasOwnProperty('enabled')) {
        this.enabled = initObj.enabled
      }
      else {
        this.enabled = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AllowedCollisionEntry
    // Serialize message field [enabled]
    bufferOffset = _arraySerializer.bool(obj.enabled, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AllowedCollisionEntry
    let len;
    let data = new AllowedCollisionEntry(null);
    // Deserialize message field [enabled]
    data.enabled = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.enabled.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/AllowedCollisionEntry';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '90d1ae1850840724bb043562fe3285fc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # whether or not collision checking is enabled
    bool[] enabled
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AllowedCollisionEntry(null);
    if (msg.enabled !== undefined) {
      resolved.enabled = msg.enabled;
    }
    else {
      resolved.enabled = []
    }

    return resolved;
    }
};

module.exports = AllowedCollisionEntry;
