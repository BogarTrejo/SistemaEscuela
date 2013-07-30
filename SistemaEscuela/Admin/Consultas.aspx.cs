using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

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
            pnlAsesores.Visible = false;
            pnlSupervisores.Visible = false;
            pnlSubGerentes.Visible = false;
            pnlGerente.Visible = false;
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
                case "7":
                    // Asesor
                    pnlAsesores.Visible = true;
                    break;
                case "8":
                    // Supervisor
                    pnlSupervisores.Visible = true;
                    break;
                case "9":
                    // Subgerente
                    pnlSubGerentes.Visible = true;
                    break;
                case "10":
                    // Gerente
                    pnlGerente.Visible = true;
                    break;
            }
        }


        private List<QueryFormat> ExecuteQuery(int index,DateTime start,DateTime end)
        {
            List<QueryFormat> queryResult = new List<QueryFormat>();
            string query = String.Empty;

            query += "SELECT M.No_Consecutivo, M.No_Puntos,M.Numero_Contrato,M.Fecha_Matricula, ";
            query += "M.No_RP,T.Nombre AS Titular,AL.Nombre AS Beneficiario,T.RFC,ORG.Nombre AS Organizacion, ";
            query += "A.Nombre AS Asesor, SV.Nombre AS Supervisor, SG.Nombre AS Subgerente,ORG.Gerente, M.Tiempo_Servicio,M.Tipo_Programa, ";
            query += "M.Cuota,M.Importe_Mensual,M.Estrategia,M.Estatus,M.Observaciones,M.Fecha_Validacion AS Fecha_Verificacion, DT.Calle,DT.Colonia,T.Compania,T.Telefono_Oficina,T.Profesion ";
            query += "FROM matricula M ";
            query += "INNER JOIN titular T ";
            query += "ON M.Titular_idTitular = T.idTitular ";
            query += "INNER JOIN alumno AL ";
            query += "ON M.idMatricula = AL.Matricula_idMatricula ";
            query += "INNER JOIN asesor A ";
            query += "ON M.Asesor_idAsesor = A.idAsesor ";
            query += "INNER JOIN subgerente SG ";
            query += "ON M.Subgerente_idSubgerente = SG.idSubgerente ";
            query += "INNER JOIN supervisor SV ";
            query += "ON M.Supervisor_idSupervisor = SV.idSupervisor ";
            query += "INNER JOIN organizacion ORG ";
            query += "ON M.Organizacion_idOrganizacion = ORG.idOrganizacion ";
            query += "INNER JOIN dom_titular DT ";
            query += "ON T.Dom_Titular_idDom_Titular1 = DT.idDom_Titular ";
            query += "WHERE M.Fecha_Matricula between @Start AND @End ";


            var stringConnection = ConfigurationManager.ConnectionStrings["multilingualConnectionString"].ConnectionString;

            MySqlConnection connection = new MySqlConnection(stringConnection);
            MySqlCommand command = new MySqlCommand();
            command.Connection = connection;
            command.CommandType = System.Data.CommandType.Text;
            command.Parameters.AddWithValue("@Start", start);
            command.Parameters.AddWithValue("@End", end);
            switch (index)
            {
                case 1:
                    // Tipo programa
                    query += "AND M.Tipo_Programa = @Filtro";
                    command.Parameters.AddWithValue("@Filtro", ddlPrograma.SelectedValue);
                    break;
                case 2:
                    // Idioma
                    
                    break;
                case 3:
                    // Organización
                    query += "AND ORG.idOrganizacion=@Filtro";
                    command.Parameters.AddWithValue("@Filtro", Convert.ToInt32(ddlOrganizations.SelectedValue));
                    break;
                case 4:
                    // Estrategia
                    query += "AND M.Estrategia like @Filtro";
                    command.Parameters.AddWithValue("@Filtro", ddlEstrategia.SelectedValue);

                    break;
                case 5:
                    // Estatus
                    query += "AND M.Estatus like @Filtro";
                    command.Parameters.AddWithValue("@Filtro", ddlStatus.SelectedValue);
                    break;
                case 6:
                    // RFC
                    query += "AND T.RFC like @Filtro";
                    command.Parameters.AddWithValue("@Filtro", txtRfc.Text);
                    break;
                case 7:
                    // Asesor
                    query += "AND A.idAsesor = @Filtro";
                    command.Parameters.AddWithValue("@Filtro",Convert.ToInt32(ddlAsesor.SelectedValue));
                    break;
                case 8:
                    // Supervisor
                    query += "AND SV.idSupervisor = @Filtro";
                    command.Parameters.AddWithValue("@Filtro", Convert.ToInt32(ddlSupervisor.SelectedValue));
                    break;
                case 9:
                    // Subgerente
                    query += "AND SG.idSubgerente = @Filtro";
                    command.Parameters.AddWithValue("@Filtro", Convert.ToInt32(ddlSubGerente.SelectedValue));
                    break;
                case 10:
                    // Gerente
                    query += "AND ORG.idOrganizacion=@Filtro";
                    command.Parameters.AddWithValue("@Filtro", ddlGerente.SelectedValue);
                    break;                
            }

            command.CommandText = query;

            try
            {
                connection.Open();
                MySqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    var dummy = reader["Fecha_Verificacion"];
                    DateTime fechaDummy;
                    if (dummy == DBNull.Value)
                    {
                        fechaDummy = new DateTime(1990, 1, 1);                        
                    }
                    else
                    {
                        fechaDummy = (DateTime)dummy;
                    }
                    var temp = new QueryFormat()
                    {
                        NoCons = Convert.ToInt32(reader["No_Consecutivo"]),
                        NoPuntos = Convert.ToInt32(reader["No_Puntos"]),
                        NoContrato = Convert.ToInt32(reader["Numero_Contrato"]),
                        FechaMatricula = DateTime.Parse(reader["Fecha_Matricula"].ToString()),
                        NoRp = Convert.ToInt32(reader["No_RP"]),
                        NombreTitular = reader["Titular"].ToString(),
                        NombreBeneficiario = reader["Beneficiario"].ToString(),
                        RfcTitular = reader["RFC"].ToString(),
                        Organizacion = reader["Organizacion"].ToString(),
                        Asesor = reader["Asesor"].ToString(),
                        Supervisor = reader["Supervisor"].ToString(),
                        Subgerente = reader["Subgerente"].ToString(),
                        TiempoServicio = reader["Tiempo_Servicio"].ToString(),
                        Cuotas = Convert.ToInt32(reader["Cuota"].ToString()),
                        ImporteMensual = Convert.ToInt32(reader["Importe_Mensual"]),
                        Estrategia = reader["Estrategia"].ToString(),
                        Estatus = reader["Estatus"].ToString(),
                        Observaciones = reader["Observaciones"].ToString(),
                        FechaVerificacion =fechaDummy,
                        Calle = reader["Calle"].ToString(),
                        Colonia = reader["Colonia"].ToString(),
                        Compania = reader["Compania"].ToString(),
                        TelefonoOficina = reader["Telefono_Oficina"].ToString(),
                        Profesion = reader["Profesion"].ToString()
                    };

                    queryResult.Add(temp);
                }
            }
            catch (MySqlException ex)
            {
                                
            }

            return queryResult;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var result = this.ExecuteQuery(Convert.ToInt32(RadioButtonList1.SelectedValue), DateTime.Parse(txtFechaInicio.Value), DateTime.Parse(txtFechaFin.Value));
            GridView1.DataSource = result;
            GridView1.DataBind();
        }
        
    }


    public class QueryFormat
    {
        public int NoCons { get; set; }
        public int NoPuntos { get; set; }
        public int NoContrato { get; set; }
        public DateTime FechaMatricula { get; set; }
        public int NoRp { get; set; }
        public string NombreTitular { get; set; }
        public string NombreBeneficiario { get; set; }
        public string RfcTitular { get; set; }
        public string Organizacion { get; set; }
        public string Asesor { get; set; }
        public string Supervisor { get; set; }
        public string Subgerente { get; set; }
        public string Gerente { get; set; }
        public string[] Idiomas { get; set; }
        public string TiempoServicio { get; set; }
        public string TipoPrograma { get; set; }
        public int Inscripcion { get; set; }
        public int Cuotas { get; set; }
        public int ImporteMensual { get; set; }
        public string TipoPagoInscripcion { get; set; }
        public string Estrategia { get; set; }
        public string Estatus { get; set; }
        public string Observaciones { get; set; }
        public DateTime FechaVerificacion { get; set; }
        public int NoConfidencial { get; set; }
        public string TelefonoParticular { get; set; }
        public string Calle { get; set; }
        public string Colonia { get; set; }
        public string Compania { get; set; }
        public string TelefonoOficina { get; set; }
        public string Profesion { get; set; }
    }
}