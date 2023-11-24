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
        
        <h6>"Una santanina, una señorita de éxito"</h6>
        <a class="btn btn-outline-dark" href="../../views/usuario/historialuser.php">Historial</a>
        <a class="btn btn-outline-dark" href="../../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
        <?php echo $_SESSION["login"]["nombres"]?>
        
    </nav>

    <section class="grid mt-4">
        <div id="infoLibro">
            
        </div>
        <div>
        <form>
        <div class="form-row mt-2">
            <h4>Solicitud de préstamo</h4>
  
    <div class="form-group col-md-3 mt-2">
        <label for="fechaprestamo" >Fecha préstamo</label>
        <input type="date" class="form-control" id="fechaprestamo">
    </div>
    <input type="text" hidden id="rol" value="<?php echo $_SESSION['login']['nombrerol']?>">

    <div id="contenedor-cantidad" class="form-group col-md-3 mt-2">
        <label for="cantidad">Cantidad</label>
        <input type="number" class="form-control form-control-sm" id="cantidad">
    </div>

    <div class="form-group col-md-3 mt-2">
    <label for="enbiblioteca" style="color:#574E4E;">En Biblioteca</label>
    <select class="form-control" required="" data-placement="top" id="enbiblioteca">
        <option value="">Seleccione</option>
        <option value="SI">Sí</option>
        <option value="NO">No</option>
    </select>
    </div>

    <div id="contenedor-lugar" class="form-group col-md-6 mt-2 d-none">
        <label for="lugar" class="form-label bold">Lugar</label>
        <input type="text" class="form-control" id="lugar">
    </div>

    <div class="form-group col-md-6 mt-2">
        <label for="descripcion" class="form-label bold">Descripción</label>
        <input type="text" class="form-control" id="descripcion">
    </div>

    <div class="form-group col-md-3 mt-2">
    <label for="fechadevolucion" >Fecha devolución</label>
    <input type="date" class="form-control" id="fechadevolucion">
    </div>

    <div class="mt-4 mb-4">
    <button type="button" class="btn btn-primary" id="solicitar">Solicitar</button>
    </div>
</form>
    </div>
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
                <p>261941</p>
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
        margin-bottom: 20px; /*Pie de página*/
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


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>



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
            const fechadevolucion = document.querySelector("#fechadevolucion")

            if(nombrerol == 'Estudiante'){
                document.querySelector('#contenedor-cantidad').style.display='none'

            }

            const fechaActual = new Date(); 
            const fechaMinima = fechaActual.toISOString().split('T')[0];
            fechaprestamo.min = fechaMinima
            fechaprestamo.value = fechaMinima
            fechadevolucion.min = fechaMinima
            fechaprestamo.addEventListener("change", function(){
                console.log(fechaprestamo.value)
                fechadevolucion.min = fechaprestamo.value
            })
        

            fordata.append("operacion", "buscarlibro")
            fordata.append("idlibro", idlibro)
            fetch("../../controller/userlibros.php", {
                method: "POST",
                body: fordata
            }).then(res=>res.json())
            .then(datos=>{         
                
                containerLibro.innerHTML = `
                <ul>
                <div class="titulo">Descripción:</div>
                <img src="../img/${datos.imagenportada}" width="200px" />
                <li class="descripcion"">Nombre de libro: ${datos.libro}</li>
                <li style="margin-left: 60px;">Autor: ${datos.autor}</li>
                <li style="margin-left: 60px;">Editorial: ${datos.editorial}</li>
                <li style="margin-left: 60px;">Categoría: ${datos.categoria}</li>
                <li style="margin-left: 60px;">Subcategoría: ${datos.subcategoria}</li>
                <li style="margin-left: 60px;">Cantidad: ${datos.cantidad}</li>
                </ul>
                `
            })
            enbiblioteca.addEventListener("change", function(e){
            const value = e.target.value
            
                if(value == 'NO'){
                console.log(contenedorlugar)
                contenedorlugar.classList.remove("d-none")
                }else {
                contenedorlugar.classList.add("d-none")
                }
            })

            function RegistrarPrestamo(){
            if(confirm("¿Está seguro de guardar?")){
            const cantidad = nombrerol == 'Estudiante'?1:document.querySelector("#cantidad").value
            const parametros = new URLSearchParams();
            parametros.append("operacion", "prestamousuario");
            parametros.append("idlibro", idlibro);     
            parametros.append("cantidad", cantidad);
            parametros.append("descripcion", document.querySelector("#descripcion").value);
            parametros.append("enbiblioteca", enbiblioteca.value);
            parametros.append("lugardestino", document.querySelector("#lugar").value);
            parametros.append("fechaprestamo", document.querySelector("#fechaprestamo").value);
            parametros.append("fechadevolucion", document.querySelector("#fechadevolucion").value)
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
                    document.querySelector("#fechadevolucion").value = ''
                    enbiblioteca.value =''
                }else{
                    alert('No puede solicitar más libros')
                }
            })
            }
            }

            Solicitar.addEventListener("click", RegistrarPrestamo);

            
    });
    </script>
</body>

</html>