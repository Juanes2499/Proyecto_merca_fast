<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="productoSeleccionado.aspx.cs" Inherits="Proyecto.carrito.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 841px;
        }
        .auto-style2 {
            margin-top: 0px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 157px;
        }
        .auto-style6 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <div class="container">

        <section>
            <asp:Label ID="LabelFecha" runat="server" Text=" "></asp:Label>
        </section>
        
        <section class="row mt-5">
            <div class="col-md-6">
                <asp:Image ID="ImagePro" runat="server" Width="500px" class="img-fluid z-depth-1-half img-responsive"/>
            </div>

            <div class="col-md-6">
                <h1><asp:Label ID="LabelNombre" runat="server" Text="Nombre" Font-Bold="True" Font-Size="50px"></asp:Label></h1>
                <hr>
                <asp:Label ID="Label3" runat="server" Text="Descripción:" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <asp:Label ID="LabelDescripcion" runat="server" Text="Label"></asp:Label>

                <section>
                    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" Text="Precio: $"></asp:Label>
                    <asp:Label ID="LabelPrecio" runat="server" Text="Precio" Font-Size="X-Large"></asp:Label>
                </section>

                <section>
                    <asp:Label ID="Label2" runat="server" Text="Puntos:"></asp:Label>
                    <asp:Label ID="LabelPuntos" runat="server" Text="Label"></asp:Label>
                </section>

                <section>
                    <asp:Label ID="Label1" runat="server" Text="Cantidad seleccionada:"></asp:Label>
                    <asp:DropDownList ID="DropDownListstock" runat="server">
                    </asp:DropDownList>
                </section>

                <section>
                    <asp:Label ID="LabelNoDispo" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </section>

                <section>
                    <asp:Button ID="ButtonComprar" runat="server" class="btn btn-outline-success" Text="Añadir al carrito"  OnClick="ButtonComprar_Click" />
                    <asp:Button ID="BTN_GoLogin" runat="server" Text="Ir a a iniciar sesión" class="btn btn-outline-primary" PostBackUrl="~/Modulos/Login.aspx"  />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Atras" class="btn btn-outline-warning" />
                </section>
            </div>
        </section>
    </div>
</asp:Content>
