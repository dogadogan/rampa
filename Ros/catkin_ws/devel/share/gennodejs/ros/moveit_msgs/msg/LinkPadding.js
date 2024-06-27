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

class LinkPadding {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.link_name = null;
      this.padding = null;
    }
    else {
      if (initObj.hasOwnProperty('link_name')) {
        this.link_name = initObj.link_name
      }
      else {
        this.link_name = '';
      }
      if (initObj.hasOwnProperty('padding')) {
        this.padding = initObj.padding
      }
      else {
        this.padding = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LinkPadding
    // Serialize message field [link_name]
    bufferOffset = _serializer.string(obj.link_name, buffer, bufferOffset);
    // Serialize message field [padding]
    bufferOffset = _serializer.float64(obj.padding, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LinkPadding
    let len;
    let data = new LinkPadding(null);
    // Deserialize message field [link_name]
    data.link_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [padding]
    data.padding = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.link_name);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/LinkPadding';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b3ea75670df55c696fedee97774d5947';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #name for the link
    string link_name
    
    # padding to apply to the link
    float64 padding
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LinkPadding(null);
    if (msg.link_name !== undefined) {
      resolved.link_name = msg.link_name;
    }
    else {
      resolved.link_name = ''
    }

    if (msg.padding !== undefined) {
      resolved.padding = msg.padding;
    }
    else {
      resolved.padding = 0.0
    }

    return resolved;
    }
};

module.exports = LinkPadding;
