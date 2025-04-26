using UnityEngine;
using UnityEngine.SceneManagement;

public class CambiarEscenaConFlechas : MonoBehaviour
{
    void Update()
    {
        // Ir a la escena anterior con flecha izquierda
        if (Input.GetKeyDown(KeyCode.LeftArrow))
        {
            int escenaActual = SceneManager.GetActiveScene().buildIndex;
            int escenaAnterior = escenaActual - 1;

            if (escenaAnterior >= 0)
                SceneManager.LoadScene(escenaAnterior);
        }

        // Ir a la escena siguiente con flecha derecha
        if (Input.GetKeyDown(KeyCode.RightArrow))
        {
            int escenaActual = SceneManager.GetActiveScene().buildIndex;
            int totalEscenas = SceneManager.sceneCountInBuildSettings;
            int escenaSiguiente = escenaActual + 1;

            if (escenaSiguiente < totalEscenas)
                SceneManager.LoadScene(escenaSiguiente);
        }
    }
}
