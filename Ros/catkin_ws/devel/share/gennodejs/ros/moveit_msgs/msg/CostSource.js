// Auto-generated. Do not edit!

// (in-package moveit_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class CostSource {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cost_density = null;
      this.aabb_min = null;
      this.aabb_max = null;
    }
    else {
      if (initObj.hasOwnProperty('cost_density')) {
        this.cost_density = initObj.cost_density
      }
      else {
        this.cost_density = 0.0;
      }
      if (initObj.hasOwnProperty('aabb_min')) {
        this.aabb_min = initObj.aabb_min
      }
      else {
        this.aabb_min = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('aabb_max')) {
        this.aabb_max = initObj.aabb_max
      }
      else {
        this.aabb_max = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CostSource
    // Serialize message field [cost_density]
    bufferOffset = _serializer.float64(obj.cost_density, buffer, bufferOffset);
    // Serialize message field [aabb_min]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.aabb_min, buffer, bufferOffset);
    // Serialize message field [aabb_max]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.aabb_max, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CostSource
    let len;
    let data = new CostSource(null);
    // Deserialize message field [cost_density]
    data.cost_density = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [aabb_min]
    data.aabb_min = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [aabb_max]
    data.aabb_max = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/CostSource';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'abb7e013237dacaaa8b97e704102f908';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # The density of the cost source
    float64 cost_density
    
    # The volume of the cost source is represented as an
    # axis-aligned bounding box (AABB)
    # The AABB is specified by two of its opposite corners
    
    geometry_msgs/Vector3 aabb_min
    
    geometry_msgs/Vector3 aabb_max
    
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
    const resolved = new CostSource(null);
    if (msg.cost_density !== undefined) {
      resolved.cost_density = msg.cost_density;
    }
    else {
      resolved.cost_density = 0.0
    }

    if (msg.aabb_min !== undefined) {
      resolved.aabb_min = geometry_msgs.msg.Vector3.Resolve(msg.aabb_min)
    }
    else {
      resolved.aabb_min = new geometry_msgs.msg.Vector3()
    }

    if (msg.aabb_max !== undefined) {
      resolved.aabb_max = geometry_msgs.msg.Vector3.Resolve(msg.aabb_max)
    }
    else {
      resolved.aabb_max = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = CostSource;
