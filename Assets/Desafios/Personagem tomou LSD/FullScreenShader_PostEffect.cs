using UnityEngine;
using System.Collections;

//COLOQUE ESSE SCRIPT NA CAMERA



//com isso podemos ver o resultado sem ter que dar play.
[ExecuteInEditMode]

public class FullScreenShader_PostEffect : MonoBehaviour {

    public Material _mat;


	void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        //scr é a imagem da cena renderizada que vai para o monitor
        //estamos interceptando essa imagem para fazer algo e ai passamos
        //a dest que é a final.

        //colocamos um material que vai fazer o tratamento dessa imagem
        Graphics.Blit(src, dest,_mat);
    }
}
