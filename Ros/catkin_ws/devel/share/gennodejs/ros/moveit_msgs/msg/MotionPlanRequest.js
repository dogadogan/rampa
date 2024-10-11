// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let WorkspaceParameters = require('./WorkspaceParameters.js');
let RobotState = require('./RobotState.js');
let Constraints = require('./Constraints.js');
let TrajectoryConstraints = require('./TrajectoryConstraints.js');
let GenericTrajectory = require('./GenericTrajectory.js');

//-----------------------------------------------------------

class MotionPlanRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.workspace_parameters = null;
      this.start_state = null;
      this.goal_constraints = null;
      this.path_constraints = null;
      this.trajectory_constraints = null;
      this.reference_trajectories = null;
      this.planner_id = null;
      this.group_name = null;
      this.num_planning_attempts = null;
      this.allowed_planning_time = null;
      this.max_velocity_scaling_factor = null;
      this.max_acceleration_scaling_factor = null;
      this.cartesian_speed_end_effector_link = null;
      this.max_cartesian_speed = null;
    }
    else {
      if (initObj.hasOwnProperty('workspace_parameters')) {
        this.workspace_parameters = initObj.workspace_parameters
      }
      else {
        this.workspace_parameters = new WorkspaceParameters();
      }
      if (initObj.hasOwnProperty('start_state')) {
        this.start_state = initObj.start_state
      }
      else {
        this.start_state = new RobotState();
      }
      if (initObj.hasOwnProperty('goal_constraints')) {
        this.goal_constraints = initObj.goal_constraints
      }
      else {
        this.goal_constraints = [];
      }
      if (initObj.hasOwnProperty('path_constraints')) {
        this.path_constraints = initObj.path_constraints
      }
      else {
        this.path_constraints = new Constraints();
      }
      if (initObj.hasOwnProperty('trajectory_constraints')) {
        this.trajectory_constraints = initObj.trajectory_constraints
      }
      else {
        this.trajectory_constraints = new TrajectoryConstraints();
      }
      if (initObj.hasOwnProperty('reference_trajectories')) {
        this.reference_trajectories = initObj.reference_trajectories
      }
      else {
        this.reference_trajectories = [];
      }
      if (initObj.hasOwnProperty('planner_id')) {
        this.planner_id = initObj.planner_id
      }
      else {
        this.planner_id = '';
      }
      if (initObj.hasOwnProperty('group_name')) {
        this.group_name = initObj.group_name
      }
      else {
        this.group_name = '';
      }
      if (initObj.hasOwnProperty('num_planning_attempts')) {
        this.num_planning_attempts = initObj.num_planning_attempts
      }
      else {
        this.num_planning_attempts = 0;
      }
      if (initObj.hasOwnProperty('allowed_planning_time')) {
        this.allowed_planning_time = initObj.allowed_planning_time
      }
      else {
        this.allowed_planning_time = 0.0;
      }
      if (initObj.hasOwnProperty('max_velocity_scaling_factor')) {
        this.max_velocity_scaling_factor = initObj.max_velocity_scaling_factor
      }
      else {
        this.max_velocity_scaling_factor = 0.0;
      }
      if (initObj.hasOwnProperty('max_acceleration_scaling_factor')) {
        this.max_acceleration_scaling_factor = initObj.max_acceleration_scaling_factor
      }
      else {
        this.max_acceleration_scaling_factor = 0.0;
      }
      if (initObj.hasOwnProperty('cartesian_speed_end_effector_link')) {
        this.cartesian_speed_end_effector_link = initObj.cartesian_speed_end_effector_link
      }
      else {
        this.cartesian_speed_end_effector_link = '';
      }
      if (initObj.hasOwnProperty('max_cartesian_speed')) {
        this.max_cartesian_speed = initObj.max_cartesian_speed
      }
      else {
        this.max_cartesian_speed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotionPlanRequest
    // Serialize message field [workspace_parameters]
    bufferOffset = WorkspaceParameters.serialize(obj.workspace_parameters, buffer, bufferOffset);
    // Serialize message field [start_state]
    bufferOffset = RobotState.serialize(obj.start_state, buffer, bufferOffset);
    // Serialize message field [goal_constraints]
    // Serialize the length for message field [goal_constraints]
    bufferOffset = _serializer.uint32(obj.goal_constraints.length, buffer, bufferOffset);
    obj.goal_constraints.forEach((val) => {
      bufferOffset = Constraints.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [path_constraints]
    bufferOffset = Constraints.serialize(obj.path_constraints, buffer, bufferOffset);
    // Serialize message field [trajectory_constraints]
    bufferOffset = TrajectoryConstraints.serialize(obj.trajectory_constraints, buffer, bufferOffset);
    // Serialize message field [reference_trajectories]
    // Serialize the length for message field [reference_trajectories]
    bufferOffset = _serializer.uint32(obj.reference_trajectories.length, buffer, bufferOffset);
    obj.reference_trajectories.forEach((val) => {
      bufferOffset = GenericTrajectory.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [planner_id]
    bufferOffset = _serializer.string(obj.planner_id, buffer, bufferOffset);
    // Serialize message field [group_name]
    bufferOffset = _serializer.string(obj.group_name, buffer, bufferOffset);
    // Serialize message field [num_planning_attempts]
    bufferOffset = _serializer.int32(obj.num_planning_attempts, buffer, bufferOffset);
    // Serialize message field [allowed_planning_time]
    bufferOffset = _serializer.float64(obj.allowed_planning_time, buffer, bufferOffset);
    // Serialize message field [max_velocity_scaling_factor]
    bufferOffset = _serializer.float64(obj.max_velocity_scaling_factor, buffer, bufferOffset);
    // Serialize message field [max_acceleration_scaling_factor]
    bufferOffset = _serializer.float64(obj.max_acceleration_scaling_factor, buffer, bufferOffset);
    // Serialize message field [cartesian_speed_end_effector_link]
    bufferOffset = _serializer.string(obj.cartesian_speed_end_effector_link, buffer, bufferOffset);
    // Serialize message field [max_cartesian_speed]
    bufferOffset = _serializer.float64(obj.max_cartesian_speed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotionPlanRequest
    let len;
    let data = new MotionPlanRequest(null);
    // Deserialize message field [workspace_parameters]
    data.workspace_parameters = WorkspaceParameters.deserialize(buffer, bufferOffset);
    // Deserialize message field [start_state]
    data.start_state = RobotState.deserialize(buffer, bufferOffset);
    // Deserialize message field [goal_constraints]
    // Deserialize array length for message field [goal_constraints]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.goal_constraints = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.goal_constraints[i] = Constraints.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [path_constraints]
    data.path_constraints = Constraints.deserialize(buffer, bufferOffset);
    // Deserialize message field [trajectory_constraints]
    data.trajectory_constraints = TrajectoryConstraints.deserialize(buffer, bufferOffset);
    // Deserialize message field [reference_trajectories]
    // Deserialize array length for message field [reference_trajectories]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.reference_trajectories = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.reference_trajectories[i] = GenericTrajectory.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [planner_id]
    data.planner_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [group_name]
    data.group_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [num_planning_attempts]
    data.num_planning_attempts = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [allowed_planning_time]
    data.allowed_planning_time = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_velocity_scaling_factor]
    data.max_velocity_scaling_factor = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_acceleration_scaling_factor]
    data.max_acceleration_scaling_factor = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [cartesian_speed_end_effector_link]
    data.cartesian_speed_end_effector_link = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [max_cartesian_speed]
    data.max_cartesian_speed = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += WorkspaceParameters.getMessageSize(object.workspace_parameters);
    length += RobotState.getMessageSize(object.start_state);
    object.goal_constraints.forEach((val) => {
      length += Constraints.getMessageSize(val);
    });
    length += Constraints.getMessageSize(object.path_constraints);
    length += TrajectoryConstraints.getMessageSize(object.trajectory_constraints);
    object.reference_trajectories.forEach((val) => {
      length += GenericTrajectory.getMessageSize(val);
    });
    length += _getByteLength(object.planner_id);
    length += _getByteLength(object.group_name);
    length += _getByteLength(object.cartesian_speed_end_effector_link);
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/MotionPlanRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '06f232a8d98582f491d96e82023b5025';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This service contains the definition for a request to the motion
    # planner and the output it provides
    
    # Parameters for the workspace that the planner should work inside
    WorkspaceParameters workspace_parameters
    
    # Starting state updates. If certain joints should be considered
    # at positions other than the current ones, these positions should
    # be set here
    RobotState start_state
    
    # The possible goal states for the model to plan for. Each element of
    # the array defines a goal region. The goal is achieved
    # if the constraints for a particular region are satisfied
    Constraints[] goal_constraints
    
    # No state at any point along the path in the produced motion plan will violate these constraints (this applies to all points, not just waypoints)
    Constraints path_constraints
    
    # The constraints the resulting trajectory must satisfy
    TrajectoryConstraints trajectory_constraints
    
    # A set of trajectories that may be used as reference or initial trajectories for (typically optimization-based) planners
    # These trajectories do not override start_state or goal_constraints
    GenericTrajectory[] reference_trajectories
    
    # The name of the motion planner to use. If no name is specified,
    # a default motion planner will be used
    string planner_id
    
    # The name of the group of joints on which this planner is operating
    string group_name
    
    # The number of times this plan is to be computed. Shortest solution
    # will be reported.
    int32 num_planning_attempts
    
    # The maximum amount of time the motion planner is allowed to plan for (in seconds)
    float64 allowed_planning_time
    
    # Scaling factors for optionally reducing the maximum joint velocities and
    # accelerations.  Allowed values are in (0,1].  The maximum joint velocity and
    # acceleration specified in the robot model are multiplied by thier respective
    # factors.  If either are outside their valid ranges (importantly, this
    # includes being set to 0.0), the factor is set to the default value of 1.0
    # internally (i.e., maximum joint velocity or maximum joint acceleration).
    float64 max_velocity_scaling_factor
    float64 max_acceleration_scaling_factor
    
    # Maximum cartesian speed for the given end effector.
    # If max_cartesian_speed <= 0 the trajectory is not modified.
    # These fields require the following planning request adapter: default_planner_request_adapters/SetMaxCartesianEndEffectorSpeed
    string cartesian_speed_end_effector_link
    float64 max_cartesian_speed # m/s
    
    ================================================================================
    MSG: moveit_msgs/WorkspaceParameters
    # This message contains a set of parameters useful in
    # setting up the volume (a box) in which the robot is allowed to move.
    # This is useful only when planning for mobile parts of 
    # the robot as well.
    
    # Define the frame of reference for the box corners
    Header header
    
    # The minumum corner of the box, with respect to the robot starting pose
    geometry_msgs/Vector3 min_corner
    
    # The maximum corner of the box, with respect to the robot starting pose
    geometry_msgs/Vector3 max_corner
    
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
    MSG: moveit_msgs/Constraints
    # This message contains a list of motion planning constraints.
    # All constraints must be satisfied for a goal to be considered valid
    
    string name
    
    JointConstraint[] joint_constraints
    
    PositionConstraint[] position_constraints
    
    OrientationConstraint[] orientation_constraints
    
    VisibilityConstraint[] visibility_constraints
    
    ================================================================================
    MSG: moveit_msgs/JointConstraint
    # Constrain the position of a joint to be within a certain bound
    string joint_name
    
    # the bound to be achieved is [position - tolerance_below, position + tolerance_above]
    float64 position
    float64 tolerance_above
    float64 tolerance_below
    
    # A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
    float64 weight
    ================================================================================
    MSG: moveit_msgs/PositionConstraint
    # This message contains the definition of a position constraint.
    
    Header header
    
    # The robot link this constraint refers to
    string link_name
    
    # The offset (in the link frame) for the target point on the link we are planning for
    geometry_msgs/Vector3 target_point_offset
    
    # The volume this constraint refers to 
    BoundingVolume constraint_region
    
    # A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
    float64 weight
    
    ================================================================================
    MSG: moveit_msgs/BoundingVolume
    # Define a volume in 3D
    
    # A set of solid geometric primitives that make up the volume to define (as a union)
    shape_msgs/SolidPrimitive[] primitives
    
    # The poses at which the primitives are located
    geometry_msgs/Pose[] primitive_poses
    
    # In addition to primitives, meshes can be specified to add to the bounding volume (again, as union)
    shape_msgs/Mesh[] meshes
    
    # The poses at which the meshes are located
    geometry_msgs/Pose[] mesh_poses
    
    ================================================================================
    MSG: moveit_msgs/OrientationConstraint
    # This message contains the definition of an orientation constraint.
    
    Header header
    
    # The desired orientation of the robot link specified as a quaternion
    geometry_msgs/Quaternion orientation
    
    # The robot link this constraint refers to
    string link_name
    
    # optional axis-angle error tolerances specified
    float64 absolute_x_axis_tolerance
    float64 absolute_y_axis_tolerance
    float64 absolute_z_axis_tolerance
    
    # A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
    float64 weight
    
    ================================================================================
    MSG: moveit_msgs/VisibilityConstraint
    # The constraint is useful to maintain visibility to a disc (the target) in a particular frame.
    # This disc forms the base of a visibiliy cone whose tip is at the origin of the sensor.
    # Maintaining visibility is done by ensuring the robot does not obstruct the visibility cone.
    # Note:
    # This constraint does NOT enforce minimum or maximum distances between the sensor
    # and the target, nor does it enforce the target to be in the field of view of
    # the sensor. A PositionConstraint can (and probably should) be used for such purposes.
    
    # The radius of the disc that should be maintained visible 
    float64 target_radius
    
    # The pose of the disc; as the robot moves, the pose of the disc may change as well
    # This can be in the frame of a particular robot link, for example
    geometry_msgs/PoseStamped target_pose
    
    # From the sensor origin towards the target, the disc forms a visibility cone
    # This cone is approximated using many sides. For example, when using 4 sides, 
    # that in fact makes the visibility region be a pyramid.
    # This value should always be 3 or more.
    int32 cone_sides
    
    # The pose in which visibility is to be maintained.
    # The frame id should represent the robot link to which the sensor is attached.
    # It is assumed the sensor can look directly at the target, in any direction.
    # This assumption is usually not true, but additional PositionConstraints
    # can resolve this issue.
    geometry_msgs/PoseStamped sensor_pose
    
    # Even though the disc is maintained visible, the visibility cone can be very small
    # because of the orientation of the disc with respect to the sensor. It is possible
    # for example to view the disk almost from a side, in which case the visibility cone 
    # can end up having close to 0 volume. The view angle is defined to be the angle between
    # the normal to the visibility disc and the direction vector from the sensor origin.
    # The value below represents the minimum desired view angle. For a perfect view,
    # this value will be 0 (the two vectors are exact opposites). For a completely obstructed view
    # this value will be Pi/2 (the vectors are perpendicular). This value defined below 
    # is the maximum view angle to be maintained. This should be a value in the open interval
    # (0, Pi/2). If 0 is set, the view angle is NOT enforced.
    float64 max_view_angle
    
    # This angle is used similarly to max_view_angle but limits the maximum angle
    # between the sensor origin direction vector and the axis that connects the
    # sensor origin to the target frame origin. The value is again in the range (0, Pi/2)
    # and is NOT enforced if set to 0.
    float64 max_range_angle
    
    # The axis that is assumed to indicate the direction of view for the sensor
    # X = 2, Y = 1, Z = 0
    uint8 SENSOR_Z=0
    uint8 SENSOR_Y=1
    uint8 SENSOR_X=2
    uint8 sensor_view_direction
    
    # A weighting factor for this constraint (denotes relative importance to other constraints. Closer to zero means less important)
    float64 weight
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: moveit_msgs/TrajectoryConstraints
    # The array of constraints to consider along the trajectory
    Constraints[] constraints
    
    ================================================================================
    MSG: moveit_msgs/GenericTrajectory
    # A generic trajectory message that may either encode a joint- or cartesian-space trajectory, or both
    # Trajectories encoded in this message are considered semantically equivalent
    Header header
    trajectory_msgs/JointTrajectory[] joint_trajectory
    moveit_msgs/CartesianTrajectory[] cartesian_trajectory
    
    ================================================================================
    MSG: moveit_msgs/CartesianTrajectory
    # This message describes the trajectory of a tracked frame in task-space
    Header header
    
    # The name of the Cartesian frame being tracked with respect to the base frame provided in header.frame_id
    string tracked_frame
    
    CartesianTrajectoryPoint[] points
    
    ================================================================================
    MSG: moveit_msgs/CartesianTrajectoryPoint
    # The definition of a cartesian point in a trajectory. Defines the cartesian state of the point and it's time,
    # following the pattern of the JointTrajectory message
    CartesianPoint point
    
    duration time_from_start
    
    ================================================================================
    MSG: moveit_msgs/CartesianPoint
    # This message defines a point in a cartesian trajectory
    geometry_msgs/Pose pose
    geometry_msgs/Twist velocity
    geometry_msgs/Accel acceleration
    ================================================================================
    MSG: geometry_msgs/Accel
    # This expresses acceleration in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotionPlanRequest(null);
    if (msg.workspace_parameters !== undefined) {
      resolved.workspace_parameters = WorkspaceParameters.Resolve(msg.workspace_parameters)
    }
    else {
      resolved.workspace_parameters = new WorkspaceParameters()
    }

    if (msg.start_state !== undefined) {
      resolved.start_state = RobotState.Resolve(msg.start_state)
    }
    else {
      resolved.start_state = new RobotState()
    }

    if (msg.goal_constraints !== undefined) {
      resolved.goal_constraints = new Array(msg.goal_constraints.length);
      for (let i = 0; i < resolved.goal_constraints.length; ++i) {
        resolved.goal_constraints[i] = Constraints.Resolve(msg.goal_constraints[i]);
      }
    }
    else {
      resolved.goal_constraints = []
    }

    if (msg.path_constraints !== undefined) {
      resolved.path_constraints = Constraints.Resolve(msg.path_constraints)
    }
    else {
      resolved.path_constraints = new Constraints()
    }

    if (msg.trajectory_constraints !== undefined) {
      resolved.trajectory_constraints = TrajectoryConstraints.Resolve(msg.trajectory_constraints)
    }
    else {
      resolved.trajectory_constraints = new TrajectoryConstraints()
    }

    if (msg.reference_trajectories !== undefined) {
      resolved.reference_trajectories = new Array(msg.reference_trajectories.length);
      for (let i = 0; i < resolved.reference_trajectories.length; ++i) {
        resolved.reference_trajectories[i] = GenericTrajectory.Resolve(msg.reference_trajectories[i]);
      }
    }
    else {
      resolved.reference_trajectories = []
    }

    if (msg.planner_id !== undefined) {
      resolved.planner_id = msg.planner_id;
    }
    else {
      resolved.planner_id = ''
    }

    if (msg.group_name !== undefined) {
      resolved.group_name = msg.group_name;
    }
    else {
      resolved.group_name = ''
    }

    if (msg.num_planning_attempts !== undefined) {
      resolved.num_planning_attempts = msg.num_planning_attempts;
    }
    else {
      resolved.num_planning_attempts = 0
    }

    if (msg.allowed_planning_time !== undefined) {
      resolved.allowed_planning_time = msg.allowed_planning_time;
    }
    else {
      resolved.allowed_planning_time = 0.0
    }

    if (msg.max_velocity_scaling_factor !== undefined) {
      resolved.max_velocity_scaling_factor = msg.max_velocity_scaling_factor;
    }
    else {
      resolved.max_velocity_scaling_factor = 0.0
    }

    if (msg.max_acceleration_scaling_factor !== undefined) {
      resolved.max_acceleration_scaling_factor = msg.max_acceleration_scaling_factor;
    }
    else {
      resolved.max_acceleration_scaling_factor = 0.0
    }

    if (msg.cartesian_speed_end_effector_link !== undefined) {
      resolved.cartesian_speed_end_effector_link = msg.cartesian_speed_end_effector_link;
    }
    else {
      resolved.cartesian_speed_end_effector_link = ''
    }

    if (msg.max_cartesian_speed !== undefined) {
      resolved.max_cartesian_speed = msg.max_cartesian_speed;
    }
    else {
      resolved.max_cartesian_speed = 0.0
    }

    return resolved;
    }
};

module.exports = MotionPlanRequest;
