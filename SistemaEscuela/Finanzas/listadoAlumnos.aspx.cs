using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaEscuela.Model;

namespace SistemaEscuela.Finanzas
{
    public partial class listadoAlumnos : System.Web.UI.Page
    {

        public int IdTitular 
        { 
            get 
            {
                int id = Convert.ToInt32(Session["idTitular"]);
                return id;
            } 
            set 
            {
                Session["idTitular"] = value;
            } 
        }

        public bool Verificada { get; set; }

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
                var id = Convert.ToInt32(Request.QueryString["id"]);
                this.IdTitular = id;

                agregarPagoUrl.HRef += "?id=" + id;
                // Consultar alumnos del titular
                using (var context = new multilingualEntities())
                {
                    var titular =
                                (
                                    from t in context.titulars
                                    where t.idTitular == this.IdTitular
                                    select t.No_Confidencial
                                ).First();
                    if (titular.HasValue)
                    {
                        this.Verificada = true;
                    }

                    // Consultar matriculas
                    var matriculas =
                        (
                            from m in context.matriculas
                            where m.Titular_idTitular == id
                            select m.idMatricula
                        ).ToList();


                    var alumnos =
                        (
                            from a in context.alumnoes.Include("idiomas")
                            where matriculas.Contains(a.Matricula_idMatricula)
                            select a
                        ).ToList();
                    

                    listadoAlumno.DataSource = alumnos;
                    listadoAlumno.DataBind();


                    // Se consulta la direcicón
                    var dirId =
                        (
                             from d in context.titulars
                             where d.idTitular == id
                             select d.Dom_Titular_idDom_Titular1
                        ).First();

                    var datosDir =
                        (
                            from dir in context.dom_titular
                            where dir.idDom_Titular == dirId
                            select new
                            {
                                Calle = dir.Calle,
                                Numero = dir.Numero,
                                Colonia = dir.Colonia,
                                Ciudad = dir.Ciudad
                            }
                        ).ToList();

                    gridDir.DataSource = datosDir;
                    gridDir.DataBind();
                }
            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            
        }

    }
}