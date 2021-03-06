﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaEscuela.Registro
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool result = LoginHelper.CheckUserSecurity(LoginType.Students);
                if (!result)
                {
                    // Redirigir a login
                    Response.Redirect("../Login.aspx?m=1");
                    return;
                }
            }
        }
    }
}