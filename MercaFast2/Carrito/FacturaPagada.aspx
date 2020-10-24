<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="FacturaPagada.aspx.cs" Inherits="Proyecto.carrito.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .header {
            background: url(../Imagenes/FacturaFInal.jpg) no-repeat center;
            background-size: cover;           
            min-height: 100vh;
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
    <div>
        <div class="container">
            <section>
                <div class="row">
                    <h1>Tu factura</h1>
                </div>

                <div class="row">
                    <asp:Label ID="Label1" runat="server" Text="Factura No. "></asp:Label>
                    <asp:Label ID="LabelFactura" runat="server"></asp:Label>
                </div>

                <div class="row">
                    <asp:Label ID="Label2" runat="server" Text="Fecha de la Factura: "></asp:Label>
                    <asp:Label ID="LabelFechaFac" runat="server"></asp:Label>
                </div>

                <div class="row">
                    <h1>----------------------------------------------------------------------</h1>
                </div>

                <div class="row">
                    <h3>Datos Personales</h3>
                </div>
                <div class="row">
                    <asp:Label ID="Label3" runat="server" Text="Numero de identificación: "></asp:Label>
                    <asp:Label ID="Lbl_NumID" runat="server"></asp:Label>
                </div>

                <div class="row">
                    <asp:Label ID="Label4" runat="server" Text="Nombre: "></asp:Label>
                    <asp:Label ID="Lbl_Nom" runat="server"></asp:Label>
                </div>

                <div class="row">
                    <asp:Label ID="Label6" runat="server" Text="Apellido: "></asp:Label>
                    <asp:Label ID="Lbl_Ape" runat="server"></asp:Label>
                </div>

                <div class="row">
                    <asp:Label ID="Label8" runat="server" Text="Celular: "></asp:Label>
                    <asp:Label ID="Lbl_Cel" runat="server"></asp:Label>
                </div>

                <div class="row">
                    <asp:Label ID="Label10" runat="server" Text="Ciudad: "></asp:Label>
                    <asp:Label ID="Lbl_Ciudad" runat="server"></asp:Label>
                </div>

                <div class="row">
                    <asp:Label ID="Label12" runat="server" Text="Dirección: "></asp:Label>
                    <asp:Label ID="Lbl_Dir" runat="server"></asp:Label>
                </div>
               

                <div class="row">
                    <h1>----------------------------------------------------------------------</h1>
                </div>

                <div class="row">
                    <h3>Productos comprados</h3>
                </div>

                <div class="row">
                    <asp:GridView ID="GridViewFactura" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="613px" CssClass="mGrid">
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

                <div class="row">
                    <h1>----------------------------------------------------------------------</h1>
                </div>

                 <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Finalizar compra" class="btn btn-outline-success" />
            </section>
        </div>
    </div>
</asp:Content>
