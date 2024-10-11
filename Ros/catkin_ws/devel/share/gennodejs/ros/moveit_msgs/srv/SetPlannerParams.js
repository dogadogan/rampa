// Auto-generated. Do not edit!

// (in-package moveit_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PlannerParams = require('../msg/PlannerParams.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetPlannerParamsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.planner_config = null;
      this.group = null;
      this.params = null;
      this.replace = null;
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
      if (initObj.hasOwnProperty('params')) {
        this.params = initObj.params
      }
      else {
        this.params = new PlannerParams();
      }
      if (initObj.hasOwnProperty('replace')) {
        this.replace = initObj.replace
      }
      else {
        this.replace = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetPlannerParamsRequest
    // Serialize message field [planner_config]
    bufferOffset = _serializer.string(obj.planner_config, buffer, bufferOffset);
    // Serialize message field [group]
    bufferOffset = _serializer.string(obj.group, buffer, bufferOffset);
    // Serialize message field [params]
    bufferOffset = PlannerParams.serialize(obj.params, buffer, bufferOffset);
    // Serialize message field [replace]
    bufferOffset = _serializer.bool(obj.replace, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPlannerParamsRequest
    let len;
    let data = new SetPlannerParamsRequest(null);
    // Deserialize message field [planner_config]
    data.planner_config = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [group]
    data.group = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [params]
    data.params = PlannerParams.deserialize(buffer, bufferOffset);
    // Deserialize message field [replace]
    data.replace = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.planner_config);
    length += _getByteLength(object.group);
    length += PlannerParams.getMessageSize(object.params);
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/SetPlannerParamsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '86762d89189c5f52cda7680fdbceb1db';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Name of planning config
    string planner_config
    
    # Optional name of planning group (set global defaults if empty)
    string group
    
    # parameters as key-value pairs
    PlannerParams params
    
    # replace params or augment existing ones?
    bool replace
    
    
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
    const resolved = new SetPlannerParamsRequest(null);
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

    if (msg.params !== undefined) {
      resolved.params = PlannerParams.Resolve(msg.params)
    }
    else {
      resolved.params = new PlannerParams()
    }

    if (msg.replace !== undefined) {
      resolved.replace = msg.replace;
    }
    else {
      resolved.replace = false
    }

    return resolved;
    }
};

class SetPlannerParamsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetPlannerParamsResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetPlannerParamsResponse
    let len;
    let data = new SetPlannerParamsResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/SetPlannerParamsResponse';
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
    const resolved = new SetPlannerParamsResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: SetPlannerParamsRequest,
  Response: SetPlannerParamsResponse,
  md5sum() { return '86762d89189c5f52cda7680fdbceb1db'; },
  datatype() { return 'moveit_msgs/SetPlannerParams'; }
};
