using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MercaFast2.Modulos
{
    public partial class FacturaCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string VarSesUser =  Session["UserLogin"].ToString();
            
            var sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
            var Datos = "SELECT correoCuenta FROM CUENTA  WHERE nombreUsuario=" + "'" + VarSesUser + "'";
            var cmdDa = new SqlCommand(Datos, sql);
            var dsDa = new DataSet();
            var daCo = new SqlDataAdapter(cmdDa);
            sql.Open();
            daCo.Fill(dsDa, "CUENTA");
            sql.Close();
            var tabDa = dsDa.Tables[0];
            var Mail = tabDa.Rows[0][0].ToString();


            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
            var strFact = "SELECT idFactura, fechaFactura, valorTotal, numeroPuntos, metodoPago, pagada FROM FACTURA WHERE correoCuentaF=" + "'" + Mail + "' ";
            var cmd = new SqlCommand(strFact, sqlConn);

            var ds = new DataSet();
            var da = new SqlDataAdapter(cmd);

            sqlConn.Open();
            da.Fill(ds, "FACTURA");
            sqlConn.Close();

            var dt = ds.Tables[0];

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void BTN_Buscar_Click(object sender, EventArgs e)
        {
            string buscar = TXT_Busc.Text;
            string Mail = Session["CorreoUserLogin"].ToString();
            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
            var strFact = "SELECT idFactura, fechaFactura, valorTotal, numeroPuntos, metodoPago, pagada FROM FACTURA WHERE correoCuentaF=" + "'" + Mail + "' and fechaFactura like '%"+ buscar + "%'";
            var cmd = new SqlCommand(strFact, sqlConn);

            var ds = new DataSet();
            var da = new SqlDataAdapter(cmd);

            sqlConn.Open();
            da.Fill(ds, "FACTURA");
            sqlConn.Close();

            var dt = ds.Tables[0];

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}