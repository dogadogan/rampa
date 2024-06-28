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

class CheckIfRobotStateExistsInWarehouseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.robot = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
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
    // Serializes a message object of type CheckIfRobotStateExistsInWarehouseRequest
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [robot]
    bufferOffset = _serializer.string(obj.robot, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckIfRobotStateExistsInWarehouseRequest
    let len;
    let data = new CheckIfRobotStateExistsInWarehouseRequest(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot]
    data.robot = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    length += _getByteLength(object.robot);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/CheckIfRobotStateExistsInWarehouseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dab44354403f811c40b84964e068219c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    string robot
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckIfRobotStateExistsInWarehouseRequest(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
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

class CheckIfRobotStateExistsInWarehouseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.exists = null;
    }
    else {
      if (initObj.hasOwnProperty('exists')) {
        this.exists = initObj.exists
      }
      else {
        this.exists = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CheckIfRobotStateExistsInWarehouseResponse
    // Serialize message field [exists]
    bufferOffset = _serializer.bool(obj.exists, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CheckIfRobotStateExistsInWarehouseResponse
    let len;
    let data = new CheckIfRobotStateExistsInWarehouseResponse(null);
    // Deserialize message field [exists]
    data.exists = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/CheckIfRobotStateExistsInWarehouseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e8c90de4adc1219c86af9c2874c0c1b5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool exists
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CheckIfRobotStateExistsInWarehouseResponse(null);
    if (msg.exists !== undefined) {
      resolved.exists = msg.exists;
    }
    else {
      resolved.exists = false
    }

    return resolved;
    }
};

module.exports = {
  Request: CheckIfRobotStateExistsInWarehouseRequest,
  Response: CheckIfRobotStateExistsInWarehouseResponse,
  md5sum() { return '3b47364b81dd44f643fa67c9cd127486'; },
  datatype() { return 'moveit_msgs/CheckIfRobotStateExistsInWarehouse'; }
};
