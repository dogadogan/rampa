using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FixedRotation : MonoBehaviour
{
    private void LateUpdate()
    {
        transform.rotation = Quaternion.Euler(0,0,0);
    }
}
