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
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class ContactInformation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.position = null;
      this.normal = null;
      this.depth = null;
      this.contact_body_1 = null;
      this.body_type_1 = null;
      this.contact_body_2 = null;
      this.body_type_2 = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('normal')) {
        this.normal = initObj.normal
      }
      else {
        this.normal = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('depth')) {
        this.depth = initObj.depth
      }
      else {
        this.depth = 0.0;
      }
      if (initObj.hasOwnProperty('contact_body_1')) {
        this.contact_body_1 = initObj.contact_body_1
      }
      else {
        this.contact_body_1 = '';
      }
      if (initObj.hasOwnProperty('body_type_1')) {
        this.body_type_1 = initObj.body_type_1
      }
      else {
        this.body_type_1 = 0;
      }
      if (initObj.hasOwnProperty('contact_body_2')) {
        this.contact_body_2 = initObj.contact_body_2
      }
      else {
        this.contact_body_2 = '';
      }
      if (initObj.hasOwnProperty('body_type_2')) {
        this.body_type_2 = initObj.body_type_2
      }
      else {
        this.body_type_2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ContactInformation
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [normal]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.normal, buffer, bufferOffset);
    // Serialize message field [depth]
    bufferOffset = _serializer.float64(obj.depth, buffer, bufferOffset);
    // Serialize message field [contact_body_1]
    bufferOffset = _serializer.string(obj.contact_body_1, buffer, bufferOffset);
    // Serialize message field [body_type_1]
    bufferOffset = _serializer.uint32(obj.body_type_1, buffer, bufferOffset);
    // Serialize message field [contact_body_2]
    bufferOffset = _serializer.string(obj.contact_body_2, buffer, bufferOffset);
    // Serialize message field [body_type_2]
    bufferOffset = _serializer.uint32(obj.body_type_2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ContactInformation
    let len;
    let data = new ContactInformation(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [normal]
    data.normal = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [depth]
    data.depth = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [contact_body_1]
    data.contact_body_1 = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [body_type_1]
    data.body_type_1 = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [contact_body_2]
    data.contact_body_2 = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [body_type_2]
    data.body_type_2 = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.contact_body_1);
    length += _getByteLength(object.contact_body_2);
    return length + 72;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/ContactInformation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '116228ca08b0c286ec5ca32a50fdc17b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ContactInformation(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.position !== undefined) {
      resolved.position = geometry_msgs.msg.Point.Resolve(msg.position)
    }
    else {
      resolved.position = new geometry_msgs.msg.Point()
    }

    if (msg.normal !== undefined) {
      resolved.normal = geometry_msgs.msg.Vector3.Resolve(msg.normal)
    }
    else {
      resolved.normal = new geometry_msgs.msg.Vector3()
    }

    if (msg.depth !== undefined) {
      resolved.depth = msg.depth;
    }
    else {
      resolved.depth = 0.0
    }

    if (msg.contact_body_1 !== undefined) {
      resolved.contact_body_1 = msg.contact_body_1;
    }
    else {
      resolved.contact_body_1 = ''
    }

    if (msg.body_type_1 !== undefined) {
      resolved.body_type_1 = msg.body_type_1;
    }
    else {
      resolved.body_type_1 = 0
    }

    if (msg.contact_body_2 !== undefined) {
      resolved.contact_body_2 = msg.contact_body_2;
    }
    else {
      resolved.contact_body_2 = ''
    }

    if (msg.body_type_2 !== undefined) {
      resolved.body_type_2 = msg.body_type_2;
    }
    else {
      resolved.body_type_2 = 0
    }

    return resolved;
    }
};

// Constants for message
ContactInformation.Constants = {
  ROBOT_LINK: 0,
  WORLD_OBJECT: 1,
  ROBOT_ATTACHED: 2,
}

module.exports = ContactInformation;
