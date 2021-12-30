using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RegistroRPA.RegistroRPA.Reportes;
using RegistroRPA;

namespace RegistroRPA.RegistroRPA.Reportes
{
    public partial class RegistroRPA : System.Web.UI.Page
    {
        private ReporteRPA2 RPAReporte;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                
                RPAReporte = new ReporteRPA2();

                PdfExportOptions xtraprinting = new PdfExportOptions();
                Page.Response.Buffer = false;
                Page.Response.ClearHeaders();
                Page.Response.ClearContent();
                RPAReporte.CreateDocument();
                RPAReporte.Parameters["id"].Value = Session["id_reporte"];
                RPAReporte.CreateDocument();
                RPAReporte.CreateDocument();
                RPAReporte.Name = "";
                xtraprinting.ShowPrintDialogOnOpen = false;
                RPAReporte.ExportToPdf(ms, xtraprinting);
                ms.Seek(0, SeekOrigin.Begin);
                Byte[] report = ms.ToArray();
                Page.Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "filename=" + Session["id_reporte"]);
                Page.Response.Clear();
                Page.Response.OutputStream.Write(report, 0, report.Length);
                Page.Response.End();
                Page.Response.Flush();
                Page.Response.Close();
                RPAReporte.Dispose();
                report = null;
                Session["id_reporte"] = 0;


            }


        }
    }
}