// Auto-generated. Do not edit!

// (in-package moveit_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RobotState = require('../msg/RobotState.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

let MoveItErrorCodes = require('../msg/MoveItErrorCodes.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GetPositionFKRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.fk_link_names = null;
      this.robot_state = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('fk_link_names')) {
        this.fk_link_names = initObj.fk_link_names
      }
      else {
        this.fk_link_names = [];
      }
      if (initObj.hasOwnProperty('robot_state')) {
        this.robot_state = initObj.robot_state
      }
      else {
        this.robot_state = new RobotState();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPositionFKRequest
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [fk_link_names]
    bufferOffset = _arraySerializer.string(obj.fk_link_names, buffer, bufferOffset, null);
    // Serialize message field [robot_state]
    bufferOffset = RobotState.serialize(obj.robot_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPositionFKRequest
    let len;
    let data = new GetPositionFKRequest(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [fk_link_names]
    data.fk_link_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [robot_state]
    data.robot_state = RobotState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    object.fk_link_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += RobotState.getMessageSize(object.robot_state);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/GetPositionFKRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0cc2c8039d5792659dd3a5a92f64c5bb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # A service definition for a standard forward kinematics service
    # The frame_id in the header message is the frame in which 
    # the forward kinematics poses will be returned
    Header header
    
    # A vector of link name for which forward kinematics must be computed
    string[] fk_link_names
    
    # A robot state consisting of joint names and joint positions to be used for forward kinematics
    RobotState robot_state
    
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
    MSG: moveit_msgs/RobotState
    # This message contains information about the robot state, i.e. the positions of its joints and links
    sensor_msgs/JointState joint_state
    
    # Joints that may have multiple DOF are specified here
    sensor_msgs/MultiDOFJointState multi_dof_joint_state
    
    # Attached collision objects (attached to some link on the robot)
    AttachedCollisionObject[] attached_collision_objects
    
    # Flag indicating whether this scene is to be interpreted as a diff with respect to some other scene
    # This is mostly important for handling the attached bodies (whether or not to clear the attached bodies
    # of a moveit::core::RobotState before updating it with this message)
    bool is_diff
    
    ================================================================================
    MSG: sensor_msgs/JointState
    # This is a message that holds data to describe the state of a set of torque controlled joints. 
    #
    # The state of each joint (revolute or prismatic) is defined by:
    #  * the position of the joint (rad or m),
    #  * the velocity of the joint (rad/s or m/s) and 
    #  * the effort that is applied in the joint (Nm or N).
    #
    # Each joint is uniquely identified by its name
    # The header specifies the time at which the joint states were recorded. All the joint states
    # in one message have to be recorded at the same time.
    #
    # This message consists of a multiple arrays, one for each part of the joint state. 
    # The goal is to make each of the fields optional. When e.g. your joints have no
    # effort associated with them, you can leave the effort array empty. 
    #
    # All arrays in this message should have the same size, or be empty.
    # This is the only way to uniquely associate the joint name with the correct
    # states.
    
    
    Header header
    
    string[] name
    float64[] position
    float64[] velocity
    float64[] effort
    
    ================================================================================
    MSG: sensor_msgs/MultiDOFJointState
    # Representation of state for joints with multiple degrees of freedom, 
    # following the structure of JointState.
    #
    # It is assumed that a joint in a system corresponds to a transform that gets applied 
    # along the kinematic chain. For example, a planar joint (as in URDF) is 3DOF (x, y, yaw)
    # and those 3DOF can be expressed as a transformation matrix, and that transformation
    # matrix can be converted back to (x, y, yaw)
    #
    # Each joint is uniquely identified by its name
    # The header specifies the time at which the joint states were recorded. All the joint states
    # in one message have to be recorded at the same time.
    #
    # This message consists of a multiple arrays, one for each part of the joint state. 
    # The goal is to make each of the fields optional. When e.g. your joints have no
    # wrench associated with them, you can leave the wrench array empty. 
    #
    # All arrays in this message should have the same size, or be empty.
    # This is the only way to uniquely associate the joint name with the correct
    # states.
    
    Header header
    
    string[] joint_names
    geometry_msgs/Transform[] transforms
    geometry_msgs/Twist[] twist
    geometry_msgs/Wrench[] wrench
    
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
    
    ================================================================================
    MSG: geometry_msgs/Wrench
    # This represents force in free space, separated into
    # its linear and angular parts.
    Vector3  force
    Vector3  torque
    
    ================================================================================
    MSG: moveit_msgs/AttachedCollisionObject
    # The CollisionObject will be attached with a fixed joint to this link
    string link_name
    
    #This contains the actual shapes and poses for the CollisionObject
    #to be attached to the link
    #If action is remove and no object.id is set, all objects
    #attached to the link indicated by link_name will be removed
    CollisionObject object
    
    # The set of links that the attached objects are allowed to touch
    # by default - the link_name is already considered by default
    string[] touch_links
    
    # If certain links were placed in a particular posture for this object to remain attached 
    # (e.g., an end effector closing around an object), the posture necessary for releasing
    # the object is stored here
    trajectory_msgs/JointTrajectory detach_posture
    
    # The weight of the attached object, if known
    float64 weight
    
    ================================================================================
    MSG: moveit_msgs/CollisionObject
    # A header, used for interpreting the poses
    Header header
    
    # DISCLAIMER: This field is not in use yet and all other poses
    # are still interpreted in the header frame.
    # https://github.com/ros-planning/moveit/pull/2037
    # implements the actual logic for this field.
    # ---
    # The object's pose relative to the header frame.
    # The shapes and subframe poses are defined relative to this pose.
    geometry_msgs/Pose pose
    
    # The id of the object (name used in MoveIt)
    string id
    
    # The object type in a database of known objects
    object_recognition_msgs/ObjectType type
    
    # The collision geometries associated with the object.
    # Their poses are with respect to the object's pose
    
    # Solid geometric primitives
    shape_msgs/SolidPrimitive[] primitives
    geometry_msgs/Pose[] primitive_poses
    
    # Meshes
    shape_msgs/Mesh[] meshes
    geometry_msgs/Pose[] mesh_poses
    
    # Bounding planes (equation is specified, but the plane can be oriented using an additional pose)
    shape_msgs/Plane[] planes
    geometry_msgs/Pose[] plane_poses
    
    # Named subframes on the object. Use these to define points of interest on the object that you want
    # to plan with (e.g. "tip", "spout", "handle"). The id of the object will be prepended to the subframe.
    # If an object with the id "screwdriver" and a subframe "tip" is in the scene, you can use the frame
    # "screwdriver/tip" for planning.
    # The length of the subframe_names and subframe_poses has to be identical.
    string[] subframe_names
    geometry_msgs/Pose[] subframe_poses
    
    # Adds the object to the planning scene. If the object previously existed, it is replaced.
    byte ADD=0
    
    # Removes the object from the environment entirely (everything that matches the specified id)
    byte REMOVE=1
    
    # Append to an object that already exists in the planning scene. If the object does not exist, it is added.
    byte APPEND=2
    
    # If an object already exists in the scene, new poses can be sent (the geometry arrays must be left empty)
    # if solely moving the object is desired
    byte MOVE=3
    
    # Operation to be performed
    byte operation
    
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
    MSG: object_recognition_msgs/ObjectType
    ################################################## OBJECT ID #########################################################
    
    # Contains information about the type of a found object. Those two sets of parameters together uniquely define an
    # object
    
    # The key of the found object: the unique identifier in the given db
    string key
    
    # The db parameters stored as a JSON/compressed YAML string. An object id does not make sense without the corresponding
    # database. E.g., in object_recognition, it can look like: "{'type':'CouchDB', 'root':'http://localhost'}"
    # There is no conventional format for those parameters and it's nice to keep that flexibility.
    # The object_recognition_core as a generic DB type that can read those fields
    # Current examples:
    # For CouchDB:
    #   type: 'CouchDB'
    #   root: 'http://localhost:5984'
    #   collection: 'object_recognition'
    # For SQL household database:
    #   type: 'SqlHousehold'
    #   host: 'wgs36'
    #   port: 5432
    #   user: 'willow'
    #   password: 'willow'
    #   name: 'household_objects'
    #   module: 'tabletop'
    string db
    
    ================================================================================
    MSG: shape_msgs/SolidPrimitive
    # Define box, sphere, cylinder, cone 
    # All shapes are defined to have their bounding boxes centered around 0,0,0.
    
    uint8 BOX=1
    uint8 SPHERE=2
    uint8 CYLINDER=3
    uint8 CONE=4
    
    # The type of the shape
    uint8 type
    
    
    # The dimensions of the shape
    float64[] dimensions
    
    # The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array
    
    # For the BOX type, the X, Y, and Z dimensions are the length of the corresponding
    # sides of the box.
    uint8 BOX_X=0
    uint8 BOX_Y=1
    uint8 BOX_Z=2
    
    
    # For the SPHERE type, only one component is used, and it gives the radius of
    # the sphere.
    uint8 SPHERE_RADIUS=0
    
    
    # For the CYLINDER and CONE types, the center line is oriented along
    # the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component
    # of dimensions gives the height of the cylinder (cone).  The
    # CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the
    # radius of the base of the cylinder (cone).  Cone and cylinder
    # primitives are defined to be circular. The tip of the cone is
    # pointing up, along +Z axis.
    
    uint8 CYLINDER_HEIGHT=0
    uint8 CYLINDER_RADIUS=1
    
    uint8 CONE_HEIGHT=0
    uint8 CONE_RADIUS=1
    
    ================================================================================
    MSG: shape_msgs/Mesh
    # Definition of a mesh
    
    # list of triangles; the index values refer to positions in vertices[]
    MeshTriangle[] triangles
    
    # the actual vertices that make up the mesh
    geometry_msgs/Point[] vertices
    
    ================================================================================
    MSG: shape_msgs/MeshTriangle
    # Definition of a triangle's vertices
    uint32[3] vertex_indices
    
    ================================================================================
    MSG: shape_msgs/Plane
    # Representation of a plane, using the plane equation ax + by + cz + d = 0
    
    # a := coef[0]
    # b := coef[1]
    # c := coef[2]
    # d := coef[3]
    
    float64[4] coef
    
    ================================================================================
    MSG: trajectory_msgs/JointTrajectory
    Header header
    string[] joint_names
    JointTrajectoryPoint[] points
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetPositionFKRequest(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.fk_link_names !== undefined) {
      resolved.fk_link_names = msg.fk_link_names;
    }
    else {
      resolved.fk_link_names = []
    }

    if (msg.robot_state !== undefined) {
      resolved.robot_state = RobotState.Resolve(msg.robot_state)
    }
    else {
      resolved.robot_state = new RobotState()
    }

    return resolved;
    }
};

class GetPositionFKResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose_stamped = null;
      this.fk_link_names = null;
      this.error_code = null;
    }
    else {
      if (initObj.hasOwnProperty('pose_stamped')) {
        this.pose_stamped = initObj.pose_stamped
      }
      else {
        this.pose_stamped = [];
      }
      if (initObj.hasOwnProperty('fk_link_names')) {
        this.fk_link_names = initObj.fk_link_names
      }
      else {
        this.fk_link_names = [];
      }
      if (initObj.hasOwnProperty('error_code')) {
        this.error_code = initObj.error_code
      }
      else {
        this.error_code = new MoveItErrorCodes();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetPositionFKResponse
    // Serialize message field [pose_stamped]
    // Serialize the length for message field [pose_stamped]
    bufferOffset = _serializer.uint32(obj.pose_stamped.length, buffer, bufferOffset);
    obj.pose_stamped.forEach((val) => {
      bufferOffset = geometry_msgs.msg.PoseStamped.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [fk_link_names]
    bufferOffset = _arraySerializer.string(obj.fk_link_names, buffer, bufferOffset, null);
    // Serialize message field [error_code]
    bufferOffset = MoveItErrorCodes.serialize(obj.error_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetPositionFKResponse
    let len;
    let data = new GetPositionFKResponse(null);
    // Deserialize message field [pose_stamped]
    // Deserialize array length for message field [pose_stamped]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pose_stamped = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pose_stamped[i] = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [fk_link_names]
    data.fk_link_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [error_code]
    data.error_code = MoveItErrorCodes.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.pose_stamped.forEach((val) => {
      length += geometry_msgs.msg.PoseStamped.getMessageSize(val);
    });
    object.fk_link_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/GetPositionFKResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d8c20528014017b172ce1f1d15ac982';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The resultant vector of PoseStamped messages that contains the (stamped) poses of the requested links
    geometry_msgs/PoseStamped[] pose_stamped
    
    # The list of link names corresponding to the poses
    string[] fk_link_names
    
    MoveItErrorCodes error_code
    
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
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
    const resolved = new GetPositionFKResponse(null);
    if (msg.pose_stamped !== undefined) {
      resolved.pose_stamped = new Array(msg.pose_stamped.length);
      for (let i = 0; i < resolved.pose_stamped.length; ++i) {
        resolved.pose_stamped[i] = geometry_msgs.msg.PoseStamped.Resolve(msg.pose_stamped[i]);
      }
    }
    else {
      resolved.pose_stamped = []
    }

    if (msg.fk_link_names !== undefined) {
      resolved.fk_link_names = msg.fk_link_names;
    }
    else {
      resolved.fk_link_names = []
    }

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
  Request: GetPositionFKRequest,
  Response: GetPositionFKResponse,
  md5sum() { return '7e5228d4c9e3511cf5071ecf43c502b8'; },
  datatype() { return 'moveit_msgs/GetPositionFK'; }
};
