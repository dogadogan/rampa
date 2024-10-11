// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let RobotState = require('./RobotState.js');
let AllowedCollisionMatrix = require('./AllowedCollisionMatrix.js');
let LinkPadding = require('./LinkPadding.js');
let LinkScale = require('./LinkScale.js');
let ObjectColor = require('./ObjectColor.js');
let PlanningSceneWorld = require('./PlanningSceneWorld.js');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class PlanningScene {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.robot_state = null;
      this.robot_model_name = null;
      this.fixed_frame_transforms = null;
      this.allowed_collision_matrix = null;
      this.link_padding = null;
      this.link_scale = null;
      this.object_colors = null;
      this.world = null;
      this.is_diff = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('robot_state')) {
        this.robot_state = initObj.robot_state
      }
      else {
        this.robot_state = new RobotState();
      }
      if (initObj.hasOwnProperty('robot_model_name')) {
        this.robot_model_name = initObj.robot_model_name
      }
      else {
        this.robot_model_name = '';
      }
      if (initObj.hasOwnProperty('fixed_frame_transforms')) {
        this.fixed_frame_transforms = initObj.fixed_frame_transforms
      }
      else {
        this.fixed_frame_transforms = [];
      }
      if (initObj.hasOwnProperty('allowed_collision_matrix')) {
        this.allowed_collision_matrix = initObj.allowed_collision_matrix
      }
      else {
        this.allowed_collision_matrix = new AllowedCollisionMatrix();
      }
      if (initObj.hasOwnProperty('link_padding')) {
        this.link_padding = initObj.link_padding
      }
      else {
        this.link_padding = [];
      }
      if (initObj.hasOwnProperty('link_scale')) {
        this.link_scale = initObj.link_scale
      }
      else {
        this.link_scale = [];
      }
      if (initObj.hasOwnProperty('object_colors')) {
        this.object_colors = initObj.object_colors
      }
      else {
        this.object_colors = [];
      }
      if (initObj.hasOwnProperty('world')) {
        this.world = initObj.world
      }
      else {
        this.world = new PlanningSceneWorld();
      }
      if (initObj.hasOwnProperty('is_diff')) {
        this.is_diff = initObj.is_diff
      }
      else {
        this.is_diff = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanningScene
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [robot_state]
    bufferOffset = RobotState.serialize(obj.robot_state, buffer, bufferOffset);
    // Serialize message field [robot_model_name]
    bufferOffset = _serializer.string(obj.robot_model_name, buffer, bufferOffset);
    // Serialize message field [fixed_frame_transforms]
    // Serialize the length for message field [fixed_frame_transforms]
    bufferOffset = _serializer.uint32(obj.fixed_frame_transforms.length, buffer, bufferOffset);
    obj.fixed_frame_transforms.forEach((val) => {
      bufferOffset = geometry_msgs.msg.TransformStamped.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [allowed_collision_matrix]
    bufferOffset = AllowedCollisionMatrix.serialize(obj.allowed_collision_matrix, buffer, bufferOffset);
    // Serialize message field [link_padding]
    // Serialize the length for message field [link_padding]
    bufferOffset = _serializer.uint32(obj.link_padding.length, buffer, bufferOffset);
    obj.link_padding.forEach((val) => {
      bufferOffset = LinkPadding.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [link_scale]
    // Serialize the length for message field [link_scale]
    bufferOffset = _serializer.uint32(obj.link_scale.length, buffer, bufferOffset);
    obj.link_scale.forEach((val) => {
      bufferOffset = LinkScale.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [object_colors]
    // Serialize the length for message field [object_colors]
    bufferOffset = _serializer.uint32(obj.object_colors.length, buffer, bufferOffset);
    obj.object_colors.forEach((val) => {
      bufferOffset = ObjectColor.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [world]
    bufferOffset = PlanningSceneWorld.serialize(obj.world, buffer, bufferOffset);
    // Serialize message field [is_diff]
    bufferOffset = _serializer.bool(obj.is_diff, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanningScene
    let len;
    let data = new PlanningScene(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot_state]
    data.robot_state = RobotState.deserialize(buffer, bufferOffset);
    // Deserialize message field [robot_model_name]
    data.robot_model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fixed_frame_transforms]
    // Deserialize array length for message field [fixed_frame_transforms]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.fixed_frame_transforms = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.fixed_frame_transforms[i] = geometry_msgs.msg.TransformStamped.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [allowed_collision_matrix]
    data.allowed_collision_matrix = AllowedCollisionMatrix.deserialize(buffer, bufferOffset);
    // Deserialize message field [link_padding]
    // Deserialize array length for message field [link_padding]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.link_padding = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.link_padding[i] = LinkPadding.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [link_scale]
    // Deserialize array length for message field [link_scale]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.link_scale = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.link_scale[i] = LinkScale.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [object_colors]
    // Deserialize array length for message field [object_colors]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.object_colors = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.object_colors[i] = ObjectColor.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [world]
    data.world = PlanningSceneWorld.deserialize(buffer, bufferOffset);
    // Deserialize message field [is_diff]
    data.is_diff = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    length += RobotState.getMessageSize(object.robot_state);
    length += _getByteLength(object.robot_model_name);
    object.fixed_frame_transforms.forEach((val) => {
      length += geometry_msgs.msg.TransformStamped.getMessageSize(val);
    });
    length += AllowedCollisionMatrix.getMessageSize(object.allowed_collision_matrix);
    object.link_padding.forEach((val) => {
      length += LinkPadding.getMessageSize(val);
    });
    object.link_scale.forEach((val) => {
      length += LinkScale.getMessageSize(val);
    });
    object.object_colors.forEach((val) => {
      length += ObjectColor.getMessageSize(val);
    });
    length += PlanningSceneWorld.getMessageSize(object.world);
    return length + 25;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/PlanningScene';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'acfc50bcfd6c7b978066bfa7c786002c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # name of planning scene
    string name
    
    # full robot state
    RobotState robot_state
    
    # The name of the robot model this scene is for
    string robot_model_name
    
    #additional frames for duplicating tf (with respect to the planning frame)
    geometry_msgs/TransformStamped[] fixed_frame_transforms
    
    #full allowed collision matrix
    AllowedCollisionMatrix allowed_collision_matrix
    
    # all link paddings
    LinkPadding[] link_padding
    
    # all link scales
    LinkScale[] link_scale
    
    # Attached objects, collision objects, even the octomap or collision map can have 
    # colors associated to them. This array specifies them.
    ObjectColor[] object_colors
    
    # the collision map
    PlanningSceneWorld world
    
    # Flag indicating whether this scene is to be interpreted as a diff with respect to some other scene
    bool is_diff
    
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
    
    ================================================================================
    MSG: geometry_msgs/TransformStamped
    # This expresses a transform from coordinate frame header.frame_id
    # to the coordinate frame child_frame_id
    #
    # This message is mostly used by the 
    # <a href="http://wiki.ros.org/tf">tf</a> package. 
    # See its documentation for more information.
    
    Header header
    string child_frame_id # the frame id of the child frame
    Transform transform
    
    ================================================================================
    MSG: moveit_msgs/AllowedCollisionMatrix
    # The list of entry names in the matrix
    string[] entry_names
    
    # The individual entries in the allowed collision matrix
    # square, symmetric, with same order as entry_names
    AllowedCollisionEntry[] entry_values
    
    # In addition to the collision matrix itself, we also have 
    # the default entry value for each entry name.
    
    # If the allowed collision flag is queried for a pair of names (n1, n2)
    # that is not found in the collision matrix itself, the value of
    # the collision flag is considered to be that of the entry (n1 or n2)
    # specified in the list below. If both n1 and n2 are found in the list 
    # of defaults, the result is computed with an AND operation
    
    string[] default_entry_names
    bool[] default_entry_values
    
    ================================================================================
    MSG: moveit_msgs/AllowedCollisionEntry
    # whether or not collision checking is enabled
    bool[] enabled
    
    ================================================================================
    MSG: moveit_msgs/LinkPadding
    #name for the link
    string link_name
    
    # padding to apply to the link
    float64 padding
    
    ================================================================================
    MSG: moveit_msgs/LinkScale
    #name for the link
    string link_name
    
    # scaling to apply to the link
    float64 scale
    
    ================================================================================
    MSG: moveit_msgs/ObjectColor
    # The object id for which we specify color
    string id
    
    # The value of the color
    std_msgs/ColorRGBA color
    
    ================================================================================
    MSG: std_msgs/ColorRGBA
    float32 r
    float32 g
    float32 b
    float32 a
    
    ================================================================================
    MSG: moveit_msgs/PlanningSceneWorld
    # collision objects
    CollisionObject[] collision_objects
    
    # The octomap that represents additional collision data
    octomap_msgs/OctomapWithPose octomap
    
    ================================================================================
    MSG: octomap_msgs/OctomapWithPose
    # A 3D map in binary format, as Octree
    Header header
    
    # The pose of the octree with respect to the header frame 
    geometry_msgs/Pose origin
    
    # The actual octree msg
    octomap_msgs/Octomap octomap
    
    ================================================================================
    MSG: octomap_msgs/Octomap
    # A 3D map in binary format, as Octree
    Header header
    
    # Flag to denote a binary (only free/occupied) or full occupancy octree (.bt/.ot file)
    bool binary
    
    # Class id of the contained octree 
    string id
    
    # Resolution (in m) of the smallest octree nodes
    float64 resolution
    
    # binary serialization of octree, use conversions.h to read and write octrees
    int8[] data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanningScene(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.robot_state !== undefined) {
      resolved.robot_state = RobotState.Resolve(msg.robot_state)
    }
    else {
      resolved.robot_state = new RobotState()
    }

    if (msg.robot_model_name !== undefined) {
      resolved.robot_model_name = msg.robot_model_name;
    }
    else {
      resolved.robot_model_name = ''
    }

    if (msg.fixed_frame_transforms !== undefined) {
      resolved.fixed_frame_transforms = new Array(msg.fixed_frame_transforms.length);
      for (let i = 0; i < resolved.fixed_frame_transforms.length; ++i) {
        resolved.fixed_frame_transforms[i] = geometry_msgs.msg.TransformStamped.Resolve(msg.fixed_frame_transforms[i]);
      }
    }
    else {
      resolved.fixed_frame_transforms = []
    }

    if (msg.allowed_collision_matrix !== undefined) {
      resolved.allowed_collision_matrix = AllowedCollisionMatrix.Resolve(msg.allowed_collision_matrix)
    }
    else {
      resolved.allowed_collision_matrix = new AllowedCollisionMatrix()
    }

    if (msg.link_padding !== undefined) {
      resolved.link_padding = new Array(msg.link_padding.length);
      for (let i = 0; i < resolved.link_padding.length; ++i) {
        resolved.link_padding[i] = LinkPadding.Resolve(msg.link_padding[i]);
      }
    }
    else {
      resolved.link_padding = []
    }

    if (msg.link_scale !== undefined) {
      resolved.link_scale = new Array(msg.link_scale.length);
      for (let i = 0; i < resolved.link_scale.length; ++i) {
        resolved.link_scale[i] = LinkScale.Resolve(msg.link_scale[i]);
      }
    }
    else {
      resolved.link_scale = []
    }

    if (msg.object_colors !== undefined) {
      resolved.object_colors = new Array(msg.object_colors.length);
      for (let i = 0; i < resolved.object_colors.length; ++i) {
        resolved.object_colors[i] = ObjectColor.Resolve(msg.object_colors[i]);
      }
    }
    else {
      resolved.object_colors = []
    }

    if (msg.world !== undefined) {
      resolved.world = PlanningSceneWorld.Resolve(msg.world)
    }
    else {
      resolved.world = new PlanningSceneWorld()
    }

    if (msg.is_diff !== undefined) {
      resolved.is_diff = msg.is_diff;
    }
    else {
      resolved.is_diff = false
    }

    return resolved;
    }
};

module.exports = PlanningScene;
