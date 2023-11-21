<?php

require_once '../models/libros.php';

if (isset($_POST['operacion'])){
  
  $libro = new Libro();

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
    
    $rutaDestino = '';
    $nombreArchivo = '';
    $nombreGuardar = 'NULL';

    if(isset($_FILES['imagenportada'])){

      $rutaDestino = '../views/img/';
      //Nombre archivo (host)
      $nombreArchivo = sha1(date('c')) . ".jpg";
      //Ruta completa (ruta + nombre)
      $rutaDestino .= $nombreArchivo;
      
      if(move_uploaded_file($_FILES['imagenportada']['tmp_name'], $rutaDestino)){
        $nombreGuardar = $nombreArchivo;
      }
    }

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
      "imagenportada"     => $nombreGuardar,
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

  if($_POST['operacion'] == 'listarSubcategorias'){

    $datos = $libro->listarSubcategorias();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'librosInactivo'){

    $datos = $libro->librosInactivo();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'ActivarLibro'){

    $datos = $libro->ActivarLibro($_POST['idlibro']);
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'TraerEjemplar'){
    $datos = $libro->TraerEjemplar($_POST['idlibro']);
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'registrarEstudiante'){
    $datosGuardar = [
      "idlibro"             => $_POST['idlibro'],
      "cantidad"            => $_POST['cantidad'],
      "idsubcategoria"      => $_POST['idsubcategoria'],
      "ideditorial"         => $_POST['ideditorial'],
      "libro"               => $_POST['libro'],
      "tipo"                => $_POST['tipo'],   
      "numeropaginas"       => $_POST['numeropaginas'],
      "codigo"              => $_POST['codigo'],
      "edicion"             => $_POST['edicion'],    
      "formato"             => $_POST['formato'],    
      "anio"                => $_POST['anio'],    
      "idioma"              => $_POST['idioma'],
      "descripcion"         => $_POST['descripcion'],
      "imagenportada"       => $_POST['imagenportada'],
      "idautor"             => $_POST['idautor'],
      "iddetalleautor"     => $_POST['iddetalleautor']
    ];
    $respuesta = $libro->EditarLibro($datosGuardar);
    echo json_encode($respuesta);
  }

}
