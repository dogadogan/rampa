// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let CollisionObject = require('./CollisionObject.js');
let octomap_msgs = _finder('octomap_msgs');

//-----------------------------------------------------------

class PlanningSceneWorld {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.collision_objects = null;
      this.octomap = null;
    }
    else {
      if (initObj.hasOwnProperty('collision_objects')) {
        this.collision_objects = initObj.collision_objects
      }
      else {
        this.collision_objects = [];
      }
      if (initObj.hasOwnProperty('octomap')) {
        this.octomap = initObj.octomap
      }
      else {
        this.octomap = new octomap_msgs.msg.OctomapWithPose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanningSceneWorld
    // Serialize message field [collision_objects]
    // Serialize the length for message field [collision_objects]
    bufferOffset = _serializer.uint32(obj.collision_objects.length, buffer, bufferOffset);
    obj.collision_objects.forEach((val) => {
      bufferOffset = CollisionObject.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [octomap]
    bufferOffset = octomap_msgs.msg.OctomapWithPose.serialize(obj.octomap, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanningSceneWorld
    let len;
    let data = new PlanningSceneWorld(null);
    // Deserialize message field [collision_objects]
    // Deserialize array length for message field [collision_objects]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.collision_objects = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.collision_objects[i] = CollisionObject.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [octomap]
    data.octomap = octomap_msgs.msg.OctomapWithPose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.collision_objects.forEach((val) => {
      length += CollisionObject.getMessageSize(val);
    });
    length += octomap_msgs.msg.OctomapWithPose.getMessageSize(object.octomap);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/PlanningSceneWorld';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '79457311445f53d410ab4e3781de8447';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # collision objects
    CollisionObject[] collision_objects
    
    # The octomap that represents additional collision data
    octomap_msgs/OctomapWithPose octomap
    
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
    const resolved = new PlanningSceneWorld(null);
    if (msg.collision_objects !== undefined) {
      resolved.collision_objects = new Array(msg.collision_objects.length);
      for (let i = 0; i < resolved.collision_objects.length; ++i) {
        resolved.collision_objects[i] = CollisionObject.Resolve(msg.collision_objects[i]);
      }
    }
    else {
      resolved.collision_objects = []
    }

    if (msg.octomap !== undefined) {
      resolved.octomap = octomap_msgs.msg.OctomapWithPose.Resolve(msg.octomap)
    }
    else {
      resolved.octomap = new octomap_msgs.msg.OctomapWithPose()
    }

    return resolved;
    }
};

module.exports = PlanningSceneWorld;
