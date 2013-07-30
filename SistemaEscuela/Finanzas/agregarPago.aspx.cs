using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SistemaEscuela.Model;

namespace SistemaEscuela.Finanzas
{
    public partial class agregarPago : System.Web.UI.Page
    {

        public int TitularId 
        {
            get
            {
                int temp = Convert.ToInt32(Session["idTitular"]);
                return temp;
            }
            set
            {
                Session["idTitular"] = value;
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

            if (IsPostBack)
                return;

            var id =Convert.ToInt32(Request.QueryString["id"]);
            this.TitularId = id;

            using (var context = new multilingualEntities() )
            {
                var matriculas =
                    (
                        from m in context.matriculas
                        where m.Titular_idTitular == id
                        select m
                    ).ToList();

                lblFecha.Text = DateTime.Now.ToShortDateString();

                // precio básico
                decimal? precioBasico = 0;
                // pagos
                decimal? pagos = 0;
                decimal? primerPago = 0;
                foreach (var item in matriculas)
                {
                    precioBasico += item.Costo_Total;

                    primerPago =
                        (
                            from p in context.pagos
                            where p.Titular_idTitular == id
                            orderby p.Fecha_de_Pago ascending
                            select p.Cantidad_Recibida                            
                        ).FirstOrDefault();                    
                }

                var pagosEfectuados =
                    (
                        from p in context.pagos
                        where p.Titular_idTitular == id
                        select p
                    ).ToList();

                foreach (var item in pagosEfectuados)
                {
                    pagos += item.Cantidad_Recibida;
                }

                
                // vencimiento
                lblVencimiento.Text = matriculas[0].Vigencia;
               
                lblNoCuotas.Text = matriculas[0].Cuota.Value.ToString();
                lblCuotaMensual.Text = matriculas[0].Importe_Mensual.Value.ToString();
                lblNoContrato.Text = matriculas[0].Numero_Contrato.Value.ToString();
                lblRp.Text = matriculas[0].No_RP.Value.ToString();
                lblPrecio.Text = precioBasico.ToString();
                lblCuotaInicial.Text = primerPago.ToString();
                lblSaldo.Text = (precioBasico - pagos).ToString();
                

            }
        }

        protected void btnAgregarPago_Click(object sender, EventArgs e)
        {
            pago nuevoPago = new pago()
            {
                Cantidad_Recibida = Convert.ToInt32(txtRecibido.Text),
                Fecha_de_Pago = DateTime.Parse(txtFecha.Text),
                Metodo_Pago = ddlMetodoPago.SelectedValue,
                Numero_Cuota = Convert.ToInt32(txtNoCuota.Text),
                Numero_Factura = !String.IsNullOrEmpty(txtNoFactura.Text) ? Convert.ToInt32(txtNoFactura.Text) : 0,
                Numero_Recibo =!String.IsNullOrEmpty(txtNoRecibo.Text) ? Convert.ToInt32(txtNoRecibo.Text) : 0,
                Tipo_Pago = ddlTipoPago.SelectedValue,
                Titular_idTitular = this.TitularId,
                Observaciones = txtObservacion.Text,
                Elaboro = txtElaboro.Text,
                Interes = !String.IsNullOrEmpty(txtInteres.Text) ? Convert.ToInt32(txtInteres.Text) : 0,
                Promocion = !String.IsNullOrEmpty(txtPromo.Text) ? Convert.ToInt32(txtPromo.Text) : 0,
                Mes_Pagado = ddlMesPagado.SelectedValue
                
            };

            using (var context = new multilingualEntities())
            {
                context.pagos.Add(nuevoPago);
                context.SaveChanges();

                Response.Redirect("../MessageAction.aspx?m=8");
            }
        }
    }
}