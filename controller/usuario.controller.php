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
        $resultado["nombres"] = $datosObtenidos["nombres"];
        $resultado["idusuario"]=$datosObtenidos["idusuario"];
        $resultado["nombrerol"]=$datosObtenidos["nombrerol"];
      } else {
        //clave incorrecta
        $resultado["mensaje"] = "contraseña incorrecta";
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
}

if (isset($_GET['operacion']) == 'destroy'){
  session_destroy();
  session_unset();
  header("location: ../index.php");
}

?>