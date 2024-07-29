// Auto-generated. Do not edit!

// (in-package ur10_mover.srv)


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

class SampleServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_msg = null;
      this.condition_poses = null;
      this.context = null;
    }
    else {
      if (initObj.hasOwnProperty('input_msg')) {
        this.input_msg = initObj.input_msg
      }
      else {
        this.input_msg = '';
      }
      if (initObj.hasOwnProperty('condition_poses')) {
        this.condition_poses = initObj.condition_poses
      }
      else {
        this.condition_poses = [];
      }
      if (initObj.hasOwnProperty('context')) {
        this.context = initObj.context
      }
      else {
        this.context = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SampleServiceRequest
    // Serialize message field [input_msg]
    bufferOffset = _serializer.string(obj.input_msg, buffer, bufferOffset);
    // Serialize message field [condition_poses]
    // Serialize the length for message field [condition_poses]
    bufferOffset = _serializer.uint32(obj.condition_poses.length, buffer, bufferOffset);
    obj.condition_poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [context]
    bufferOffset = _serializer.float64(obj.context, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SampleServiceRequest
    let len;
    let data = new SampleServiceRequest(null);
    // Deserialize message field [input_msg]
    data.input_msg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [condition_poses]
    // Deserialize array length for message field [condition_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.condition_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.condition_poses[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [context]
    data.context = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.input_msg);
    length += 56 * object.condition_poses.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/SampleServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '80b48f9c302347801e022f4750bf5612';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string input_msg
    geometry_msgs/Pose[] condition_poses
    float64 context
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
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
    const resolved = new SampleServiceRequest(null);
    if (msg.input_msg !== undefined) {
      resolved.input_msg = msg.input_msg;
    }
    else {
      resolved.input_msg = ''
    }

    if (msg.condition_poses !== undefined) {
      resolved.condition_poses = new Array(msg.condition_poses.length);
      for (let i = 0; i < resolved.condition_poses.length; ++i) {
        resolved.condition_poses[i] = geometry_msgs.msg.Pose.Resolve(msg.condition_poses[i]);
      }
    }
    else {
      resolved.condition_poses = []
    }

    if (msg.context !== undefined) {
      resolved.context = msg.context;
    }
    else {
      resolved.context = 0.0
    }

    return resolved;
    }
};

class SampleServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output_msg = null;
      this.sampled_trajectory = null;
    }
    else {
      if (initObj.hasOwnProperty('output_msg')) {
        this.output_msg = initObj.output_msg
      }
      else {
        this.output_msg = '';
      }
      if (initObj.hasOwnProperty('sampled_trajectory')) {
        this.sampled_trajectory = initObj.sampled_trajectory
      }
      else {
        this.sampled_trajectory = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SampleServiceResponse
    // Serialize message field [output_msg]
    bufferOffset = _serializer.string(obj.output_msg, buffer, bufferOffset);
    // Serialize message field [sampled_trajectory]
    // Serialize the length for message field [sampled_trajectory]
    bufferOffset = _serializer.uint32(obj.sampled_trajectory.length, buffer, bufferOffset);
    obj.sampled_trajectory.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SampleServiceResponse
    let len;
    let data = new SampleServiceResponse(null);
    // Deserialize message field [output_msg]
    data.output_msg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sampled_trajectory]
    // Deserialize array length for message field [sampled_trajectory]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.sampled_trajectory = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.sampled_trajectory[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.output_msg);
    length += 56 * object.sampled_trajectory.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/SampleServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '00586cb897008f318cddf6b335d18c39';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string output_msg
    geometry_msgs/Pose[] sampled_trajectory
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
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
    const resolved = new SampleServiceResponse(null);
    if (msg.output_msg !== undefined) {
      resolved.output_msg = msg.output_msg;
    }
    else {
      resolved.output_msg = ''
    }

    if (msg.sampled_trajectory !== undefined) {
      resolved.sampled_trajectory = new Array(msg.sampled_trajectory.length);
      for (let i = 0; i < resolved.sampled_trajectory.length; ++i) {
        resolved.sampled_trajectory[i] = geometry_msgs.msg.Pose.Resolve(msg.sampled_trajectory[i]);
      }
    }
    else {
      resolved.sampled_trajectory = []
    }

    return resolved;
    }
};

module.exports = {
  Request: SampleServiceRequest,
  Response: SampleServiceResponse,
  md5sum() { return '1d1a2b8ec8f0aacf9f57d31767f2b42d'; },
  datatype() { return 'ur10_mover/SampleService'; }
};
