using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace MercaFast2.CRUD
{
    public partial class CRUDClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Ejecuctar_Click(object sender, EventArgs e)
        {
            var Accion = DropDownList1.Text;

            string NumId = TXT_OutNum.Text;
            string Nombre = TXT_OutNombre.Text;
            string Apellido = TXT_OutApellido.Text;
            string Fecha = TXT_OutFechaNac.Text;
            string Celular = TXT_OutTelefono.Text;
            string Mail = LBL_OutMail.Text;

            string Buscar = TXT_Buscar.Text;

            if (Accion.Equals("Update"))
            {

                if (NumId.Trim() == "" | Nombre.Trim() == "" | Apellido.Trim() == "" | Fecha.Trim() == "" | Celular.Trim() == "")
                {
                    LBL_Msg2.Text = "Se debe seleccionar un cliente para poder ejecutar la acción actualizar cliente"; ;
                }
                else
                {
                    var SqlCnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                    var StrSqlUpdate = "UPDATE CUENTA SET nombreCuenta='" + Nombre + "', apellidoCuenta='" + Apellido + "', fechaNacimiento='" + Fecha + "', celularUsu='" + Celular + "'WHERE correoCuenta=" + "'" + Mail + "'";
                    var CmdUpdate = new SqlCommand(StrSqlUpdate, SqlCnn);

                    SqlCnn.Open();
                    CmdUpdate.ExecuteNonQuery();
                    SqlCnn.Close();
                    LBL_Msg2.Text = "Registro actualizado correctamente, actualizar la tabla por favor.";
                }
            }
            else if (Accion.Equals("Delete"))
            {
                try
                {
                    if (NumId.Trim() == "" | Nombre.Trim() == "" | Apellido.Trim() == "" | Fecha.Trim() == "" | Celular.Trim() == "")
                    {
                        LBL_Msg2.Text = "Se debe seleccionar un cliente para poder ejecutar la acción eliminar cliente";
                    }
                    else
                    {
                        var SqlCnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                        var StrSqlDelete = "DELETE FROM CUENTA WHERE correoCuenta=" + "'" + Mail + "'";
                        var CmdDelete = new SqlCommand(StrSqlDelete, SqlCnn);

                        SqlCnn.Open();
                        CmdDelete.ExecuteNonQuery();
                        SqlCnn.Close();
                        LBL_Msg2.Text = "El registro fue elimando correctamente, actualizar la tabla por favor.";
                    }
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    LBL_Msg2.Text = "No se puede ejecutar la acción, el cliente tiene una factura pendiente";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Buscar = TXT_Buscar.Text;
            if (Buscar.Trim() == "")
            {
                SqlDataSource1.SelectCommand = "SELECT [tipoDocumento], [numDocIdentidad], [nombreCuenta], [apellidoCuenta], [fechaNacimiento], [celularUsu], [correoCuenta], [nombreUsuario] FROM [CUENTA] WHERE esAdmin='N' ";
                SqlDataSource1.DataBind();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT  tipoDocumento, numDocIdentidad, nombreCuenta, apellidoCuenta, fechaNacimiento, celularUsu, correoCuenta, nombreUsuario  FROM CUENTA WHERE esAdmin='N' AND correoCuenta LIKE '" + Buscar + "%'";
                SqlDataSource1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            LBL_TipoId.Text = gr.Cells[1].Text;
            TXT_OutNum.Text = gr.Cells[2].Text;
            TXT_OutNombre.Text = gr.Cells[3].Text;
            TXT_OutApellido.Text = gr.Cells[4].Text;
            TXT_OutFechaNac.Text = gr.Cells[5].Text;
            TXT_OutTelefono.Text = gr.Cells[6].Text;
            LBL_OutMail.Text = gr.Cells[7].Text;
            LBL_OutUser.Text = gr.Cells[8].Text;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string Buscar = TXT_Buscar.Text;
            if (Buscar.Trim() == "")
            {
                SqlDataSource1.SelectCommand = "SELECT [tipoDocumento], [numDocIdentidad], [nombreCuenta], [apellidoCuenta], [fechaNacimiento], [celularUsu], [correoCuenta], [nombreUsuario] FROM [CUENTA] WHERE esAdmin='N' ";
                SqlDataSource1.DataBind();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT  tipoDocumento, numDocIdentidad, nombreCuenta, apellidoCuenta, fechaNacimiento, celularUsu, correoCuenta, nombreUsuario  FROM CUENTA WHERE esAdmin='N'";
                SqlDataSource1.DataBind();
            }
        }

        protected void BTN_LimpiarCampos_Click(object sender, EventArgs e)
        {
            LBL_TipoId.Text = "";
            TXT_OutNum.Text = "";
            TXT_OutNombre.Text = "";
            TXT_OutApellido.Text = "";
            TXT_OutFechaNac.Text = "";
            TXT_OutTelefono.Text= "";
            LBL_OutMail.Text = "";
            LBL_OutUser.Text = "";
        }
    }
}