using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ParallaxController : MonoBehaviour
{
    public Material targetMaterial;
    public Slider scaleSlider;
    public Slider refPlaneSlider;

    private float lastScaleValue;
    private float lastRefPlaneValue;

    void Start()
    {
        
        lastScaleValue = scaleSlider.value;
        lastRefPlaneValue = refPlaneSlider.value;

     
        UpdateScale(lastScaleValue);
        UpdateRefPlane(lastRefPlaneValue);
    }

    void Update()
    {
        if (scaleSlider.value != lastScaleValue)
        {
            lastScaleValue = scaleSlider.value;
            UpdateScale(lastScaleValue);
        }

        if (refPlaneSlider.value != lastRefPlaneValue)
        {
            lastRefPlaneValue = refPlaneSlider.value;
            UpdateRefPlane(lastRefPlaneValue);
        }
    }

    void UpdateScale(float value)
    {
        targetMaterial.SetFloat("_Scale", value);
    }

    void UpdateRefPlane(float value)
    {
        targetMaterial.SetFloat("_RefPlane", value);
    }
}
