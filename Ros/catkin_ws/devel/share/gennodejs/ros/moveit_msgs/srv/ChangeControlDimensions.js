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

class ChangeControlDimensionsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.control_x_translation = null;
      this.control_y_translation = null;
      this.control_z_translation = null;
      this.control_x_rotation = null;
      this.control_y_rotation = null;
      this.control_z_rotation = null;
    }
    else {
      if (initObj.hasOwnProperty('control_x_translation')) {
        this.control_x_translation = initObj.control_x_translation
      }
      else {
        this.control_x_translation = false;
      }
      if (initObj.hasOwnProperty('control_y_translation')) {
        this.control_y_translation = initObj.control_y_translation
      }
      else {
        this.control_y_translation = false;
      }
      if (initObj.hasOwnProperty('control_z_translation')) {
        this.control_z_translation = initObj.control_z_translation
      }
      else {
        this.control_z_translation = false;
      }
      if (initObj.hasOwnProperty('control_x_rotation')) {
        this.control_x_rotation = initObj.control_x_rotation
      }
      else {
        this.control_x_rotation = false;
      }
      if (initObj.hasOwnProperty('control_y_rotation')) {
        this.control_y_rotation = initObj.control_y_rotation
      }
      else {
        this.control_y_rotation = false;
      }
      if (initObj.hasOwnProperty('control_z_rotation')) {
        this.control_z_rotation = initObj.control_z_rotation
      }
      else {
        this.control_z_rotation = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeControlDimensionsRequest
    // Serialize message field [control_x_translation]
    bufferOffset = _serializer.bool(obj.control_x_translation, buffer, bufferOffset);
    // Serialize message field [control_y_translation]
    bufferOffset = _serializer.bool(obj.control_y_translation, buffer, bufferOffset);
    // Serialize message field [control_z_translation]
    bufferOffset = _serializer.bool(obj.control_z_translation, buffer, bufferOffset);
    // Serialize message field [control_x_rotation]
    bufferOffset = _serializer.bool(obj.control_x_rotation, buffer, bufferOffset);
    // Serialize message field [control_y_rotation]
    bufferOffset = _serializer.bool(obj.control_y_rotation, buffer, bufferOffset);
    // Serialize message field [control_z_rotation]
    bufferOffset = _serializer.bool(obj.control_z_rotation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeControlDimensionsRequest
    let len;
    let data = new ChangeControlDimensionsRequest(null);
    // Deserialize message field [control_x_translation]
    data.control_x_translation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [control_y_translation]
    data.control_y_translation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [control_z_translation]
    data.control_z_translation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [control_x_rotation]
    data.control_x_rotation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [control_y_rotation]
    data.control_y_rotation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [control_z_rotation]
    data.control_z_rotation = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/ChangeControlDimensionsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '64c0dd6d519e78f5ce2626b06dab34c1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # For use with moveit_jog_arm Cartesian planner
    #
    # Turn on/off jogging along these dimensions.
    # Give 'true' to enable jogging in the direction, 'false' to disable
    bool control_x_translation
    bool control_y_translation
    bool control_z_translation
    bool control_x_rotation
    bool control_y_rotation
    bool control_z_rotation
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeControlDimensionsRequest(null);
    if (msg.control_x_translation !== undefined) {
      resolved.control_x_translation = msg.control_x_translation;
    }
    else {
      resolved.control_x_translation = false
    }

    if (msg.control_y_translation !== undefined) {
      resolved.control_y_translation = msg.control_y_translation;
    }
    else {
      resolved.control_y_translation = false
    }

    if (msg.control_z_translation !== undefined) {
      resolved.control_z_translation = msg.control_z_translation;
    }
    else {
      resolved.control_z_translation = false
    }

    if (msg.control_x_rotation !== undefined) {
      resolved.control_x_rotation = msg.control_x_rotation;
    }
    else {
      resolved.control_x_rotation = false
    }

    if (msg.control_y_rotation !== undefined) {
      resolved.control_y_rotation = msg.control_y_rotation;
    }
    else {
      resolved.control_y_rotation = false
    }

    if (msg.control_z_rotation !== undefined) {
      resolved.control_z_rotation = msg.control_z_rotation;
    }
    else {
      resolved.control_z_rotation = false
    }

    return resolved;
    }
};

class ChangeControlDimensionsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeControlDimensionsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeControlDimensionsResponse
    let len;
    let data = new ChangeControlDimensionsResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/ChangeControlDimensionsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeControlDimensionsResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ChangeControlDimensionsRequest,
  Response: ChangeControlDimensionsResponse,
  md5sum() { return '35b43a24f32e4654e4afa7596399fc3c'; },
  datatype() { return 'moveit_msgs/ChangeControlDimensions'; }
};
