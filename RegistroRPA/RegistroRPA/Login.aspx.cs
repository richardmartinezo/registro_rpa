using RegistroRPA.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistroRPA
{
    public partial class Login : System.Web.UI.Page
    {
        private ConexionBDRPA conexionBDRPA;
        private String[] usuariopass;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["usuario"] = "";
            Session["password"] = "";
            Session["nivel_acceso"] = "";
            Session["autorizado"] = "";
            Session["correo"] = "";
            Session["usuario_envioCorreo"] = "";
        }

        protected void ASPxButtonlogin_Click(object sender, EventArgs e)
        {
            conexionBDRPA = new ConexionBDRPA();          
            usuariopass = conexionBDRPA.usuarioPassword(TextUser.Text,TextPass.Text);
            if (usuariopass[0] == "" )
            {
                ASPxLabelUsuarioValidacion.Text = "Usuario no existe";

            }
            else if(usuariopass[1]==""){

                ASPxLabelUsuarioValidacion.Text = "Password Incorrecto";
            }
            
            else {
                Session["usuario"] = usuariopass[0];
                Session["password"] = usuariopass[1];
                Session["nivel_acceso"]=usuariopass[2];
                Session["autorizado"] = usuariopass[3];
                Session["correo"] = usuariopass[4];

                if (Session["usuario"].Equals("")) 
                {

                    Response.Redirect("~/Login.aspx");
                }               
                else 
                {
                    if (Session["autorizado"].Equals("True"))
                    {
                        Response.Redirect("~/RegistroRPA/MainMenu.aspx");
                    }
                    else 
                    {
                        ASPxLabelUsuarioValidacion.Text = "Usuario no autorizado, favor comunicarse con Registro Aeronautico e intentar nuevamente.";
                    }
                    
                
                }
                    
                
            }
                        

        }

        protected void UpdatePanel1_Unload(object sender, EventArgs e)
        {

        }
    }
}