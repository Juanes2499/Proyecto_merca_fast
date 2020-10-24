<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MercaFast.Modulos.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--   	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600|Open+Sans" rel="stylesheet"> 
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
	<link rel="stylesheet" href="estilos.css">--%>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link  rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@8.18.3/dist/sweetalert2.all.min.js">

    <style type="text/css">
        .abs-center {
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: center;
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

        function ValidacionEmail() {

            var Ema = document.getElementById('<%=TXT_InMail.ClientID%>').value;

            Em = Ema.toLowerCase()
            re = /^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/

            if (!re.exec(Em)) {
                Swal.fire(" El Email: " + Em + " NO es valido");
            }
        }

        function ValidarContraseña(Value) {
            var contenido = Value;

            if (contenido.length < 5) {
                Swal.fire('La contraseña no puede ser menor a 5 caracteres.');
            } else {
            }
        }

        function ValidacionUser() {
            var U1 = document.getElementById('<%=TXT_InUser.ClientID%>').value;

            if (U1.indexOf(' ') > -1) {
                Swal.fire("Hay espacio vacios en el usuario, no puede haber espacios")
            } else {
            }
        }
    </script>


    <br />
    <br />
    <br />
    <div class="container">
        <asp:Panel ID="pnlDefaultButton" runat="server" DefaultButton="BTN_Ingresar">
            <section class="row mt-5">
                <div class="col-md-6">
                    <div class="container">
                        <img style="width: 100%; height: 130%;" src="../Imagenes/supermercado.png" />
                    </div>
                </div>

                <div class="col-md-6">
                    <section>
                        <div class="container">
                            <h1>Iniciar sesión</h1>
                            <h4>Te lo llevamos hasta tu puerta</h4>
                            <br />
                            <div class="row">
                                <asp:Label ID="Label1" runat="server" Text="Usuario o Correo electrónico"></asp:Label>
                                <asp:TextBox ID="TXT_User" class="form-control" runat="server"></asp:TextBox>
                            </div>

                            <br />

                            <div class="row">
                                <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                                <asp:TextBox ID="TXT_Pass" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </div>

                            <br />

                            <div class="row">
                                <asp:Label ID="LBL_Msg" runat="server" ForeColor="Red"></asp:Label>
                                <asp:Button ID="BTN_Ingresar" runat="server" Text="Ingresar" class="btn btn-primary btn-block" OnClick="BTN_Ingresar_Click" />
                            </div>
                        </div>
                    </section>
                </div>
            </section>
        </asp:Panel>
        <br />
        <br />
        <br />
        <br />

        <section class="row mt-5">
            <h1 class="abs-center">¿Quieres ser parte de nuestra familia?</h1>
            <div class="container ">
                <div class="text-center">
                    <button class="btn btn-primary btn-block" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">Registrate</button>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="container">
                            <div class="collapse multi-collapse" id="multiCollapseExample1">
                                <section class="row mt-5">
                                    <div class="col-md-6">
                                        <div class="container">
                                            <div class="modal-body">
                                                <a style="color: grey">Tipo de documentos: </a>
                                                <asp:DropDownList ID="DDL_TipoDoc" runat="server" CssClass="auto-style2">
                                                    <asp:ListItem Value="CCN">Cédula nacional</asp:ListItem>
                                                    <asp:ListItem Value="CCE">Cédula extranjera</asp:ListItem>
                                                    <asp:ListItem Value="PSP">Pasaporte</asp:ListItem>
                                                    <asp:ListItem Value="NT">Nit</asp:ListItem>
                                                </asp:DropDownList>
                                                <br>
                                                <br>
                                                <asp:TextBox ID="TXT_InNumDoc" runat="server" placeholder="Número de identidad" class="form-control" onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                                                <br>
                                                <asp:TextBox ID="TXT_InNombres" runat="server" placeholder="Nombre" class="form-control" onkeypress="return sololetras(event)" onpaste="return false"></asp:TextBox>
                                                <br>
                                                <asp:TextBox ID="TXT_InApellidos" runat="server" placeholder="Apellido" class="form-control" onkeypress="return sololetras(event)" onpaste="return false"></asp:TextBox>
                                                <br>
                                                <a style="color: grey">Fecha de naciemiento: </a>
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
                                                <br>
                                                <br>
                                                <asp:TextBox ID="TXT_InCelular" runat="server" placeholder="Celular" class="form-control" onkeypress="return SoloNumero(event)" onpaste="return false"></asp:TextBox>
                                                <br>
                                                <asp:TextBox ID="TXT_InMail" runat="server" placeholder="Correo elctrónico" class="form-control" onchange="ValidacionEmail(this.value);"></asp:TextBox>
                                                <br>
                                                <asp:TextBox ID="TXT_InUser" placeholder="Usuario" onchange="ValidacionUser(this.value);" class="form-control" runat="server"></asp:TextBox>
                                                <br>
                                                <asp:TextBox ID="TXT_InPass" placeholder="Contraseña" class="form-control" runat="server" type="password" onchange="ValidarContraseña(this.value);"></asp:TextBox>
                                                <br>
                                                <asp:Label ID="Label3" runat="server"></asp:Label>
                                            </div>

                                            <!-- Modal footer -->

                                            <div class="modal-footer">
                                                <asp:Button ID="BTN_Regis" runat="server" Text="Resgistrate" OnClick="BTN_Regis_Click" class="btn btn-success" />
                                                <asp:Button ID="BTN_LimpiarCampos" runat="server" Text="Limpiar campos" class="btn btn-warning" OnClick="BTN_LimpiarCampos_Click" />
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d63721.75089414443!2d-76.50196570273803!3d3.4447734554636313!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sexito!5e0!3m2!1ses-419!2sco!4v1573428593864!5m2!1ses-419!2sco"
                                            width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
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
