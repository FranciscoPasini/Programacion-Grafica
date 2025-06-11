using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DissolveController : MonoBehaviour
{
    public Material targetMaterial;
    public Slider dissolveSlider;
    private float lastDissolveValue;


    void Start()
    {

        lastDissolveValue = dissolveSlider.value;



        UpdateDissolve(lastDissolveValue);

    }

    void Update()
    {
        if (dissolveSlider.value != lastDissolveValue)
        {
            lastDissolveValue = dissolveSlider.value;
            UpdateDissolve(lastDissolveValue);
        }
    }

    void UpdateDissolve(float value)
    {
        targetMaterial.SetFloat("_Dissolve", value);
    }


}
