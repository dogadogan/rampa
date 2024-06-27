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
let Constraints = require('../msg/Constraints.js');

//-----------------------------------------------------------

let ContactInformation = require('../msg/ContactInformation.js');
let CostSource = require('../msg/CostSource.js');
let ConstraintEvalResult = require('../msg/ConstraintEvalResult.js');

//-----------------------------------------------------------

class GetStateValidityRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_state = null;
      this.group_name = null;
      this.constraints = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_state')) {
        this.robot_state = initObj.robot_state
      }
      else {
        this.robot_state = new RobotState();
      }
      if (initObj.hasOwnProperty('group_name')) {
        this.group_name = initObj.group_name
      }
      else {
        this.group_name = '';
      }
      if (initObj.hasOwnProperty('constraints')) {
        this.constraints = initObj.constraints
      }
      else {
        this.constraints = new Constraints();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetStateValidityRequest
    // Serialize message field [robot_state]
    bufferOffset = RobotState.serialize(obj.robot_state, buffer, bufferOffset);
    // Serialize message field [group_name]
    bufferOffset = _serializer.string(obj.group_name, buffer, bufferOffset);
    // Serialize message field [constraints]
    bufferOffset = Constraints.serialize(obj.constraints, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetStateValidityRequest
    let len;
    let data = new GetStateValidityRequest(null);
    // Deserialize message field [robot_state]
    data.robot_state = RobotState.deserialize(buffer, bufferOffset);
    // Deserialize message field [group_name]
    data.group_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [constraints]
    data.constraints = Constraints.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += RobotState.getMessageSize(object.robot_state);
    length += _getByteLength(object.group_name);
    length += Constraints.getMessageSize(object.constraints);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/GetStateValidityRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '884921484f3ecdbbc91a8e8234793906';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    RobotState robot_state
    string group_name
    Constraints constraints
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetStateValidityRequest(null);
    if (msg.robot_state !== undefined) {
      resolved.robot_state = RobotState.Resolve(msg.robot_state)
    }
    else {
      resolved.robot_state = new RobotState()
    }

    if (msg.group_name !== undefined) {
      resolved.group_name = msg.group_name;
    }
    else {
      resolved.group_name = ''
    }

    if (msg.constraints !== undefined) {
      resolved.constraints = Constraints.Resolve(msg.constraints)
    }
    else {
      resolved.constraints = new Constraints()
    }

    return resolved;
    }
};

class GetStateValidityResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.valid = null;
      this.contacts = null;
      this.cost_sources = null;
      this.constraint_result = null;
    }
    else {
      if (initObj.hasOwnProperty('valid')) {
        this.valid = initObj.valid
      }
      else {
        this.valid = false;
      }
      if (initObj.hasOwnProperty('contacts')) {
        this.contacts = initObj.contacts
      }
      else {
        this.contacts = [];
      }
      if (initObj.hasOwnProperty('cost_sources')) {
        this.cost_sources = initObj.cost_sources
      }
      else {
        this.cost_sources = [];
      }
      if (initObj.hasOwnProperty('constraint_result')) {
        this.constraint_result = initObj.constraint_result
      }
      else {
        this.constraint_result = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetStateValidityResponse
    // Serialize message field [valid]
    bufferOffset = _serializer.bool(obj.valid, buffer, bufferOffset);
    // Serialize message field [contacts]
    // Serialize the length for message field [contacts]
    bufferOffset = _serializer.uint32(obj.contacts.length, buffer, bufferOffset);
    obj.contacts.forEach((val) => {
      bufferOffset = ContactInformation.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [cost_sources]
    // Serialize the length for message field [cost_sources]
    bufferOffset = _serializer.uint32(obj.cost_sources.length, buffer, bufferOffset);
    obj.cost_sources.forEach((val) => {
      bufferOffset = CostSource.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [constraint_result]
    // Serialize the length for message field [constraint_result]
    bufferOffset = _serializer.uint32(obj.constraint_result.length, buffer, bufferOffset);
    obj.constraint_result.forEach((val) => {
      bufferOffset = ConstraintEvalResult.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetStateValidityResponse
    let len;
    let data = new GetStateValidityResponse(null);
    // Deserialize message field [valid]
    data.valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [contacts]
    // Deserialize array length for message field [contacts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.contacts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.contacts[i] = ContactInformation.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [cost_sources]
    // Deserialize array length for message field [cost_sources]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.cost_sources = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.cost_sources[i] = CostSource.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [constraint_result]
    // Deserialize array length for message field [constraint_result]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.constraint_result = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.constraint_result[i] = ConstraintEvalResult.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.contacts.forEach((val) => {
      length += ContactInformation.getMessageSize(val);
    });
    length += 56 * object.cost_sources.length;
    length += 9 * object.constraint_result.length;
    return length + 13;
  }

  static datatype() {
    // Returns string type for a service object
    return 'moveit_msgs/GetStateValidityResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e326fb22b7448f29c0e726d9270d9929';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool valid
    ContactInformation[] contacts
    CostSource[] cost_sources
    ConstraintEvalResult[] constraint_result
    
    
    ================================================================================
    MSG: moveit_msgs/ContactInformation
    # Standard ROS header contains information 
    # about the frame in which this 
    # contact is specified
    Header header
    
    # Position of the contact point
    geometry_msgs/Point position
    
    # Normal corresponding to the contact point
    geometry_msgs/Vector3 normal 
    
    # Depth of contact point
    float64 depth
    
    # Name of the first body that is in contact
    # This could be a link or a namespace that represents a body
    string contact_body_1
    uint32 body_type_1
    
    # Name of the second body that is in contact
    # This could be a link or a namespace that represents a body
    string contact_body_2
    uint32 body_type_2
    
    uint32 ROBOT_LINK=0
    uint32 WORLD_OBJECT=1
    uint32 ROBOT_ATTACHED=2
    
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
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
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
    MSG: moveit_msgs/CostSource
    # The density of the cost source
    float64 cost_density
    
    # The volume of the cost source is represented as an
    # axis-aligned bounding box (AABB)
    # The AABB is specified by two of its opposite corners
    
    geometry_msgs/Vector3 aabb_min
    
    geometry_msgs/Vector3 aabb_max
    
    ================================================================================
    MSG: moveit_msgs/ConstraintEvalResult
    # This message contains result from constraint evaluation
    # result specifies the result of constraint evaluation 
    # (true indicates state satisfies constraint, false indicates state violates constraint)
    # if false, distance specifies a measure of the distance of the state from the constraint
    # if true, distance is set to zero
    bool result
    float64 distance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetStateValidityResponse(null);
    if (msg.valid !== undefined) {
      resolved.valid = msg.valid;
    }
    else {
      resolved.valid = false
    }

    if (msg.contacts !== undefined) {
      resolved.contacts = new Array(msg.contacts.length);
      for (let i = 0; i < resolved.contacts.length; ++i) {
        resolved.contacts[i] = ContactInformation.Resolve(msg.contacts[i]);
      }
    }
    else {
      resolved.contacts = []
    }

    if (msg.cost_sources !== undefined) {
      resolved.cost_sources = new Array(msg.cost_sources.length);
      for (let i = 0; i < resolved.cost_sources.length; ++i) {
        resolved.cost_sources[i] = CostSource.Resolve(msg.cost_sources[i]);
      }
    }
    else {
      resolved.cost_sources = []
    }

    if (msg.constraint_result !== undefined) {
      resolved.constraint_result = new Array(msg.constraint_result.length);
      for (let i = 0; i < resolved.constraint_result.length; ++i) {
        resolved.constraint_result[i] = ConstraintEvalResult.Resolve(msg.constraint_result[i]);
      }
    }
    else {
      resolved.constraint_result = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetStateValidityRequest,
  Response: GetStateValidityResponse,
  md5sum() { return '8cf421a006e549ff65ea0cea3f2f8233'; },
  datatype() { return 'moveit_msgs/GetStateValidity'; }
};
