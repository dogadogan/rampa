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

class RenameRobotStateInWarehouseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.old_name = null;
      this.new_name = null;
      this.robot = null;
    }
    else {
      if (initObj.hasOwnProperty('old_name')) {
        this.old_name = initObj.old_name
      }
      else {
        this.old_name = '';
      }
      if (initObj.hasOwnProperty('new_name')) {
        this.new_name = initObj.new_name
      }
      else {
        this.new_name = '';
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
    // Serializes a message object of type RenameRobotStateInWarehouseRequest
    // Serialize message field [old_name]
    bufferOffset = _serializer.string(obj.old_name, buffer, bufferOffset);
    // Serialize message field [new_name]
    bufferOffset = _serializer.string(obj.new_name, buffer, bufferOffset);
    // Serialize message field [robot]
    bufferOffset = _serializer.string(obj.robot, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RenameRobotStateInWarehouseRequest
    let len;
    let data = new RenameRobotStateInWarehouseRequest(null);
    // Deserialize message field [old_name]
    data.old_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [new_name]
    data.new_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot]
    data.robot = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.old_name);
    length += _getByteLength(object.new_name);
    length += _getByteLength(object.robot);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/RenameRobotStateInWarehouseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '073dc05c3fd313b947cea483c25c46b0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string old_name
    string new_name
    string robot
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RenameRobotStateInWarehouseRequest(null);
    if (msg.old_name !== undefined) {
      resolved.old_name = msg.old_name;
    }
    else {
      resolved.old_name = ''
    }

    if (msg.new_name !== undefined) {
      resolved.new_name = msg.new_name;
    }
    else {
      resolved.new_name = ''
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

class RenameRobotStateInWarehouseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RenameRobotStateInWarehouseResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RenameRobotStateInWarehouseResponse
    let len;
    let data = new RenameRobotStateInWarehouseResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/RenameRobotStateInWarehouseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RenameRobotStateInWarehouseResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: RenameRobotStateInWarehouseRequest,
  Response: RenameRobotStateInWarehouseResponse,
  md5sum() { return '073dc05c3fd313b947cea483c25c46b0'; },
  datatype() { return 'moveit_msgs/RenameRobotStateInWarehouse'; }
};
