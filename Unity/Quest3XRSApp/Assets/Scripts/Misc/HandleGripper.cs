using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HandleGripper : MonoBehaviour
{

    public ArticulationBody finger1;
    public ArticulationBody finger2;

    int state = 0;

    public void handleClick() {

        if (state == 0) {
            state = 1;
            var xDrive = finger1.xDrive;
            xDrive.target = 5f;
            finger1.xDrive = xDrive;

            xDrive = finger2.xDrive;
            xDrive.target = 5f;
            finger2.xDrive = xDrive;
        } else {
            state = 0;
            var xDrive = finger1.xDrive;
            xDrive.target = 0.0f;
            finger1.xDrive = xDrive;
            
            xDrive = finger2.xDrive;
            xDrive.target = 0.0f;
            finger2.xDrive = xDrive;
        }

    }
}
