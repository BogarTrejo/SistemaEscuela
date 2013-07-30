using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaEscuela.Model;

namespace SistemaEscuela.Finanzas
{
    public partial class editarAlumno : System.Web.UI.Page
    {
        public int IdAlumno 
        {
            get 
            {
                var intId = Convert.ToInt32(Session["studentId"]);
                return intId;
            }
            set
            {
                Session["studentId"] = value;
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool result = LoginHelper.CheckUserSecurity(LoginType.Payments);
                if (!result)
                {
                    // Redirigir a login
                    Response.Redirect("../Login.aspx?m=1");
                    return;
                }
            }

            if (!IsPostBack)
            {
                this.IdAlumno = Convert.ToInt32(Request.QueryString["id"]);                
            }
        }

        protected void btnGuardarVerif_Click(object sender, EventArgs e)
        {
            var date = txtFechaVerif.Text;

            using (var context = new multilingualEntities())
            {
                var alumno =
                    (
                        from a in context.alumnoes
                        where a.id_alumno == this.IdAlumno
                        select a
                    ).First();

                var matricula =
                    (
                        from m in context.matriculas
                        where m.idMatricula == alumno.Matricula_idMatricula
                        select m
                    ).First();

                matricula.Fecha_Validacion = DateTime.Parse(date);

                context.SaveChanges();
                Label2.Text = "Se ha guardado con éxito";
            }
        }



    }
}