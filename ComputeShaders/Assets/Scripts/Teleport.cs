using UnityEngine;
using UnityEngine.SceneManagement;

public class Teleport : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        Cursor.lockState = CursorLockMode.None;
        SceneManager.LoadScene("Menu");
    }
}
