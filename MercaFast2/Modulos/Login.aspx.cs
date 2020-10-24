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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BTN_Ingresar_Click(object sender, EventArgs e)
        {
            string User = TXT_User.Text;
            string Pass = TXT_Pass.Text;
            var Es = "S";
            
            ////////////// Consulta que haya alguna cuanta administradora con el correo o el usuario 
            var SQLCnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
            var StrSql = "SELECT COUNT(nombreUsuario) FROM CUENTA  WHERE (nombreUsuario=" + "'" + User + "'" + "OR correoCuenta=" + "'" + User + "'" + ")" + " AND contraseñaCuenta=" + "'" + Pass + "'" + "AND esAdmin=" + "'" + Es + "'";
            var Cmd1 = new SqlCommand(StrSql, SQLCnn);

            var ds = new DataSet();
            var da = new SqlDataAdapter(Cmd1);

            SQLCnn.Open();
            da.Fill(ds, "CUENTA");
            SQLCnn.Close();

            var dt = ds.Tables[0];
            var Consulta1 = dt.Rows[0][0];

            //////////////Si ha y o no una cuenta usario
            if (Consulta1.Equals(0))
            {
                var StrSql2 = "SELECT COUNT(nombreUsuario) FROM CUENTA  WHERE (nombreUsuario=" + "'" + User + "'" + "OR correoCuenta=" + "'" + User + "'" + ")" + " AND contraseñaCuenta=" + "'" + Pass + "'" + "AND esAdmin='N'";
                var Cmd2 = new SqlCommand(StrSql2, SQLCnn);

                var StrSql22 = "SELECT nombreUsuario, correoCuenta FROM CUENTA  WHERE (nombreUsuario=" + "'" + User + "'" + "OR correoCuenta=" + "'" + User + "'" + ")" + " AND contraseñaCuenta=" + "'" + Pass + "'" + "AND esAdmin='N'" + "GROUP BY nombreUsuario, correoCuenta";
                var Cmd22 = new SqlCommand(StrSql22, SQLCnn);

                var ds2 = new DataSet();
                var da2 = new SqlDataAdapter(Cmd2);

                var ds22 = new DataSet();
                var da22 = new SqlDataAdapter(Cmd22);

                SQLCnn.Open();
                da2.Fill(ds2, "CUENTA");
                da22.Fill(ds22, "CUENTA");
                SQLCnn.Close();

                var dt2 = ds2.Tables[0];
                var Consulta2 = dt2.Rows[0][0];

                var dt22 = ds22.Tables[0];


                if (Consulta2.Equals(0))
                {
                    LBL_Msg.Text = "Usuario no encontrado";
                }
                else
                {
                    var NomUserCliente = dt22.Rows[0][0];
                    var CorreoUserCliente = dt22.Rows[0][1];

                    Session["UserLogin"] = NomUserCliente.ToString();
                    Session["CorreoUserLogin"] = CorreoUserCliente.ToString();

                    var SQLCnnF = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                    var StrSqlF = "select count(f.idFactura) from FACTURA f, CUENTA c where pagada='no' and (c.correoCuenta='"+ NomUserCliente + "' or c.nombreUsuario='"+ NomUserCliente + "') and c.contraseñaCuenta='"+ Pass + "'";
                    var CmdF = new SqlCommand(StrSqlF, SQLCnnF);

                    var dsF = new DataSet();
                    var daF = new SqlDataAdapter(CmdF);

                    SQLCnnF.Open();
                    daF.Fill(dsF, "CUENTA");
                    SQLCnnF.Close();

                    var dtF = dsF.Tables[0];
                    var ConsultaF = dtF.Rows[0][0];

                    if (ConsultaF.Equals(0))
                    {
                        Session["idFactura"] = null;
                        Response.Redirect("CuentaCliente.aspx");
                    }
                    else
                    {
                        var SQLCnnF2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                        var StrSqlF2 = "select f.idFactura from FACTURA f, CUENTA c where pagada='no' and (c.correoCuenta='" + NomUserCliente + "' or c.nombreUsuario='" + NomUserCliente + "') and c.contraseñaCuenta='" + Pass + "'";
                        var CmdF2 = new SqlCommand(StrSqlF2, SQLCnnF2);

                        var dsF2 = new DataSet();
                        var daF2 = new SqlDataAdapter(CmdF2);

                        SQLCnnF2.Open();
                        daF2.Fill(dsF2, "CUENTA");
                        SQLCnnF2.Close();

                        var dtF2 = dsF2.Tables[0];
                        string ConsultaF2 = dtF2.Rows[0][0].ToString();

                        Session["idFactura"] = ConsultaF2;
                        Response.Redirect("CuentaCliente.aspx");
                    }
                    
                }
            }
            else
            {
                var StrSql3 = "SELECT COUNT(nombreUsuario), nombreUsuario FROM CUENTA  WHERE (nombreUsuario=" + "'" + User + "'" + "OR correoCuenta=" + "'" + User + "'" + ")" + " AND contraseñaCuenta=" + "'" + Pass + "'" + "AND esAdmin=" + "'" + Es + "'" + "GROUP BY nombreUsuario";
                var Cmd3 = new SqlCommand(StrSql3, SQLCnn);

                var StrSql33 = "SELECT nombreUsuario FROM  CUENTA WHERE (nombreUsuario=" + "'" + User + "'" + "OR correoCuenta=" + "'" + User + "'" + ")" + "AND contraseñaCuenta=" + "'" + Pass + "'" + "AND esAdmin =" + "'" + Es + "'" + "GROUP BY nombreUsuario";
                var Cmd33 = new SqlCommand(StrSql33, SQLCnn);

                var ds3 = new DataSet();
                var da3 = new SqlDataAdapter(Cmd3);

                var ds33 = new DataSet();
                var da33 = new SqlDataAdapter(Cmd33);

                SQLCnn.Open();
                da3.Fill(ds3, "CUENTA");
                da33.Fill(ds33, "CUENTA");
                SQLCnn.Close();

                var dt3 = ds3.Tables[0];
                var Consulta3 = dt3.Rows[0][0];

                var dt33 = ds33.Tables[0];

                if (Consulta3.Equals(0))
                {
                    LBL_Msg.Text = "Usuario no encontrado";
                }
                else
                {
                    var NomUserAdmin = dt33.Rows[0][0];
                    Session["UserLogin2"] = NomUserAdmin;
                    Response.Redirect("CuentaAdmin.aspx");
                }
            }
        }

        protected void BTN_Regis_Click(object sender, EventArgs e)
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
                if (NunIdentidad.Trim() == "" | Nombres.Trim() == "" | Apellidos.Trim() == "" | Celular.Trim() == "" | Mail.Trim() == "" | User.Trim() == "" | Pass.Trim() == "")
                {
                    LBL_Msg.Text = "No puede haber campos vacios, por favor completarlos";
                }
                else
                {
                    var StrSqlIngresar = "INSERT INTO CUENTA VALUES ('" + TipoDoc + "', '" + NunIdentidad + "','" + Mail + "','" + Pass + "','" + Nombres + "','" + Apellidos + "','" + User + "','" + PuntosInic + "','" + FechaNac + "','" + Celular + "','" + EsAdmin + "')";
                    var CmdIngresar = new SqlCommand(StrSqlIngresar, SQLCnn);

                    SQLCnn.Open();
                    CmdIngresar.ExecuteNonQuery();
                    SQLCnn.Close();

                    LBL_Msg.Text = "Nuevo usuario guardado";
                }
            }
            else
            {
                LBL_Msg.Text = "Usuario o mail ya exitentes, por favor verifcar o cambiarlos.";
            }
        }

        protected void BTN_LimpiarCampos_Click(object sender, EventArgs e)
        {
            TXT_InNumDoc.Text = "";
            TXT_InNombres.Text = "";
            TXT_InApellidos.Text = "";
            TXT_InCelular.Text = "";
            TXT_InMail.Text = "";
            TXT_InUser.Text = "";
            TXT_InPass.Text = "";
        }
    }
}