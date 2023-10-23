<?php

require_once '../models/libros.php';

if (isset($_POST['operacion'])){
  
  $libro = new Libro();

  if($_POST['operacion'] == 'listarlibro'){

    $datos = $libro->listarlibro();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'selectcategoria'){

    $datos = $libro->selectcategoria();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'selectEditorial'){

    $datos = $libro->selectEditorial();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'registrarLibro'){
    $datosGuardar = [
      "idsubcategoria"     => $_POST['idsubcategoria'],
      "ideditorial"       => $_POST['ideditorial'],
      "nombre"            => $_POST['nombre'],
      "tipo"              => $_POST['tipo'],
      "cantidad"          => $_POST['cantidad'],
      "numeropaginas"     => $_POST['numeropaginas'],
      "codigo"            => $_POST['codigo'],
      "edicion"           => $_POST['edicion'],
      "formato"           => $_POST['formato'],
      "anio"              => $_POST['anio'],
      "idioma"            => $_POST['idioma'],
      "descripcion"       => $_POST['descripcion'],
      "imagenportada"     => $_POST['imagenportada'],
      "idautor"           => $_POST['idautor']
    ];

    $respuesta = $libro->registrarLibro($datosGuardar);
    echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'listadolibro'){

    $datos = $libro->listadolibro();
    if($datos){
      echo json_encode($datos);
    }
  }
  if($_POST['operacion'] == 'selectAutores'){
    $datos = $libro->selectAutor();
    if($datos){
      echo json_encode($datos);
    }
  }
}
