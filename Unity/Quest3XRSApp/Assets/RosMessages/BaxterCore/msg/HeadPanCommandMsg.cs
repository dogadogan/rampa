//Do not edit! This file was generated by Unity-ROS MessageGeneration.
using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using Unity.Robotics.ROSTCPConnector.MessageGeneration;

namespace RosMessageTypes.BaxterCore
{
    [Serializable]
    public class HeadPanCommandMsg : Message
    {
        public const string k_RosMessageName = "baxter_core_msgs/HeadPanCommand";
        public override string RosMessageName => k_RosMessageName;

        public float target;
        //  radians for target, 0 str
        public float speed_ratio;
        //  Percentage of max speed [0-1]
        // 
        public const float MAX_SPEED_RATIO = 1.0f;
        public const float MIN_SPEED_RATIO = 0.0f;
        // 
        public byte enable_pan_request;
        //  override automatic pan enable/disable
        //  enable_pan_request is tristate: 0 = disable pan; 1 = enable pan; 2 = don't change pan
        public const byte REQUEST_PAN_DISABLE = 0;
        public const byte REQUEST_PAN_ENABLE = 1;
        public const byte REQUEST_PAN_VOID = 2;
        // 

        public HeadPanCommandMsg()
        {
            this.target = 0.0f;
            this.speed_ratio = 0.0f;
            this.enable_pan_request = 0;
        }

        public HeadPanCommandMsg(float target, float speed_ratio, byte enable_pan_request)
        {
            this.target = target;
            this.speed_ratio = speed_ratio;
            this.enable_pan_request = enable_pan_request;
        }

        public static HeadPanCommandMsg Deserialize(MessageDeserializer deserializer) => new HeadPanCommandMsg(deserializer);

        private HeadPanCommandMsg(MessageDeserializer deserializer)
        {
            deserializer.Read(out this.target);
            deserializer.Read(out this.speed_ratio);
            deserializer.Read(out this.enable_pan_request);
        }

        public override void SerializeTo(MessageSerializer serializer)
        {
            serializer.Write(this.target);
            serializer.Write(this.speed_ratio);
            serializer.Write(this.enable_pan_request);
        }

        public override string ToString()
        {
            return "HeadPanCommandMsg: " +
            "\ntarget: " + target.ToString() +
            "\nspeed_ratio: " + speed_ratio.ToString() +
            "\nenable_pan_request: " + enable_pan_request.ToString();
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
