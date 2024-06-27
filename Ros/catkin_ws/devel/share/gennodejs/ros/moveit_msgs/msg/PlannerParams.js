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

class PlannerParams {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.keys = null;
      this.values = null;
      this.descriptions = null;
    }
    else {
      if (initObj.hasOwnProperty('keys')) {
        this.keys = initObj.keys
      }
      else {
        this.keys = [];
      }
      if (initObj.hasOwnProperty('values')) {
        this.values = initObj.values
      }
      else {
        this.values = [];
      }
      if (initObj.hasOwnProperty('descriptions')) {
        this.descriptions = initObj.descriptions
      }
      else {
        this.descriptions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlannerParams
    // Serialize message field [keys]
    bufferOffset = _arraySerializer.string(obj.keys, buffer, bufferOffset, null);
    // Serialize message field [values]
    bufferOffset = _arraySerializer.string(obj.values, buffer, bufferOffset, null);
    // Serialize message field [descriptions]
    bufferOffset = _arraySerializer.string(obj.descriptions, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlannerParams
    let len;
    let data = new PlannerParams(null);
    // Deserialize message field [keys]
    data.keys = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [values]
    data.values = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [descriptions]
    data.descriptions = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.keys.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.values.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.descriptions.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/PlannerParams';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cebdf4927996b9026bcf59a160d64145';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # parameter names (same size as values)
    string[] keys
    
    # parameter values (same size as keys)
    string[] values
    
    # parameter description (can be empty)
    string[] descriptions
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlannerParams(null);
    if (msg.keys !== undefined) {
      resolved.keys = msg.keys;
    }
    else {
      resolved.keys = []
    }

    if (msg.values !== undefined) {
      resolved.values = msg.values;
    }
    else {
      resolved.values = []
    }

    if (msg.descriptions !== undefined) {
      resolved.descriptions = msg.descriptions;
    }
    else {
      resolved.descriptions = []
    }

    return resolved;
    }
};

module.exports = PlannerParams;
