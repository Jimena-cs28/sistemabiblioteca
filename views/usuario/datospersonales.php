<?php
session_start();

if (!isset($_SESSION['login']) || !$_SESSION['login']['status']) {
    header("Location:../");
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datos Personales</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/user.css">
    <link rel="stylesheet" href="../css/detalle.libro.css">
    <link rel="icon" href="../../img/logo2.png">
</head>
<body>

<style>
    #p {
        margin-top: 65px;
    }

    .img1 {
        margin-left: 70%;
    }
</style>

<style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        .card {
            border: 1px solid #ced4da;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card h4 {
            color: #000; /* Set the color to black */
        }

        .form-label {
            font-weight: bold;
        }

        .form-control[readonly] {
            background-color: #f8f9fa;
            color: #495057;
        }
    </style>

<nav>
    <a href="./user.php"><img class="img" src="../../img/logo2.png" alt="logo"></a>
    <h5>"Una santanina, una señorita de éxito"</h5>
    <a class="btn btn-outline-dark" href="../usuario/user.php">Inicio</a>        
    <a class="btn btn-outline-dark" href="../../views/usuario/historialuser.php">Historial</a>
    <a class="btn btn-outline-dark" href="../../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
    <?php echo $_SESSION["login"]["nombres"] ?>
</nav>

<div class="container" id="div">
    <div class="col-md-6 offset-md-3">
        <div class="card p-4">
            <h4 class="text-center mb-4">Datos Personales</h4>
            <form action="update_user.php" method="post">
                <div class="mb-3">
                    <label for="nombres" class="form-label">Nombres y Apellidos:</label>
                    <input type="text" class="form-control" id="nombres" name="nombres" value="<?php echo $_SESSION['login']['nombres'] ?>" readonly>
                </div>
                <div class="mb-3">
                    <label for="nombrerol" class="form-label">Rol:</label>
                    <input type="text" class="form-control" id="nombrerol" name="nombrerol" value="<?php echo $_SESSION['login']['nombrerol'] ?>" readonly>
                </div>
                <div class="mb-3">
                    <label for="nrodocumento" class="form-label">DNI:</label>
                    <input type="text" class="form-control" id="nrodocumento" name="nrodocumento" value="<?php echo $_SESSION['login']['nrodocumento'] ?>" readonly>
                </div>
                <div class="mb-3">
                    <label for="fechanac" class="form-label">Fecha de nacimiento:</label>
                    <input type="text" class="form-control" id="fechanac" name="fechanac" value="<?php echo $_SESSION['login']['fechanac'] ?>" readonly>
                </div>
                <div class="mb-3">
                    <label for="direccion" class="form-label">Dirección:</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" value="<?php echo $_SESSION['login']['direccion'] ?>" readonly>
                </div>
            </form>
        </div>
    </div>
</div>

<style>
    #div {
      margin-top: 130px; /* Ajusta este valor según tus preferencias */
    }
</style>

</body>
</html>
