using RegistroRPA.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistroRPA.RegistroRPA.TableroPrincipal
{
    public partial class TableroPrincipalUsuarioPlantaBaja : System.Web.UI.Page
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
            else if (Session["nivel_acceso"].Equals("PB"))
            {
            }
            else
            {

                Response.Redirect("../Login.aspx");
            }
        }

        protected void SqlDataSourceTableroPlantaBajarRPA_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            enviocorreos = new EnvioCorreos();
            e.Command.Parameters["@id_usuario"].Value = Session["usuario"];
            e.Command.Parameters["@fecha_ingreso"].Value = DateTime.Now;
            enviocorreos.enviarNotifiacionRegistroRPA("no_reply@aviacioncivil.gob.ec", Session["correo"].ToString(), 
                e.Command.Parameters["@id_usuario_propietario"].Value.ToString(), "RPANuevo", "1", "id ");
        }

        protected void SqlDataSourceTableroPlantaBajarRPA_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@id_usuario"].Value = Session["usuario"];
        }

        protected void SqlDataSourceTableroPlantaBajarRPA_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@id_usuario"].Value = Session["usuario"];
        }
    }
}