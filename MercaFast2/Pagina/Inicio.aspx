<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="ProyectoAmbienteWeb.Inicio" %>
 
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link  rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@8.18.3/dist/sweetalert2.all.min.js">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        .carousel-control-prev,.carousel-control-next{ 
            filter: invert(100%);
            transition: background-color .5s;     
        }

        .carousel-control-prev:hover,.carousel-control-next:hover{
            background-color: rgba(255,255,255,0.05);            
        }

        

    </style>
    <script src="../JavaScript/JavaScript.js"></script>
    <link href="../CSS/EstilosHome.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container">
        <br />
        <br />
        <div class="col-md-12">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../Imagenes/Aseo.png" class="img-fluid" alt="">
                        <div class="carousel-caption d-none d-md-block">
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="../Imagenes/ShampooJhonsson.jpg" class="img-fluid" alt="">
                        <div class="carousel-caption d-none d-md-block">
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="../Imagenes/Hatsu.jpg" class="img-fluid" alt="">
                        <div class="carousel-caption d-none d-md-block">
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="container">
        <section class="row mt-5">
            <div class="col-md-6">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagenes/Logo.png" class="img-fluid z-depth-1-half img-responsive" />
            </div>

            <div class="col-md-6">
                <h1>Bienvenido a MercaFest</h1>
              
                <hr>
                <p>
                La maestría de los agricultores Colombianos son elemento 
                esencial del procesor a la hora de seleccionar nuestros 
                productos para que dispongas y disfrutes de ellos.
                sentirás pasión y compromiso Colombiano
                </p>
                <a href="../Carrito/Productos.aspx" class="btn btn-outline-primary">Ve nuestros Productos</a>
            </div>
        </section>
    </div>

    <br>
    <div class="container">
        <hr />
    </div>
    <br />
    
    <div class="container">
        <iframe width="100%" 
                height="600px" 
                src="../Imagenes/Secuencia 01.mp4" 
                frameborder="0" 
                allowfullscreen></iframe>
        
    </div>
    
    <br>
    <div class="container">
        <hr />
    </div>
    <br />

    <div class="container">
        <div class="card-deck">

            <div class="card">
                <h3 style="text-align:center" >COMIDA</h3>
           
                <img src="../Imagenes/comida1.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">DEJATE GUIAR POR NUESTRA MEJOR COMIDA</h5>
                    <p class="card-text">
                      Las personas realizan varias comidas al día. Su contenido y número variará de acuerdo a una serie de factores sociales, culturales, estacionales y geográficos. 
                        Las comidas más usuales son el desayuno (se realiza después de dormir por la noche), el almuerzo (al mediodía), la merienda (a media tarde) y la cena (al anochecer, suele ser la última comida del día).
                        Por eso nuestro supermercado te brinda los mejores productos para tus diferentes comida al día.
                    </p>
                    <a href="../Carrito/Productos.aspx" class="btn btn-outline-primary">Descubre Tus Productos de Comida</a>
                </div>
            </div>

            <div class="card">
                <h4 style="text-align:center" >ASEO</h4>
               
                <img src="../Imagenes/aseo1.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">MAESTRÍA EN LA MEJOR IMPORTACIÓN DE ELEMENTOS DE ASEO</h5>
                    <p class="card-text">
                     Éstos son los elementos de aseo que distribuimos. 
                     Si deseas conocer todo nuestro portafolio de productos de aseo accede a la tienda para conocer todo nuestro catálogo, tenemos mas de mil productos diferentes para tí y tu empresa. Con una maestría en las mejores importaciones.
                    </p>
                    <a href="../Carrito/Productos.aspx" class="btn btn-outline-primary">Descubre tus Productos de Aseo</a>
                </div>
            </div>

            <div class="card">
                <h4 style="text-align:center" >LIMPIEZA PERSONAL</h4>
              
                <img src="../Imagenes/limpieza1.png" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">LA MÁXIMA EXPRESIÓN DE CALIDAD PARA EL ASEO PERSONAL </h5>
                    <p class="card-text">
                        El aseo personal se podría definir como la limpieza de uno mismo para prevenir enfermedades y 
                        mantener un buen estado de salud. Mantener buenos hábitos de higiene personal es una de las mejores formas de prevenir enfermedades, evitar transmitirlas y mantener limpio y aseado el cuerpo externo.
                        Por eso MercaFest te brinda la mejor calidad para el uso en diferentes partes del cuerpo. 
                    </p>
                    <a href="../Carrito/Productos.aspx" class="btn btn-outline-primary">Descubre tus Productos de Aseo Personal</a>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />

    <div class="container ">
        <div class="text-center">
        <button class="btn btn-outline-primary" type="button" data-toggle="collapse" data-target=".multi-collapse" aria-expanded="false" aria-controls="multiCollapseExample1 multiCollapseExample2">Nuestro Ranking</button>
        </div>
        <br />
        <br>
            <div class="row">
            <div class="col">
                             
                <br>                

                <div class="container">
                    <div class="collapse multi-collapse" id="multiCollapseExample5">
                       <div class="container">
                      
                                <h2 style="text-align:center">Las Mejores Supermercados a nivel Nacional</h2>
                                <br />
                                <div class="table-responsive">
                                    <table class="table table-Active ">
                                        <thead class="bg-primary">
                                            <tr style="color:white">
                                                <th scope="col">Supermercado</th>
                                                <th scope="col">Calificación</th>
                                                <th scope="col">Puntuación de Usuario</th>
                                                <th scope="col">Estrellas</th>
                                               
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr >
                                                <th scope="row">MercaFest</th>
                                                
                                                <td>5</td>
                                                <td>5</td>
                                                <td>5</td>
                                            </tr>
                                            <tr >
                                                <th scope="row">Exito</th>
                                                <td>4.9</td>
                                                <td>4.7</td>
                                                <td>5</td>
                                               
                                            </tr>
                                            <tr>
                                                <th scope="row">Yumbo</th>
                                                <td>4.6</td>
                                                <td>4.6</td>
                                                <td>5</td>
                                             
                                            </tr>
                                            <tr >
                                                <th scope="row">Comfandi</th>
                                                <td>4.5</td>
                                                <td>4.5</td>
                                                <td>5</td>
                                                
                                            </tr>
                                            <tr >
                                                <th scope="row">De uno</th>
                                                <td>4.3</td>
                                                <td>4.3</td>
                                                <td>5</td>

                                            </tr>

                                        </tbody>
                                    </table>
                                </div>

                       </div>
                    </div>
                </div>
            </div>
            </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.18.3/dist/sweetalert2.all.min.js"></script>
    <script src="popup.js"></script>
</asp:Content>
