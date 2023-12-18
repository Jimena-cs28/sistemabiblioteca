<?php
//Iniciamos/heredamos la sesión
session_start();
//La sesión contendrá datos del login en formato de arreglo
$_SESSION["login"] = [];

require_once '../models/Usuario.model.php';

if(isset($_POST['operacion'])) {
  $usuario = new Usuario();
  if($_POST['operacion'] == 'login'){
    //buscamos al usuario a traves de su nombre
    $datosObtenidos = $usuario->login($_POST['nombreusuario']);
    //arreglo que contiene datos de login
    $resultado = [
      "status" => false,
      "nombres" => "",
      "mensaje" => "",
      "idusuario" => 0,
      "nombrerol" => ""
    ];

    if($datosObtenidos) {
      //encontramos el registro
      $claveIngresada = $_POST['claveIngresada'];
      if(password_verify( $claveIngresada,$datosObtenidos['claveacceso'])){
        //clave correcta
        $resultado["status"] = true;
        $resultado["nombres"] = $datosObtenidos["nombres"] . " " . $datosObtenidos["apellidos"];
        $resultado["idusuario"]=$datosObtenidos["idusuario"];
        $resultado["nombrerol"]=$datosObtenidos["nombrerol"];
        $resultado["nrodocumento"]=$datosObtenidos["nrodocumento"];
        $resultado["fechanac"]=$datosObtenidos["fechanac"];
        $resultado["direccion"]=$datosObtenidos["direccion"];
      }else {
        $resultado["mensaje"] = "Contraseña incorrecta";
      }
    } else {
      //usuario no encontrado
      $resultado["mensaje"] = "No se encuentra el usuario";
    }

    //Actualizando la informacion en la variable de sesion
    $_SESSION["login"] = $resultado;
    //enviando informacion de la sesion a la vista
    echo json_encode($resultado);
  }

  if($_POST['operacion'] == 'registrarAutor'){
    $datosGuardar = [
      "nombres"     => $_POST['nombres'],
      "apellidos"    => $_POST['apellidos'],
      "seudonimio"      => $_POST['seudonimio'],
      "nacionalidad"       => $_POST['nacionalidad']
    ];
    $respuesta = $usuario->registrarAutor($datosGuardar);
    echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'registrarEditorial'){
    $datosGuardar = [
      "nombres"     => $_POST['nombres'],
      "telefono"    => $_POST['telefono'],
      "web"      => $_POST['web'],
      "email"       => $_POST['email'],
      "paisorigen"       => $_POST['paisorigen']
    ];
    $respuesta = $usuario->registrarEditorial($datosGuardar);
    echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'registrarCategoria'){
    $datosGuardar = [
      "categoria"     => $_POST['categoria'],
      "codigo"    => $_POST['codigo']
    ];
    $respuesta = $usuario->registrarCategoria($datosGuardar);
    echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'nuevaclave'){
    $nuevo = [
      "usuario"     => $_POST['usuario'],
      "clave"       => password_hash($_POST['clave'], PASSWORD_BCRYPT)
    ];
    $respuesta = $usuario->NuevaContraseña($nuevo);
    echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'updateAdmin'){
    $nuevo = [
      "idusuario"     => $_POST['idusuario'],
      "apellidos"       =>   $_POST['apellidos'],
      "nombres"       =>   $_POST['nombres'],
      "dni"       =>   $_POST['dni'],
      "fechan"       =>   $_POST['fechan'],
      "direccion"       =>   $_POST['direccion'],
      "telefono"       =>   $_POST['telefono'],
      "email"       =>   $_POST['email'],
      "usuario"       =>   $_POST['usuario']
    ];
    $respuesta = $usuario->updateAdmin($nuevo);
    echo json_encode($respuesta);
  }
  

}

if (isset($_GET['operacion']) == 'destroy'){
  session_destroy();
  session_unset();
  header("location: ../index.php");
}

?>