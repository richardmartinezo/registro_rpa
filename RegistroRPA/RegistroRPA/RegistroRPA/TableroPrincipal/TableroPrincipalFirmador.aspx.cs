using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RegistroRPA.RegistroRPA.TableroPrincipal
{
    public partial class TableroPrincipalFirmador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"].Equals(""))
            {
                Response.Redirect("../Login.aspx");
            }
            else if (Session["nivel_acceso"].Equals("A"))
            {
            }
            else if (Session["nivel_acceso"].Equals("FU"))
            {
            }
            else
            {

                Response.Redirect("../Login.aspx");
            }


            if (!Page.IsPostBack)
            {
                this.Form.Attributes.Add("autocomplete", "off");
                ASPxPopupControlReporteRPA.ContentUrl = "~/RegistroRPA/Reportes/RegistroRPA.aspx";
                this.ASPxPopupControlReporteRPA.Height = 600;
                this.ASPxPopupControlReporteRPA.Width = 900;
                ASPxPopupControlCargarArchivo.ContentUrl = "~/RegistroRPA/Archivos/SubirArchivo.aspx";
                this.ASPxPopupControlCargarArchivo.Height = 300;
                this.ASPxPopupControlCargarArchivo.Width = 300;


            }

        }

        protected void ASPxCallbackFirma_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            
             if (Session["codigoFirma"]== null)
            {
                
            }
             else if (Session["codigoFirma"].Equals("Reporte"))
            {
             
                ASPxCallbackFirma.JSProperties["cpText"] = "Reporte";
            }
            else if (Session["codigoFirma"].Equals("CargarArchivo"))
            {
             
                ASPxCallbackFirma.JSProperties["cpText"] = "CargarArchivo";
            }
           


            Session["codigoFirma"] = "";
        }

        protected void ASPxGridView1_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID=="PDF")
            {
                Session["codigoFirma"] = "Reporte";
                // Session["id_maestro"] = this.ASPxGridViewPuestos.GetRowValues(e.VisibleIndex, grid.KeyFieldName);
                ASPxGridView grid = (ASPxGridView)sender;
                Session["id_reporte"] = this.ASPxGridView1.GetRowValues(e.VisibleIndex, grid.KeyFieldName);

            }
            else if (e.ButtonID == "Upload"){
                Session["codigoFirma"] = "CargarArchivo";
                ASPxGridView grid = (ASPxGridView)sender;
                Session["id_firma"] = this.ASPxGridView1.GetRowValues(e.VisibleIndex, grid.KeyFieldName);

            
            }
        }
    }
}