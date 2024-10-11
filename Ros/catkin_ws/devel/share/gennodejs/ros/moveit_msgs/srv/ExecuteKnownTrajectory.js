// Auto-generated. Do not edit!

// (in-package moveit_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RobotTrajectory = require('../msg/RobotTrajectory.js');

//-----------------------------------------------------------

let MoveItErrorCodes = require('../msg/MoveItErrorCodes.js');

//-----------------------------------------------------------

class ExecuteKnownTrajectoryRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.trajectory = null;
      this.wait_for_execution = null;
    }
    else {
      if (initObj.hasOwnProperty('trajectory')) {
        this.trajectory = initObj.trajectory
      }
      else {
        this.trajectory = new RobotTrajectory();
      }
      if (initObj.hasOwnProperty('wait_for_execution')) {
        this.wait_for_execution = initObj.wait_for_execution
      }
      else {
        this.wait_for_execution = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExecuteKnownTrajectoryRequest
    // Serialize message field [trajectory]
    bufferOffset = RobotTrajectory.serialize(obj.trajectory, buffer, bufferOffset);
    // Serialize message field [wait_for_execution]
    bufferOffset = _serializer.bool(obj.wait_for_execution, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExecuteKnownTrajectoryRequest
    let len;
    let data = new ExecuteKnownTrajectoryRequest(null);
    // Deserialize message field [trajectory]
    data.trajectory = RobotTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [wait_for_execution]
    data.wait_for_execution = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += RobotTrajectory.getMessageSize(object.trajectory);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/ExecuteKnownTrajectoryRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2a3d2a0b337c6a27da4468bb351928e5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This service is deprecated and will go away at some point. For new development use the ExecuteTrajectory action.
    # Effective since: Indigo 0.7.4, Jade and Kinetic 0.8.3
    
    # The trajectory to execute 
    RobotTrajectory trajectory
    
    # Set this to true if the service should block until the execution is complete
    bool wait_for_execution
    
    
    ================================================================================
    MSG: moveit_msgs/RobotTrajectory
    trajectory_msgs/JointTrajectory joint_trajectory
    trajectory_msgs/MultiDOFJointTrajectory multi_dof_joint_trajectory
    
    ================================================================================
    MSG: trajectory_msgs/JointTrajectory
    Header header
    string[] joint_names
    JointTrajectoryPoint[] points
    
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
    MSG: trajectory_msgs/JointTrajectoryPoint
    # Each trajectory point specifies either positions[, velocities[, accelerations]]
    # or positions[, effort] for the trajectory to be executed.
    # All specified values are in the same order as the joint names in JointTrajectory.msg
    
    float64[] positions
    float64[] velocities
    float64[] accelerations
    float64[] effort
    duration time_from_start
    
    ================================================================================
    MSG: trajectory_msgs/MultiDOFJointTrajectory
    # The header is used to specify the coordinate frame and the reference time for the trajectory durations
    Header header
    
    # A representation of a multi-dof joint trajectory (each point is a transformation)
    # Each point along the trajectory will include an array of positions/velocities/accelerations
    # that has the same length as the array of joint names, and has the same order of joints as 
    # the joint names array.
    
    string[] joint_names
    MultiDOFJointTrajectoryPoint[] points
    
    ================================================================================
    MSG: trajectory_msgs/MultiDOFJointTrajectoryPoint
    # Each multi-dof joint can specify a transform (up to 6 DOF)
    geometry_msgs/Transform[] transforms
    
    # There can be a velocity specified for the origin of the joint 
    geometry_msgs/Twist[] velocities
    
    # There can be an acceleration specified for the origin of the joint 
    geometry_msgs/Twist[] accelerations
    
    duration time_from_start
    
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
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ExecuteKnownTrajectoryRequest(null);
    if (msg.trajectory !== undefined) {
      resolved.trajectory = RobotTrajectory.Resolve(msg.trajectory)
    }
    else {
      resolved.trajectory = new RobotTrajectory()
    }

    if (msg.wait_for_execution !== undefined) {
      resolved.wait_for_execution = msg.wait_for_execution;
    }
    else {
      resolved.wait_for_execution = false
    }

    return resolved;
    }
};

class ExecuteKnownTrajectoryResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.error_code = null;
    }
    else {
      if (initObj.hasOwnProperty('error_code')) {
        this.error_code = initObj.error_code
      }
      else {
        this.error_code = new MoveItErrorCodes();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExecuteKnownTrajectoryResponse
    // Serialize message field [error_code]
    bufferOffset = MoveItErrorCodes.serialize(obj.error_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExecuteKnownTrajectoryResponse
    let len;
    let data = new ExecuteKnownTrajectoryResponse(null);
    // Deserialize message field [error_code]
    data.error_code = MoveItErrorCodes.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/ExecuteKnownTrajectoryResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a367304b29bf35b99db616894f470bab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Error code - encodes the overall reason for failure
    MoveItErrorCodes error_code
    
    
    ================================================================================
    MSG: moveit_msgs/MoveItErrorCodes
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
    const resolved = new ExecuteKnownTrajectoryResponse(null);
    if (msg.error_code !== undefined) {
      resolved.error_code = MoveItErrorCodes.Resolve(msg.error_code)
    }
    else {
      resolved.error_code = new MoveItErrorCodes()
    }

    return resolved;
    }
};

module.exports = {
  Request: ExecuteKnownTrajectoryRequest,
  Response: ExecuteKnownTrajectoryResponse,
  md5sum() { return '90682c5b72fe34a7ac8538ce473e228b'; },
  datatype() { return 'moveit_msgs/ExecuteKnownTrajectory'; }
};
