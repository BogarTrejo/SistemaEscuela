using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaEscuela.Model;

namespace SistemaEscuela.Finanzas
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool result = LoginHelper.CheckUserSecurity(LoginType.Payments);
                if (!result)
                {
                    // Redirigir a login
                    Response.Redirect("../Login.aspx?m=1");
                }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {


        }


    }
}