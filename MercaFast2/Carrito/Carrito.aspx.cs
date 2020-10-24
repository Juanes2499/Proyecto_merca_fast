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
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /////////////// El tray catch se hace en caso de que no haya ninguna factura
            try
            {
                string idFactura = Session["idFactura"].ToString();
                double precioP = 0;
                int puntos = 0;
                int puntosCanjeo = 0;

                //////////////// Se consultan los datos que van a aparecer en el carrito
                var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQL = "select p.nombreProducto Nombre, p.precioProducto Precio, c.cantidadProducto Cantidad, c.PuntosTotales TotalPuntos, c.precioProductoT PrecioTotal from PRODUCTO p, CARRITO c, FACTURA f where p.idProducto=c.idProductoF and c.idFacturaF=f.idFactura and f.idFactura='" + idFactura + "'";
                var cmd = new SqlCommand(strSQL, sqlConn);

                var ds = new DataSet();
                var da = new SqlDataAdapter(cmd);

                sqlConn.Open();
                da.Fill(ds, "PRODUCTO");
                sqlConn.Close();

                var dt = ds.Tables[0];

                ////////// Se calculan los punton y el preciotal sumandolos de todos los productos del carrito
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    puntos = puntos + int.Parse(dt.Rows[i][3].ToString());
                    precioP = precioP + double.Parse(dt.Rows[i][4].ToString());
                }

                /////////// Trae el email del cliente creada en el login
                string MailCliente = Session["CorreoUserLogin"].ToString();

                ////////////// Consulta los puntos acumulados del usuario
                var sqlConn6 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                var strSQL6 = "select puntosAcumulados from CUENTA where correoCuenta='" + MailCliente + "'";
                var cmd6 = new SqlCommand(strSQL6, sqlConn6);

                var ds6 = new DataSet();
                var da6 = new SqlDataAdapter(cmd6);

                sqlConn6.Open();
                da6.Fill(ds6, "PRODUCTO");
                sqlConn6.Close();

                var dt6 = ds6.Tables[0];

                int puntosAcumu = int.Parse(dt6.Rows[0][0].ToString());

                /////////// Convierte el precio total del carrito en puntos que son 50 puntos por cada mil pesos que desee comprar

                puntosCanjeo = (Convert.ToInt32(precioP)*50)/1000;

                Session["PuntosTo"] = puntos;
                Session["PrecioTo"] = precioP;
                Session["puntosCanjeo"] = puntosCanjeo;


                if(puntosCanjeo > puntosAcumu)
                {
                    RadioButtonMetodo.Items.FindByValue("Puntos").Enabled = false; ///////////////////////////////////////**********************************************************
                }

                ///////// Convierte e ingresa los datos del carrito en los label

                LabelPuntosActuales.Text = puntosAcumu.ToString();
                LabelPuntosNece.Text = puntosCanjeo.ToString();
                TXT_Iva.Text= (precioP - (precioP / 1.19)).ToString();
                Txt_Puntos.Text = puntos.ToString();
                Txt_TotPa.Text = (precioP * 1.19).ToString();

                GridViewProductos.DataSource = dt;
                GridViewProductos.DataBind();

                /////////////////////////////////////////////////////////////// Traer los datos del cliente
                string correo = Session["UserLogin"].ToString();
                var sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                var Datos = "SELECT numDocIdentidad, nombreCuenta, apellidoCuenta, celularUsu FROM CUENTA  WHERE nombreUsuario=" + "'" + correo + "'";
                var cmdDa = new SqlCommand(Datos, sql);
                var dsDa = new DataSet();
                var daCo = new SqlDataAdapter(cmdDa);
                sql.Open();
                daCo.Fill(dsDa, "CUENTA");
                sql.Close();
                var tabDa = dsDa.Tables[0];
                Txt_NumId.Text = tabDa.Rows[0][0].ToString();
                Txt_Nom.Text = tabDa.Rows[0][1].ToString();
                Txt_Ape.Text = tabDa.Rows[0][2].ToString();
                Txt_Cel.Text = tabDa.Rows[0][3].ToString();

                Session["NumId"] = Txt_NumId.Text;
                Session["Nom"] = Txt_Nom.Text;
                Session["Ape"] = Txt_Ape.Text;
                Session["Cel"] = Txt_Cel.Text;
                Session["Ciudad"] = Txt_Ciudad.Text;
                Session["Dir"] = Txt_Dir.Text;
                ///////////////////////////////////////////////////////////////

            }
            catch (System.NullReferenceException)
            {
                //Response.Write("<script>window.alert('No has seleccionado ningun producto para crear una factura, por favor selecciona al menos uno');</script>");
                Response.Redirect("~/Carrito/Productos.aspx");
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productos.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string correo = Session["UserLogin"].ToString();
            string idFactura = Session["idFactura"].ToString();
            int puntosCanjeo = int.Parse(Session["puntosCanjeo"].ToString());
            string Metodo = RadioButtonMetodo.SelectedValue;

            var NumId = Txt_NumId.Text;
            var Nom = Txt_Nom.Text;
            var Ape = Txt_Ape.Text;
            var Cel = Txt_Cel.Text;
            var Ciud = Txt_Ciudad.Text;
            var Dir = Txt_Dir.Text;

            if (NumId.Trim() == "" | Nom.Trim() == "" | Ape.Trim() == "" | Cel.Trim() == "" | Ciud.Trim() == "" | Dir.Trim() == "" | Metodo.Trim() == "")
            {
                Lbl_msg.Text = "Se debe completar todos los datos personles o el metodo de pago";
            }
            else
            {
                /////////////// Busca el correo de la cuenta
                var sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                var Mail = "SELECT correoCuenta FROM CUENTA  WHERE nombreUsuario='" + correo + "'";
                var cmdCo = new SqlCommand(Mail, sql);
                var dsCo = new DataSet();
                var daCo = new SqlDataAdapter(cmdCo);
                sql.Open();
                daCo.Fill(dsCo, "CUENTA");
                sql.Close();
                var tabco = dsCo.Tables[0];
                var MailCliente = tabco.Rows[0][0];


                //////////////////// Consulta todos los productos de la factura que se esta pagando

                var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQL = "select p.nombreProducto Nombre, p.precioProducto Precio, c.cantidadProducto Cantidad, c.PuntosTotales TotalPuntos, c.precioProductoT PrecioTotal from PRODUCTO p, CARRITO c, FACTURA f where p.idProducto=c.idProductoF and c.idFacturaF=f.idFactura and f.idFactura='" + idFactura + "'";
                var cmd = new SqlCommand(strSQL, sqlConn);

                var ds = new DataSet();
                var da = new SqlDataAdapter(cmd);

                sqlConn.Open();
                da.Fill(ds, "PRODUCTO");
                sqlConn.Close();

                var dt = ds.Tables[0];

                //////////////// El ciclo tomara los datos de los productos que hay en el carrito

                

            
                /////////////////////// Escribe el precio total, los puntos totales y si a pagada

                int punT = int.Parse(Session["PuntosTo"].ToString());
                double preTo = double.Parse(Session["PrecioTo"].ToString());

                var sqlConn4 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQL4 = "update FACTURA set valorTotal=" + preTo + ", numeroPuntos=" + punT + ", pagada='si', metodoPago='"+ Metodo + "' where idFactura='" + idFactura + "'";

                var cmd4 = new SqlCommand(strSQL4, sqlConn4);

                sqlConn4.Open();
                cmd4.ExecuteNonQuery();
                sqlConn4.Close();

                /////////////////// Consulta los puntos actuales que tiene la cuenta del usuario

                var sqlConn6 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQL6 = "select puntosAcumulados from CUENTA where correoCuenta='"+ MailCliente + "'";
                var cmd6 = new SqlCommand(strSQL6, sqlConn6);

                var ds6 = new DataSet();
                var da6 = new SqlDataAdapter(cmd6);

                sqlConn6.Open();
                da6.Fill(ds6, "PRODUCTO");
                sqlConn6.Close();

                var dt6 = ds6.Tables[0];

                int puntosAcumu = int.Parse(dt6.Rows[0][0].ToString());

                int pAcumuladosTotal = punT + puntosAcumu;

                //////////////////////////
                int CostoPuntos = (puntosAcumu - puntosCanjeo) + punT;

                if (Metodo == "Puntos")
                {

                    var sqlConnRes = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                    var strSQLRes = "update CUENTA set puntosAcumulados=" + CostoPuntos + " where correoCuenta='" + MailCliente + "'";

                    var cmdRes = new SqlCommand(strSQLRes, sqlConnRes);

                    sqlConnRes.Open();
                    cmdRes.ExecuteNonQuery();
                    sqlConnRes.Close();
                

                }
                else
                {
                    ////////////////////////// Actualiza los puntos de la cuenta

                    var sqlConn5 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                    var strSQL5 = "update CUENTA set puntosAcumulados=" + pAcumuladosTotal + " where correoCuenta='" + MailCliente + "'";

                    var cmd5 = new SqlCommand(strSQL5, sqlConn5);

                    sqlConn5.Open();
                    cmd5.ExecuteNonQuery();
                    sqlConn5.Close();
                }


            
                Response.Redirect("FacturaPagada.aspx");
            }
           

        }

        protected void BTN_Eliminar_Click(object sender, EventArgs e)
        {
            string idFactura = Session["idFactura"].ToString();

            var sqlConn5 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var strSQL5 = "delete from CARRITO where idFacturaF='"+ idFactura + "'";

            var cmd5 = new SqlCommand(strSQL5, sqlConn5);

            sqlConn5.Open();
            cmd5.ExecuteNonQuery();
            sqlConn5.Close();



            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var strSQL = "select p.nombreProducto Nombre, p.precioProducto Precio, c.cantidadProducto Cantidad, c.PuntosTotales TotalPuntos, c.precioProductoT PrecioTotal from PRODUCTO p, CARRITO c, FACTURA f where p.idProducto=c.idProductoF and c.idFacturaF=f.idFactura and f.idFactura='" + idFactura + "'";
            var cmd = new SqlCommand(strSQL, sqlConn);

            var ds = new DataSet();
            var da = new SqlDataAdapter(cmd);

            sqlConn.Open();
            da.Fill(ds, "PRODUCTO");
            sqlConn.Close();

            var dt = ds.Tables[0];

            GridViewProductos.DataSource = dt;
            GridViewProductos.DataBind();

            
        }
    }
}