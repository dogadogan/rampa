// Auto-generated. Do not edit!

// (in-package ur10_mover.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ListOfFloats {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.list = null;
    }
    else {
      if (initObj.hasOwnProperty('list')) {
        this.list = initObj.list
      }
      else {
        this.list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ListOfFloats
    // Serialize message field [list]
    bufferOffset = _arraySerializer.float64(obj.list, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ListOfFloats
    let len;
    let data = new ListOfFloats(null);
    // Deserialize message field [list]
    data.list = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.list.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ur10_mover/ListOfFloats';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c927dcaf1d3ff0b9aa7fd844cd956a22';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] list
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ListOfFloats(null);
    if (msg.list !== undefined) {
      resolved.list = msg.list;
    }
    else {
      resolved.list = []
    }

    return resolved;
    }
};

module.exports = ListOfFloats;
