using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MercaFast.Modulos
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string TipoDoc = DDL_TipoDoc.Text;
            string NunIdentidad = TXT_InNumDoc.Text;
            string Nombres = TXT_InNombres.Text;
            string Apellidos = TXT_InApellidos.Text;
            string Dia = DDL_Dia.Text;
            string Mes = DDL_Mes.Text;
            string Año = DDL_Año.Text;
            string FechaNac = Dia + "/" + Mes + "/" + Año;
            string Celular = TXT_InCelular.Text;
            string Mail = TXT_InMail.Text;
            string User = TXT_InUser.Text;
            string Pass = TXT_InPass.Text;
            int PuntosInic = 0;
            string EsAdmin = "N";

            var SQLCnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
            var StrSQL = "SELECT COUNT(nombreUsuario) FROM  CUENTA WHERE nombreUsuario =" + "'" + User + "'" + "OR correoCuenta =" + "'" + Mail + "'";
            var CmdReg = new SqlCommand(StrSQL, SQLCnn);

            var ds = new DataSet();
            var da = new SqlDataAdapter(CmdReg);

            SQLCnn.Open();
            da.Fill(ds, "CUENTA");
            SQLCnn.Close();

            var dt = ds.Tables[0];
            var ConsultaRegistrados = dt.Rows[0][0];

            if (ConsultaRegistrados.Equals(0))
            {
                var StrSqlIngresar = "INSERT INTO CUENTA VALUES ('" + TipoDoc + "', '" + NunIdentidad + "','" + Mail + "','" + Pass+ "','" + Nombres + "','" + Apellidos + "','" + User + "','" + PuntosInic + "','" + FechaNac + "','" + Celular + "','" + EsAdmin + "')";
                var CmdIngresar = new SqlCommand(StrSqlIngresar, SQLCnn);

                SQLCnn.Open();
                CmdIngresar.ExecuteNonQuery();
                SQLCnn.Close();

                LBL_Msg.Text = "Nuevo usuario guardado";
            }
            else
            {
                LBL_Msg.Text = "Usuario o mail ya exitentes, por favor verifcar o cambiarlos.";
            }
        }
    }
}