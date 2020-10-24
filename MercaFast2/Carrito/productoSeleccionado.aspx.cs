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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var VarSessionAD = HttpContext.Current.Session["UserLogin2"];

            Session["fecha"] = LabelFecha.Text = DateTime.Now.ToString("G");

            ///////////////// Captura el nombre de producto recibido por el url
            string producto = Request.QueryString["nP"].ToString();

            string nombrePro, puntosPro, idSubCatFPro, descripPro, idProducto;
            int stockPro;
            double precioPro;
            byte[] imagenPro;

            var sqlConn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var strSQL2 = "select * from PRODUCTO WHERE nombreProducto='" + producto + "'";

            var cmd2 = new SqlCommand(strSQL2, sqlConn2);

            var ds2 = new DataSet();
            var da2 = new SqlDataAdapter(cmd2);

            sqlConn2.Open();
            da2.Fill(ds2, "PRODUCTO");
            sqlConn2.Close();

            var dt2 = ds2.Tables[0];

            Session["idProducto"] = idProducto = dt2.Rows[0][0].ToString();
            Session["nombrePro"] = nombrePro = dt2.Rows[0][1].ToString();
            Session["precioPro"] = precioPro = double.Parse(dt2.Rows[0][2].ToString());
            Session["stockPro"] = stockPro = (int)dt2.Rows[0][3];
            Session["puntosPro"] = puntosPro = dt2.Rows[0][4].ToString();
            Session["idSubCatFPro"] = idSubCatFPro = dt2.Rows[0][5].ToString();
            Session["imagenPro"] = imagenPro = (byte[])dt2.Rows[0][6];
            Session["descripPro"] = descripPro = dt2.Rows[0][7].ToString();

            LabelNombre.Text = nombrePro;
            LabelPrecio.Text = precioPro.ToString();
            LabelPuntos.Text = puntosPro;
            LabelDescripcion.Text = descripPro;

            for (int i = 1; i <= stockPro && i<=12; i++)
            {
                DropDownListstock.Items.Add(i.ToString());
            }

            if (stockPro <= 0)
            {
                DropDownListstock.Items.Add("0");
                LabelNoDispo.Text = "Producto no disponible en el momento.";
                ButtonComprar.Visible = false;
            }


            if (VarSessionAD != null && Session["UserLogin"] == null)
            {
                LabelNoDispo.Text = "El administrador no puede ir a Carrito";
                ButtonComprar.Visible = false;
            }
            else if (Session["UserLogin"] == null)
            {
                LabelNoDispo.Text = "Necesitas iniciar sesion para poder comprar.";
                ButtonComprar.Visible = false;
                BTN_GoLogin.Visible = true;
            }else if (Session["UserLogin"] != null)
            {
                BTN_GoLogin.Visible = false;
            }


            string imgDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(imagenPro);
            ImagePro.ImageUrl = imgDataURL64;


        }

        protected void ButtonComprar_Click(object sender, EventArgs e)
        {
            //string correo = Session["correoCuen"].ToString();
            int cantidad = int.Parse(DropDownListstock.SelectedValue);

            string idFactura;

            string NomUserCliente = Session["UserLogin"].ToString();
            

            var SQLCnnF = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
            var StrSqlF = "select count(f.idFactura) from FACTURA f, CUENTA c where pagada='no' and (c.correoCuenta='" + NomUserCliente + "' or c.nombreUsuario='" + NomUserCliente + "')";
            var CmdF = new SqlCommand(StrSqlF, SQLCnnF);

            var dsF = new DataSet();
            var daF = new SqlDataAdapter(CmdF);

            SQLCnnF.Open();
            daF.Fill(dsF, "CUENTA");
            SQLCnnF.Close();

            var dtF = dsF.Tables[0];
            string ConsultaF = dtF.Rows[0][0].ToString();

            //////////////// Creacion de la factura
            if (Session["idFactura"] == null ) ///
            {
                string coreo = Session["UserLogin"].ToString();
                string fechaAct = Session["fecha"].ToString();

                //////////////// Se consulta el correo con el nimbre de usuario
                var sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                var Mail = "SELECT correoCuenta FROM CUENTA  WHERE nombreUsuario=" + "'" + coreo + "'";
                var cmdCo = new SqlCommand(Mail, sql);
                var dsCo = new DataSet();
                var daCo = new SqlDataAdapter(cmdCo);
                sql.Open();
                daCo.Fill(dsCo, "CUENTA");
                sql.Close();
                var tabco = dsCo.Tables[0];
                var MailCliente = tabco.Rows[0][0];


                ////////// Se crea la factura
                var sqlConn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQL2 = "insert into FACTURA(fechaFactura, correoCuentaF, pagada) values('" + fechaAct + "','" + MailCliente + "', 'no')";// + correo + "'";

                var cmd2 = new SqlCommand(strSQL2, sqlConn2);

                sqlConn2.Open();
                cmd2.ExecuteNonQuery();
                sqlConn2.Close();

                ////////// Se consulta el id de la ultima factura creada
                var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQL = "select * from FACTURA WHERE fechaFactura='" + fechaAct + "' and correoCuentaF='" + MailCliente + "'";

                var cmd = new SqlCommand(strSQL, sqlConn);

                var ds = new DataSet();
                var da = new SqlDataAdapter(cmd);

                sqlConn.Open();
                da.Fill(ds, "PRODUCTO");
                sqlConn.Close();

                var dt2 = ds.Tables[0];

                Session["idFactura"] = idFactura = dt2.Rows[0][0].ToString();
            }
            else
            {
                idFactura = Session["idFactura"].ToString();

                //////////////////////// Crear Carrito

                double precio = double.Parse(Session["precioPro"].ToString()) * cantidad;

                int puntosT = int.Parse(Session["puntosPro"].ToString()) * cantidad;

                var sqlConn3 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQL3 = "insert into CARRITO(cantidadProducto, idFacturaF, idProductoF, precioProductoT, PuntosTotales) values('" + cantidad + "','" + idFactura + "','" + Session["idProducto"].ToString() + "'," + precio + "," + puntosT + ")";

                var cmd3 = new SqlCommand(strSQL3, sqlConn3);

                sqlConn3.Open();
                cmd3.ExecuteNonQuery();
                sqlConn3.Close();
            }

                ///////////////////// se calcula el nuevo stock
                string nomPro = Session["nombrePro"].ToString();
                int stockProduc = int.Parse(Session["stockPro"].ToString());
                int stockActual = stockProduc - cantidad;

                var sqlConnPro = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQLPro = "update PRODUCTO set Stock=" + stockActual + " where nombreProducto='" + nomPro + "'";

                var cmdPro = new SqlCommand(strSQLPro, sqlConnPro);

                sqlConnPro.Open();
                cmdPro.ExecuteNonQuery();
                sqlConnPro.Close();

                Response.Redirect("Carrito.aspx");
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }
    }
}