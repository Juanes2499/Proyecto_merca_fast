<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="crearProducto.aspx.cs" Inherits="Proyecto.carrito.WebForm2" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link  rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@8.18.3/dist/sweetalert2.all.min.js">
    <style type="text/css">

        .mGrid {
            width: 100%;
            background-color: #fff;
            margin: 5px 0 10px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
        }

            .mGrid td {
                padding: 2px;
                border: solid 1px #fff;
                color: #717171;
            }

            .mGrid th { /*parte superior*/
                padding: 4px 2px;
                color: #FFFFFF;
                background: #21618C url(grd_head.png) repeat-x top;
                border-left: solid 1px #21618C;
                font-size: 0.9em;
            }

            .mGrid .alt {
                background: #FCFCFC url(grd_alt.png) repeat-x top;
            }

            .mGrid .pgr {
                background: #21618C url(grd_pgr.png) repeat-x top;
            }

                .mGrid .pgr table {
                    margin: 5px 0;
                }

                .mGrid .pgr td {
                    border-width: 0;
                    padding: 0 6px;
                    border-left: solid 1px #666;
                    font-weight: bold;
                    color: #666;
                    line-height: 12px;
                }

                .mGrid .pgr a {
                    color: #666;
                    text-decoration: none;
                }

                    .mGrid .pgr a:hover {
                        color: #000;
                        text-decoration: none;
                    }

        
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <script type="text/javascript">
        function sololetras(e) {
            key = e.keyCode || e.which;

            teclado = String.fromCharCode(key).toLowerCase();

            letras = "áéíóúqwertyuiopasdfghjklñzxcvbnm ";

            especiales = "8-37-38-46-164";

            teclado_especial = false;

            for (var i in especiales) {
                if (key == especiales[i]) {
                    teclado_especial = true;
                    break;
                }
            }

            if (letras.indexOf(teclado) == -1 && !teclado_especial) {
                Swal.fire("Solo se puede ingresar letras");
                return false;
            }
        }

        function SoloNumero(e) {
            key = e.keyCode || e.which;

            teclado = String.fromCharCode(key).toLowerCase();

            letras = "1234567890.";

            especiales = "8-37-38-46-164";

            teclado_especial = false;

            for (var i in especiales) {
                if (key == especiales[i]) {
                    teclado_especial = true;
                    break;
                }
            }

            if (letras.indexOf(teclado) == -1 && !teclado_especial) {
                Swal.fire("Solo se puede ingrear números");
                return false;
            }
        }

        function ValidarDescripcion(Value) {
            var contenido = Value;

            if (contenido.length > 150) {
                Swal.fire('La descripción no puede tener mas de 150 caracteres.');
            } else {
            }
        }
    </script>

    <br />
    <br />
    <br />
    <div class="container">
        <h1>Productos MercaFast</h1>
        <hr />
        <asp:Panel ID="pnlDefaultButton" runat="server" DefaultButton="BTN_Buscar">
            <section>
                <div class="input-group mb-3">
                    <asp:TextBox ID="TXT_Buscar" runat="server" class="form-control" placeholder="Buscar por nombre"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="BTN_Buscar" runat="server" Text="Buscar" class="btn btn-success" OnClick="BTN_Buscar_Click1" />
                    </div>
                </div>
            </section>
        </asp:Panel>
        <hr />
        <section>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="mGrid" DataKeyNames="idProducto" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="idProducto" HeaderText="idProducto" ReadOnly="True" SortExpression="idProducto" />
                    <asp:BoundField DataField="nombreProducto" HeaderText="nombreProducto" SortExpression="nombreProducto" />
                    <asp:BoundField DataField="precioProducto" HeaderText="precioProducto" SortExpression="precioProducto" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                    <asp:BoundField DataField="valorPuntos" HeaderText="valorPuntos" SortExpression="valorPuntos" />
                    <asp:BoundField DataField="idSubCategoriaF" HeaderText="idSubCategoriaF" SortExpression="idSubCategoriaF" />
                    <asp:BoundField DataField="descripcionProduc" HeaderText="descripcionProduc" SortExpression="descripcionProduc" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoConnectionString %>" SelectCommand="SELECT [idProducto], [nombreProducto], [precioProducto], [Stock], [valorPuntos], [idSubCategoriaF], [descripcionProduc] FROM [PRODUCTO]"></asp:SqlDataSource>
            <asp:Button ID="BTN_UpTable" runat="server" OnClick="BTN_UpTable_Click" Text="Actualizar tabla" class="btn btn-primary" />
        </section>

        <hr />

        <section class="row mt-5">
            <div class="col-md-6">
                <asp:Image ID="ImagePrevia" runat="server" CssClass="Icono" ImageUrl="~/Iconos/Efectivo.png" Width="100%" />
            </div>

            <div class="col-md-6">
                <section>
                    <h1>Modificar datos del producto</h1>
                    <hr/>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">ID. Producto</span>
                        </div>
                        <asp:TextBox ID="TXT_OutID" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Nombre</span>
                        </div>
                        <asp:TextBox ID="TextBoxNombre" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return sololetras(event)" onpaste="return false"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Precio</span>
                        </div>
                        <asp:TextBox ID="TextBoxPrecio" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Stock</span>
                        </div>
                        <asp:TextBox ID="TextBoxStock" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Puntos producto</span>
                        </div>
                        <asp:TextBox ID="TextBoxPuntos" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True"  onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Categoria</span>
                        <asp:TextBox ID="TextBoxCategoriaActual" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True"  onkeypress="return SoloNumero(event)" onpaste="return false" ReadOnly="True"></asp:TextBox>
                        </div>
                        <asp:DropDownList ID="DropDownListCategoria" runat="server" Visible="False">
                        </asp:DropDownList>
                        <asp:Button ID="BoT_CamCat" runat="server" Text="Cambiar categoria" class="btn btn-outline-warning" OnClick="BoT_CamCat_Click" />
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Subir imagen</span>
                        </div>
                        <asp:FileUpload ID="FileUploadImagen" accept=".jpg" runat="server" class="form-control"/>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Descripción</span>
                        </div>
                        <asp:TextBox ID="TextBoxDescrip" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onchange="ValidarDescripcion(this.value);"></asp:TextBox>
                    </div>

                    <hr />

                    <div>
                        <asp:Button ID="Button3" runat="server" OnClick="Button1_Click" Text="Actualizar" class="btn btn-outline-warning" />
                        <asp:Button ID="Button4" runat="server" OnClick="BTN_Delete_Click" Text="Eliminar" class="btn btn-outline-danger" />
                        <asp:Button ID="BTN_LimpiarCampos" runat="server" Text="Limpiar campos" class="btn btn-outline-primary" OnClick="BTN_LimpiarCampos_Click" />
                    </div>

                    <div class="row">
                        <asp:Label ID="LBL_Msg2" runat="server" Style="color: red"></asp:Label>
                    </div>
                    <br />
                </section>
            </div>
        </section>



        <section class="row mt-5">
            <h2 class="text-center">¡Registra un nuevo producto aquí!</h2>
            <div class="container ">
                <div class="text-center">
                    <button class="btn btn-primary btn-block" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">Registra un nuevo producto</button>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="container">
                            <div class="collapse multi-collapse" id="multiCollapseExample1">
                                <section class="row mt-5">
                                    <div class="col-md-6">
                                        <div class="container">
                                            <div class="modal-body">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Nombre</span>
                                                    </div>
                                                    <asp:TextBox ID="TXT_InNom" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return sololetras(event)" onpaste="return false"></asp:TextBox>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Precio</span>
                                                    </div>
                                                    <asp:TextBox ID="TXT_InPrecio" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Stock</span>
                                                    </div>
                                                    <asp:TextBox ID="TXT_InStock" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Puntos producto</span>
                                                    </div>
                                                    <asp:TextBox ID="TXT_InPuntos" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Categoria</span>   
                                                    </div>
                                                    <asp:DropDownList ID="DropDownListInCat" runat="server" Visible="true">
                                                    </asp:DropDownList>
                                                </div>

                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Subir imagen</span>
                                                    </div>
                                                    <asp:FileUpload ID="FileUploadInProducto" accept=".jpg" runat="server" class="form-control" />
                                                </div>

                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text">Descripción</span>
                                                    </div>
                                                    <asp:TextBox ID="TXT_InDesc" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onchange="ValidarDescripcion(this.value);"></asp:TextBox>
                                                </div>
                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <asp:Button ID="Button2" runat="server" Text="Agregar" OnClick="ButtonSubir_Click" class="btn btn-outline-success" />
                                                <asp:Button ID="BTN_LimpiarCamposIn" runat="server" Text="Limpiar campos" class="btn btn-outline-primary" OnClick="BTN_LimpiarCamposIn_Click" />
                                            </div>
                                            <div>
                                                <asp:Label ID="LblMensaje" runat="server" ForeColor="Red"></asp:Label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <asp:Image ID="ImagePreviaIn" runat="server" CssClass="Icono" ImageUrl="~/Iconos/Efectivo.png" Width="100%" />
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.18.3/dist/sweetalert2.all.min.js"></script>
    <script src="popup.js"></script>
</asp:Content>
