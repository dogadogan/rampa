// Auto-generated. Do not edit!

// (in-package ur10_mover.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class StateServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_msg = null;
    }
    else {
      if (initObj.hasOwnProperty('input_msg')) {
        this.input_msg = initObj.input_msg
      }
      else {
        this.input_msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StateServiceRequest
    // Serialize message field [input_msg]
    bufferOffset = _serializer.string(obj.input_msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StateServiceRequest
    let len;
    let data = new StateServiceRequest(null);
    // Deserialize message field [input_msg]
    data.input_msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.input_msg);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/StateServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2beecd7d8a70aad2184c84345d0cd8d3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string input_msg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StateServiceRequest(null);
    if (msg.input_msg !== undefined) {
      resolved.input_msg = msg.input_msg;
    }
    else {
      resolved.input_msg = ''
    }

    return resolved;
    }
};

class StateServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output_msg = null;
      this.current_joint_angles = null;
    }
    else {
      if (initObj.hasOwnProperty('output_msg')) {
        this.output_msg = initObj.output_msg
      }
      else {
        this.output_msg = '';
      }
      if (initObj.hasOwnProperty('current_joint_angles')) {
        this.current_joint_angles = initObj.current_joint_angles
      }
      else {
        this.current_joint_angles = new Array(6).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StateServiceResponse
    // Serialize message field [output_msg]
    bufferOffset = _serializer.string(obj.output_msg, buffer, bufferOffset);
    // Check that the constant length array field [current_joint_angles] has the right length
    if (obj.current_joint_angles.length !== 6) {
      throw new Error('Unable to serialize array field current_joint_angles - length must be 6')
    }
    // Serialize message field [current_joint_angles]
    bufferOffset = _arraySerializer.float64(obj.current_joint_angles, buffer, bufferOffset, 6);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StateServiceResponse
    let len;
    let data = new StateServiceResponse(null);
    // Deserialize message field [output_msg]
    data.output_msg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [current_joint_angles]
    data.current_joint_angles = _arrayDeserializer.float64(buffer, bufferOffset, 6)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.output_msg);
    return length + 52;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/StateServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9e7aee8efb870b0111c155e8c0755e88';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string output_msg
    float64[6] current_joint_angles
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StateServiceResponse(null);
    if (msg.output_msg !== undefined) {
      resolved.output_msg = msg.output_msg;
    }
    else {
      resolved.output_msg = ''
    }

    if (msg.current_joint_angles !== undefined) {
      resolved.current_joint_angles = msg.current_joint_angles;
    }
    else {
      resolved.current_joint_angles = new Array(6).fill(0)
    }

    return resolved;
    }
};

module.exports = {
  Request: StateServiceRequest,
  Response: StateServiceResponse,
  md5sum() { return '30fae736b7734374461e907d8c1eb052'; },
  datatype() { return 'ur10_mover/StateService'; }
};
