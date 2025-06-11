using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraWASD : MonoBehaviour
{
    [Header("Movimiento WASD")]
    public float moveSpeed = 10f;
    public float sprintMultiplier = 2f;
    public float smoothTime = 0.1f;
    private Vector3 _velocity = Vector3.zero;

    [Header("Rotación con RightClick")]
    public float rotationSpeed = 3f;
    public float maxVerticalAngle = 80f;
    public float minVerticalAngle = -80f;
    private float _rotationX = 0f;
    private float _rotationY = 0f;

    void Update()
    {
        HandleMovement();
        HandleRotation();
    }

    private void HandleMovement()
    {
        float horizontal = Input.GetAxisRaw("Horizontal");
        float vertical = Input.GetAxisRaw("Vertical");

        float currentSpeed = Input.GetKey(KeyCode.LeftShift) ? moveSpeed * sprintMultiplier : moveSpeed;

        Vector3 moveDirection = (transform.forward * vertical + transform.right * horizontal).normalized;
        Vector3 targetPosition = transform.position + moveDirection * currentSpeed * Time.deltaTime;

        transform.position = Vector3.SmoothDamp(transform.position, targetPosition, ref _velocity, smoothTime);
    }

    private void HandleRotation()
    {
        if (Input.GetMouseButton(1))
        {

            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;


            _rotationX += Input.GetAxis("Mouse X") * rotationSpeed;
            _rotationY -= Input.GetAxis("Mouse Y") * rotationSpeed;
            _rotationY = Mathf.Clamp(_rotationY, minVerticalAngle, maxVerticalAngle);

            transform.rotation = Quaternion.Euler(_rotationY, _rotationX, 0);
        }
        else
        {
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
        }
    }
}
