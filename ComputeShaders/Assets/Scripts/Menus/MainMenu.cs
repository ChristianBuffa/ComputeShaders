using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenu : MonoBehaviour
{
    public void PlayComputeScene()
    {
        SceneManager.LoadScene("ComputeGeometryShader");
    }
    public void PlayGeometryScene()
    {
        SceneManager.LoadScene("GeometryGrass");
    }

    public void QuitGame()
    {
        Application.Quit();
    }
}