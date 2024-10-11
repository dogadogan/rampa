using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class RightHandPositionDebug : MonoBehaviour
{
    public OVRHand hand;

    public TMP_Text debugText;

    public void Update() {

        if (hand.GetFingerIsPinching(OVRHand.HandFinger.Index)) {
            debugText.text += "\n" + hand.PointerPose.position.ToString();
        } else {
            
        }
    }


}
