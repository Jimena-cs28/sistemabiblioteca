<?php
session_start();
if (!isset($_SESSION['login']) || !$_SESSION['login']['status']){
    header("Location:../");
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <!-- bootstrap 5 -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/user.css">
    <link rel="stylesheet" href="../css/detalle.libro.css">
    <link rel="icon" href="../../img/logo2.png">
</head>

<body>
    <style> 
        #p{
            margin-top: 65px;
        }
        .img1{
            margin-left: 70%;
        }
        #featured{
            margin-left: 7%;
            margin-right: 7%;
        }
    </style>

    <nav class="fixed-top">
        <img class="img" src="../../img/logo2.png" alt="logo">
        <h5>"Una santanina, una señorita de éxito"</h5>
        <a class="btn btn-outline-dark" href="../../views/usuario/historialuser.php">Historial</a>
        <a class="btn btn-outline-dark" href="../../views/usuario/datospersonales.php">Ver Perfil</a>
        <a class="btn btn-outline-dark" href="../../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
        <?php echo $_SESSION["login"]["nombres"]?>
			</p>
    </nav>
    <!-- fondo de portada-->
    <div id="carouselExampleControlsNoTouching" class="carousel slide mt-5" data-bs-touch="false">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../../img/fondo.jpg" class="d-block w-100 mt-5" alt="banner 1">
            </div>
        </div>
    </div>
    
    <!--Section Libros-->
    <!-- Filtra categorías y subcategorías -->

    <section class="featured ml-4" id="featured">
        <div class="row mb-4">
            <div class="col-md-4">
                <label for="categoria" class="form-label form-label text-center">CATEGORÍA</label>
                <select class="form-select" name="categoria" id="categoria">
                    
                </select>
            </div>
            <div class="col-md-4">
                <label for="selectsubcategoria" class="form-label form-label text-center">SUBCATEGORÍA</label>
                <select class="form-select" name="selectsubcategoria" id="selectsubcategoria">
                    
                </select>
            </div>

            <!-- Buscar por nombre del libro -->
            <div class="mt-4">
                <input placeholder="Buscar libro" type="text" id="buscador" name="buscador" class="campo-busqueda">
                <button class="btn btn-dark ml-2" id= "buscarlibro">Buscar</button>
            </div>

    
            
        </div>

        <div class="row mt-5" id="cards">
            <!-- litooo-->
            <!--<div class="col-md-3 mt-5">
                <div class="mb-3" style="max-width: 18rem;"  id="tablaslibros">
                    <img src="" alt="">
                    <div class="card-header"></div>
                    <div class="card-body">
                    <h6 class="card-title"></h6>
                    <p class="card-text"></p>
                    </div>
                </div>
            </div>-->
        </div>
    </section>
    
    <footer id="foot">
        <div class="contenedor-footer">
            <div class="content-footer">
                <h4>Ubicación</h4>
                <p>Av. Alfonso Ugarte s/n</p>
            </div>
            <div class="content-footer">
                <h4>Facebook</h4>
                <p>I.E. Santa Ana Chincha Oficial</p>
            </div>
            <div class="content-footer">
                <h4>Email</h4>
                <p>iesantaanachincha@gmail.com</p>
            </div>
            <div class="content-footer">
                <h4>Teléfono</h4>
                <p>(056)784813</p>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script> -->
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded",() => {
            const selectcategoria = document.querySelector("#categoria");
            const tabla = document.querySelector("#tabla.slibros");
            const cuerpo = document.querySelector("#tablaslibros");
            const selectsubcategoria = document.querySelector("#selectsubcategoria");
            const card = document.querySelector("#cards");
            const buscarlibro = document.querySelector("#buscarlibro");
            const buscador = document.querySelector("#buscador");

            buscarlibro.addEventListener("click", listarLibroUser) 

            function listarCategoria(){
                const parametros = new URLSearchParams();
                parametros.append("operacion", "selectcategoria");

                fetch("../../controller/userlibros.php",{
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    // console.log(datos);
                selectcategoria.innerHTML = "<option value =''>Seleccione</option>";
                    datos.forEach(element => {
                        let copcion3= `
                        <option value ='${element.idcategoria}'>${element.categoria}</option>
                    `;
                    selectcategoria.innerHTML += copcion3;
                    });
                })
            }

            function listarLibroUser(){
                const parametros = new URLSearchParams();
                console.log(buscador.value)
                parametros.append("operacion","listarLibroUser");
                parametros.append("idsubcategoria",selectsubcategoria.value);
                parametros.append("idcategoria",selectcategoria.value);
                parametros.append("nombres",buscador.value);
                fetch("../../controller/userlibros.php", {
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    console.log(datos)
                    card.innerHTML = ``;
                    datos.forEach(element => {
                        const libro = `
                        <div class="col-xl-3 mb-4">
                            <div class="card overflow-hidden rounded-2" style="max-width: 18rem;">
                            <div class="position-relative">
                                <img src="../img/${element.imagenportada}" class="card-img-top rounded-0 img-fluid" alt="" style="width: 100%; height: 300px;">
                            </div>
                            <div class="card-body pt-2 pb-2">
                                <h5 class="card-title fw-semibold fs-6 text-center">${element.libro}</h5>
                                <div class="d-flex align-items-center justify-content-between">
                                    <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Autor: ${element.autor}</li>
                                    <li class="list-group-item">Editorial: ${element.editorial}</li>
                                    <li class="mt-1 list-group-item">Cantidad: ${element.cantidad}</li>
                                    </ul>
                                </div>
                                <div class="text-center">
                                    <a href="../../views/usuario/detallelibro.php?idlibro=${element.idlibro}" class="btn btn-dark btn-sm mt-2">Ver más</a>
                                </div>
                            </div>
                        </div>
                    </div> 
                        `;
                        card.innerHTML += libro;
                    });
                })
            }

            function loadlibro(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","listlibro");         
                fetch("../../controller/userlibros.php", {
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    console.log(datos)
                    card.innerHTML = ``;
                    datos.forEach(element => {
                        const libro = `
                        <div class="col-md-6 col-lg-4 col-xl-3 mb-4">
                            <div class="card overflow-hidden rounded-2" style="max-width: 18rem;">
                            <div class="position-relative">
                                <img src="../img/${element.imagenportada}" class="card-img-top rounded-0 img-fluid" alt="" style="width: 100%; height: 300px;">
                            </div>
                            <div class="card-body pt-2 pb-2">
                                <h5 class="card-title fw-semibold fs-6 text-center">${element.libro}</h5>
                                <div class="d-flex align-items-center justify-content-between">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">Autor: ${element.autor}</li>
                                        <li class="list-group-item">Editorial: ${element.editorial}</li>
                                        <li class="mt-1 list-group-item">Cantidad: ${element.cantidad}</li>
                                    </ul>
                                </div>
                                <div class="text-center">
                                    <a href="../../views/usuario/detallelibro.php?idlibro=${element.idlibro}" class="btn btn-primary btn-sm mt-2">Ver más</a>
                                </div>
                            </div>
                        </div>
                    </div>
                        `;
                        card.innerHTML += libro;
                    });
                })
            }

            function selectsubCategoriauser(){
                const parametros = new URLSearchParams();
                parametros.append("operacion", "selectsubcategoria");
                parametros.append("idcat", selectcategoria.value);
                fetch("../../controller/userlibros.php", {
                    method : 'POST',
                    body:parametros
                })
                .then(response => response.json())
                .then(datos => {
                    selectsubcategoria.innerHTML = "<option value=''>Seleccione</option>";
                    datos.forEach(element => {
                        let opcion1 = `
                            <option value='${element.idsubcategoria}'>${element.subcategoria}</option>`;
                            selectsubcategoria.innerHTML += opcion1;  
                    });
                    
                });
            }
            

            selectcategoria.addEventListener("change", selectsubCategoriauser);
            listarCategoria();
            selectsubCategoriauser();
            loadlibro();
        });
    </script>
    
    
</body>

</html>