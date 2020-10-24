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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Insert is successfull')", true);

            ///////////////// Pone los nombres de la categoria en el dropDownList
            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM SUB_CATEGORIA where idCategoriaF='396ca44c-3924-4edd-80a1-acff08912a6b'", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DropDownListComida.DataTextField = "nombreSubCategoria";
                    DropDownListComida.DataValueField = "nombreSubCategoria";
                    DropDownListComida.DataSource = rdr;
                    DropDownListComida.DataBind();
                }
            }

            ///////////////// Pone los nombres de la categoria en el dropDownList
            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM SUB_CATEGORIA where idCategoriaF='1784704E-5A08-482D-8633-3C81C0801B52'", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DropDownListAseo.DataTextField = "nombreSubCategoria";
                    DropDownListAseo.DataValueField = "nombreSubCategoria";
                    DropDownListAseo.DataSource = rdr;
                    DropDownListAseo.DataBind();
                }
            }           

            ///////////////// Carga todas las imagenes en el repeater al iniciar
            ConsultarImagen();
            
        }

        protected void ConsultarImagen()
        {
            var sqlConn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            //where nombreSubCategoria='" + subCat + "'";

            var cmd2 = new SqlCommand();
            cmd2.CommandText = "select * from PRODUCTO";
            cmd2.CommandType = CommandType.Text;
            cmd2.Connection = sqlConn2;

            sqlConn2.Open();

            DataTable ImagenesDB = new DataTable();

            ImagenesDB.Load(cmd2.ExecuteReader());

            Repeater1.DataSource = ImagenesDB;
            Repeater1.DataBind();
            sqlConn2.Close();

        }


        protected void ConsultarImagenBuscar()
        {

            var sqlConn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            //where nombreSubCategoria='" + subCat + "'";
            string bus = TextBoxBuscar.Text;
            var cmd2 = new SqlCommand();
            cmd2.CommandText = "select * from PRODUCTO where nombreProducto like '%"+ bus + "%'";
            cmd2.CommandType = CommandType.Text;
            cmd2.Connection = sqlConn2;

            sqlConn2.Open();

            DataTable ImagenesDB = new DataTable();

            ImagenesDB.Load(cmd2.ExecuteReader());

            Repeater1.DataSource = ImagenesDB;
            Repeater1.DataBind();
            sqlConn2.Close();

        }

        protected void ConsultarImagenComidas()
        {
            

        }

        protected void ConsultarImagenAseo()
        {
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
          
        }

        protected void ButtonFiltrar2_Click(object sender, EventArgs e)
        {
            
        }

        protected void ButtonSelec_Click(object sender, EventArgs e)
        {
          
            Response.Redirect("productoSeleccionado.aspx");
        }

        protected void DropDownListComida_SelectedIndexChanged(object sender, EventArgs e)
        {
            string subCat = DropDownListComida.SelectedValue.ToString();

            var sqlConn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var strSQL2 = "select idSubCategoria from SUB_CATEGORIA where nombreSubCategoria='" + subCat + "'";

            var cmd2 = new SqlCommand(strSQL2, sqlConn2);

            var ds2 = new DataSet();
            var da2 = new SqlDataAdapter(cmd2);

            sqlConn2.Open();
            da2.Fill(ds2, "PRODUCTO");
            sqlConn2.Close();

            var dt2 = ds2.Tables[0];
            string idSubCat = dt2.Rows[0][0].ToString();



            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            //where nombreSubCategoria='" + subCat + "'";

            var cmd = new SqlCommand();
            cmd.CommandText = "select * from PRODUCTO where idSubCategoriaF='" + idSubCat + "'";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConn;

            sqlConn.Open();

            DataTable ImagenesDB = new DataTable();

            ImagenesDB.Load(cmd.ExecuteReader());

            Repeater1.DataSource = ImagenesDB;
            Repeater1.DataBind();
            sqlConn.Close();
        }

        protected void DropDownListAseo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string subCat = DropDownListAseo.SelectedValue.ToString();

            var sqlConn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var strSQL2 = "select idSubCategoria from SUB_CATEGORIA where nombreSubCategoria='" + subCat + "'";

            var cmd2 = new SqlCommand(strSQL2, sqlConn2);

            var ds2 = new DataSet();
            var da2 = new SqlDataAdapter(cmd2);

            sqlConn2.Open();
            da2.Fill(ds2, "PRODUCTO");
            sqlConn2.Close();

            var dt2 = ds2.Tables[0];
            string idSubCat = dt2.Rows[0][0].ToString();



            var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            //where nombreSubCategoria='" + subCat + "'";

            var cmd = new SqlCommand();
            cmd.CommandText = "select * from PRODUCTO where idSubCategoriaF='" + idSubCat + "'";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConn;

            sqlConn.Open();

            DataTable ImagenesDB = new DataTable();

            ImagenesDB.Load(cmd.ExecuteReader());

            Repeater1.DataSource = ImagenesDB;
            Repeater1.DataBind();
            sqlConn.Close();
        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            ConsultarImagen();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ConsultarImagenBuscar();
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Carrito.aspx");
        }
    }
}