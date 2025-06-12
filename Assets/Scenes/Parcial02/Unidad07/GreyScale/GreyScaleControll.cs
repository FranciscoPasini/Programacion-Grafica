using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GreyScaleControll : MonoBehaviour
{
    public Material material;
    public Slider grayscaleSlider;

    void Update()
    {
        material.SetFloat("_GrayscaleAmount", grayscaleSlider.value);
    }
}
