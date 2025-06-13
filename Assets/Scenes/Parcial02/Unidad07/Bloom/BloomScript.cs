using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Camera))]
public class BloomScript : MonoBehaviour
{
    public Shader postProcessShader;

    [SerializeField] private Material postProcessMaterial;

    [Range(0.0f, 5.0f)]

    public float bloomIntensity = 1.0f;

    void Awake()
    {
        postProcessMaterial = new Material(postProcessShader);
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (postProcessMaterial != null)
        {
            postProcessMaterial.SetFloat("_BloomIntensity", bloomIntensity);

            Graphics.Blit(source, destination, postProcessMaterial);
        }
        else
        {
            Graphics.Blit(source, destination);
        }
    }
}
