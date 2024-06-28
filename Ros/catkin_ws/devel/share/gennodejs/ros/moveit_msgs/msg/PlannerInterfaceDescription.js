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

class PlannerInterfaceDescription {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.planner_ids = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('planner_ids')) {
        this.planner_ids = initObj.planner_ids
      }
      else {
        this.planner_ids = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlannerInterfaceDescription
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [planner_ids]
    bufferOffset = _arraySerializer.string(obj.planner_ids, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlannerInterfaceDescription
    let len;
    let data = new PlannerInterfaceDescription(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [planner_ids]
    data.planner_ids = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    object.planner_ids.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/PlannerInterfaceDescription';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ea5f6e6129aa1b110ccda9900d2bf25e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new PlannerInterfaceDescription(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.planner_ids !== undefined) {
      resolved.planner_ids = msg.planner_ids;
    }
    else {
      resolved.planner_ids = []
    }

    return resolved;
    }
};

module.exports = PlannerInterfaceDescription;
