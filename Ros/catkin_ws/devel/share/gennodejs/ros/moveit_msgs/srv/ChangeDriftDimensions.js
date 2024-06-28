// Auto-generated. Do not edit!

// (in-package moveit_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ChangeDriftDimensionsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.drift_x_translation = null;
      this.drift_y_translation = null;
      this.drift_z_translation = null;
      this.drift_x_rotation = null;
      this.drift_y_rotation = null;
      this.drift_z_rotation = null;
      this.transform_jog_frame_to_drift_frame = null;
    }
    else {
      if (initObj.hasOwnProperty('drift_x_translation')) {
        this.drift_x_translation = initObj.drift_x_translation
      }
      else {
        this.drift_x_translation = false;
      }
      if (initObj.hasOwnProperty('drift_y_translation')) {
        this.drift_y_translation = initObj.drift_y_translation
      }
      else {
        this.drift_y_translation = false;
      }
      if (initObj.hasOwnProperty('drift_z_translation')) {
        this.drift_z_translation = initObj.drift_z_translation
      }
      else {
        this.drift_z_translation = false;
      }
      if (initObj.hasOwnProperty('drift_x_rotation')) {
        this.drift_x_rotation = initObj.drift_x_rotation
      }
      else {
        this.drift_x_rotation = false;
      }
      if (initObj.hasOwnProperty('drift_y_rotation')) {
        this.drift_y_rotation = initObj.drift_y_rotation
      }
      else {
        this.drift_y_rotation = false;
      }
      if (initObj.hasOwnProperty('drift_z_rotation')) {
        this.drift_z_rotation = initObj.drift_z_rotation
      }
      else {
        this.drift_z_rotation = false;
      }
      if (initObj.hasOwnProperty('transform_jog_frame_to_drift_frame')) {
        this.transform_jog_frame_to_drift_frame = initObj.transform_jog_frame_to_drift_frame
      }
      else {
        this.transform_jog_frame_to_drift_frame = new geometry_msgs.msg.Transform();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeDriftDimensionsRequest
    // Serialize message field [drift_x_translation]
    bufferOffset = _serializer.bool(obj.drift_x_translation, buffer, bufferOffset);
    // Serialize message field [drift_y_translation]
    bufferOffset = _serializer.bool(obj.drift_y_translation, buffer, bufferOffset);
    // Serialize message field [drift_z_translation]
    bufferOffset = _serializer.bool(obj.drift_z_translation, buffer, bufferOffset);
    // Serialize message field [drift_x_rotation]
    bufferOffset = _serializer.bool(obj.drift_x_rotation, buffer, bufferOffset);
    // Serialize message field [drift_y_rotation]
    bufferOffset = _serializer.bool(obj.drift_y_rotation, buffer, bufferOffset);
    // Serialize message field [drift_z_rotation]
    bufferOffset = _serializer.bool(obj.drift_z_rotation, buffer, bufferOffset);
    // Serialize message field [transform_jog_frame_to_drift_frame]
    bufferOffset = geometry_msgs.msg.Transform.serialize(obj.transform_jog_frame_to_drift_frame, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeDriftDimensionsRequest
    let len;
    let data = new ChangeDriftDimensionsRequest(null);
    // Deserialize message field [drift_x_translation]
    data.drift_x_translation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [drift_y_translation]
    data.drift_y_translation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [drift_z_translation]
    data.drift_z_translation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [drift_x_rotation]
    data.drift_x_rotation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [drift_y_rotation]
    data.drift_y_rotation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [drift_z_rotation]
    data.drift_z_rotation = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [transform_jog_frame_to_drift_frame]
    data.transform_jog_frame_to_drift_frame = geometry_msgs.msg.Transform.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 62;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/ChangeDriftDimensionsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4a5ce44f94cdee672e699df89b1ebaf1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # For use with moveit_jog_arm Cartesian planner
    #
    # Allow the robot to drift along these dimensions in a smooth but unregulated way.
    # Give 'true' to enable drift in the direction, 'false' to disable.
    # For example, may allow wrist rotation by drift_x_rotation == true.
    bool drift_x_translation
    bool drift_y_translation
    bool drift_z_translation
    bool drift_x_rotation
    bool drift_y_rotation
    bool drift_z_rotation
    
    # Not implemented as of Jan 2020 (for now assumed to be the identity matrix). In the future it will allow us to transform
    # from the jog control frame to a unique drift frame, so the robot can drift along off-principal axes
    geometry_msgs/Transform transform_jog_frame_to_drift_frame
    
    ================================================================================
    MSG: geometry_msgs/Transform
    # This represents the transform between two coordinate frames in free space.
    
    Vector3 translation
    Quaternion rotation
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeDriftDimensionsRequest(null);
    if (msg.drift_x_translation !== undefined) {
      resolved.drift_x_translation = msg.drift_x_translation;
    }
    else {
      resolved.drift_x_translation = false
    }

    if (msg.drift_y_translation !== undefined) {
      resolved.drift_y_translation = msg.drift_y_translation;
    }
    else {
      resolved.drift_y_translation = false
    }

    if (msg.drift_z_translation !== undefined) {
      resolved.drift_z_translation = msg.drift_z_translation;
    }
    else {
      resolved.drift_z_translation = false
    }

    if (msg.drift_x_rotation !== undefined) {
      resolved.drift_x_rotation = msg.drift_x_rotation;
    }
    else {
      resolved.drift_x_rotation = false
    }

    if (msg.drift_y_rotation !== undefined) {
      resolved.drift_y_rotation = msg.drift_y_rotation;
    }
    else {
      resolved.drift_y_rotation = false
    }

    if (msg.drift_z_rotation !== undefined) {
      resolved.drift_z_rotation = msg.drift_z_rotation;
    }
    else {
      resolved.drift_z_rotation = false
    }

    if (msg.transform_jog_frame_to_drift_frame !== undefined) {
      resolved.transform_jog_frame_to_drift_frame = geometry_msgs.msg.Transform.Resolve(msg.transform_jog_frame_to_drift_frame)
    }
    else {
      resolved.transform_jog_frame_to_drift_frame = new geometry_msgs.msg.Transform()
    }

    return resolved;
    }
};

class ChangeDriftDimensionsResponse {
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
    // Serializes a message object of type ChangeDriftDimensionsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeDriftDimensionsResponse
    let len;
    let data = new ChangeDriftDimensionsResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/ChangeDriftDimensionsResponse';
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
    const resolved = new ChangeDriftDimensionsResponse(null);
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
  Request: ChangeDriftDimensionsRequest,
  Response: ChangeDriftDimensionsResponse,
  md5sum() { return '0d34c8d563fea2efff65829c37132a15'; },
  datatype() { return 'moveit_msgs/ChangeDriftDimensions'; }
};
