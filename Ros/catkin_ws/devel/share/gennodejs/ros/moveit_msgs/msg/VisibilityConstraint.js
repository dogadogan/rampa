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

class VisibilityConstraint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_radius = null;
      this.target_pose = null;
      this.cone_sides = null;
      this.sensor_pose = null;
      this.max_view_angle = null;
      this.max_range_angle = null;
      this.sensor_view_direction = null;
      this.weight = null;
    }
    else {
      if (initObj.hasOwnProperty('target_radius')) {
        this.target_radius = initObj.target_radius
      }
      else {
        this.target_radius = 0.0;
      }
      if (initObj.hasOwnProperty('target_pose')) {
        this.target_pose = initObj.target_pose
      }
      else {
        this.target_pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('cone_sides')) {
        this.cone_sides = initObj.cone_sides
      }
      else {
        this.cone_sides = 0;
      }
      if (initObj.hasOwnProperty('sensor_pose')) {
        this.sensor_pose = initObj.sensor_pose
      }
      else {
        this.sensor_pose = new geometry_msgs.msg.PoseStamped();
      }
      if (initObj.hasOwnProperty('max_view_angle')) {
        this.max_view_angle = initObj.max_view_angle
      }
      else {
        this.max_view_angle = 0.0;
      }
      if (initObj.hasOwnProperty('max_range_angle')) {
        this.max_range_angle = initObj.max_range_angle
      }
      else {
        this.max_range_angle = 0.0;
      }
      if (initObj.hasOwnProperty('sensor_view_direction')) {
        this.sensor_view_direction = initObj.sensor_view_direction
      }
      else {
        this.sensor_view_direction = 0;
      }
      if (initObj.hasOwnProperty('weight')) {
        this.weight = initObj.weight
      }
      else {
        this.weight = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VisibilityConstraint
    // Serialize message field [target_radius]
    bufferOffset = _serializer.float64(obj.target_radius, buffer, bufferOffset);
    // Serialize message field [target_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.target_pose, buffer, bufferOffset);
    // Serialize message field [cone_sides]
    bufferOffset = _serializer.int32(obj.cone_sides, buffer, bufferOffset);
    // Serialize message field [sensor_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.sensor_pose, buffer, bufferOffset);
    // Serialize message field [max_view_angle]
    bufferOffset = _serializer.float64(obj.max_view_angle, buffer, bufferOffset);
    // Serialize message field [max_range_angle]
    bufferOffset = _serializer.float64(obj.max_range_angle, buffer, bufferOffset);
    // Serialize message field [sensor_view_direction]
    bufferOffset = _serializer.uint8(obj.sensor_view_direction, buffer, bufferOffset);
    // Serialize message field [weight]
    bufferOffset = _serializer.float64(obj.weight, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VisibilityConstraint
    let len;
    let data = new VisibilityConstraint(null);
    // Deserialize message field [target_radius]
    data.target_radius = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [target_pose]
    data.target_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [cone_sides]
    data.cone_sides = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [sensor_pose]
    data.sensor_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [max_view_angle]
    data.max_view_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_range_angle]
    data.max_range_angle = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sensor_view_direction]
    data.sensor_view_direction = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [weight]
    data.weight = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.target_pose);
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.sensor_pose);
    return length + 37;
  }

  static datatype() {
    // Returns string type for a message object
    return 'moveit_msgs/VisibilityConstraint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '62cda903bfe31ff2e5fcdc3810d577ad';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new VisibilityConstraint(null);
    if (msg.target_radius !== undefined) {
      resolved.target_radius = msg.target_radius;
    }
    else {
      resolved.target_radius = 0.0
    }

    if (msg.target_pose !== undefined) {
      resolved.target_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.target_pose)
    }
    else {
      resolved.target_pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.cone_sides !== undefined) {
      resolved.cone_sides = msg.cone_sides;
    }
    else {
      resolved.cone_sides = 0
    }

    if (msg.sensor_pose !== undefined) {
      resolved.sensor_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.sensor_pose)
    }
    else {
      resolved.sensor_pose = new geometry_msgs.msg.PoseStamped()
    }

    if (msg.max_view_angle !== undefined) {
      resolved.max_view_angle = msg.max_view_angle;
    }
    else {
      resolved.max_view_angle = 0.0
    }

    if (msg.max_range_angle !== undefined) {
      resolved.max_range_angle = msg.max_range_angle;
    }
    else {
      resolved.max_range_angle = 0.0
    }

    if (msg.sensor_view_direction !== undefined) {
      resolved.sensor_view_direction = msg.sensor_view_direction;
    }
    else {
      resolved.sensor_view_direction = 0
    }

    if (msg.weight !== undefined) {
      resolved.weight = msg.weight;
    }
    else {
      resolved.weight = 0.0
    }

    return resolved;
    }
};

// Constants for message
VisibilityConstraint.Constants = {
  SENSOR_Z: 0,
  SENSOR_Y: 1,
  SENSOR_X: 2,
}

module.exports = VisibilityConstraint;
