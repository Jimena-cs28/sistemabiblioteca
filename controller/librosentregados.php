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
  
  if($_POST['operacion'] == 'SentenciaLibro'){

    $datos = $libroentregado->SentenciaLibro($_POST['idlibro']);
    if($datos){
      echo json_encode($datos);
    }
  }
  if($_POST['operacion'] == 'GraficoIndex1'){

    $datos = $libroentregado->GraficoIndex1();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'Grafico2'){
    $datos = $libroentregado->Grafico2($_POST['idrol']);
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'selectGrado'){

    $datos = $libroentregado->selectGrado();
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'tablareporte'){
    $datos = $libroentregado->tablareporte($_POST['descripcion']);
    if($datos){
      echo json_encode($datos);
    }
  }

  if($_POST['operacion'] == 'traerEjemplar'){
    $datos = $libroentregado->traerEjemplar($_POST['idprestamo']);
    if($datos){
      echo json_encode($datos);
    }
  }
}
