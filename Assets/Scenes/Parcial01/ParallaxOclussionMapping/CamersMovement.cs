using UnityEngine;

public class CameraMovement : MonoBehaviour
{
    public float moveSpeed = 10f;
    public float lookSpeed = 2f;

    float yaw = 0f;
    float pitch = 0f;

    void Update()
    {
        if (Input.GetMouseButton(1))
        {
            Cursor.lockState = CursorLockMode.Locked;

            yaw += Input.GetAxis("Mouse X") * lookSpeed;
            pitch -= Input.GetAxis("Mouse Y") * lookSpeed;
            pitch = Mathf.Clamp(pitch, -90f, 90f);

            transform.eulerAngles = new Vector3(pitch, yaw, 0f);

            float x = Input.GetAxis("Horizontal"); // A/D
            float z = Input.GetAxis("Vertical");   // W/S
            float y = 0;

            if (Input.GetKey(KeyCode.E)) y += 1f;  // Subir
            if (Input.GetKey(KeyCode.Q)) y -= 1f;  // Bajar

            Vector3 move = transform.right * x + transform.forward * z + transform.up * y;
            transform.position += move * moveSpeed * Time.deltaTime;
        }
        else
        {
            Cursor.lockState = CursorLockMode.None;
        }
    }
}