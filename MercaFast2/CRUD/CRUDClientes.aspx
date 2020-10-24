<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDClientes.aspx.cs" Inherits="MercaFast2.CRUD.CRUDClientes" %>
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
                color: #fff;
                background: #21618C url(grd_head.png) repeat-x top;
                border-left: solid 1px #21618C;
                font-size: 0.9em;
            }

            .mGrid .alt {
                background: #fcfcfc url(grd_alt.png) repeat-x top;
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

            if (contenido.length < 10) {
                Swal.fire('La contraseña no puede ser menor a 10 caracteres.');
            } else {
            }
        }

        function validarFormatoFecha()
        {
            var Ema = document.getElementById('<%=TXT_OutFechaNac.ClientID%>').value;
            var RegExPattern = /^\d{2}\/\d{2}\/\d{4}$/;
            if ((Ema.match(RegExPattern)) && (Ema != ''))
            {

            } else
            {
                Swal.fire('La fecha ingresada ' + Ema + ' es incorreta, por favor seguir formato dd/mm/aaaa ');
            }
        }
    </script>

    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <h1>Clientes de MercaFast</h1>
        <hr />
        <asp:Panel ID="pnlDefaultButton" runat="server" DefaultButton="Button1">
            <section>
                <div class="row">
                    <div class="input-group mb-3">
                        <asp:TextBox ID="TXT_Buscar" runat="server" Width="20%" class="form-control" placeholder="Buscar por correo electrónico"></asp:TextBox>
                        <div class="input-group-append">
                            <asp:Button ID="Button1" runat="server" class="btn btn-success" OnClick="Button1_Click" Text="Buscar" />
                        </div>
                    </div>
                </div>
            </section>
        </asp:Panel>
        <hr />

        <section>
            <asp:GridView ID="GridView1" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataKeyNames="correoCuenta" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="tipoDocumento" HeaderText="tipoDocumento" SortExpression="tipoDocumento" />
                    <asp:BoundField DataField="numDocIdentidad" HeaderText="numDocIdentidad" SortExpression="numDocIdentidad" />
                    <asp:BoundField DataField="nombreCuenta" HeaderText="nombreCuenta" SortExpression="nombreCuenta" />
                    <asp:BoundField DataField="apellidoCuenta" HeaderText="apellidoCuenta" SortExpression="apellidoCuenta" />
                    <asp:BoundField DataField="fechaNacimiento" HeaderText="fechaNacimiento" SortExpression="fechaNacimiento" />
                    <asp:BoundField DataField="celularUsu" HeaderText="celularUsu" SortExpression="celularUsu" />
                    <asp:BoundField DataField="correoCuenta" HeaderText="correoCuenta" ReadOnly="True" SortExpression="correoCuenta" />
                    <asp:BoundField DataField="nombreUsuario" HeaderText="nombreUsuario" SortExpression="nombreUsuario" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProyectoConnectionString2 %>" SelectCommand="SELECT tipoDocumento, numDocIdentidad, nombreCuenta, apellidoCuenta, fechaNacimiento, celularUsu, correoCuenta, nombreUsuario FROM CUENTA WHERE (esAdmin = 'N')"></asp:SqlDataSource>
        </section>
        <section>
            <asp:Button ID="Button2" runat="server" Text="Actualizar tabla" OnClick="Button2_Click" class="btn btn-primary"/>
        </section>

        <hr />

        <section class="row mt-5">
            <div class="col-md-6">
                <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl="~/Imagenes/Cliente.jpg" style="Width:100%;height:100%;"/>
            </div>

            <div class="col-md-6">
                <section>
                    <h1>Modificar datos</h1>
                    <hr />
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Tipo de indentidad</span>
                        </div>
                        <asp:Label ID="LBL_TipoId" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Numero de indentificación</span>
                        </div>
                        <asp:TextBox ID="TXT_OutNum" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Nombre</span>
                        </div>
                        <asp:TextBox ID="TXT_OutNombre" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return sololetras(event)" onpaste="return false"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Apellido</span>
                        </div>
                        <asp:TextBox ID="TXT_OutApellido" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return sololetras(event)" onpaste="return false"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Fecha de nacimiento</span>
                        </div>
                        <asp:TextBox ID="TXT_OutFechaNac" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onchange="validarFormatoFecha(this.value);"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Celular</span>
                        </div>
                        <asp:TextBox ID="TXT_OutTelefono" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Correo electrónico</span>
                        </div>
                        <asp:Label ID="LBL_OutMail" runat="server" class="form-control" ></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Usuario</span>
                        </div>
                        <asp:Label ID="LBL_OutUser" runat="server" class="form-control"></asp:Label>
                    </div>

                    <hr />

                    <div class="row">
                        <asp:DropDownList ID="DropDownList1" class="btn btn-primary dropdown-toggle ml-2" runat="server">
                            <asp:ListItem Value="Update">Actualizar cliente</asp:ListItem>
                            <asp:ListItem Value="Delete">Eliminar cliente</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="Ejecuctar" runat="server" class="btn btn-outline-success ml-2" Text="Ejecutar" OnClick="Ejecuctar_Click" />
                        <asp:Button ID="BTN_LimpiarCampos" class="btn btn-outline-warning ml-2" runat="server" Text="Limpiar campos" OnClick="BTN_LimpiarCampos_Click" />
                    </div>

                    <div class="row">
                        <asp:Label ID="LBL_Msg2" runat="server" style="color:red"></asp:Label>
                    </div>
                    <br />
                </section>
            </div>
        </section>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.18.3/dist/sweetalert2.all.min.js"></script>
    <script src="popup.js"></script>
</asp:Content>
