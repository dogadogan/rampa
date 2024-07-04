// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let GripperTranslation = require('./GripperTranslation.js');
let geometry_msgs = _finder('geometry_msgs');
let trajectory_msgs = _finder('trajectory_msgs');

//-----------------------------------------------------------

class Grasp {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.pre_grasp_posture = null;
      this.grasp_posture = null;
      this.grasp_pose = null;
      this.grasp_quality = null;
      this.pre_grasp_approach = null;
      this.post_grasp_retreat = null;
      this.post_place_retreat = null;
      this.max_contact_force = null;
      this.allowed_touch_objects = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('pre_grasp_posture')) {
        this.pre_grasp_posture = initObj.pre_grasp_posture
      }
      else {
        this.pre_grasp_posture = new trajectory_msgs.msg.JointTrajectory();
      }
      if (initObj.hasOwnProperty('grasp_posture')) {
        this.grasp_posture = initObj.grasp_posture
      }
      else {
        this.grasp_posture = new trajectory_msgs.msg.JointTrajectory();
      }
      if (initObj.hasOwnProperty('grasp_pose')) {
        this.grasp_pose = initObj.grasp_pose
      }
      else {
        this.grasp_pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('grasp_quality')) {
        this.grasp_quality = initObj.grasp_quality
      }
      else {
        this.grasp_quality = 0.0;
      }
      if (initObj.hasOwnProperty('pre_grasp_approach')) {
        this.pre_grasp_approach = initObj.pre_grasp_approach
      }
      else {
        this.pre_grasp_approach = new GripperTranslation();
      }
      if (initObj.hasOwnProperty('post_grasp_retreat')) {
        this.post_grasp_retreat = initObj.post_grasp_retreat
      }
      else {
        this.post_grasp_retreat = new GripperTranslation();
      }
      if (initObj.hasOwnProperty('post_place_retreat')) {
        this.post_place_retreat = initObj.post_place_retreat
      }
      else {
        this.post_place_retreat = new GripperTranslation();
      }
      if (initObj.hasOwnProperty('max_contact_force')) {
        this.max_contact_force = initObj.max_contact_force
      }
      else {
        this.max_contact_force = 0.0;
      }
      if (initObj.hasOwnProperty('allowed_touch_objects')) {
        this.allowed_touch_objects = initObj.allowed_touch_objects
      }
      else {
        this.allowed_touch_objects = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Grasp
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [pre_grasp_posture]
    bufferOffset = trajectory_msgs.msg.JointTrajectory.serialize(obj.pre_grasp_posture, buffer, bufferOffset);
    // Serialize message field [grasp_posture]
    bufferOffset = trajectory_msgs.msg.JointTrajectory.serialize(obj.grasp_posture, buffer, bufferOffset);
    // Serialize message field [grasp_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.grasp_pose, buffer, bufferOffset);
    // Serialize message field [grasp_quality]
    bufferOffset = _serializer.float64(obj.grasp_quality, buffer, bufferOffset);
    // Serialize message field [pre_grasp_approach]
    bufferOffset = GripperTranslation.serialize(obj.pre_grasp_approach, buffer, bufferOffset);
    // Serialize message field [post_grasp_retreat]
    bufferOffset = GripperTranslation.serialize(obj.post_grasp_retreat, buffer, bufferOffset);
    // Serialize message field [post_place_retreat]
    bufferOffset = GripperTranslation.serialize(obj.post_place_retreat, buffer, bufferOffset);
    // Serialize message field [max_contact_force]
    bufferOffset = _serializer.float32(obj.max_contact_force, buffer, bufferOffset);
    // Serialize message field [allowed_touch_objects]
    bufferOffset = _arraySerializer.string(obj.allowed_touch_objects, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Grasp
    let len;
    let data = new Grasp(null);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pre_grasp_posture]
    data.pre_grasp_posture = trajectory_msgs.msg.JointTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [grasp_posture]
    data.grasp_posture = trajectory_msgs.msg.JointTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [grasp_pose]
    data.grasp_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [grasp_quality]
    data.grasp_quality = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pre_grasp_approach]
    data.pre_grasp_approach = GripperTranslation.deserialize(buffer, bufferOffset);
    // Deserialize message field [post_grasp_retreat]
    data.post_grasp_retreat = GripperTranslation.deserialize(buffer, bufferOffset);
    // Deserialize message field [post_place_retreat]
    data.post_place_retreat = GripperTranslation.deserialize(buffer, bufferOffset);
    // Deserialize message field [max_contact_force]
    data.max_contact_force = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [allowed_touch_objects]
    data.allowed_touch_objects = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.id);
    length += trajectory_msgs.msg.JointTrajectory.getMessageSize(object.pre_grasp_posture);
    length += trajectory_msgs.msg.JointTrajectory.getMessageSize(object.grasp_posture);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.grasp_pose);
    length += GripperTranslation.getMessageSize(object.pre_grasp_approach);
    length += GripperTranslation.getMessageSize(object.post_grasp_retreat);
    length += GripperTranslation.getMessageSize(object.post_place_retreat);
    object.allowed_touch_objects.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/Grasp';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e26c8fb64f589c33c5d5e54bd7b5e4cb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message contains a description of a grasp that would be used
    # with a particular end-effector to grasp an object, including how to
    # approach it, grip it, etc.  This message does not contain any
    # information about a "grasp point" (a position ON the object).
    # Whatever generates this message should have already combined
    # information about grasp points with information about the geometry
    # of the end-effector to compute the grasp_pose in this message.
    
    # A name for this grasp
    string id
    
    # The internal posture of the hand for the pre-grasp
    # only positions are used
    trajectory_msgs/JointTrajectory pre_grasp_posture
    
    # The internal posture of the hand for the grasp
    # positions and efforts are used
    trajectory_msgs/JointTrajectory grasp_posture
    
    # The position of the end-effector for the grasp.  This is the pose of
    # the "parent_link" of the end-effector, not actually the pose of any
    # link *in* the end-effector.  Typically this would be the pose of the
    # most distal wrist link before the hand (end-effector) links began.
    geometry_msgs/PoseStamped grasp_pose
    
    # The estimated probability of success for this grasp, or some other
    # measure of how "good" it is.
    float64 grasp_quality
    
    # The approach direction to take before picking an object
    GripperTranslation pre_grasp_approach
    
    # The retreat direction to take after a grasp has been completed (object is attached)
    GripperTranslation post_grasp_retreat
    
    # The retreat motion to perform when releasing the object; this information
    # is not necessary for the grasp itself, but when releasing the object,
    # the information will be necessary. The grasp used to perform a pickup
    # is returned as part of the result, so this information is available for 
    # later use.
    GripperTranslation post_place_retreat
    
    # the maximum contact force to use while grasping (<=0 to disable)
    float32 max_contact_force
    
    # an optional list of obstacles that we have semantic information about
    # and that can be touched/pushed/moved in the course of grasping
    string[] allowed_touch_objects
    
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
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
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
    MSG: moveit_msgs/GripperTranslation
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
    const resolved = new Grasp(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.pre_grasp_posture !== undefined) {
      resolved.pre_grasp_posture = trajectory_msgs.msg.JointTrajectory.Resolve(msg.pre_grasp_posture)
    }
    else {
      resolved.pre_grasp_posture = new trajectory_msgs.msg.JointTrajectory()
    }

    if (msg.grasp_posture !== undefined) {
      resolved.grasp_posture = trajectory_msgs.msg.JointTrajectory.Resolve(msg.grasp_posture)
    }
    else {
      resolved.grasp_posture = new trajectory_msgs.msg.JointTrajectory()
    }

    if (msg.grasp_pose !== undefined) {
      resolved.grasp_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.grasp_pose)
    }
    else {
      resolved.grasp_pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.grasp_quality !== undefined) {
      resolved.grasp_quality = msg.grasp_quality;
    }
    else {
      resolved.grasp_quality = 0.0
    }

    if (msg.pre_grasp_approach !== undefined) {
      resolved.pre_grasp_approach = GripperTranslation.Resolve(msg.pre_grasp_approach)
    }
    else {
      resolved.pre_grasp_approach = new GripperTranslation()
    }

    if (msg.post_grasp_retreat !== undefined) {
      resolved.post_grasp_retreat = GripperTranslation.Resolve(msg.post_grasp_retreat)
    }
    else {
      resolved.post_grasp_retreat = new GripperTranslation()
    }

    if (msg.post_place_retreat !== undefined) {
      resolved.post_place_retreat = GripperTranslation.Resolve(msg.post_place_retreat)
    }
    else {
      resolved.post_place_retreat = new GripperTranslation()
    }

    if (msg.max_contact_force !== undefined) {
      resolved.max_contact_force = msg.max_contact_force;
    }
    else {
      resolved.max_contact_force = 0.0
    }

    if (msg.allowed_touch_objects !== undefined) {
      resolved.allowed_touch_objects = msg.allowed_touch_objects;
    }
    else {
      resolved.allowed_touch_objects = []
    }

    return resolved;
    }
};

module.exports = Grasp;
