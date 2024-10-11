// Auto-generated. Do not edit!

// (in-package ur10_mover.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let ListOfPoses = require('../msg/ListOfPoses.js');

//-----------------------------------------------------------

class GetTrainingDataServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_msg = null;
    }
    else {
      if (initObj.hasOwnProperty('input_msg')) {
        this.input_msg = initObj.input_msg
      }
      else {
        this.input_msg = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetTrainingDataServiceRequest
    // Serialize message field [input_msg]
    bufferOffset = _serializer.string(obj.input_msg, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetTrainingDataServiceRequest
    let len;
    let data = new GetTrainingDataServiceRequest(null);
    // Deserialize message field [input_msg]
    data.input_msg = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.input_msg);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/GetTrainingDataServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2beecd7d8a70aad2184c84345d0cd8d3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string input_msg
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetTrainingDataServiceRequest(null);
    if (msg.input_msg !== undefined) {
      resolved.input_msg = msg.input_msg;
    }
    else {
      resolved.input_msg = ''
    }

    return resolved;
    }
};

class GetTrainingDataServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trajectoryList = null;
    }
    else {
      if (initObj.hasOwnProperty('trajectoryList')) {
        this.trajectoryList = initObj.trajectoryList
      }
      else {
        this.trajectoryList = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetTrainingDataServiceResponse
    // Serialize message field [trajectoryList]
    // Serialize the length for message field [trajectoryList]
    bufferOffset = _serializer.uint32(obj.trajectoryList.length, buffer, bufferOffset);
    obj.trajectoryList.forEach((val) => {
      bufferOffset = ListOfPoses.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetTrainingDataServiceResponse
    let len;
    let data = new GetTrainingDataServiceResponse(null);
    // Deserialize message field [trajectoryList]
    // Deserialize array length for message field [trajectoryList]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.trajectoryList = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.trajectoryList[i] = ListOfPoses.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.trajectoryList.forEach((val) => {
      length += ListOfPoses.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/GetTrainingDataServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '911d3df46a7703daf3e95d9231abf0d7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ur10_mover/ListOfPoses[] trajectoryList
    
    
    ================================================================================
    MSG: ur10_mover/ListOfPoses
    geometry_msgs/Pose[] pose_list
    
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
    const resolved = new GetTrainingDataServiceResponse(null);
    if (msg.trajectoryList !== undefined) {
      resolved.trajectoryList = new Array(msg.trajectoryList.length);
      for (let i = 0; i < resolved.trajectoryList.length; ++i) {
        resolved.trajectoryList[i] = ListOfPoses.Resolve(msg.trajectoryList[i]);
      }
    }
    else {
      resolved.trajectoryList = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetTrainingDataServiceRequest,
  Response: GetTrainingDataServiceResponse,
  md5sum() { return 'a23732bf635c86b0cb4cf0b1248e70e9'; },
  datatype() { return 'ur10_mover/GetTrainingDataService'; }
};
