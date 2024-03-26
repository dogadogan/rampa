using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Teleport: MonoBehaviour
{

    public ArticulationBody ab;
    // public GameObject from;
    // public GameObject target;
    // private float timeCount = 0.0f;
    public GameObject grabable;

    private void Start()
    {
        //ab.TeleportRoot(transform.position + Vector3.up, transform.rotation);
        //from = transform;
        //target = new Transform();
        // target.Rotate(90.0f, 0.0f, 0.0f, Space.Self);
    }


    void FixedUpdate()
    {
        //Quaternion rotation  = Quaternion.Slerp(from.transform.rotation, target.transform.rotation, timeCount);
        //timeCount += Time.deltaTime;
        ab.TeleportRoot(grabable.transform.position,grabable.transform.rotation);
    }
}
