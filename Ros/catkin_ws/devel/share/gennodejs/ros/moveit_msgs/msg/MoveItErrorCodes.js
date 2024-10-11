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

class MoveItErrorCodes {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.val = null;
    }
    else {
      if (initObj.hasOwnProperty('val')) {
        this.val = initObj.val
      }
      else {
        this.val = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveItErrorCodes
    // Serialize message field [val]
    bufferOffset = _serializer.int32(obj.val, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveItErrorCodes
    let len;
    let data = new MoveItErrorCodes(null);
    // Deserialize message field [val]
    data.val = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/MoveItErrorCodes';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '35a153d4489afb90a182bbf874ecc0f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 val
    
    # overall behavior
    int32 SUCCESS=1
    int32 FAILURE=99999
    
    int32 PLANNING_FAILED=-1
    int32 INVALID_MOTION_PLAN=-2
    int32 MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE=-3
    int32 CONTROL_FAILED=-4
    int32 UNABLE_TO_AQUIRE_SENSOR_DATA=-5
    int32 TIMED_OUT=-6
    int32 PREEMPTED=-7
    
    # planning & kinematics request errors
    int32 START_STATE_IN_COLLISION=-10
    int32 START_STATE_VIOLATES_PATH_CONSTRAINTS=-11
    
    int32 GOAL_IN_COLLISION=-12
    int32 GOAL_VIOLATES_PATH_CONSTRAINTS=-13
    int32 GOAL_CONSTRAINTS_VIOLATED=-14
    
    int32 INVALID_GROUP_NAME=-15
    int32 INVALID_GOAL_CONSTRAINTS=-16
    int32 INVALID_ROBOT_STATE=-17
    int32 INVALID_LINK_NAME=-18
    int32 INVALID_OBJECT_NAME=-19
    
    # system errors
    int32 FRAME_TRANSFORM_FAILURE=-21
    int32 COLLISION_CHECKING_UNAVAILABLE=-22
    int32 ROBOT_STATE_STALE=-23
    int32 SENSOR_INFO_STALE=-24
    int32 COMMUNICATION_FAILURE=-25
    
    # kinematics errors
    int32 NO_IK_SOLUTION=-31
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveItErrorCodes(null);
    if (msg.val !== undefined) {
      resolved.val = msg.val;
    }
    else {
      resolved.val = 0
    }

    return resolved;
    }
};

// Constants for message
MoveItErrorCodes.Constants = {
  SUCCESS: 1,
  FAILURE: 99999,
  PLANNING_FAILED: -1,
  INVALID_MOTION_PLAN: -2,
  MOTION_PLAN_INVALIDATED_BY_ENVIRONMENT_CHANGE: -3,
  CONTROL_FAILED: -4,
  UNABLE_TO_AQUIRE_SENSOR_DATA: -5,
  TIMED_OUT: -6,
  PREEMPTED: -7,
  START_STATE_IN_COLLISION: -10,
  START_STATE_VIOLATES_PATH_CONSTRAINTS: -11,
  GOAL_IN_COLLISION: -12,
  GOAL_VIOLATES_PATH_CONSTRAINTS: -13,
  GOAL_CONSTRAINTS_VIOLATED: -14,
  INVALID_GROUP_NAME: -15,
  INVALID_GOAL_CONSTRAINTS: -16,
  INVALID_ROBOT_STATE: -17,
  INVALID_LINK_NAME: -18,
  INVALID_OBJECT_NAME: -19,
  FRAME_TRANSFORM_FAILURE: -21,
  COLLISION_CHECKING_UNAVAILABLE: -22,
  ROBOT_STATE_STALE: -23,
  SENSOR_INFO_STALE: -24,
  COMMUNICATION_FAILURE: -25,
  NO_IK_SOLUTION: -31,
}

module.exports = MoveItErrorCodes;
