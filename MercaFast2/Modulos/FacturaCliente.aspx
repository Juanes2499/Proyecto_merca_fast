<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="FacturaCliente.aspx.cs" Inherits="MercaFast2.Modulos.FacturaCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@8.18.3/dist/sweetalert2.all.min.js">


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
    <br />
    <br />
    <br />
    <br />
    <div class="container">
        <h1>Mis facturas</h1>
        <hr />
        <asp:Panel id="pnlDefaultButton" runat="server" DefaultButton="BTN_Buscar">
         <section>
            <div class="row">
                <div class="input-group mb-3">
                    <asp:TextBox ID="TXT_Busc"  runat="server" class="form-control" placeholder="Buscar por fecha de facturación"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="BTN_Buscar" runat="server" Text="Buscar" class="btn btn-success" OnClick="BTN_Buscar_Click" />
                    </div>
                </div>
            </div>
         </section>
        </asp:Panel>
        <hr />
        <section>
            <asp:GridView ID="GridView1" runat="server" CssClass="mGrid"></asp:GridView>
        </section>
        <section>
            <asp:Button ID="BTN_Actualizar" runat="server" Text="Actualizar tabla"  class="btn btn-warning"/>
        </section>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.18.3/dist/sweetalert2.all.min.js"></script>
    <script src="popup.js"></script>
</asp:Content>
