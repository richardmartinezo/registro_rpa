using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RegistroRPA.Classes;

namespace RegistroRPA.RegistroRPA
{
    public partial class AdministracionUsuarios : System.Web.UI.Page
    {
        private EnvioCorreos envioCorreos;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"].Equals(""))
            {
                Response.Redirect("../Login.aspx");
            }
            else if (Session["usuario"].Equals(""))
            {
                Response.Redirect("../Login.aspx");
            }
        }

        protected void SqlDataSourceUsuarios_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            envioCorreos = new EnvioCorreos();
            e.Command.Parameters["@usuario_autoriza"].Value = Session["usuario"].ToString();
            
            if (e.Command.Parameters["@autorizado"].Value.Equals(true))
            {
                e.Command.Parameters["@fecha_autoriza"].Value = DateTime.Now;
              //  envioCorreos.enviarNotificacionSinAdjuntos("no_reply@aviacioncivil.gob.ec",e.Command.Parameters["@email"].Value.ToString(),"usuario_aprobado",e.Command.Parameters["@usuario"].Value.ToString());
            }
            else 
            {
            
            }
        }

        protected void SqlDataSourceUsuarios_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@usuario_autoriza"].Value = Session["usuario"].ToString();
            e.Command.Parameters["@fecha_autoriza"].Value = DateTime.Now;
        }

        protected void SqlDataSourceUsuarios_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
          //  envioCorreos.enviarNotificacionSinAdjuntos("no_reply@aviacioncivil.gob.ec", e.Command.Parameters["@email"].Value.ToString(), "usuario_aprobado", e.Command.Parameters["@usuario"].Value.ToString());
            if (e.Command.Parameters["@autorizado"].Value.Equals(true))
            {
               // e.Command.Parameters["@fecha_autoriza"].Value = DateTime.Now;
                  envioCorreos.enviarNotificacionSinAdjuntos("no_reply@aviacioncivil.gob.ec",e.Command.Parameters["@email"].Value.ToString(),"usuario_aprobado",e.Command.Parameters["@usuario"].Value.ToString());
            }
            else
            {

            }
        
        }
    }
}