<?php

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
    if($datos){
      echo json_encode($datos);
    }
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

}