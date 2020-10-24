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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM SUB_CATEGORIA", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DropDownListCategoria.DataTextField = "nombreSubCategoria";
                    DropDownListCategoria.DataValueField = "nombreSubCategoria";                    
                    DropDownListCategoria.DataSource = rdr;
                    DropDownListCategoria.DataBind();
                }
            }

            if (!IsPostBack)
            {
                string CS = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM SUB_CATEGORIA", con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    DropDownListInCat.DataTextField = "nombreSubCategoria";
                    DropDownListInCat.DataValueField = "nombreSubCategoria";
                    DropDownListInCat.DataSource = rdr;
                    DropDownListInCat.DataBind();
                }
            }
        }

        protected void ButtonSubir_Click(object sender, EventArgs e)
        {
            ///////////
            try
            {
                string nombre, precio, stock, valorPuntos, subCat, descripcion;
                nombre = TXT_InNom.Text;
                precio = TXT_InPrecio.Text;
                stock = TXT_InStock.Text;
                valorPuntos = TXT_InPuntos.Text;
                subCat = DropDownListInCat.SelectedValue.ToString();
                descripcion = TXT_InDesc.Text;


                /////////////// Obtienes id de la sub_categoria

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


                /////////////////// Obtener datos de la imagen
                ///
                //int tamImagen = FileUploadImagen.PostedFile.ContentLength;
                //byte[] ImagenOriginal = new byte[tamImagen];

                //FileUploadImagen.PostedFile.InputStream.Read(ImagenOriginal, 0, tamImagen);
                //Bitmap ImaOrigiBinaria = new Bitmap(FileUploadImagen.PostedFile.InputStream);

                int sizeImage = FileUploadInProducto.PostedFile.ContentLength;
                byte[] originalImage = new byte[sizeImage];
                FileUploadInProducto.PostedFile.InputStream.Read(originalImage, 0, sizeImage);
                Bitmap binaryOriginalImage = new Bitmap(FileUploadInProducto.PostedFile.InputStream);

                var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

                var strSQL = "insert into PRODUCTO(nombreProducto, precioProducto, Stock, valorPuntos, idSubCategoriaF, imagenProducto, descripcionProduc) values('" + nombre + "','" + precio + "','" + stock + "','" + valorPuntos + "','" + idSubCat + "',@imagenProducto,'" + descripcion + "')";

                var cmd = new SqlCommand(strSQL, sqlConn);

                cmd.Parameters.Add("@imagenProducto", SqlDbType.Image).Value = originalImage;

                sqlConn.Open();
                cmd.ExecuteNonQuery();
                sqlConn.Close();



                string imgDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(originalImage);
                Session["imagenRecuperada"] = imgDataURL64;
                ImagePreviaIn.ImageUrl = imgDataURL64;
            }
            catch (System.ArgumentException)
            {
                LblMensaje.Text = "No puede haber campos vacios";
            }
        }
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            ////////////
            try
            {
                string nombre, precio, stock, valorPuntos, subCat, descripcion;
                var ID = TXT_OutID.Text;
                nombre = TextBoxNombre.Text;
                precio = TextBoxPrecio.Text;
                stock = TextBoxStock.Text;
                valorPuntos = TextBoxPuntos.Text;

                if (DropDownListCategoria.Visible == true)
                {
                    subCat = DropDownListCategoria.SelectedValue.ToString();
                }
                else
                {
                    subCat = Session["nomSubCatCRUD"].ToString();
                }

                descripcion = TextBoxDescrip.Text;

                /////////////// Obtienes id de la sub_categoria

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

                /////////////////// Obtener datos de la imagen

                if (FileUploadImagen.HasFile)
                {
                    int sizeImage = FileUploadImagen.PostedFile.ContentLength;
                    byte[] originalImage = new byte[sizeImage];
                    FileUploadImagen.PostedFile.InputStream.Read(originalImage, 0, sizeImage);
                    Bitmap binaryOriginalImage = new Bitmap(FileUploadImagen.PostedFile.InputStream);

                    var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);


                    var strSQL = "UPDATE PRODUCTO SET nombreProducto= '" + nombre + "', precioProducto= '" + precio + "', Stock='" + stock + "', valorPuntos='" + valorPuntos + "', idSubCategoriaF='" + idSubCat + "',  imagenProducto=@imagenProducto, descripcionProduc='" + descripcion + "' WHERE idProducto=" + "'" + ID + "'";

                    var cmd = new SqlCommand(strSQL, sqlConn);

                    cmd.Parameters.Add("@imagenProducto", SqlDbType.Image).Value = originalImage;

                    sqlConn.Open();
                    cmd.ExecuteNonQuery();
                    sqlConn.Close();

                    string imgDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(originalImage);
                    ImagePrevia.ImageUrl = imgDataURL64;
                }
                else
                {
                    var sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);


                    var strSQL = "UPDATE PRODUCTO SET nombreProducto= '" + nombre + "', precioProducto= '" + precio + "', Stock='" + stock + "', valorPuntos='" + valorPuntos + "', idSubCategoriaF='" + idSubCat + "', descripcionProduc='" + descripcion + "' WHERE idProducto=" + "'" + ID + "'";

                    var cmd = new SqlCommand(strSQL, sqlConn);


                    sqlConn.Open();
                    cmd.ExecuteNonQuery();
                    sqlConn.Close();
                }



                TextBoxCategoriaActual.Visible = true;
                DropDownListCategoria.Visible = false;
            }catch (System.NullReferenceException)
            {
                LBL_Msg2.Text = "Se debe seleccionar un producto para poder ejectur una actualización del producto";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //kpmg
            string nombreSubCat, idSubCat;
            TextBoxDescrip.Text = "";
            GridViewRow gr = GridView1.SelectedRow;
            var ID = gr.Cells[1].Text;
            TXT_OutID.Text = gr.Cells[1].Text;
            TextBoxNombre.Text = gr.Cells[2].Text;
            TextBoxPrecio.Text = gr.Cells[3].Text;
            TextBoxStock.Text = gr.Cells[4].Text;
            TextBoxPuntos.Text = gr.Cells[5].Text;
            idSubCat = gr.Cells[6].Text;
            TextBoxDescrip.Text = gr.Cells[7].Text;

            /////////////// Consultar el nombre de la subCategoria

            var sqlConnSC = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var cmdSC = new SqlCommand();
            cmdSC.CommandText = "select nombreSubCategoria from SUB_CATEGORIA WHERE idSubCategoria =" + "'" + idSubCat + "'";
            cmdSC.CommandType = CommandType.Text;
            cmdSC.Connection = sqlConnSC;

            var dsSC = new DataSet();
            var daSC = new SqlDataAdapter(cmdSC);

            sqlConnSC.Open();
            daSC.Fill(dsSC, "PRODUCTO");
            sqlConnSC.Close();

            var dtSC = dsSC.Tables[0];
            nombreSubCat = dtSC.Rows[0][0].ToString();
            Session["nomSubCatCRUD"] = nombreSubCat;
            TextBoxCategoriaActual.Text = nombreSubCat;

            ////////////////  Consultar la imagen del producto seleccionado
            var sqlConn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);

            var cmd2 = new SqlCommand();
            cmd2.CommandText = "select imagenProducto from PRODUCTO WHERE idProducto =" + "'" + ID + "'";
            cmd2.CommandType = CommandType.Text;
            cmd2.Connection = sqlConn2;

            var ds2 = new DataSet();
            var da2 = new SqlDataAdapter(cmd2);

            sqlConn2.Open();
            da2.Fill(ds2, "PRODUCTO");
            sqlConn2.Close();

            var dt2 = ds2.Tables[0];
            byte[] imagen = (byte[]) dt2.Rows[0][0];

            string imgDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(imagen);
            ImagePrevia.ImageUrl = imgDataURL64;
        }

        protected void BTN_Delete_Click(object sender, EventArgs e)
        {
            try
            {
                var ID = TXT_OutID.Text;

                var SqlCnnCar = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                var StrSQLDeleteCar = "DELETE FROM CARRITO WHERE idProductoF=" + "'" + ID + "'";
                var CmdDeleteCar = new SqlCommand(StrSQLDeleteCar, SqlCnnCar);

                SqlCnnCar.Open();
                CmdDeleteCar.ExecuteNonQuery();
                SqlCnnCar.Close();

                var SqlCnn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString);
                var StrSQLDelete = "DELETE FROM PRODUCTO WHERE idProducto=" + "'" + ID + "'";
                var CmdDelete = new SqlCommand(StrSQLDelete, SqlCnn);

                SqlCnn.Open();
                CmdDelete.ExecuteNonQuery();
                SqlCnn.Close();
            }
            catch (System.Data.SqlClient.SqlException)
            {
                LBL_Msg2.Text= "Se debe seleccionar un producto para poder eliminar alguno";
            }
        }


        protected void BTN_UpTable_Click(object sender, EventArgs e)
        {
            string InBuscarNom = TXT_Buscar.Text;
            if (InBuscarNom.Trim() == "")
            {
                SqlDataSource1.SelectCommand = "SELECT idProducto, nombreProducto, precioProducto, Stock, valorPuntos, idSubCategoriaF, descripcionProduc FROM PRODUCTO";
            }
            else
            {
                TXT_Buscar.Text = "";
                SqlDataSource1.SelectCommand = "SELECT idProducto, nombreProducto, precioProducto, Stock, valorPuntos, idSubCategoriaF, descripcionProduc FROM PRODUCTO";
            }
        }

        protected void BTN_Buscar_Click1(object sender, EventArgs e)
        {
            string Buscar = TXT_Buscar.Text;
            if (Buscar.Trim() == "")
            {
                SqlDataSource1.SelectCommand = "SELECT idProducto, nombreProducto, precioProducto, Stock, valorPuntos, idSubCategoriaF, descripcionProduc FROM PRODUCTO";
                SqlDataSource1.DataBind();
            }
            else
            {
                SqlDataSource1.SelectCommand = "SELECT [idProducto], [nombreProducto], [precioProducto], [Stock], [valorPuntos], [idSubCategoriaF], [descripcionProduc] FROM [PRODUCTO] WHERE nombreProducto LIKE '%" + Buscar + "%'";
                SqlDataSource1.DataBind();
            }
        }

        protected void BoT_CamCat_Click(object sender, EventArgs e)
        {
            TextBoxCategoriaActual.Visible = false;
            DropDownListCategoria.Visible = true;
        }

        protected void BTN_LimpiarCampos_Click(object sender, EventArgs e)
        {
            TextBoxNombre.Text = "";
            TextBoxPrecio.Text = "";
            TextBoxStock.Text = "";
            TextBoxPuntos.Text = "";
            TextBoxDescrip.Text = "";
        }

        protected void BTN_LimpiarCamposIn_Click(object sender, EventArgs e)
        {
            TXT_InNom.Text = "";
            TXT_InPrecio.Text = "";
            TXT_InStock.Text = "";
            TXT_InPuntos.Text  = "";
            TXT_InDesc.Text  = "";
        }
    }
}