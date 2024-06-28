// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let AllowedCollisionEntry = require('./AllowedCollisionEntry.js');

//-----------------------------------------------------------

class AllowedCollisionMatrix {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.entry_names = null;
      this.entry_values = null;
      this.default_entry_names = null;
      this.default_entry_values = null;
    }
    else {
      if (initObj.hasOwnProperty('entry_names')) {
        this.entry_names = initObj.entry_names
      }
      else {
        this.entry_names = [];
      }
      if (initObj.hasOwnProperty('entry_values')) {
        this.entry_values = initObj.entry_values
      }
      else {
        this.entry_values = [];
      }
      if (initObj.hasOwnProperty('default_entry_names')) {
        this.default_entry_names = initObj.default_entry_names
      }
      else {
        this.default_entry_names = [];
      }
      if (initObj.hasOwnProperty('default_entry_values')) {
        this.default_entry_values = initObj.default_entry_values
      }
      else {
        this.default_entry_values = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AllowedCollisionMatrix
    // Serialize message field [entry_names]
    bufferOffset = _arraySerializer.string(obj.entry_names, buffer, bufferOffset, null);
    // Serialize message field [entry_values]
    // Serialize the length for message field [entry_values]
    bufferOffset = _serializer.uint32(obj.entry_values.length, buffer, bufferOffset);
    obj.entry_values.forEach((val) => {
      bufferOffset = AllowedCollisionEntry.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [default_entry_names]
    bufferOffset = _arraySerializer.string(obj.default_entry_names, buffer, bufferOffset, null);
    // Serialize message field [default_entry_values]
    bufferOffset = _arraySerializer.bool(obj.default_entry_values, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AllowedCollisionMatrix
    let len;
    let data = new AllowedCollisionMatrix(null);
    // Deserialize message field [entry_names]
    data.entry_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [entry_values]
    // Deserialize array length for message field [entry_values]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.entry_values = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.entry_values[i] = AllowedCollisionEntry.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [default_entry_names]
    data.default_entry_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [default_entry_values]
    data.default_entry_values = _arrayDeserializer.bool(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.entry_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.entry_values.forEach((val) => {
      length += AllowedCollisionEntry.getMessageSize(val);
    });
    object.default_entry_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += object.default_entry_values.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/AllowedCollisionMatrix';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'aedce13587eef0d79165a075659c1879';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The list of entry names in the matrix
    string[] entry_names
    
    # The individual entries in the allowed collision matrix
    # square, symmetric, with same order as entry_names
    AllowedCollisionEntry[] entry_values
    
    # In addition to the collision matrix itself, we also have 
    # the default entry value for each entry name.
    
    # If the allowed collision flag is queried for a pair of names (n1, n2)
    # that is not found in the collision matrix itself, the value of
    # the collision flag is considered to be that of the entry (n1 or n2)
    # specified in the list below. If both n1 and n2 are found in the list 
    # of defaults, the result is computed with an AND operation
    
    string[] default_entry_names
    bool[] default_entry_values
    
    ================================================================================
    MSG: moveit_msgs/AllowedCollisionEntry
    # whether or not collision checking is enabled
    bool[] enabled
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AllowedCollisionMatrix(null);
    if (msg.entry_names !== undefined) {
      resolved.entry_names = msg.entry_names;
    }
    else {
      resolved.entry_names = []
    }

    if (msg.entry_values !== undefined) {
      resolved.entry_values = new Array(msg.entry_values.length);
      for (let i = 0; i < resolved.entry_values.length; ++i) {
        resolved.entry_values[i] = AllowedCollisionEntry.Resolve(msg.entry_values[i]);
      }
    }
    else {
      resolved.entry_values = []
    }

    if (msg.default_entry_names !== undefined) {
      resolved.default_entry_names = msg.default_entry_names;
    }
    else {
      resolved.default_entry_names = []
    }

    if (msg.default_entry_values !== undefined) {
      resolved.default_entry_values = msg.default_entry_values;
    }
    else {
      resolved.default_entry_values = []
    }

    return resolved;
    }
};

module.exports = AllowedCollisionMatrix;
