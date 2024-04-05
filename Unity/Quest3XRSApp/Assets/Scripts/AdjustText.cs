using System.Collections;
using System.Collections.Generic;
using System.Net.Mime;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class AdjustText : MonoBehaviour
{
    // Start is called before the first frame update
    public Slider Slider;
    public TextMeshProUGUI textMeshPro;
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        textMeshPro.text = (Slider.value * 180).ToString("0.000") + "°";

    }
}
