using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Camera))]
public class BloomScript : MonoBehaviour
{
    public Shader postProcessShader;

    [SerializeField] private Material postProcessMaterial;
    [SerializeField] private Slider intensitySlider;


    void Awake()
    {
        postProcessMaterial = new Material(postProcessShader);
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (postProcessMaterial != null)
        {
            postProcessMaterial.SetFloat("_BloomIntensity", intensitySlider.value);

            Graphics.Blit(source, destination, postProcessMaterial);
        }
        else
        {
            Graphics.Blit(source, destination);
        }
    }
}
