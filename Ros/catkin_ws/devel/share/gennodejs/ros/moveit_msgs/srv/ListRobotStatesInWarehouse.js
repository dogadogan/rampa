// Auto-generated. Do not edit!

// (in-package moveit_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ListRobotStatesInWarehouseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.regex = null;
      this.robot = null;
    }
    else {
      if (initObj.hasOwnProperty('regex')) {
        this.regex = initObj.regex
      }
      else {
        this.regex = '';
      }
      if (initObj.hasOwnProperty('robot')) {
        this.robot = initObj.robot
      }
      else {
        this.robot = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ListRobotStatesInWarehouseRequest
    // Serialize message field [regex]
    bufferOffset = _serializer.string(obj.regex, buffer, bufferOffset);
    // Serialize message field [robot]
    bufferOffset = _serializer.string(obj.robot, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ListRobotStatesInWarehouseRequest
    let len;
    let data = new ListRobotStatesInWarehouseRequest(null);
    // Deserialize message field [regex]
    data.regex = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot]
    data.robot = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.regex);
    length += _getByteLength(object.robot);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/ListRobotStatesInWarehouseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6f0970a3ca837e2fc3ed63e314b44b42';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string regex
    string robot
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ListRobotStatesInWarehouseRequest(null);
    if (msg.regex !== undefined) {
      resolved.regex = msg.regex;
    }
    else {
      resolved.regex = ''
    }

    if (msg.robot !== undefined) {
      resolved.robot = msg.robot;
    }
    else {
      resolved.robot = ''
    }

    return resolved;
    }
};

class ListRobotStatesInWarehouseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.states = null;
    }
    else {
      if (initObj.hasOwnProperty('states')) {
        this.states = initObj.states
      }
      else {
        this.states = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ListRobotStatesInWarehouseResponse
    // Serialize message field [states]
    bufferOffset = _arraySerializer.string(obj.states, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ListRobotStatesInWarehouseResponse
    let len;
    let data = new ListRobotStatesInWarehouseResponse(null);
    // Deserialize message field [states]
    data.states = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.states.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/ListRobotStatesInWarehouseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a8656b247c0429bb79afe0ddb88eb2f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    string[] states
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ListRobotStatesInWarehouseResponse(null);
    if (msg.states !== undefined) {
      resolved.states = msg.states;
    }
    else {
      resolved.states = []
    }

    return resolved;
    }
};

module.exports = {
  Request: ListRobotStatesInWarehouseRequest,
  Response: ListRobotStatesInWarehouseResponse,
  md5sum() { return 'dc02fa289e68670e9d392985a0235ee6'; },
  datatype() { return 'moveit_msgs/ListRobotStatesInWarehouse'; }
};
