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

let moveit_msgs = _finder('moveit_msgs');

//-----------------------------------------------------------

class PlannerServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.input_msg = null;
      this.request_type = null;
      this.joints_input = null;
      this.pose_list = null;
    }
    else {
      if (initObj.hasOwnProperty('input_msg')) {
        this.input_msg = initObj.input_msg
      }
      else {
        this.input_msg = '';
      }
      if (initObj.hasOwnProperty('request_type')) {
        this.request_type = initObj.request_type
      }
      else {
        this.request_type = '';
      }
      if (initObj.hasOwnProperty('joints_input')) {
        this.joints_input = initObj.joints_input
      }
      else {
        this.joints_input = new Array(6).fill(0);
      }
      if (initObj.hasOwnProperty('pose_list')) {
        this.pose_list = initObj.pose_list
      }
      else {
        this.pose_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlannerServiceRequest
    // Serialize message field [input_msg]
    bufferOffset = _serializer.string(obj.input_msg, buffer, bufferOffset);
    // Serialize message field [request_type]
    bufferOffset = _serializer.string(obj.request_type, buffer, bufferOffset);
    // Check that the constant length array field [joints_input] has the right length
    if (obj.joints_input.length !== 6) {
      throw new Error('Unable to serialize array field joints_input - length must be 6')
    }
    // Serialize message field [joints_input]
    bufferOffset = _arraySerializer.float64(obj.joints_input, buffer, bufferOffset, 6);
    // Serialize message field [pose_list]
    // Serialize the length for message field [pose_list]
    bufferOffset = _serializer.uint32(obj.pose_list.length, buffer, bufferOffset);
    obj.pose_list.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlannerServiceRequest
    let len;
    let data = new PlannerServiceRequest(null);
    // Deserialize message field [input_msg]
    data.input_msg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [request_type]
    data.request_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [joints_input]
    data.joints_input = _arrayDeserializer.float64(buffer, bufferOffset, 6)
    // Deserialize message field [pose_list]
    // Deserialize array length for message field [pose_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pose_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pose_list[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.input_msg);
    length += _getByteLength(object.request_type);
    length += 56 * object.pose_list.length;
    return length + 60;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/PlannerServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '457198907edcc0113dfed24d6746788d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string input_msg
    string request_type
    float64[6] joints_input
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
    const resolved = new PlannerServiceRequest(null);
    if (msg.input_msg !== undefined) {
      resolved.input_msg = msg.input_msg;
    }
    else {
      resolved.input_msg = ''
    }

    if (msg.request_type !== undefined) {
      resolved.request_type = msg.request_type;
    }
    else {
      resolved.request_type = ''
    }

    if (msg.joints_input !== undefined) {
      resolved.joints_input = msg.joints_input;
    }
    else {
      resolved.joints_input = new Array(6).fill(0)
    }

    if (msg.pose_list !== undefined) {
      resolved.pose_list = new Array(msg.pose_list.length);
      for (let i = 0; i < resolved.pose_list.length; ++i) {
        resolved.pose_list[i] = geometry_msgs.msg.Pose.Resolve(msg.pose_list[i]);
      }
    }
    else {
      resolved.pose_list = []
    }

    return resolved;
    }
};

class PlannerServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.output_msg = null;
      this.request_type = null;
      this.pose_list = null;
      this.trajectories = null;
    }
    else {
      if (initObj.hasOwnProperty('output_msg')) {
        this.output_msg = initObj.output_msg
      }
      else {
        this.output_msg = '';
      }
      if (initObj.hasOwnProperty('request_type')) {
        this.request_type = initObj.request_type
      }
      else {
        this.request_type = '';
      }
      if (initObj.hasOwnProperty('pose_list')) {
        this.pose_list = initObj.pose_list
      }
      else {
        this.pose_list = [];
      }
      if (initObj.hasOwnProperty('trajectories')) {
        this.trajectories = initObj.trajectories
      }
      else {
        this.trajectories = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlannerServiceResponse
    // Serialize message field [output_msg]
    bufferOffset = _serializer.string(obj.output_msg, buffer, bufferOffset);
    // Serialize message field [request_type]
    bufferOffset = _serializer.string(obj.request_type, buffer, bufferOffset);
    // Serialize message field [pose_list]
    // Serialize the length for message field [pose_list]
    bufferOffset = _serializer.uint32(obj.pose_list.length, buffer, bufferOffset);
    obj.pose_list.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [trajectories]
    // Serialize the length for message field [trajectories]
    bufferOffset = _serializer.uint32(obj.trajectories.length, buffer, bufferOffset);
    obj.trajectories.forEach((val) => {
      bufferOffset = moveit_msgs.msg.RobotTrajectory.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlannerServiceResponse
    let len;
    let data = new PlannerServiceResponse(null);
    // Deserialize message field [output_msg]
    data.output_msg = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [request_type]
    data.request_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pose_list]
    // Deserialize array length for message field [pose_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pose_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pose_list[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [trajectories]
    // Deserialize array length for message field [trajectories]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.trajectories = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.trajectories[i] = moveit_msgs.msg.RobotTrajectory.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.output_msg);
    length += _getByteLength(object.request_type);
    length += 56 * object.pose_list.length;
    object.trajectories.forEach((val) => {
      length += moveit_msgs.msg.RobotTrajectory.getMessageSize(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ur10_mover/PlannerServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fac5536b24a557c9047ab7e3e33e413d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string output_msg
    string request_type
    geometry_msgs/Pose[] pose_list
    moveit_msgs/RobotTrajectory[] trajectories
    
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
    const resolved = new PlannerServiceResponse(null);
    if (msg.output_msg !== undefined) {
      resolved.output_msg = msg.output_msg;
    }
    else {
      resolved.output_msg = ''
    }

    if (msg.request_type !== undefined) {
      resolved.request_type = msg.request_type;
    }
    else {
      resolved.request_type = ''
    }

    if (msg.pose_list !== undefined) {
      resolved.pose_list = new Array(msg.pose_list.length);
      for (let i = 0; i < resolved.pose_list.length; ++i) {
        resolved.pose_list[i] = geometry_msgs.msg.Pose.Resolve(msg.pose_list[i]);
      }
    }
    else {
      resolved.pose_list = []
    }

    if (msg.trajectories !== undefined) {
      resolved.trajectories = new Array(msg.trajectories.length);
      for (let i = 0; i < resolved.trajectories.length; ++i) {
        resolved.trajectories[i] = moveit_msgs.msg.RobotTrajectory.Resolve(msg.trajectories[i]);
      }
    }
    else {
      resolved.trajectories = []
    }

    return resolved;
    }
};

module.exports = {
  Request: PlannerServiceRequest,
  Response: PlannerServiceResponse,
  md5sum() { return 'a9d9e87f111d55827a268a07768a7199'; },
  datatype() { return 'ur10_mover/PlannerService'; }
};
