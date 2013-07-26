using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaEscuela.Admin
{
    public partial class Consultas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {            

            pnlEstrategia.Visible = false;
            pnlIdioma.Visible = false;
            pnlOrganizacion.Visible = false;
            pnlPrograma.Visible = false;
            pnlRfc.Visible = false;
            pnlStatus.Visible = false;

            switch (RadioButtonList1.SelectedValue)
            {
                case "1":
                    // Tipo de programa
                    pnlPrograma.Visible = true;
                    break;
                case "2":
                    // Idioma
                    pnlIdioma.Visible = true;
                    break;
                case "3":
                    // Organizazión
                    pnlOrganizacion.Visible = true;
                    break;
                case "4":
                    // Estrategia
                    pnlEstrategia.Visible = true;
                    break;
                case "5":
                    // Estatus
                    pnlStatus.Visible = true;
                    break;
                case "6":
                    // RFC
                    pnlRfc.Visible = true;
                    break;
            }
        }
    }
}