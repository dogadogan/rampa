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

let PlannerInterfaceDescription = require('../msg/PlannerInterfaceDescription.js');

//-----------------------------------------------------------

class QueryPlannerInterfacesRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QueryPlannerInterfacesRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QueryPlannerInterfacesRequest
    let len;
    let data = new QueryPlannerInterfacesRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/QueryPlannerInterfacesRequest';
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
    const resolved = new QueryPlannerInterfacesRequest(null);
    return resolved;
    }
};

class QueryPlannerInterfacesResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.planner_interfaces = null;
    }
    else {
      if (initObj.hasOwnProperty('planner_interfaces')) {
        this.planner_interfaces = initObj.planner_interfaces
      }
      else {
        this.planner_interfaces = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QueryPlannerInterfacesResponse
    // Serialize message field [planner_interfaces]
    // Serialize the length for message field [planner_interfaces]
    bufferOffset = _serializer.uint32(obj.planner_interfaces.length, buffer, bufferOffset);
    obj.planner_interfaces.forEach((val) => {
      bufferOffset = PlannerInterfaceDescription.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QueryPlannerInterfacesResponse
    let len;
    let data = new QueryPlannerInterfacesResponse(null);
    // Deserialize message field [planner_interfaces]
    // Deserialize array length for message field [planner_interfaces]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.planner_interfaces = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.planner_interfaces[i] = PlannerInterfaceDescription.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.planner_interfaces.forEach((val) => {
      length += PlannerInterfaceDescription.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/QueryPlannerInterfacesResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'acd3317a4c5631f33127fb428209db05';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # The planning instances that could be used in the benchmark
    PlannerInterfaceDescription[] planner_interfaces
    
    
    ================================================================================
    MSG: moveit_msgs/PlannerInterfaceDescription
    # The name of the planner interface
    string name
    
    # The names of the planner ids within the interface
    string[] planner_ids
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new QueryPlannerInterfacesResponse(null);
    if (msg.planner_interfaces !== undefined) {
      resolved.planner_interfaces = new Array(msg.planner_interfaces.length);
      for (let i = 0; i < resolved.planner_interfaces.length; ++i) {
        resolved.planner_interfaces[i] = PlannerInterfaceDescription.Resolve(msg.planner_interfaces[i]);
      }
    }
    else {
      resolved.planner_interfaces = []
    }

    return resolved;
    }
};

module.exports = {
  Request: QueryPlannerInterfacesRequest,
  Response: QueryPlannerInterfacesResponse,
  md5sum() { return 'acd3317a4c5631f33127fb428209db05'; },
  datatype() { return 'moveit_msgs/QueryPlannerInterfaces'; }
};
