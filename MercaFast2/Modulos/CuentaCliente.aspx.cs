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
    public partial class CuentaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LBL_OutUser.Text = Session["UserLogin"].ToString();
            var VarSession = Session["UserLogin"].ToString();

            var SqlCnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
            var StrSqlCliente = "SELECT tipoDocumento, numDocIdentidad, nombreCuenta, apellidoCuenta, fechaNacimiento, celularUsu, correoCuenta, nombreUsuario, puntosAcumulados FROM CUENTA WHERE nombreUsuario='" + VarSession +"'";
            var CmdClientes = new SqlCommand(StrSqlCliente, SqlCnn);

            var ds = new DataSet();
            var da = new SqlDataAdapter(CmdClientes);

            SqlCnn.Open();
            da.Fill(ds, "CUENTA");
            SqlCnn.Close();

            var dt = ds.Tables[0];

            LBL_OutTipoIden.Text = dt.Rows[0][0].ToString();
            LBL_OutNumIden.Text = dt.Rows[0][1].ToString();
            LBL_OutNom.Text = dt.Rows[0][2].ToString();
            LBL_OutApe.Text = dt.Rows[0][3].ToString();
            LBL_OutFecNac.Text = dt.Rows[0][4].ToString();
            LBL_OutCelular.Text = dt.Rows[0][5].ToString();
            LBL_OutMail.Text = dt.Rows[0][6].ToString();
            LBL_OutUser.Text = dt.Rows[0][7].ToString();
            LBL_OutPuntos.Text = dt.Rows[0][8].ToString();
        }

        protected void BTN_CloseSession_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Remove("UserLogin");
            Response.Redirect("/Modulos/Login.aspx");
        }

        protected void BTN_Carro_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Carrito/Carrito.aspx");
        }

        protected void BTN_Historial_Click(object sender, EventArgs e)
        {
            Response.Redirect("FacturaCliente.aspx");
        }
    }
}