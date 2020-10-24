<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="CuentaCliente.aspx.cs" Inherits="MercaFast.Modulos.CuentaCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style type="text/css">
        .bg {
            background-image: url("/Imagenes/SupeClient2.jpg");
            height: 150%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .Backgroud {
            border: 5px solid #FFFFFF;
            background-color: #FFFFFF;
            opacity: 0.95;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <div class="bg">
        <br />
        <br />
        <br />
        <div class="container embed-responsive">
            <div class="container border border-light rounded-lg col-6 Backgroud">
                <div class="container embed-responsive">
                    <br />
                    <h2>Mi cuenta cliente</h2>
                    <img class="card-img-top" src="../Imagenes/img_avatar1.png" alt="Card image" style="width: 100%">
                    <br />
                    <br />
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Tipo de indentidad</span>
                        </div>
                        <asp:Label ID="LBL_OutTipoIden" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Número de indentidad</span>
                        </div>
                        <asp:Label ID="LBL_OutNumIden" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Nombres</span>
                        </div>
                        <asp:Label ID="LBL_OutNom" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Apellidos</span>
                        </div>
                        <asp:Label ID="LBL_OutApe" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Fecha de naciemiento</span>
                        </div>
                        <asp:Label ID="LBL_OutFecNac" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Celular</span>
                        </div>
                        <asp:Label ID="LBL_OutCelular" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Correo electrónico</span>
                        </div>
                        <asp:Label ID="LBL_OutMail" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Usuario</span>
                        </div>
                        <asp:Label ID="LBL_OutUser" runat="server" class="form-control"></asp:Label>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Puntos</span>
                        </div>
                        <asp:Label ID="LBL_OutPuntos" runat="server" class="form-control"></asp:Label>
                    </div>

                    <section class="align-items-center text-center">
                        <asp:Button ID="BTN_Carro" runat="server" class="btn btn-outline-success" Text="Carro" OnClick="BTN_Carro_Click" />
                        <asp:Button ID="BTN_Historial" runat="server" class="btn btn-outline-warning" Text="Historial" OnClick="BTN_Historial_Click" />
                        <asp:Button ID="BTN_CloseSession" runat="server" OnClick="BTN_CloseSession_Click" Text="Cerrar sesión" class="btn btn-outline-danger" />
                    </section>
                    <br />
                </div>
            </div>
        </div>
        <br />
        <br />
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="popup.js"></script>
</asp:Content>
