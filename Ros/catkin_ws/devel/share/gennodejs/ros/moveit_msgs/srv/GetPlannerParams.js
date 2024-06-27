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

let PlannerParams = require('../msg/PlannerParams.js');

//-----------------------------------------------------------

class GetPlannerParamsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.planner_config = null;
      this.group = null;
    }
    else {
      if (initObj.hasOwnProperty('planner_config')) {
        this.planner_config = initObj.planner_config
      }
      else {
        this.planner_config = '';
      }
      if (initObj.hasOwnProperty('group')) {
        this.group = initObj.group
      }
      else {
        this.group = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPlannerParamsRequest
    // Serialize message field [planner_config]
    bufferOffset = _serializer.string(obj.planner_config, buffer, bufferOffset);
    // Serialize message field [group]
    bufferOffset = _serializer.string(obj.group, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPlannerParamsRequest
    let len;
    let data = new GetPlannerParamsRequest(null);
    // Deserialize message field [planner_config]
    data.planner_config = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [group]
    data.group = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.planner_config);
    length += _getByteLength(object.group);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/GetPlannerParamsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f548a13784550d510d791867af53ef40';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Name of planning config
    string planner_config
    
    # Optional name of planning group (return global defaults if empty)
    string group
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetPlannerParamsRequest(null);
    if (msg.planner_config !== undefined) {
      resolved.planner_config = msg.planner_config;
    }
    else {
      resolved.planner_config = ''
    }

    if (msg.group !== undefined) {
      resolved.group = msg.group;
    }
    else {
      resolved.group = ''
    }

    return resolved;
    }
};

class GetPlannerParamsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.params = null;
    }
    else {
      if (initObj.hasOwnProperty('params')) {
        this.params = initObj.params
      }
      else {
        this.params = new PlannerParams();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPlannerParamsResponse
    // Serialize message field [params]
    bufferOffset = PlannerParams.serialize(obj.params, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPlannerParamsResponse
    let len;
    let data = new GetPlannerParamsResponse(null);
    // Deserialize message field [params]
    data.params = PlannerParams.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += PlannerParams.getMessageSize(object.params);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/GetPlannerParamsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '462b1bd59976ece800f6a48f2b0bf1a2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # parameters as key-value pairs
    PlannerParams params
    
    
    ================================================================================
    MSG: moveit_msgs/PlannerParams
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
    const resolved = new GetPlannerParamsResponse(null);
    if (msg.params !== undefined) {
      resolved.params = PlannerParams.Resolve(msg.params)
    }
    else {
      resolved.params = new PlannerParams()
    }

    return resolved;
    }
};

module.exports = {
  Request: GetPlannerParamsRequest,
  Response: GetPlannerParamsResponse,
  md5sum() { return 'b3ec1aca2b1471e3eea051c548c69810'; },
  datatype() { return 'moveit_msgs/GetPlannerParams'; }
};
