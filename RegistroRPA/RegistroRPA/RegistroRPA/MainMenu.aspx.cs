using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RegistroRPA;

namespace RegistroRPA.RegistroRPA
{
    public partial class MainMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // System.Web.UI.Page page = (System.Web.UI.Page)this.Page;
          //  Root mp1 = (Root)page.Master;
           // mp1.;
           


            if (Session["usuario"].Equals(""))
            {
                Response.Redirect("../Login.aspx");
            }
            else if (Session["usuario"].Equals(""))
            {
                Response.Redirect("../Login.aspx");
            }
            
            if (Session["nivel_acceso"].Equals("A"))
            {
                ASPxButtonAdministracionUsuario.Enabled = true;
                ASPxButtonPersonalFirmador.Enabled = true;
                ASPxButtonPlantaBaja.Enabled = true;
                ASPxButtonRegistroAeronautico.Enabled = true;
                ASPxButtonTableroPrincipal.Enabled = true;
            }
            else if (Session["nivel_acceso"].Equals("AU"))
            {
                
                ASPxButtonAdministracionUsuario.Enabled = true;
                ASPxButtonPersonalFirmador.Enabled = false;
                ASPxButtonPlantaBaja.Enabled = false;
                ASPxButtonRegistroAeronautico.Enabled = false;
                ASPxButtonTableroPrincipal.Enabled = false;
            }
            else if (Session["nivel_acceso"].Equals("FU"))
            {

                ASPxButtonAdministracionUsuario.Enabled = false;
                ASPxButtonPersonalFirmador.Enabled = true;
                ASPxButtonPlantaBaja.Enabled = false;
                ASPxButtonRegistroAeronautico.Enabled = false;
                ASPxButtonTableroPrincipal.Enabled = false;
            }
            else if (Session["nivel_acceso"].Equals("U"))
            {
                ASPxButtonAdministracionUsuario.Enabled = false;
                ASPxButtonPersonalFirmador.Enabled = false;
                ASPxButtonPlantaBaja.Enabled = false;
                ASPxButtonRegistroAeronautico.Enabled = false;
                ASPxButtonTableroPrincipal.Enabled = true;
            }
            else if (Session["nivel_acceso"].Equals("PB"))
            {
                ASPxButtonAdministracionUsuario.Enabled = false;
                ASPxButtonPersonalFirmador.Enabled = false;
                ASPxButtonPlantaBaja.Enabled = true;
                ASPxButtonRegistroAeronautico.Enabled = false;
                ASPxButtonTableroPrincipal.Enabled = true;
            }
            else if (Session["nivel_acceso"].Equals("RA"))
            {
                ASPxButtonAdministracionUsuario.Enabled = false;
                ASPxButtonPersonalFirmador.Enabled = false;
                ASPxButtonPlantaBaja.Enabled = false;
                ASPxButtonRegistroAeronautico.Enabled = true;
                ASPxButtonTableroPrincipal.Enabled = false;
            }
        }

        protected void ASPxButtonAdministracionUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("../RegistroRPA/AdministracionUsuarios.aspx");
        }

        protected void ASPxButtonTableroPrincipal_Click(object sender, EventArgs e)
        {
            Response.Redirect("../RegistroRPA/TableroPrincipal/TableroPrincipal.aspx");
           
           
        }

        protected void ASPxButtonPersonalFirmador_Click(object sender, EventArgs e)
        {
            Response.Redirect("../RegistroRPA/TableroPrincipal/TableroPrincipalFirmador.aspx");
        }

        protected void ASPxButtonPlantaBaja_Click(object sender, EventArgs e)
        {
            Response.Redirect("../RegistroRPA/TableroPrincipal/TableroPrincipalUsuarioPlantaBaja.aspx");
        }

        protected void ASPxButtonRegistroAeronautico_Click(object sender, EventArgs e)
        {
            Response.Redirect("../RegistroRPA/TableroPrincipal/TableroPrincipalRegistroAeronautico.aspx");
        }
    }
}