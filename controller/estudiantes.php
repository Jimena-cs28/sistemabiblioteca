<?php

require_once '../models/estudiantes.php';

if (isset($_POST['operacion'])){
   
  $estudiantes = new Estudiantes();

  if($_POST['operacion'] == 'listarestudiantes'){
    $datos = $estudiantes->listarestudiante();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'listarDocente'){
    $datos = $estudiantes->listarDocente();
    if($datos){
      echo json_encode($datos);
    }
  }
  
  if($_POST['operacion'] == 'mostrarRol'){
    $datos = $estudiantes->mostrarRol();
    if($datos){
      echo json_encode($datos);
    }
  }
  if($_POST['operacion'] == 'registrarEstudiante'){
    $datosGuardar = [
      "apellidos"     => $_POST['apellidos'],
      "nombres"       => $_POST['nombres'],
      "nrodocumento"      => $_POST['nrodocumento'],
      "tipodocumento"    => $_POST['tipodocumento'],
      "fechanac"    => $_POST['fechanac'],
      "direccion"    => $_POST['direccion'],
      "telefono"    => $_POST['telefono'],
      "email"    => $_POST['email'],
      "nombreusuario"    => $_POST['nombreusuario'],
      "claveacceso"    => $_POST['claveacceso']
    ];

    $respuesta = $estudiantes->registrarEstudiante($datosGuardar);
    echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'registrarDocente'){
    $datosGuardar = [
      "apellidos"     => $_POST['apellidos'],
      "nombres"       => $_POST['nombres'],
      "nrodocumento"      => $_POST['nrodocumento'],
      "tipodocumento"    => $_POST['tipodocumento'],
      "fechanac"    => $_POST['fechanac'],
      "direccion"    => $_POST['direccion'],
      "telefono"    => $_POST['telefono'],
      "email"    => $_POST['email'],
      "nombreusuario"    => $_POST['nombreusuario'],
      "claveacceso"    => $_POST['claveacceso']
    ];

    $respuesta = $estudiantes->registrarDocente($datosGuardar);
    echo json_encode($respuesta);
  }
}