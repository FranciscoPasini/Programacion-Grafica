using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MaterialDistorsionController : MonoBehaviour
{
    public Material material;
    public float distortionStrength = 0.1f;
    public float speed = 1f;

    private float timeOffset;

    void Update()
    {
        timeOffset += Time.deltaTime * speed;
        material.SetFloat("_DistortionTime", timeOffset);
        material.SetFloat("_DistortionStrength", distortionStrength);
    }
}
