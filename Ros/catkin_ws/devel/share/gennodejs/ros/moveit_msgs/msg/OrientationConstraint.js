// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class OrientationConstraint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.orientation = null;
      this.link_name = null;
      this.absolute_x_axis_tolerance = null;
      this.absolute_y_axis_tolerance = null;
      this.absolute_z_axis_tolerance = null;
      this.weight = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('link_name')) {
        this.link_name = initObj.link_name
      }
      else {
        this.link_name = '';
      }
      if (initObj.hasOwnProperty('absolute_x_axis_tolerance')) {
        this.absolute_x_axis_tolerance = initObj.absolute_x_axis_tolerance
      }
      else {
        this.absolute_x_axis_tolerance = 0.0;
      }
      if (initObj.hasOwnProperty('absolute_y_axis_tolerance')) {
        this.absolute_y_axis_tolerance = initObj.absolute_y_axis_tolerance
      }
      else {
        this.absolute_y_axis_tolerance = 0.0;
      }
      if (initObj.hasOwnProperty('absolute_z_axis_tolerance')) {
        this.absolute_z_axis_tolerance = initObj.absolute_z_axis_tolerance
      }
      else {
        this.absolute_z_axis_tolerance = 0.0;
      }
      if (initObj.hasOwnProperty('weight')) {
        this.weight = initObj.weight
      }
      else {
        this.weight = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OrientationConstraint
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.orientation, buffer, bufferOffset);
    // Serialize message field [link_name]
    bufferOffset = _serializer.string(obj.link_name, buffer, bufferOffset);
    // Serialize message field [absolute_x_axis_tolerance]
    bufferOffset = _serializer.float64(obj.absolute_x_axis_tolerance, buffer, bufferOffset);
    // Serialize message field [absolute_y_axis_tolerance]
    bufferOffset = _serializer.float64(obj.absolute_y_axis_tolerance, buffer, bufferOffset);
    // Serialize message field [absolute_z_axis_tolerance]
    bufferOffset = _serializer.float64(obj.absolute_z_axis_tolerance, buffer, bufferOffset);
    // Serialize message field [weight]
    bufferOffset = _serializer.float64(obj.weight, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OrientationConstraint
    let len;
    let data = new OrientationConstraint(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [link_name]
    data.link_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [absolute_x_axis_tolerance]
    data.absolute_x_axis_tolerance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [absolute_y_axis_tolerance]
    data.absolute_y_axis_tolerance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [absolute_z_axis_tolerance]
    data.absolute_z_axis_tolerance = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [weight]
    data.weight = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.link_name);
    return length + 68;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/OrientationConstraint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ab5cefb9bc4c0089620f5eb4caf4e59a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message contains the definition of an orientation constraint.
    
    Header header
    
    # The desired orientation of the robot link specified as a quaternion
    geometry_msgs/Quaternion orientation
    
    # The robot link this constraint refers to
    string link_name
    
    # optional axis-angle error tolerances specified
    float64 absolute_x_axis_tolerance
    float64 absolute_y_axis_tolerance
    float64 absolute_z_axis_tolerance
    
    # A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
    float64 weight
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
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
    const resolved = new OrientationConstraint(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = geometry_msgs.msg.Quaternion.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new geometry_msgs.msg.Quaternion()
    }

    if (msg.link_name !== undefined) {
      resolved.link_name = msg.link_name;
    }
    else {
      resolved.link_name = ''
    }

    if (msg.absolute_x_axis_tolerance !== undefined) {
      resolved.absolute_x_axis_tolerance = msg.absolute_x_axis_tolerance;
    }
    else {
      resolved.absolute_x_axis_tolerance = 0.0
    }

    if (msg.absolute_y_axis_tolerance !== undefined) {
      resolved.absolute_y_axis_tolerance = msg.absolute_y_axis_tolerance;
    }
    else {
      resolved.absolute_y_axis_tolerance = 0.0
    }

    if (msg.absolute_z_axis_tolerance !== undefined) {
      resolved.absolute_z_axis_tolerance = msg.absolute_z_axis_tolerance;
    }
    else {
      resolved.absolute_z_axis_tolerance = 0.0
    }

    if (msg.weight !== undefined) {
      resolved.weight = msg.weight;
    }
    else {
      resolved.weight = 0.0
    }

    return resolved;
    }
};

module.exports = OrientationConstraint;
