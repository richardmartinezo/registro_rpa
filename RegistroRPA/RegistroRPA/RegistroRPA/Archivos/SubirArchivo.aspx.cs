using RegistroRPA.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistroRPA.RegistroRPA
{
    public partial class SubirArchivo : System.Web.UI.Page
    {
        private string nombre_archivo="";
        private string tipo_contenido = "";
        private EnvioCorreos envioCorreos;
        private string usuario_propietario = "";
        private string correo_propietario = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            envioCorreos = new EnvioCorreos();
        }
        // Session["id_firma"]
        protected void ASPxUploadControlArchivoFirmado_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            envioCorreos = new EnvioCorreos();
            // SqlDataSourcePDFFirmado.DataBind();
            DataView dv = (DataView)SqlDataSourcePDFFirmado.Select(DataSourceSelectArguments.Empty);
            DataView dv2 = (DataView)SqlDataSourceEstadoFirmado.Select(DataSourceSelectArguments.Empty);
            usuario_propietario = dv2[0].Row[2].ToString();
            DataView dv3 = (DataView)SqlDataSourceUsuarioPropietario.Select(DataSourceSelectArguments.Empty);
            //correo de usuario
            correo_propietario = dv3[0].Row[2].ToString();
            // usuario_propietario= dv2.Table.Rows[0].ItemArray[2].ToString();
            //dv[0].Row[1]
            //dv2[0].Row[2]usuario propietario

            if (e.IsValid)
            {
                if (dv.Count.Equals(0))
                {
                    Session["archivo_binary"] = e.UploadedFile.FileBytes;
                    nombre_archivo = e.UploadedFile.FileName;
                    tipo_contenido = e.UploadedFile.ContentType;
                    SqlDataSourcePDFFirmado.Insert();
                    SqlDataSourceEstadoFirmado.Update();
                }
                else 
                {

                    Session["archivo_binary"] = e.UploadedFile.FileBytes;
                    nombre_archivo = e.UploadedFile.FileName;
                    tipo_contenido = e.UploadedFile.ContentType;
                    SqlDataSourcePDFFirmado.Update();
                    SqlDataSourceEstadoFirmado.Update();
                
                }
                           
            }
            envioCorreos.enviarNotifiacionRegistroRPAFirmado("no_reply@aviacioncivil.gob.ec", correo_propietario,
                usuario_propietario, "RPAFirmado", Session["id_firma"].ToString());

          
        }

        protected void SqlDataSourcePDFFirmado_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            //id firma
            e.Command.Parameters[0].Value = Session["id_firma"];
            //pdf firmado
            e.Command.Parameters[1].Value = Session["archivo_binary"];
            //nombre archivo
            e.Command.Parameters[2].Value = nombre_archivo;
            //tipo contenido
            e.Command.Parameters[3].Value = tipo_contenido;

            //nombres parametros:
            //id_registro_rpa
            //pdf_firmado

        }

        protected void SqlDataSourcePDFFirmado_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = Session["id_firma"];
        }

        protected void SqlDataSourcePDFFirmado_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {

            //pdf firmado
            e.Command.Parameters[0].Value = Session["archivo_binary"];
            //nombre archivo
            e.Command.Parameters[1].Value = nombre_archivo;
            //tipo contenido
            e.Command.Parameters[2].Value = tipo_contenido;
            //id firma
            e.Command.Parameters[3].Value = Session["id_firma"];
            
        


        }

        protected void SqlDataSourceEstadoFirmado_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters[0].Value = true;
            e.Command.Parameters[1].Value = Session["id_firma"];
            
        }

        protected void SqlDataSourceUsuarioPropietario_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = usuario_propietario;
        }

        protected void SqlDataSourceEstadoFirmado_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //@id_registro_rpa
            e.Command.Parameters[0].Value = Session["id_firma"];
        }
    }
}