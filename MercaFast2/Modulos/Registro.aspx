<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="MercaFast.Modulos.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .Backgroud {
            background-color: #FFFFFF;
            border: 5px solid #009BDB;
            border-radius: 20px 20px 20px 20px;
            width: 40%;
            height: 20%;
            margin: 15% auto auto auto;
        }

        .TextBox {
            background-color: #BEDCE8;
            border-radius: 5px 5px 5px 5px;
            border: 1px solid #BEDCE8;
            width: 80%;
            height: 70%;
            font-family: Arial, serif;
            font-size: 20px;
            color: #009BDB;
        }

        .Titulo {
            margin-left: 35%;
            font-family: Arial, serif;
            font-size: 50px;
            font-weight: bold;
            color: #009BDB;
        }

        .Texto1 {
            margin-left: 15%;
            font-family: Arial, serif;
            font-size: 20px;
            color: #009BDB;
        }

        .Texto2 {
            margin-left: 35%;
            font-family: Britannic, serif;
            font-size: 20px;
            font-weight: bold;
            color: #21618C;
        }

        .button {
            margin-left: 40%;
            font-family: Arial,serif;
            color: #FFFFFF;
            font-size: 20px;
            border-radius: 20px 20px 20px 20px;
            padding: 5px 7px;
            background: #009BDB;
            border-style: none;
            width: 20%;
            height: 10%;
        }

        .auto-style1 {
            width: 254px;
        }

        .auto-style2 {
            margin-left: 21px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table class="w-100">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <table class="Backgroud"> 
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label1" runat="server" Text="Tipo de documento" CssClass="Texto1"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDL_TipoDoc" runat="server" CssClass="auto-style2">
                                <asp:ListItem Value="CCN">Cédula nacional</asp:ListItem>
                                <asp:ListItem Value="CCE">Cédula extranjera</asp:ListItem>
                                <asp:ListItem Value="PSP">Pasaporte</asp:ListItem>
                                <asp:ListItem Value="NT">Nit</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text="Número de identidad" CssClass="Texto1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TXT_InNumDoc" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label3" runat="server" Text="Nombres" CssClass="Texto1"></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="TXT_InNombres" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label4" runat="server" Text="Apellidos" CssClass="Texto1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TXT_InApellidos" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label5" runat="server" Text="Fecha de nacimiento" CssClass="Texto1"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DDL_Dia" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem Value="13">13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                                <asp:ListItem>31</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDL_Mes" runat="server">
                                <asp:ListItem Value="01">Enerro</asp:ListItem>
                                <asp:ListItem Value="02">Febrero</asp:ListItem>
                                <asp:ListItem Value="03">Marzo</asp:ListItem>
                                <asp:ListItem Value="04">Abril</asp:ListItem>
                                <asp:ListItem Value="05">Mayo</asp:ListItem>
                                <asp:ListItem Value="06">Junio</asp:ListItem>
                                <asp:ListItem Value="07">Julio</asp:ListItem>
                                <asp:ListItem Value="08">Agosto</asp:ListItem>
                                <asp:ListItem Value="09">Septiembre</asp:ListItem>
                                <asp:ListItem Value="10">Octubre</asp:ListItem>
                                <asp:ListItem Value="11">Noviembre</asp:ListItem>
                                <asp:ListItem Value="12">Diciembre</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="DDL_Año" runat="server">
                                <asp:ListItem>1950</asp:ListItem>
                                <asp:ListItem>1951</asp:ListItem>
                                <asp:ListItem>1952</asp:ListItem>
                                <asp:ListItem>1953</asp:ListItem>
                                <asp:ListItem>1954</asp:ListItem>
                                <asp:ListItem>1955</asp:ListItem>
                                <asp:ListItem>1956</asp:ListItem>
                                <asp:ListItem>1957</asp:ListItem>
                                <asp:ListItem>1958</asp:ListItem>
                                <asp:ListItem>1959</asp:ListItem>
                                <asp:ListItem>1960</asp:ListItem>
                                <asp:ListItem>1961</asp:ListItem>
                                <asp:ListItem>1962</asp:ListItem>
                                <asp:ListItem>1963</asp:ListItem>
                                <asp:ListItem>1964</asp:ListItem>
                                <asp:ListItem>1565</asp:ListItem>
                                <asp:ListItem>1966</asp:ListItem>
                                <asp:ListItem>1967</asp:ListItem>
                                <asp:ListItem>1968</asp:ListItem>
                                <asp:ListItem>1969</asp:ListItem>
                                <asp:ListItem>1970</asp:ListItem>
                                <asp:ListItem>1971</asp:ListItem>
                                <asp:ListItem>1972</asp:ListItem>
                                <asp:ListItem>1973</asp:ListItem>
                                <asp:ListItem>1974</asp:ListItem>
                                <asp:ListItem>1975</asp:ListItem>
                                <asp:ListItem>1976</asp:ListItem>
                                <asp:ListItem>1977</asp:ListItem>
                                <asp:ListItem>1978</asp:ListItem>
                                <asp:ListItem>1979</asp:ListItem>
                                <asp:ListItem>1980</asp:ListItem>
                                <asp:ListItem>1981</asp:ListItem>
                                <asp:ListItem>1982</asp:ListItem>
                                <asp:ListItem>1983</asp:ListItem>
                                <asp:ListItem>1984</asp:ListItem>
                                <asp:ListItem>1985</asp:ListItem>
                                <asp:ListItem>1986</asp:ListItem>
                                <asp:ListItem>1987</asp:ListItem>
                                <asp:ListItem>1988</asp:ListItem>
                                <asp:ListItem>1989</asp:ListItem>
                                <asp:ListItem>1990</asp:ListItem>
                                <asp:ListItem>1991</asp:ListItem>
                                <asp:ListItem>1992</asp:ListItem>
                                <asp:ListItem>1993</asp:ListItem>
                                <asp:ListItem>1994</asp:ListItem>
                                <asp:ListItem>1995</asp:ListItem>
                                <asp:ListItem>1996</asp:ListItem>
                                <asp:ListItem>1997</asp:ListItem>
                                <asp:ListItem>1998</asp:ListItem>
                                <asp:ListItem>1999</asp:ListItem>
                                <asp:ListItem>2000</asp:ListItem>
                                <asp:ListItem>2001</asp:ListItem>
                                <asp:ListItem>2002</asp:ListItem>
                                <asp:ListItem>2003</asp:ListItem>
                                <asp:ListItem>2004</asp:ListItem>
                                <asp:ListItem>2005</asp:ListItem>
                                <asp:ListItem>2006</asp:ListItem>
                                <asp:ListItem>2007</asp:ListItem>
                                <asp:ListItem>2008</asp:ListItem>
                                <asp:ListItem>2009</asp:ListItem>
                                <asp:ListItem>2010</asp:ListItem>
                                <asp:ListItem>2011</asp:ListItem>
                                <asp:ListItem>2012</asp:ListItem>
                                <asp:ListItem>2013</asp:ListItem>
                                <asp:ListItem>2014</asp:ListItem>
                                <asp:ListItem>2015</asp:ListItem>
                                <asp:ListItem>2016</asp:ListItem>
                                <asp:ListItem>2017</asp:ListItem>
                                <asp:ListItem>2018</asp:ListItem>
                                <asp:ListItem>2019</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label6" runat="server" Text="Celular" CssClass="Texto1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TXT_InCelular" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label7" runat="server" Text="Correo electrónico" CssClass="Texto1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TXT_InMail" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label8" runat="server" Text="Usuario" CssClass="Texto1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TXT_InUser" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label9" runat="server" Text="Contraseña" CssClass="Texto1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TXT_InPass" runat="server" CssClass="TextBox"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" Text="Registrarse" OnClick="Button1_Click" CssClass="button" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="LBL_Msg" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>



</asp:Content>
