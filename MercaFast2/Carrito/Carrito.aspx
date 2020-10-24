<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Proyecto.carrito.Carrito" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <style type="text/css">
        .abs-center {
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: center;
        }

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

    <br />
    <br />
    <br />
    <br />
    <br />

    <div class="container">
        <section>
            <div class="abs-center">
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Imagenes/Logo.png" Width="10%" />
            </div>
        </section>

        <br />

        <section>
            <div class="abs-center">
                <asp:GridView ID="GridViewProductos" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="607px" CssClass="mGrid">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
        </section>
        <hr />

        <section>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Seguir comprando" class="btn btn-outline-warning" />
            <asp:Button ID="BTN_Eliminar" runat="server" Text="Eliminar carrito" class="btn btn-outline-danger" OnClick="BTN_Eliminar_Click"/>
        </section>

        <section>
            <div class="row mt-5">
                <div class="col-md-10">
                    <div class="row">
                        <h2>Selecciona tu metodo de pago</h2>
                    </div>
                    <div class="row">
                       <asp:Label ID="LabelParala" runat="server" Text="Para realizar esta compra con puntos necesitas:_"></asp:Label> <asp:Label ID="LabelPuntosNece" runat="server"></asp:Label> <asp:Label ID="LabelTienes" runat="server" Text=" p y cuentas con:_ "></asp:Label>  <asp:Label ID="LabelPuntosActuales" runat="server"></asp:Label>
                    </div>
                    <div class="row">
                        <asp:RadioButtonList ID="RadioButtonMetodo" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="<img src='../Iconos/Efectivo.png'  Width='100px'/>" Value="Efectivo"/>
                            <asp:ListItem Text="<img src='../Iconos/PSE.png'  Width='100px'/>" Value="PSE"/>
                            <asp:ListItem Text="<img src='../Iconos/Visa.png'  Width='120px'/>" Value="VISA"/>
                            <asp:ListItem Text="<img src='../Iconos/MasterCard.png'  Width='100px'/>" Value="MasterCard"/>
                            <asp:ListItem Text="<img src='../Imagenes/Puntos2.png'  Width='100px'/>" Value="Puntos"/>
                        </asp:RadioButtonList>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="row">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Iva</span>
                            </div>
                            <asp:TextBox ID="TXT_Iva" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Puntos</span>
                            </div>
                            <asp:TextBox ID="Txt_Puntos" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Total a pagar</span>
                            </div>
                            <asp:TextBox ID="Txt_TotPa" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" ReadOnly="True"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <hr />

        <section>
            <div class="row">
                <h2>Tus datos personales</h2>
            </div>
            <div class="row">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Numero de indentidad</span>
                    </div>
                    <asp:TextBox ID="Txt_NumId" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True"></asp:TextBox>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Nombre</span>
                    </div>
                    <asp:TextBox ID="Txt_Nom" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" ReadOnly="False"></asp:TextBox>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Apellido</span>
                    </div>
                    <asp:TextBox ID="Txt_Ape" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" ReadOnly="False"></asp:TextBox>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Celular</span>
                    </div>
                    <asp:TextBox ID="Txt_Cel" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" ReadOnly="False"></asp:TextBox>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Ciudad</span>
                    </div>
                    <asp:TextBox ID="Txt_Ciudad" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" ReadOnly="False"></asp:TextBox>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Dirección</span>
                    </div>
                    <asp:TextBox ID="Txt_Dir" runat="server" class="form-control" aria-label="Amount (to the nearest dollar)" Enabled="True" ReadOnly="False"></asp:TextBox>
                </div>
            </div>
        </section>
        <hr />
        <section>
            <div class="row">
                <h5>Antes de finalizar verifica que tus datos sean los correctos</h5>
            </div>
            <div class="row">
                <asp:Label ID="Lbl_msg" runat="server" ForeColor="Red"></asp:Label>
            </div>
            <div class="row">
                
                <asp:Button ID="Button1" runat="server" Text="Finalizar compra" OnClick="Button1_Click" class="btn btn-outline-success ml-2" />
            </div>
        </section>

    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

</asp:Content>
