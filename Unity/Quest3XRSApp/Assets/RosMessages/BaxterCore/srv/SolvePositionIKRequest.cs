//Do not edit! This file was generated by Unity-ROS MessageGeneration.
using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using Unity.Robotics.ROSTCPConnector.MessageGeneration;

namespace RosMessageTypes.BaxterCore
{
    [Serializable]
    public class SolvePositionIKRequest : Message
    {
        public const string k_RosMessageName = "baxter_core_msgs/SolvePositionIK";
        public override string RosMessageName => k_RosMessageName;

        //  Endpoint Pose(s) to request Inverse-Kinematics joint solutions for.
        public Geometry.PoseStampedMsg[] pose_stamp;
        //  (optional) Joint Angle Seed(s) for IK solver.
        //  * specify a JointState seed for each pose_stamp, using name[] and position[]
        //  * empty arrays or a non-default seed_mode will cause user seed to not be used
        public Sensor.JointStateMsg[] seed_angles;
        //  Seed Type Mode
        //  * default (SEED_AUTO) mode: iterate through seed types until first valid
        //                              solution is found
        //  * setting any other mode:   try only that seed type
        public const byte SEED_AUTO = 0;
        public const byte SEED_USER = 1;
        public const byte SEED_CURRENT = 2;
        public const byte SEED_NS_MAP = 3;
        public byte seed_mode;

        public SolvePositionIKRequest()
        {
            this.pose_stamp = new Geometry.PoseStampedMsg[0];
            this.seed_angles = new Sensor.JointStateMsg[0];
            this.seed_mode = 0;
        }

        public SolvePositionIKRequest(Geometry.PoseStampedMsg[] pose_stamp, Sensor.JointStateMsg[] seed_angles, byte seed_mode)
        {
            this.pose_stamp = pose_stamp;
            this.seed_angles = seed_angles;
            this.seed_mode = seed_mode;
        }

        public static SolvePositionIKRequest Deserialize(MessageDeserializer deserializer) => new SolvePositionIKRequest(deserializer);

        private SolvePositionIKRequest(MessageDeserializer deserializer)
        {
            deserializer.Read(out this.pose_stamp, Geometry.PoseStampedMsg.Deserialize, deserializer.ReadLength());
            deserializer.Read(out this.seed_angles, Sensor.JointStateMsg.Deserialize, deserializer.ReadLength());
            deserializer.Read(out this.seed_mode);
        }

        public override void SerializeTo(MessageSerializer serializer)
        {
            serializer.WriteLength(this.pose_stamp);
            serializer.Write(this.pose_stamp);
            serializer.WriteLength(this.seed_angles);
            serializer.Write(this.seed_angles);
            serializer.Write(this.seed_mode);
        }

        public override string ToString()
        {
            return "SolvePositionIKRequest: " +
            "\npose_stamp: " + System.String.Join(", ", pose_stamp.ToList()) +
            "\nseed_angles: " + System.String.Join(", ", seed_angles.ToList()) +
            "\nseed_mode: " + seed_mode.ToString();
        }

#if UNITY_EDITOR
        [UnityEditor.InitializeOnLoadMethod]
#else
        [UnityEngine.RuntimeInitializeOnLoadMethod]
#endif
        public static void Register()
        {
            MessageRegistry.Register(k_RosMessageName, Deserialize);
        }
    }
}
