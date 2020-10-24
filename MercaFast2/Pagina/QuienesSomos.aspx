<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuienesSomos.aspx.cs" Inherits="Quienes_somos_.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <link rel="stylesheet" href="../CSS/StyleSheet1.css">
     <header>
        
         <div class="sesgoabajo"></div>
     </header>
    <main>
        <div class="container">
            <h1 class="sobre-nosotros">¿Quiénes somos?</h1>
            <br />
            <section>
                <div class="container">
                    <div class="container embed-responsive col-12">
                        <p class="featurette-heading text-center">
                            Mercafast es un supermercado online que busca la comodidad de 
                    cada uno de los clientes, permitiéndoles hacer sus compras sin necesidad de salir 
                    de sus casa con precio económicos y de buena calidad, entregándoles sus pedidos 
                    en puerta de su cada en el menor tiempo posible.
                        </p>
                        <p class="featurette-heading text-center">
                            Mercafast quiere que sus cliente aprovechen todo el 
                    potencial de la compañía acumulando puntos
                        </p>
                    </div>
                </div>
            </section>

            <br />
            <hr />
            <br />

            <h1 class="sobre-nosotros">Mision</h1>
            <br />
            <section>
                <div class="container">
                    <div class="container embed-responsive col-12">
                        <p class="featurette-heading text-center">
                            Somos una cadena de supermercados  para servir a nuestros clientes/vecinos con productos de calidad, con precios competitivos, y especialmente con la actitud de nuestra gente orientada a crear una ambiente familiar y agradable. Nuestra excelencia en logística y rotación de productos es base de nuestra rentabilidad y la de nuestros clientes, remuneración de nuestros colaboradores y cumplimiento con el Estado y la sociedad.  
                        </p>
                       
                    </div>
                </div>
            </section>

            <br />
            <hr />
            <br />

            <h1 class="sobre-nosotros">Vision</h1>
            <br />
            <section>
                <div class="container">
                    <div class="container embed-responsive col-12">
                        <p class="featurette-heading text-center">
                            Seremos reconocidos por ser la Cadena de Supermercados más familiar en su relación con los clientes/vecinos, creando un espacio de encuentro amigable y respetuoso para el abastecimiento del hogar de cada familia.  
                        </p>
                       
                    </div>
                </div>
            </section>

            <br />
            <hr />
            <br />

            <section class="row mt-5">
                <div class="col-md-6">
                    <h4>Nosotros nos conectamos</h4>
                    <h1>Contigo</h1>
                    <div class="row">

                        <div class="col-md-6">
                            <label for="full_name_id" class="control-label">Nombre</label>
                            <input type="text" class="form-control" id="full_name_id2" name="full_name" placeholder="Ej: Juan Esteban">
                        </div>

                        <!-- Last Name -->
                        <div class="col-md-6">

                            <label for="full_name_id" class="control-label">Apellido</label>
                            <input type="text" class="form-control" id="last_name_id2" name="full_name" placeholder="Ej: Nichoy">
                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- State Button -->
                                <label for="state_id" class="control-label">Tipo doumento</label>
                                <select class="form-control" id="Tipo_docucmento">
                                    <option value="CC">Cédula de ciudadania</option>
                                    <option value="CE">Cédula extranjera</option>
                                    <option value="PSP">Pasaporte</option>
                                    <option value="NIT">NIT</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <!-- Número doc -->
                            <label for="full_name_id" class="control-label">Número documento identidad</label>
                            <input type="text" class="form-control" id="Num_Doc" name="full_name" placeholder="Ej: 216303">
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Mail -->
                        <label for="street1_id" class="control-label">Correo electrónico</label>
                        <input type="text" class="form-control" id="Mail" name="street1" placeholder="Ej: juan.nichoy@uao.edu.co">
                    </div>

                    <div class="form-group">
                        <!-- Celular -->
                        <label for="street2_id" class="control-label">Celular</label>
                        <input type="text" class="form-control" id="Celular" name="street2" placeholder="Ej: 315875849">
                    </div>

                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Observaciones</span>
                        </div>
                        <textarea class="form-control" aria-label="Observaciones"></textarea>
                    </div>
                    
                    <br />

                    <div class="col-sm-12">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="">
                                <span class=""><i class="cr-icon glyphicon glyphicon-ok"></i></span>
                               <a href="https://www.sic.gov.co/sites/default/files/files/Nuestra_Entidad/Publicaciones/ESTATUTO_sept10_2018_v2.pdf">Conozco y acepto la POLÍTICA GENERAL DE TRATAMIENTO DE DATOS PERSONALES DE MERCAFTAS COLOMBIA y autorizo el tratamiento de estos*</a> 
                            </label>
                        </div>
                    </div>

                    <br />

                    <div class="container text-center">
                        <asp:Button ID="BTN_Enviar" runat="server" Text="Enviar" class="btn btn-outline-primary"/>
                    </div>
                </div>

                <div class="col-md-6">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d63721.75089414443!2d-76.50196570273803!3d3.4447734554636313!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sexito!5e0!3m2!1ses-419!2sco!4v1573428593864!5m2!1ses-419!2sco"
                        width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
                </div>
            </section>
        </div>
    </main>
    <br />

   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="popup.js"></script>
</asp:Content>
