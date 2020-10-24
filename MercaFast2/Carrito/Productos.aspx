<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Proyecto.carrito.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="../lib/estilo.css" rel="stylesheet" />
    <style type="text/css">
        
        .overlayone{ 
        margin:0px;
        text-align: center;
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 16px;
        padding: 0px;
        width: 250px;
        display: inline-block;
        position: relative;
        }

        /*/img{
            background-size: 100% 100%;
        }
        */
        .overlayinn {
        /*background-color: rgba(0, 0, 0, 0.6);*/
        width: 250px;
        height: 200px; 
        top: 0px; 

        opacity: 0; 
        position: absolute;
        padding: 20px; 
        transition: opacity .5s;
        text-align: center; 
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-size: 16px; 
        color:#ffffff; 
        }
            .overlayinn:hover {
                opacity: 1;
                transition: .5s;
                background-color: #008CBA;
            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <br />
    <br />
    <br />

    <div class="container">
        <asp:Panel ID="pnlDefaultButton" runat="server" DefaultButton="ButtonBuscar">
            <section>
                <div class="input-group mb-3">
                    <asp:TextBox ID="TextBoxBuscar" class="form-control" runat="server" Width="343px" placeholder="Buscar producto"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="ButtonBuscar" class="btn btn-success" runat="server" Text="Buscar" OnClick="Button2_Click" />
                    </div>
                </div>
            </section>
        </asp:Panel>
        <hr />
        <section>
            <h5>selecciona la categoria que este buscando</h5>
        </section>
        <section>
            <div class="col">
                <asp:Label ID="Label1" runat="server" Text="Comida" Style="font-size: 20px"></asp:Label>
                <asp:DropDownList ID="DropDownListComida" runat="server" class="btn btn-primary dropdown-toggle ml-2" AutoPostBack="true" OnSelectedIndexChanged="DropDownListComida_SelectedIndexChanged"></asp:DropDownList>
          
                <asp:Label ID="Label2" runat="server" Text="Aseo personal" class="ml-4" Style="font-size: 20px"></asp:Label>
                <asp:DropDownList ID="DropDownListAseo" runat="server" class="btn btn-primary dropdown-toggle ml-2" AutoPostBack="true" OnSelectedIndexChanged="DropDownListAseo_SelectedIndexChanged"></asp:DropDownList>

                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click2" class="btn btn-outline-info ml-4" Text="Mostrar todos" Width="146px" />

            </div>
        </section>

    </div>

    <br />
    <div class="container">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="overlayone">
                    <img src="data:image/jpg;base64,<%# Convert.ToBase64String((Byte[])DataBinder.Eval(Container.DataItem,"imagenProducto")) %>" width="250" height="200" />
                    <a href="productoSeleccionado.aspx?nP=<%# DataBinder.Eval(Container.DataItem,"nombreProducto").ToString()%>">
                        <div class="overlayinn">
                            <strong style="color: white">
                                <span style="font-size: 25px;"><%# DataBinder.Eval(Container.DataItem,"nombreProducto")%></span>
                                <br>
                                <span>Precio: <%# DataBinder.Eval(Container.DataItem,"precioProducto")%></span>
                                <br>
                                <span>Stock: <%# DataBinder.Eval(Container.DataItem,"Stock")%></span>
                                <br>
                                <span>Puntos: <%# DataBinder.Eval(Container.DataItem,"valorPuntos")%></span>
                            </strong>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="popup.js"></script>
</asp:Content>
