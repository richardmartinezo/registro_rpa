using DevExpress.Web;
using iTextSharp.text;
using iTextSharp.text.pdf;
using RegistroRPA.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace RegistroRPA.RegistroRPA.TableroPrincipal
{
    public partial class TableroPrincipal : System.Web.UI.Page
    {
        private EnvioCorreos enviocorreos;
        private DataView dv;
        private string nombrearchivo;
        private string tipo_contenido;
        private byte[] pdfbyte;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else if (Session["usuario"].Equals(""))
            {
                Response.Redirect("../Login.aspx");
            }
            else if (Session["nivel_acceso"].Equals("A")) 
            {
            }
            else if (Session["nivel_acceso"].Equals("U"))
            {
            }
            else {
                
                Response.Redirect("../Login.aspx");
            }

        }

        protected void SqlDataSourceTableroPrincipal_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@id_usuario_propietario"].Value = Session["usuario"];
         
        }
        protected void SqlDataSourceTableroPrincipal_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
           // enviocorreos = new EnvioCorreos();
            e.Command.Parameters["@id_usuario_propietario"].Value = Session["usuario"];
            e.Command.Parameters["@id_usuario"].Value = Session["usuario"];
            e.Command.Parameters["@num_memorando"].Value ="DIGITAL";
            e.Command.Parameters["@fecha_ingreso"].Value = DateTime.Now;
            e.Command.Parameters["@estado"].Value = "N";
           //notificacion de ID nuevo
            //enviocorreos.enviarNotifiacionRegistroRPA("no_reply@aviacioncivil.gob.ec",
            //    Session["correo"].ToString(),
            //    Session["usuario"].ToString(),
            //    "RPANuevo","1","id ");
           
        }

        protected void SqlDataSourceEstadoRPA_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSourceTableroPrincipal_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@id_usuario_propietario"].Value = Session["usuario"];
            enviocorreos = new EnvioCorreos();
            enviocorreos.enviarNotifiacionRegistroRPA("no_reply@aviacioncivil.gob.ec", 
                Session["correo"].ToString(), 
                Session["usuario"].ToString(),
                "RPAModificado", 
                Session["id_principal"].ToString(),
                "comentario ");
            
           
        }

        protected void SqlDataSourceDescargarArchivo_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = Session["id_archivo_firmado"];
        }

        protected void ASPxCallbackTableroPrincipal_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            if (Session["codigoFirmado"] == null)
            {

            }
            else if (Session["codigoFirmado"].Equals("Firmado"))
            {

                ASPxCallbackTableroPrincipal.JSProperties["cpText"] = "Firmado";
                //descargar firmado
                nombrearchivo = Session["nombre_archivo"].ToString();
                pdfbyte = (byte[])Session["pdfbyte"];
                tipo_contenido = Session["tipo_contenido"].ToString();
                enviocorreos = new EnvioCorreos();

                enviocorreos.enviarNotifiacionRegistroRPAFirmadoArchivo("no_reply@aviacioncivil.gob.ec",
                    Session["correo"].ToString(),
                    Session["usuario"].ToString(),
                    "RPAFirmado", Session["id_archivo_firmado"].ToString(),
                    pdfbyte,
                    nombrearchivo);


               

            }
            else if (Session["codigoFirmado"].Equals("Vacio"))
            {
                ASPxCallbackTableroPrincipal.JSProperties["cpText"] = "Vacio";

            }
          



            Session["codigoFirmado"] = "";
        }

        protected void ASPxGridViewTableroPrincipal_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            
            
            if (e.ButtonID == "PDF")
            {
                Session["codigoFirmado"] = "Firmado";
                
                ASPxGridView grid = (ASPxGridView)sender;
                Session["id_archivo_firmado"] = this.ASPxGridViewTableroPrincipal.GetRowValues(e.VisibleIndex, grid.KeyFieldName);
                dv = (DataView)SqlDataSourceDescargarArchivo.Select(DataSourceSelectArguments.Empty);
                if (dv.Count.Equals(0))
                {
                    Session["codigoFirmado"] = "Vacio";
                }
                else 
                {
                    Session["nombre_archivo"]=dv[0].Row[0].ToString() + "_" + dv[0].Row[1].ToString();
                    Session["pdfbyte"] = (byte[])dv[0].Row[2];
                    Session["tipo_contenido"] = dv[0].Row[4].ToString();
                }

            }
           
        }

        protected void ASPxGridViewTableroPrincipal_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {
           // Session("id_registro_main") = sender.GetDataRow(e.VisibleIndex)("id")
            Session["id_registrorpa_main"] = (sender as ASPxGridView).GetRowValues(e.VisibleIndex, "id");
        }

        protected void SqlDataSourceFileManager_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters[0].Value = Session["id_registrorpa_main"].ToString();
        }

        protected void ASPxGridViewTableroPrincipal_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e)
        {
            Session["id_principal"] = e.KeyValue;
           
        }

        protected void SqlDataSourceTableroPrincipal_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            ConexionBDRPA conexionBD = new ConexionBDRPA();
           
            enviocorreos = new EnvioCorreos();
            enviocorreos.enviarNotifiacionRegistroRPA("no_reply@aviacioncivil.gob.ec",
                Session["correo"].ToString(),
                Session["usuario"].ToString(),
               "RPANuevo",
               conexionBD.consultarID().ToString(),
               "id ");
            
        }

        protected void ASPxGridViewTableroPrincipal_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
          
        }

        protected void ASPxGridViewTableroPrincipal_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            
        }

        
    }
}