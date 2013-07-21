using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SistemaEscuela.Model;

namespace SistemaEscuela.Registro
{
    public partial class Add : System.Web.UI.Page
    {

        private bool isNew
        {
            get
            {
                return Session[Add.titularSessionId] == null;
            }
        }

        private const string titularSessionId = "titularSeleccionado";
        private const string domicilioTitularSessionId = "domicilioSeleccionado";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session[Add.domicilioTitularSessionId] = null;
                Session[Add.titularSessionId] = null;
            }
        }

        protected void btnBuscarTitular_Click(object sender, EventArgs e)
        {
            string busqueda = txtBuscarTitular.Text;
            using (var context = new multilingualEntities())
            {
                var titular = 
                    (
                        from t in context.titulars
                        where t.RFC == busqueda
                        select t
                    ).FirstOrDefault();



                if (titular != null)
                {
                    // somos felices
                    // llenar el formulario con los datos del titular
                    Session[titularSessionId] = titular;

                    // consultamos su dirección
                    var dir =
                        (
                            from d in context.dom_titular
                            where d.idDom_Titular == titular.Dom_Titular_idDom_Titular1
                            select d
                        ).FirstOrDefault();

                    Session[Add.domicilioTitularSessionId] = dir;

                    var dummyList = new List<titular>();
                    dummyList.Add(titular);

                    var html = String.Format("<table><tr><th>Nombre: {0}</th></tr><tr><th>RFC: {1}</th></tr></table>",titular.Nombre,titular.RFC);
                    divHelper.InnerHtml = html;

                    txtNombreTitular.Text = titular.Nombre;
                    txtEmailTitular.Text = titular.Email;
                    txtRfc.Text = titular.RFC;
                    txtTelefonoPart.Text = titular.Telefono_Particular;
                    txtTelefonoCel.Text = titular.Telefono_Celular;
                    txtCalle.Text = dir.Calle;
                    txtColonia.Text = dir.Colonia;
                    txtNumCasa.Text = dir.Numero.ToString();
                    txtEmpresaLabora.Text = titular.Compania;
                    txtCargo.Text = titular.Profesion;

                }
                else
                    lblResultadoBusqueda.Visible = true;
            }
        }


        protected override void OnPreRenderComplete(EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlIdiomaOpcional.Items.Insert(0, new ListItem("-- Selecione una Opción --", "-1"));
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {


            var random = new Random();
            matricula nuevaMatricula = new matricula()
            {
                idMatricula = random.Next(int.MaxValue),
                Vigencia = txtVigencia.Text,
                No_Consecutivo = Convert.ToInt32(txtNoConsec.Text),
                No_Puntos = Convert.ToInt32(txtNoPuntos.Text),
                Numero_Contrato = Convert.ToInt32(txtNoContrato.Text),
                Fecha_Matricula = cldFecha.SelectedDate,
                No_RP = Convert.ToInt32(txtNoRp.Text),
                Organizacion_idOrganizacion = Convert.ToInt32(ddlOrganizacion.SelectedValue),
                Subgerente_idSubgerente = Convert.ToInt32(ddlSubGerente.SelectedValue),
                Supervisor_idSupervisor = Convert.ToInt32(ddlSupervisor.SelectedValue),
                Asesor_idAsesor = Convert.ToInt32(ddlAsesor.SelectedValue),
                Tipo_Programa = ddlTipoPrograma.Text,
                Tiempo_Servicio = txtTiempoServicio.Text,
                Importe_Mensual = Convert.ToDecimal(txtImporteMensual.Text),
                Costo_Total = Convert.ToDecimal(txtCostoTotal.Text),
                Estatus = ddlStatus.SelectedValue,
                Observaciones = txtObservacionesStatus.Text,
                Estrategia = txtEstrategia.Text,
                Cuota = Convert.ToInt32(txtCuotas.Text)
            };

            //pago pagoInscripción = new pago()
            //{
            //    Cantidad_Recibida = Convert.ToDecimal(txtPagoInscripcion.Text),
            //    Numero_Cuota = Convert.ToInt32(txtCuotas.Text),
            //    Metodo_Pago = ddlTipoPago.SelectedValue,
            //    Fecha_de_Pago = cldFechaPago.SelectedDate,
            //    Tipo_Pago = "Inscripción"
            //};


            titular titular = (titular)Session[Add.titularSessionId];
            dom_titular domicilio;

            if (titular != null)
            {
                // ya se seleccionó un titular 
                domicilio = (dom_titular)Session[Add.domicilioTitularSessionId];
            }
            else
            {
                domicilio = new dom_titular()
                {
                    idDom_Titular = random.Next(int.MaxValue),
                    Calle = txtCalle.Text,
                    Colonia = txtColonia.Text,
                    Numero = Convert.ToInt32(txtNumCasa.Text),
                    Ciudad = "Chihuahua"
                };

                // agregar datos nuevos
                titular = new titular()
                {
                    idTitular = random.Next(int.MaxValue),
                    Nombre = txtNombreTitular.Text,
                    Email = txtEmailTitular.Text,
                    RFC = txtRfc.Text,
                    Telefono_Particular = txtTelefonoPart.Text,
                    Telefono_Celular = txtTelefonoCel.Text,
                    Telefono_Oficina = txtTelOfi.Text,
                    Compania = txtEmpresaLabora.Text,
                    Profesion = txtCargo.Text,
                    Dom_Titular_idDom_Titular1 = domicilio.idDom_Titular
                };
            }

            //pagoInscripción.Titular_idTitular = titular.idTitular;

            int alumnoId = random.Next(int.MaxValue);
            alumno nuevoAlumno = new alumno()
            {
                id_alumno = alumnoId,
                Nombre = txtNombreEstudiante.Text,
                Matricula_idMatricula = nuevaMatricula.idMatricula
            };

            idioma first = new idioma();
            idioma second = new idioma();

            using (var dummyContext = new multilingualEntities())
            {
                var firstId = Convert.ToInt32(ddlIdioma.SelectedValue);
                var secondID = Convert.ToInt32(ddlIdiomaOpcional.SelectedValue);

                first =
                    (
                        from i in dummyContext.idiomas
                        where i.idIdiomas == firstId
                        select i
                    ).FirstOrDefault();

                second =
                    (
                        from i in dummyContext.idiomas
                        where i.idIdiomas == secondID
                        select i
                    ).FirstOrDefault();
            }

            nuevoAlumno.idiomas.Add(first);
            if (second != null)
            {
                nuevoAlumno.idiomas.Add(second);
            }

            using (var context = new multilingualEntities())
            {

                if (this.isNew)
                {
                    context.dom_titular.Add(domicilio);
                    context.SaveChanges();
                    context.titulars.Add(titular);
                    context.SaveChanges();
                }
                else
                {
                    Session[Add.domicilioTitularSessionId] = null;
                    Session[Add.titularSessionId] = null;
                }

                nuevaMatricula.Titular_idTitular = titular.idTitular;

                context.matriculas.Add(nuevaMatricula);
                context.SaveChanges();
                //context.pagos.Add(pagoInscripción);
                //context.SaveChanges();


                context.alumnoes.Add(nuevoAlumno);
                context.SaveChanges();


            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Session[Add.domicilioTitularSessionId] = null;
            Session[Add.titularSessionId] = null;
            Response.Redirect("Index.aspx");
        }
    }
}