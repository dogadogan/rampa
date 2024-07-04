// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let shape_msgs = _finder('shape_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class BoundingVolume {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.primitives = null;
      this.primitive_poses = null;
      this.meshes = null;
      this.mesh_poses = null;
    }
    else {
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BoundingVolume
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
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BoundingVolume
    let len;
    let data = new BoundingVolume(null);
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
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.primitives.forEach((val) => {
      length += shape_msgs.msg.SolidPrimitive.getMessageSize(val);
    });
    length += 56 * object.primitive_poses.length;
    object.meshes.forEach((val) => {
      length += shape_msgs.msg.Mesh.getMessageSize(val);
    });
    length += 56 * object.mesh_poses.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/BoundingVolume';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '22db94010f39e9198032cb4a1aeda26e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new BoundingVolume(null);
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

    return resolved;
    }
};

module.exports = BoundingVolume;
