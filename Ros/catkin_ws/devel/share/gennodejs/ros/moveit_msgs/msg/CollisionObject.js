// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let object_recognition_msgs = _finder('object_recognition_msgs');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');
let shape_msgs = _finder('shape_msgs');

//-----------------------------------------------------------

class CollisionObject {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.pose = null;
      this.id = null;
      this.type = null;
      this.primitives = null;
      this.primitive_poses = null;
      this.meshes = null;
      this.mesh_poses = null;
      this.planes = null;
      this.plane_poses = null;
      this.subframe_names = null;
      this.subframe_poses = null;
      this.operation = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = '';
      }
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = new object_recognition_msgs.msg.ObjectType();
      }
      if (initObj.hasOwnProperty('primitives')) {
        this.primitives = initObj.primitives
      }
      else {
        this.primitives = [];
      }
      if (initObj.hasOwnProperty('primitive_poses')) {
        this.primitive_poses = initObj.primitive_poses
      }
      else {
        this.primitive_poses = [];
      }
      if (initObj.hasOwnProperty('meshes')) {
        this.meshes = initObj.meshes
      }
      else {
        this.meshes = [];
      }
      if (initObj.hasOwnProperty('mesh_poses')) {
        this.mesh_poses = initObj.mesh_poses
      }
      else {
        this.mesh_poses = [];
      }
      if (initObj.hasOwnProperty('planes')) {
        this.planes = initObj.planes
      }
      else {
        this.planes = [];
      }
      if (initObj.hasOwnProperty('plane_poses')) {
        this.plane_poses = initObj.plane_poses
      }
      else {
        this.plane_poses = [];
      }
      if (initObj.hasOwnProperty('subframe_names')) {
        this.subframe_names = initObj.subframe_names
      }
      else {
        this.subframe_names = [];
      }
      if (initObj.hasOwnProperty('subframe_poses')) {
        this.subframe_poses = initObj.subframe_poses
      }
      else {
        this.subframe_poses = [];
      }
      if (initObj.hasOwnProperty('operation')) {
        this.operation = initObj.operation
      }
      else {
        this.operation = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CollisionObject
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.string(obj.id, buffer, bufferOffset);
    // Serialize message field [type]
    bufferOffset = object_recognition_msgs.msg.ObjectType.serialize(obj.type, buffer, bufferOffset);
    // Serialize message field [primitives]
    // Serialize the length for message field [primitives]
    bufferOffset = _serializer.uint32(obj.primitives.length, buffer, bufferOffset);
    obj.primitives.forEach((val) => {
      bufferOffset = shape_msgs.msg.SolidPrimitive.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [primitive_poses]
    // Serialize the length for message field [primitive_poses]
    bufferOffset = _serializer.uint32(obj.primitive_poses.length, buffer, bufferOffset);
    obj.primitive_poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [meshes]
    // Serialize the length for message field [meshes]
    bufferOffset = _serializer.uint32(obj.meshes.length, buffer, bufferOffset);
    obj.meshes.forEach((val) => {
      bufferOffset = shape_msgs.msg.Mesh.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [mesh_poses]
    // Serialize the length for message field [mesh_poses]
    bufferOffset = _serializer.uint32(obj.mesh_poses.length, buffer, bufferOffset);
    obj.mesh_poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [planes]
    // Serialize the length for message field [planes]
    bufferOffset = _serializer.uint32(obj.planes.length, buffer, bufferOffset);
    obj.planes.forEach((val) => {
      bufferOffset = shape_msgs.msg.Plane.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [plane_poses]
    // Serialize the length for message field [plane_poses]
    bufferOffset = _serializer.uint32(obj.plane_poses.length, buffer, bufferOffset);
    obj.plane_poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [subframe_names]
    bufferOffset = _arraySerializer.string(obj.subframe_names, buffer, bufferOffset, null);
    // Serialize message field [subframe_poses]
    // Serialize the length for message field [subframe_poses]
    bufferOffset = _serializer.uint32(obj.subframe_poses.length, buffer, bufferOffset);
    obj.subframe_poses.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [operation]
    bufferOffset = _serializer.byte(obj.operation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CollisionObject
    let len;
    let data = new CollisionObject(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [type]
    data.type = object_recognition_msgs.msg.ObjectType.deserialize(buffer, bufferOffset);
    // Deserialize message field [primitives]
    // Deserialize array length for message field [primitives]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.primitives = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.primitives[i] = shape_msgs.msg.SolidPrimitive.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [primitive_poses]
    // Deserialize array length for message field [primitive_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.primitive_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.primitive_poses[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [meshes]
    // Deserialize array length for message field [meshes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.meshes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.meshes[i] = shape_msgs.msg.Mesh.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [mesh_poses]
    // Deserialize array length for message field [mesh_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.mesh_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.mesh_poses[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [planes]
    // Deserialize array length for message field [planes]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.planes = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.planes[i] = shape_msgs.msg.Plane.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [plane_poses]
    // Deserialize array length for message field [plane_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.plane_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.plane_poses[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [subframe_names]
    data.subframe_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [subframe_poses]
    // Deserialize array length for message field [subframe_poses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.subframe_poses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.subframe_poses[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [operation]
    data.operation = _deserializer.byte(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.id);
    length += object_recognition_msgs.msg.ObjectType.getMessageSize(object.type);
    object.primitives.forEach((val) => {
      length += shape_msgs.msg.SolidPrimitive.getMessageSize(val);
    });
    length += 56 * object.primitive_poses.length;
    object.meshes.forEach((val) => {
      length += shape_msgs.msg.Mesh.getMessageSize(val);
    });
    length += 56 * object.mesh_poses.length;
    length += 32 * object.planes.length;
    length += 56 * object.plane_poses.length;
    object.subframe_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    length += 56 * object.subframe_poses.length;
    return length + 93;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/CollisionObject';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dbba710596087da521c07564160dfccb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CollisionObject(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = ''
    }

    if (msg.type !== undefined) {
      resolved.type = object_recognition_msgs.msg.ObjectType.Resolve(msg.type)
    }
    else {
      resolved.type = new object_recognition_msgs.msg.ObjectType()
    }

    if (msg.primitives !== undefined) {
      resolved.primitives = new Array(msg.primitives.length);
      for (let i = 0; i < resolved.primitives.length; ++i) {
        resolved.primitives[i] = shape_msgs.msg.SolidPrimitive.Resolve(msg.primitives[i]);
      }
    }
    else {
      resolved.primitives = []
    }

    if (msg.primitive_poses !== undefined) {
      resolved.primitive_poses = new Array(msg.primitive_poses.length);
      for (let i = 0; i < resolved.primitive_poses.length; ++i) {
        resolved.primitive_poses[i] = geometry_msgs.msg.Pose.Resolve(msg.primitive_poses[i]);
      }
    }
    else {
      resolved.primitive_poses = []
    }

    if (msg.meshes !== undefined) {
      resolved.meshes = new Array(msg.meshes.length);
      for (let i = 0; i < resolved.meshes.length; ++i) {
        resolved.meshes[i] = shape_msgs.msg.Mesh.Resolve(msg.meshes[i]);
      }
    }
    else {
      resolved.meshes = []
    }

    if (msg.mesh_poses !== undefined) {
      resolved.mesh_poses = new Array(msg.mesh_poses.length);
      for (let i = 0; i < resolved.mesh_poses.length; ++i) {
        resolved.mesh_poses[i] = geometry_msgs.msg.Pose.Resolve(msg.mesh_poses[i]);
      }
    }
    else {
      resolved.mesh_poses = []
    }

    if (msg.planes !== undefined) {
      resolved.planes = new Array(msg.planes.length);
      for (let i = 0; i < resolved.planes.length; ++i) {
        resolved.planes[i] = shape_msgs.msg.Plane.Resolve(msg.planes[i]);
      }
    }
    else {
      resolved.planes = []
    }

    if (msg.plane_poses !== undefined) {
      resolved.plane_poses = new Array(msg.plane_poses.length);
      for (let i = 0; i < resolved.plane_poses.length; ++i) {
        resolved.plane_poses[i] = geometry_msgs.msg.Pose.Resolve(msg.plane_poses[i]);
      }
    }
    else {
      resolved.plane_poses = []
    }

    if (msg.subframe_names !== undefined) {
      resolved.subframe_names = msg.subframe_names;
    }
    else {
      resolved.subframe_names = []
    }

    if (msg.subframe_poses !== undefined) {
      resolved.subframe_poses = new Array(msg.subframe_poses.length);
      for (let i = 0; i < resolved.subframe_poses.length; ++i) {
        resolved.subframe_poses[i] = geometry_msgs.msg.Pose.Resolve(msg.subframe_poses[i]);
      }
    }
    else {
      resolved.subframe_poses = []
    }

    if (msg.operation !== undefined) {
      resolved.operation = msg.operation;
    }
    else {
      resolved.operation = 0
    }

    return resolved;
    }
};

// Constants for message
CollisionObject.Constants = {
  ADD: 0,
  REMOVE: 1,
  APPEND: 2,
  MOVE: 3,
}

module.exports = CollisionObject;
