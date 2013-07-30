using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaEscuela.Model;

namespace SistemaEscuela
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var msg = Request.QueryString["m"];

            if (msg != null)
            {
                string message = LoginHelper.GetMessate(Convert.ToInt32(msg));
                divMessage.InnerHtml = String.Format("<h3>{0}</h3>", message);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (var context = new multilingualEntities())
            {
                var login =
                    (
                        from u in context.logins
                        where u.Login1.Equals(txtLogin.Text) && u.Password.Equals(txtPassword.Text)
                        select u
                    ).FirstOrDefault();

                if (login == null)
                {
                    Response.Redirect("Login.aspx?m=2");
                    return;
                }

                LoginHelper.SaveUserSession(login.Login1);
                Response.Redirect("Default.aspx");
            }
        }
    }
}