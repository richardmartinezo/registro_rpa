using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using RegistroRPA.Classes;

namespace RegistroRPA.RegistroRPA
{
    public partial class AdministracionUsuario : System.Web.UI.Page
    {
        private EnvioCorreos envioCorreos;

       
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected  void ASPxButtonCrearUsuario_Click(object sender, EventArgs e)
        {
            envioCorreos = new EnvioCorreos();
            //mandar insert
            if (ASPxCaptcha1.IsValid)
            {
                SqlDataSourceUsuarioNuevo.Insert();
                IngresoUsuario.Text = "Usuario Ingresado";
                envioCorreos.enviarNotificacionSinAdjuntos("no_reply@aviacioncivil.gob.ec",txtemail.Text,"usuario_nuevo",txtlogin_usuario.Text);
                         
                Response.Redirect("../Login.aspx");

               
            }
            else
            {
                IngresoUsuario.Text = "";
            }

            
        }

        protected void SqlDataSourceUsuarioNuevo_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@fecha_solicita"].Value=DateTime.Now;

        }

        protected void ASPxButtonRegresoLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Login.aspx");
        }
      
    }
}