using UnityEngine;
using UnityEngine.SceneManagement;

public class SceneManagement : MonoBehaviour
{
    public void LoadGeometryScene()
    {
        SceneManager.LoadScene("ShadersTestScene");
    }

    public void LoadComputeGeometryScene()
    {
        SceneManager.LoadScene("ComputeGeometryShader");
    }

    public void LoadGeometryGrassScene()
    {
        // SceneManager.LoadScene("ShadersTestScene");
    }

    public void LoadComputeGrassScene()
    {
        SceneManager.LoadScene("GrassShader");
    }
}
