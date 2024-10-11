// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class WorkspaceParameters {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.min_corner = null;
      this.max_corner = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('min_corner')) {
        this.min_corner = initObj.min_corner
      }
      else {
        this.min_corner = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('max_corner')) {
        this.max_corner = initObj.max_corner
      }
      else {
        this.max_corner = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WorkspaceParameters
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [min_corner]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.min_corner, buffer, bufferOffset);
    // Serialize message field [max_corner]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.max_corner, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WorkspaceParameters
    let len;
    let data = new WorkspaceParameters(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [min_corner]
    data.min_corner = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [max_corner]
    data.max_corner = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/WorkspaceParameters';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd639a834e7b1f927e9f1d6c30e920016';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message contains a set of parameters useful in
    # setting up the volume (a box) in which the robot is allowed to move.
    # This is useful only when planning for mobile parts of 
    # the robot as well.
    
    # Define the frame of reference for the box corners
    Header header
    
    # The minumum corner of the box, with respect to the robot starting pose
    geometry_msgs/Vector3 min_corner
    
    # The maximum corner of the box, with respect to the robot starting pose
    geometry_msgs/Vector3 max_corner
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WorkspaceParameters(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.min_corner !== undefined) {
      resolved.min_corner = geometry_msgs.msg.Vector3.Resolve(msg.min_corner)
    }
    else {
      resolved.min_corner = new geometry_msgs.msg.Vector3()
    }

    if (msg.max_corner !== undefined) {
      resolved.max_corner = geometry_msgs.msg.Vector3.Resolve(msg.max_corner)
    }
    else {
      resolved.max_corner = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = WorkspaceParameters;
