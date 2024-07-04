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
let trajectory_msgs = _finder('trajectory_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class PlaceLocation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.post_place_posture = null;
      this.place_pose = null;
      this.quality = null;
      this.pre_place_approach = null;
      this.post_place_retreat = null;
      this.allowed_touch_objects = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('post_place_posture')) {
        this.post_place_posture = initObj.post_place_posture
      }
      else {
        this.post_place_posture = new trajectory_msgs.msg.JointTrajectory();
      }
      if (initObj.hasOwnProperty('place_pose')) {
        this.place_pose = initObj.place_pose
      }
      else {
        this.place_pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('quality')) {
        this.quality = initObj.quality
      }
      else {
        this.quality = 0.0;
      }
      if (initObj.hasOwnProperty('pre_place_approach')) {
        this.pre_place_approach = initObj.pre_place_approach
      }
      else {
        this.pre_place_approach = new GripperTranslation();
      }
      if (initObj.hasOwnProperty('post_place_retreat')) {
        this.post_place_retreat = initObj.post_place_retreat
      }
      else {
        this.post_place_retreat = new GripperTranslation();
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
    // Serializes a message object of type PlaceLocation
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [post_place_posture]
    bufferOffset = trajectory_msgs.msg.JointTrajectory.serialize(obj.post_place_posture, buffer, bufferOffset);
    // Serialize message field [place_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.place_pose, buffer, bufferOffset);
    // Serialize message field [quality]
    bufferOffset = _serializer.float64(obj.quality, buffer, bufferOffset);
    // Serialize message field [pre_place_approach]
    bufferOffset = GripperTranslation.serialize(obj.pre_place_approach, buffer, bufferOffset);
    // Serialize message field [post_place_retreat]
    bufferOffset = GripperTranslation.serialize(obj.post_place_retreat, buffer, bufferOffset);
    // Serialize message field [allowed_touch_objects]
    bufferOffset = _arraySerializer.string(obj.allowed_touch_objects, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlaceLocation
    let len;
    let data = new PlaceLocation(null);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [post_place_posture]
    data.post_place_posture = trajectory_msgs.msg.JointTrajectory.deserialize(buffer, bufferOffset);
    // Deserialize message field [place_pose]
    data.place_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [quality]
    data.quality = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pre_place_approach]
    data.pre_place_approach = GripperTranslation.deserialize(buffer, bufferOffset);
    // Deserialize message field [post_place_retreat]
    data.post_place_retreat = GripperTranslation.deserialize(buffer, bufferOffset);
    // Deserialize message field [allowed_touch_objects]
    data.allowed_touch_objects = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.id);
    length += trajectory_msgs.msg.JointTrajectory.getMessageSize(object.post_place_posture);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.place_pose);
    length += GripperTranslation.getMessageSize(object.pre_place_approach);
    length += GripperTranslation.getMessageSize(object.post_place_retreat);
    object.allowed_touch_objects.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/PlaceLocation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7b53f032c68481686026c3e9223d0713';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # A name for this grasp
    string id
    
    # The internal posture of the hand for the grasp
    # positions and efforts are used
    trajectory_msgs/JointTrajectory post_place_posture
    
    # The position of the end-effector for the grasp relative to a reference frame 
    # (that is always specified elsewhere, not in this message)
    geometry_msgs/PoseStamped place_pose
    
    # The estimated probability of success for this place, or some other
    # measure of how "good" it is.
    float64 quality
    
    # The approach motion
    GripperTranslation pre_place_approach
    
    # The retreat motion
    GripperTranslation post_place_retreat
    
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
    const resolved = new PlaceLocation(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.post_place_posture !== undefined) {
      resolved.post_place_posture = trajectory_msgs.msg.JointTrajectory.Resolve(msg.post_place_posture)
    }
    else {
      resolved.post_place_posture = new trajectory_msgs.msg.JointTrajectory()
    }

    if (msg.place_pose !== undefined) {
      resolved.place_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.place_pose)
    }
    else {
      resolved.place_pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.quality !== undefined) {
      resolved.quality = msg.quality;
    }
    else {
      resolved.quality = 0.0
    }

    if (msg.pre_place_approach !== undefined) {
      resolved.pre_place_approach = GripperTranslation.Resolve(msg.pre_place_approach)
    }
    else {
      resolved.pre_place_approach = new GripperTranslation()
    }

    if (msg.post_place_retreat !== undefined) {
      resolved.post_place_retreat = GripperTranslation.Resolve(msg.post_place_retreat)
    }
    else {
      resolved.post_place_retreat = new GripperTranslation()
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

module.exports = PlaceLocation;
