<?php
//Iniciamos/heredamos la sesión
session_start();

require_once '../models/userlibros.php';

if (isset($_POST['operacion'])){
  
  $userlibro = new Userlibro();

  if($_POST['operacion'] == 'listarLibroUser'){
    $parametros=[
      "subcategoria" => $_POST['idsubcategoria'],
      "idcategoria" => $_POST['idcategoria'],
      "nombres" => $_POST['nombres']
    ];

    $datos = $userlibro->listarLibroUser($parametros); 
      echo json_encode($datos);
    
  }

  if($_POST['operacion'] == 'buscarlibro'){

    $datos = $userlibro->buscarlibro($_POST["idlibro"]);
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'listlibro'){

    $datos = $userlibro->listlibro();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'selectcategoria'){

    $datos = $userlibro->selectcategoria();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'selectsubcategoria'){
    $datos = $userlibro->selectsubcategoria($_POST['idcat']);
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'selectEditorial'){

    $datos = $userlibro->selectEditorial();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'prestamousuario'){
    //Validar si tiene libro prestado
    $cantidaddelibro = $userlibro->validarprestado($_SESSION['login']['idusuario']);
    $rol = $_SESSION['login']['nombrerol'];
    
    $cantidadmax = $rol == 'Estudiante'?1:2;
    
    if($cantidaddelibro['cantidad']<$cantidadmax){
      $datos= [
        "idlibro"   => $_POST['idlibro'],
        "idbeneficiario" => $_SESSION['login']['idusuario'],
        "cantidad"  =>  $_POST['cantidad'],
        "descripcion" =>  $_POST['descripcion'],
        "enbiblioteca"  => $_POST['enbiblioteca'],
        "lugardestino"  =>  $_POST['lugardestino'],
        "fechaprestamo" =>  $_POST['fechaprestamo'],
        "fechadevolucion" =>  $_POST['fechadevolucion']
      ];
      $datos = $userlibro->prestamousuario($datos);
      echo json_encode($datos);

    }else{
      $respuesta = [
      "status" => false,
      "message" =>"No puede solicitar más libros"
    ];
    echo json_encode($respuesta);
  }
    

  }

  if($_POST['operacion'] == 'historialusuario'){

    $datos = $userlibro->historialusuario($_SESSION['login']['idusuario']);
      echo json_encode($datos);
    
  }

  if($_POST['operacion'] == 'listarejemplar'){
    $datos = $userlibro->listarejemplar($_POST['idlibro']);
    echo json_encode($datos);

  }

  if($_POST['operacion'] == 'datospersonales'){
    
  }

  if($_POST['operacion'] == 'listarEjemplaresdisponibles'){
    $datos = $userlibro->listarEjemplaresdisponibles($_POST['idlibro'], $_POST['cantidad']);
    echo json_encode($datos);
  }


}