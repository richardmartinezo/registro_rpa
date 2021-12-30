using RegistroRPA.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistroRPA.RegistroRPA.TableroPrincipal
{
    public partial class TableroPrincipalRegistroAeronautico : System.Web.UI.Page
    {
        private EnvioCorreos enviocorreos;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"].Equals(""))
            {
                Response.Redirect("../Login.aspx");
            }
            else if (Session["nivel_acceso"].Equals("A"))
            {
            }
            else if (Session["nivel_acceso"].Equals("RA"))
            {
            }
            else
            {

                Response.Redirect("../Login.aspx");
            }
        }

        protected void SqlDataSourceRegistradorAeronautico_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
           enviocorreos = new EnvioCorreos();
            if(e.Command.Parameters["@estado"].Value.Equals("N"))
            {
                enviocorreos.enviarNotifiacionRegistroRPA("no_reply@aviacioncivil.gob.ec", Session["correo"].ToString(),
               Session["usuario_envioCorreo"].ToString(), "RPANuevo", "1", "id ");
            }
            else if (e.Command.Parameters["@estado"].Value.Equals("A"))
            {
                enviocorreos.enviarNotifiacionRegistroRPA("no_reply@aviacioncivil.gob.ec", Session["correo"].ToString(),
                 Session["usuario_envioCorreo"].ToString(), "RegistroAprobado", "1", "id ");
            }
            else if (e.Command.Parameters["@estado"].Value.Equals("P"))
            {
                
                //implementar llamada de correo de usuario de propietario
                
                
                enviocorreos.enviarNotifiacionRegistroRPA("no_reply@aviacioncivil.gob.ec", Session["correo"].ToString(),
                 Session["usuario_envioCorreo"].ToString(), "RegistroPendiente", "1", "id ");
            }
            else if (e.Command.Parameters["@estado"].Value.Equals("Arch"))
            {
                enviocorreos.enviarNotifiacionRegistroRPA("no_reply@aviacioncivil.gob.ec", Session["correo"].ToString(),
                Session["usuario_envioCorreo"].ToString(), "RegistroArchivado", "1", "id ");
            }
        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {

            if (ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, "id_usuario_propietario").Equals(null)) 
            {
                Session["usuario_envioCorreo"]="usuario_administrador";
            }
            else if ((ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, "id_usuario_propietario").Equals(""))){
                Session["usuario_envioCorreo"]="usuario_administrador";
            }
            else
            {
                Session["usuario_envioCorreo"] = ASPxGridView1.GetRowValuesByKeyValue(e.EditingKeyValue, "id_usuario_propietario").ToString();
            }
        }
    }
}