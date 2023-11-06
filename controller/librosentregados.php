<?php

require_once '../models/librosentregados.php';

if (isset($_POST['operacion'])){

  $libroentregado = new LibroEntregado();

  if($_POST['operacion'] == 'obtenerlibroentregado'){
    $datos = $libroentregado->obtenerlibroentregado($_POST['idlibroentregado']);
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'traerlibroentregado'){
    $datos = $libroentregado->traerlibroentregado($_POST['idlibroentregado']);
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'EditarEpendiente'){
    $datosGuardar = [
      "idlibroentregado"     => $_POST['idlibroentregado'],
      "idprestamo"       => $_POST['idprestamo'],
      "fechadevolucion" => $_POST['fechadevolucion'],
      "fechaprestamo" => $_POST['fechaprestamo']
    ];

    $respuesta = $libroentregado->EditarEpendiente($datosGuardar);
    echo json_encode($respuesta);
  }

  if($_POST['operacion'] == 'obtenerDetalleautores'){
    $datos = $libroentregado->obtenerDetalleautores($_POST['iddetalleautor']);
    if($datos){                        
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'listarSolicitud'){

    $datos = $libroentregado->listarSolicitud();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'aceptarSolicitud'){

    $datos = $libroentregado->aceptarSolicitud($_POST['idprestamo']);
    if($datos){
      echo json_encode($datos);
    }
  }
  

  if($_POST['operacion'] == 'updatedevoluciones'){
    $datosActulizar = [
      "idlibroentregado"    => $_POST['idlibroentregado'],
      "idprestamo"          => $_POST['idprestamo'],
      "condiciondevolucion" => $_POST['condiciondevolucion'],
      "observaciones"       => $_POST['observaciones'],
      "idlibro"             => $_POST['idlibro'],
      "cantidad"            => $_POST["cantidad"]
      
    ];

    $respuesta = $libroentregado->updatedevoluciones($datosActulizar);
    echo json_encode($respuesta);
  }
}