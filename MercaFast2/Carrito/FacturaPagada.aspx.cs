using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace Proyecto.carrito
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Lbl_NumID.Text = Session["NumId"].ToString();
            Lbl_Nom.Text = Session["Nom"].ToString();
            Lbl_Ape.Text = Session["Ape"].ToString();
            Lbl_Cel.Text = Session["Cel"].ToString();
            Lbl_Ciudad.Text = Session["Ciudad"].ToString();
            Lbl_Dir.Text = Session["Dir"].ToString();

            string idFactura;

            idFactura = Session["idFactura"].ToString();

            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var strSQL = "select p.nombreProducto Nombre, p.precioProducto Precio, c.cantidadProducto Cantidad, c.PuntosTotales TotalPuntos, c.precioProductoT PrecioTotal from PRODUCTO p, CARRITO c, FACTURA f where p.idProducto=c.idProductoF and c.idFacturaF=f.idFactura and f.idFactura='" + idFactura + "'";
            var cmd = new SqlCommand(strSQL, sqlConn);

            var ds = new DataSet();
            var da = new SqlDataAdapter(cmd);

            sqlConn.Open();
            da.Fill(ds, "PRODUCTO");
            sqlConn.Close();

            var dt = ds.Tables[0];

            GridViewFactura.DataSource = dt;
            GridViewFactura.DataBind();

            var sqlConn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var strSQL2 = "select * from FACTURA where idFactura='" + idFactura + "'";
            var cmd2 = new SqlCommand(strSQL2, sqlConn2);

            var ds2 = new DataSet();
            var da2 = new SqlDataAdapter(cmd2);

            sqlConn2.Open();
            da2.Fill(ds2, "PRODUCTO");
            sqlConn2.Close();

            var dt2 = ds2.Tables[0];

            string fechaFac = dt2.Rows[0][2].ToString();

            LabelFactura.Text = idFactura;
            LabelFechaFac.Text = fechaFac;

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }
    }
}