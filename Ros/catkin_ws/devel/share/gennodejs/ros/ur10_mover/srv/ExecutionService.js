// Auto-generated. Do not edit!

// (in-package ur10_mover.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ListOfFloats = require('../msg/ListOfFloats.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ExecutionServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joint_states = null;
    }
    else {
      if (initObj.hasOwnProperty('joint_states')) {
        this.joint_states = initObj.joint_states
      }
      else {
        this.joint_states = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExecutionServiceRequest
    // Serialize message field [joint_states]
    // Serialize the length for message field [joint_states]
    bufferOffset = _serializer.uint32(obj.joint_states.length, buffer, bufferOffset);
    obj.joint_states.forEach((val) => {
      bufferOffset = ListOfFloats.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExecutionServiceRequest
    let len;
    let data = new ExecutionServiceRequest(null);
    // Deserialize message field [joint_states]
    // Deserialize array length for message field [joint_states]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.joint_states = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.joint_states[i] = ListOfFloats.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joint_states.forEach((val) => {
      length += ListOfFloats.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/ExecutionServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ad64a8c77c8e0058db48fb69961d2443';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ur10_mover/ListOfFloats[] joint_states
    
    ================================================================================
    MSG: ur10_mover/ListOfFloats
    float64[] list
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ExecutionServiceRequest(null);
    if (msg.joint_states !== undefined) {
      resolved.joint_states = new Array(msg.joint_states.length);
      for (let i = 0; i < resolved.joint_states.length; ++i) {
        resolved.joint_states[i] = ListOfFloats.Resolve(msg.joint_states[i]);
      }
    }
    else {
      resolved.joint_states = []
    }

    return resolved;
    }
};

class ExecutionServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output_msg = null;
    }
    else {
      if (initObj.hasOwnProperty('output_msg')) {
        this.output_msg = initObj.output_msg
      }
      else {
        this.output_msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExecutionServiceResponse
    // Serialize message field [output_msg]
    bufferOffset = _serializer.string(obj.output_msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExecutionServiceResponse
    let len;
    let data = new ExecutionServiceResponse(null);
    // Deserialize message field [output_msg]
    data.output_msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.output_msg);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/ExecutionServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ef13bd7685401359f42466106b070713';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string output_msg
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ExecutionServiceResponse(null);
    if (msg.output_msg !== undefined) {
      resolved.output_msg = msg.output_msg;
    }
    else {
      resolved.output_msg = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: ExecutionServiceRequest,
  Response: ExecutionServiceResponse,
  md5sum() { return '200ed2e45e29d7b67fa3d65a61af734d'; },
  datatype() { return 'ur10_mover/ExecutionService'; }
};
