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
    public partial class CuentaAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var SessionVar = Session["UserLogin2"].ToString();

            var SqlCnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
            var StrSqlAdmin = "SELECT tipoDocumento, numDocIdentidad, nombreCuenta, apellidoCuenta, fechaNacimiento, celularUsu, correoCuenta, nombreUsuario FROM CUENTA WHERE nombreUsuario=" + "'" + SessionVar + "'";
            var CmdAdmin = new SqlCommand(StrSqlAdmin, SqlCnn);

            var ds = new DataSet();
            var da = new SqlDataAdapter(CmdAdmin);

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
        }

        protected void BTN_Productos_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CRUD/crearProducto.aspx");
        }

        protected void BTN_CloseSession_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Remove("UserLogin2");
            Response.Redirect("/Modulos/Login.aspx");
        }

        protected void BTN_Cliente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CRUD/CRUDClientes.aspx");
        }
    }
}