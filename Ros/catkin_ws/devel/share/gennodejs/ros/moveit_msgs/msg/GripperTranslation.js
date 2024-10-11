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

//-----------------------------------------------------------

class GripperTranslation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.direction = null;
      this.desired_distance = null;
      this.min_distance = null;
    }
    else {
      if (initObj.hasOwnProperty('direction')) {
        this.direction = initObj.direction
      }
      else {
        this.direction = new geometry_msgs.msg.Vector3Stamped();
      }
      if (initObj.hasOwnProperty('desired_distance')) {
        this.desired_distance = initObj.desired_distance
      }
      else {
        this.desired_distance = 0.0;
      }
      if (initObj.hasOwnProperty('min_distance')) {
        this.min_distance = initObj.min_distance
      }
      else {
        this.min_distance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GripperTranslation
    // Serialize message field [direction]
    bufferOffset = geometry_msgs.msg.Vector3Stamped.serialize(obj.direction, buffer, bufferOffset);
    // Serialize message field [desired_distance]
    bufferOffset = _serializer.float32(obj.desired_distance, buffer, bufferOffset);
    // Serialize message field [min_distance]
    bufferOffset = _serializer.float32(obj.min_distance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GripperTranslation
    let len;
    let data = new GripperTranslation(null);
    // Deserialize message field [direction]
    data.direction = geometry_msgs.msg.Vector3Stamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [desired_distance]
    data.desired_distance = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [min_distance]
    data.min_distance = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.Vector3Stamped.getMessageSize(object.direction);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/GripperTranslation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b53bc0ad0f717cdec3b0e42dec300121';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # defines a translation for the gripper, used in pickup or place tasks
    # for example for lifting an object off a table or approaching the table for placing
    
    # the direction of the translation
    geometry_msgs/Vector3Stamped direction
    
    # the desired translation distance
    float32 desired_distance
    
    # the min distance that must be considered feasible before the
    # grasp is even attempted
    float32 min_distance
    
    ================================================================================
    MSG: geometry_msgs/Vector3Stamped
    # This represents a Vector3 with reference coordinate frame and timestamp
    Header header
    Vector3 vector
    
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
    const resolved = new GripperTranslation(null);
    if (msg.direction !== undefined) {
      resolved.direction = geometry_msgs.msg.Vector3Stamped.Resolve(msg.direction)
    }
    else {
      resolved.direction = new geometry_msgs.msg.Vector3Stamped()
    }

    if (msg.desired_distance !== undefined) {
      resolved.desired_distance = msg.desired_distance;
    }
    else {
      resolved.desired_distance = 0.0
    }

    if (msg.min_distance !== undefined) {
      resolved.min_distance = msg.min_distance;
    }
    else {
      resolved.min_distance = 0.0
    }

    return resolved;
    }
};

module.exports = GripperTranslation;
