using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.SceneManagement;

public class LevelManager : MonoBehaviour
{
    public GameObject heightMap;
    public GameObject vertexPaint;
    public GameObject fresnelEffect;
    public GameObject parallaxOcclusionMaping;
    public GameObject screenWorldSpaceUV;
    public GameObject toonShading;
    public GameObject depthFade;
    public GameObject depthFade2;
    public GameObject shade;
    public GameObject shader10;
    public GameObject toonWater;

    public void HeightMap()
    {
        SceneManager.LoadScene("HeightMap");
    }

    public void VertexPaint()
    {
        SceneManager.LoadScene("VertexPaint");
    }

    public void FresnelEffect()
    {
        SceneManager.LoadScene("FresnelEffect");
    }

    public void ParallaxOcclusionMaping()
    {
        SceneManager.LoadScene("ParallaxOcclusionMaping");
    }

    public void ScreenWorldSpaceUV()
    {
        SceneManager.LoadScene("ScreenWorldSpaceUV");
    }

    public void ToonShading()
    {
        SceneManager.LoadScene("ToonShading");
    }

    public void DepthFade()
    {
        SceneManager.LoadScene("DepthFade");
    }

    public void DepthFade2()
    {
        SceneManager.LoadScene("DepthFade2");
    }

    public void Shade()
    {
        SceneManager.LoadScene("Shade");
    }

    public void Shader10()
    {
        SceneManager.LoadScene("Shade10");
    }

    public void ToonWater()
    {
        SceneManager.LoadScene("ToonWater");
    }
}
