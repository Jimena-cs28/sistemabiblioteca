<?php

require_once '../models/Contador.php';

if (isset($_POST['operacion'])){
   
  $contador = new Contador();

  if($_POST['operacion'] == 'cantAdmin'){
    $datos = $contador->cantAdmin();
    if($datos){
      echo json_encode($datos);
    }
  }
  if($_POST['operacion'] == 'cantDocente'){
    $datos = $contador->cantDocente();
    if($datos){
      echo json_encode($datos);
    }
  }
  if($_POST['operacion'] == 'cantEstudiantes'){
    $datos = $contador->cantEstudiantes();
    if($datos){
      echo json_encode($datos);
    }
  }
  if($_POST['operacion'] == 'cantLibro'){
    $datos = $contador->cantLibro();
    if($datos){
      echo json_encode($datos);
    }
  }
  
  if($_POST['operacion'] == 'cantCategoria'){
    $datos = $contador->cantCategoria();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'cantReservacion'){
    $datos = $contador->cantReservacion();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'cantDevolucion'){
    $datos = $contador->cantDevolucion();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'cantPrestamo'){
    $datos = $contador->cantPrestamo();
    if($datos){
      echo json_encode($datos);
    }
  }
}