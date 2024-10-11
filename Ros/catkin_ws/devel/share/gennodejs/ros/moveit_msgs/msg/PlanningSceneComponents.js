// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PlanningSceneComponents {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.components = null;
    }
    else {
      if (initObj.hasOwnProperty('components')) {
        this.components = initObj.components
      }
      else {
        this.components = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PlanningSceneComponents
    // Serialize message field [components]
    bufferOffset = _serializer.uint32(obj.components, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PlanningSceneComponents
    let len;
    let data = new PlanningSceneComponents(null);
    // Deserialize message field [components]
    data.components = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/PlanningSceneComponents';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bc993e784476960b918b6e7ad5bb58ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # This message defines the components that make up the PlanningScene message.
    # The values can be used as a bitfield to specify which parts of the PlanningScene message
    # are of interest
    
    # Scene name, model name, model root
    uint32 SCENE_SETTINGS=1
    
    # Joint values of the robot state
    uint32 ROBOT_STATE=2
    
    # Attached objects (including geometry) for the robot state
    uint32 ROBOT_STATE_ATTACHED_OBJECTS=4
    
    # The names of the world objects
    uint32 WORLD_OBJECT_NAMES=8
    
    # The geometry of the world objects
    uint32 WORLD_OBJECT_GEOMETRY=16
    
    # The maintained octomap 
    uint32 OCTOMAP=32
    
    # The maintained list of transforms
    uint32 TRANSFORMS=64
    
    # The allowed collision matrix
    uint32 ALLOWED_COLLISION_MATRIX=128
    
    # The default link padding and link scaling
    uint32 LINK_PADDING_AND_SCALING=256
    
    # The stored object colors
    uint32 OBJECT_COLORS=512
    
    # Bitfield combining options indicated above
    uint32 components
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PlanningSceneComponents(null);
    if (msg.components !== undefined) {
      resolved.components = msg.components;
    }
    else {
      resolved.components = 0
    }

    return resolved;
    }
};

// Constants for message
PlanningSceneComponents.Constants = {
  SCENE_SETTINGS: 1,
  ROBOT_STATE: 2,
  ROBOT_STATE_ATTACHED_OBJECTS: 4,
  WORLD_OBJECT_NAMES: 8,
  WORLD_OBJECT_GEOMETRY: 16,
  OCTOMAP: 32,
  TRANSFORMS: 64,
  ALLOWED_COLLISION_MATRIX: 128,
  LINK_PADDING_AND_SCALING: 256,
  OBJECT_COLORS: 512,
}

module.exports = PlanningSceneComponents;
