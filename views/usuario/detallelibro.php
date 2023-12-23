<?php
session_start();
if (!isset($_SESSION['login']) || !$_SESSION['login']['status']){
    header("Location:../");
}
require_once '../../config/conexion.php';
$acceso = new conexion();
$conexion = $acceso->getConexion();
$sql = "SELECT estado FROM usuarios WHERE idusuario = ".$_SESSION['login']['idusuario'];
$result = $conexion->query($sql)->fetchAll();
$estado = $result[0]['estado'];

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle</title>
    
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
        .grid{
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            padding: 1fr;
        }
    </style>

    <nav>
        <a href="./user.php"><img class="img" src="../../img/logo2.png" alt="logo"></a>
        <h5>"Una santanina, una señorita de éxito"</h5>
        <a class="btn btn-outline-dark" href="../../views/usuario/historialuser.php">Historial</a>
        <a class="btn btn-outline-dark" href="../../views/usuario/datospersonales.php">Ver Perfil</a>
        <a class="btn btn-outline-dark" href="../../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
        <?php echo $_SESSION["login"]["nombres"]?>
        
    </nav>

        <section class="grid">
            <div id="infoLibro"></div>
            <div style="margin-top: 50px;">
                <form>
                    <div class="form-row mt-2">
                        <h4>Solicitud de Préstamo</h4>

                        <div class="form-group col-md-3 mt-3">
                            <label for="fechaprestamo">Fecha de préstamo</label>
                            <input type="date" class="form-control" id="fechaprestamo">
                        </div>

                        <input type="text" hidden id="rol" value="<?php echo $_SESSION['login']['nombrerol']?>">

                        <div id="contenedor-cantidad" class="form-group col-md-3 mt-3">
                            <label for="cantidad">Cantidad</label>
                            <input type="number" class="form-control form-control-sm" id="cantidad">
                        </div>

                        <div class="form-group col-md-3 mt-3">
                            <label for="enbiblioteca" style="color:#574E4E;">En Biblioteca</label>
                            <select class="form-select" required="" data-placement="top" id="enbiblioteca">
                                <option value="">Seleccione</option>
                                <option value="SI">Sí</option>
                                <option value="NO">No</option>
                            </select>
                        </div>

                        <div id="contenedor-lugar" class="form-group col-md-3 mt-3 d-none">
                            <label for="lugar" class="form-label bold">Lugar</label>
                            <select class="form-control" id="lugar">
                                <option value="">Seleccione</option>
                                <option value="aula">Aula</option>
                                <option value="laboratorio">Laboratorio</option>
                                <option value="otros">Otros</option>
                            </select>
                        </div>

                        <div class="form-group col-md-4 mt-3">
                            <label for="descripcion" class="form-label bold" id="des">Descripción</label>
                            <input type="text" class="form-control" id="descripcion" placeholder="Opcional">
                        </div>
                        <!--Validación sentenciar usuarios-->
                        <div class="mt-4 mb-4">
                            <?php 
                            if($estado==1){
                                echo '<button type="button" class="btn btn-primary" id="solicitar">Solicitar</button>';
                            }
                            else{
                                echo '<span style="color:red ">Usted no puede solicitar más libros</span>';
                            }
                            ?>
                        </div>
                    </div>
                </form>
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

    <style>
    .grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 20px;
        margin-top: 20px;
    }

    form {
        background-color: #f8f9fa;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 30px; /*Pie de página*/
    }
    
    form label {
        color: #574E4E;
    }

    form select {
        width: 100%;
        padding: 8px;
        margin-top: 5px;
        margin-bottom: 10px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        box-sizing: border-box;
    }

    #contenedor-lugar {
        margin-top: 20px;
    }

    button#solicitar {
        background-color: #007BFF;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
</style>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="../../js/sweetalert.js"></script>



    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const queryString = window.location.search;
            const Solicitar =document.querySelector("#solicitar");
            const urlParams = new URLSearchParams(queryString);
            const idlibro = urlParams.get("idlibro");
            const fordata = new FormData()
            const containerLibro = document.querySelector("#infoLibro")
            const enbiblioteca = document.querySelector("#enbiblioteca")
            const contenedorlugar = document.querySelector("#contenedor-lugar")
            const nombrerol = document.querySelector("#rol").value
            const fechaprestamo = document.querySelector("#fechaprestamo")
            const cantidad = document.querySelector("#cantidad")
            let cantidadmaxima = 0
    

            if(nombrerol == 'Estudiante'){
                document.querySelector('#contenedor-cantidad').style.display='none'
                document.querySelector('#des').textContent = 'Grado y Sección';

            }

            if(nombrerol == 'Profesor'){
                document.querySelector('#des').textContent = 'Cursos';
            }

            const fechaActual = new Date(); 
            const fechaMinima = fechaActual.toISOString().split('T')[0];
            fechaActual.setDate(fechaActual.getDate()+3)
            const fechamaxima = fechaActual.toISOString().split('T')[0]
            fechaprestamo.max = fechamaxima
            fechaprestamo.min = fechaMinima
            fechaprestamo.value = fechaMinima
            
        

            fordata.append("operacion", "buscarlibro")
            fordata.append("idlibro", idlibro)
            fetch("../../controller/userlibros.php", {
                method: "POST",
                body: fordata
            }).then(res=>res.json())
            .then(datos=>{         
                if(datos.cantidad == 0){
                    solicitar.style.display='none'
                }
                cantidadmaxima = datos.cantidad
                containerLibro.innerHTML = `
                <ul>
                <div class="titulo" style="margin-bottom: 10px;">DATOS:</div>
                <div style="text-align: center;">
                    <img src="../img/${datos.imagenportada}" width="250px" alt="Portada del libro" style="border-radius: 8px;"/>
                </div>
                <li class="descripcion"><strong>Nombre del libro:</strong> ${datos.libro}</li>
                ${datos.descripcion ?`<li style="margin-left: 60px;"><strong>Descripción:</strong> ${datos.descripcion}</li>`:''}
                <li style="margin-left: 60px;"><strong>Autor:</strong> ${datos.autor}</li>
                <li style="margin-left: 60px;"><strong>Editorial:</strong> ${datos.editorial}</li>
                <li style="margin-left: 60px;"><strong>Categoría:</strong> ${datos.categoria}</li>
                <li style="margin-left: 60px;"><strong>Subcategoría:</strong> ${datos.subcategoria}</li>
                <li style="margin-left: 60px;"><strong>Cantidad:</strong> ${datos.cantidad}</li>
                </ul>
                `
            })
            //Campo de lugar disponible
            enbiblioteca.addEventListener("change", function(e){
            const value = e.target.value
            
                if(value == 'NO'){
                console.log(contenedorlugar)
                contenedorlugar.classList.remove("d-none")
                }else {
                contenedorlugar.classList.add("d-none")
                }
            })
            const validarFecha = (fecha) => {
            // Obtiene la fecha actual
            const fechaActual = new Date();
            fechaActual.setHours(0,0,0,0)

            try {
                // Convierte la fecha ingresada a un objeto Date
                const fechaIngresada = new Date(fecha);
                fechaIngresada.setHours(0,0,0,0)
                // Calcula la diferencia en milisegundos entre las fechas
                const diferenciaMilisegundos = fechaIngresada - fechaActual;

                // Convierte la diferencia a días
                const diferenciaDias = Math.floor(diferenciaMilisegundos / (1000 * 60 * 60 * 24));

                // Valida si la fecha ingresada es igual o posterior a la fecha actual
                // y no es más de 3 días en el futuro
                if (fechaIngresada >= fechaActual && diferenciaDias <= 3) {
                    return true;
                }
            } catch (error) {
                // Maneja una excepción si la fecha ingresada no es válida
            }

            // Si no se cumple alguna condición, la fecha no es válida
            return false;
        };
            //Registrar préstamo de libros
            function RegistrarPrestamo(){
                const cantidad = nombrerol == 'Estudiante'?1:Number(document.querySelector("#cantidad").value)
                const fechasolicitud = document.querySelector("#fechaprestamo").value
                //Variables
                const lugarvalue =document.querySelector("#lugar").value
                const parsetDate = new Date(fechasolicitud).toISOString().replace("Z","")
                console.log(validarFecha(parsetDate))
                if(!validarFecha(parsetDate)){
                    toastError('Verificar fecha')
                    return
                }
                //Validaciones
                if(cantidad <= 0 || cantidad>cantidadmaxima){
                    toastError('Verifique la cantidad')
                    return
                }
                if(enbiblioteca.value ==''){
                    toastError('Debe seleccionar en biblioteca')
                    return
                }
                if(enbiblioteca.value =='NO' && lugarvalue == ''){
                    toastError('Debe completar el campo lugar')
                    return
                }
                mostrarPregunta("SOLICITAR", "¿Está seguro(a) de solicitar el préstamo?").then((result)=>{
                if(result.isConfirmed){
                const parametros = new URLSearchParams();
                parametros.append("operacion", "prestamousuario");
                parametros.append("idlibro", idlibro);     
                parametros.append("cantidad", cantidad);
                parametros.append("descripcion", document.querySelector("#descripcion").value);
                parametros.append("enbiblioteca", enbiblioteca.value);
                parametros.append("lugardestino", lugarvalue);
                parametros.append("fechaprestamo", fechasolicitud)
                
                fetch("../../controller/userlibros.php" ,{
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    if(datos.status){
                        document.querySelector("#fechaprestamo").value = ''
                        document.querySelector("#cantidad").value = ''
                        document.querySelector("#descripcion").value = ''
                        document.querySelector("#lugar").value = ''
                        enbiblioteca.value =''
                    }else{
                        notificar('No puede solicitar más libros')
                    }
                })
                }})
            }
            Solicitar.addEventListener("click", RegistrarPrestamo);

            
        });
    </script>
</body>

</html>