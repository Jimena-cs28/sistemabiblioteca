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
    <title>Historial</title>
    <link rel="stylesheet" href="">
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/user.css">
    <link rel="stylesheet" href="../css/detalle.libro.css">
    <link rel="stylesheet" href="../css/historialuser.css">
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
        <a class="btn btn-outline-dark" href="../../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
        <?php echo $_SESSION["login"]["nombres"]?>
			</p>

    </nav>
    <h4>LIBROS SOLICITADOS</h4>
    <style>
    h4 {
            text-align: center;
            margin-top: 0;
            background-color: #4e4040;/*color de fondo*/
            padding: 10px;
            color: white; /* Color del texto en el título */
        }
</style>

    <div class="row" id="contenedor">

    </div>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const formData= new FormData()
            const contenedor = document.querySelector("#contenedor")
            const estados = {
                S: "Solicitado",
                R: "Reservado",
                E: "Entregado",
                D: "Sin Devolver",
                T: "Devuelto",
                C: "Cancelado"
            }
            formData.append("operacion", "historialusuario")
            fetch("../../controller/userlibros.php", {
                method:"POST",
                body: formData
            }).then(res=>res.json())
            .then(data=>{
                data.forEach(el=>{
                    contenedor.innerHTML += `<div class="col-md-4 card-deck">
                        <div class="card mb-3" style="max-width: 500px;">
                            <div class="row g-0">
                                <div class="col-md-5 d-flex align-items-center justify-content-center">
                                    <img class="img-fluid rounded-start" src="../img/${el.imagenportada}" alt="imagenLibro" style="width: 100%; object-fit: fill;">
                                </div>
                                <div class="col-md-7">
                                    <div class="card-body">
                                        <h5 class="card-title">${el.libro}</h5>
                                    </div>
                                    <ul class="list-group list-group-flush">
                                    <li class="list-group-item">Código de libro: ${el.codigo}</li>
                                    <li class="list-group-item">Fecha solicitud: ${el.fechasolicitud}</li>
                                    <li class="list-group-item">Fecha préstamo: ${el.fechaprestamo}</li>
                                    <li class="list-group-item">Fecha devolución: ${el.fechadevolucion || "---"}</li>
                                    <li class="list-group-item">Estado: ${estados[el.estado]}</li>
                                    <li class="list-group-item">Cantidad: ${el.cantidad}</li>
                                    ${el.estado=='C'? `<li class="list-group-item">Motivo Rechazo: ${el.motivorechazo}</li>` : ''}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    `
                })
            })
        })
    </script>

</body>

</html>