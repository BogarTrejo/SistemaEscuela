using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaEscuela
{
    public partial class MessageAction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divMsg.InnerHtml = String.Format("<h1>{0}</h1>",LoginHelper.GetMessate(Convert.ToInt32(Request.QueryString["m"])));
        }
    }
}