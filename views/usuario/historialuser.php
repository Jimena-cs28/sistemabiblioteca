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
    <link rel="stylesheet" href="">
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/user.css">
    <link rel="stylesheet" href="../css/detalle.libro.css">
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
        <img class="img" src="../../img/logo2.png" alt="logo"></a>
        <h6>"Una santanina, una señorita de éxito"</h6>
        <a class="btn btn-outline-dark" href="../../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
        <?php echo $_SESSION["login"]["nombres"]?>
			</p>

    </nav>

    


</body>

</html>