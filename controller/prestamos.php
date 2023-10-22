<?php

  require_once '../models/prestamos.php';

  if (isset($_POST['operacion'])){
  
    $prestamo = new Prestamos();

    if($_POST['operacion'] == 'listarcasiprestamo'){

      $datos = $prestamo->listarcasiprestamo();
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'listarprestamo'){

      $datos = $prestamo->listarprestamo();
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'filtrobeneficiario'){

      $datos = $prestamo->filtrobeneficiario();
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'registrarPrestamo'){
      $datosGuardar = [
        "idbeneficiario"     => $_POST['idbeneficiario'],
        "idbibliotecario"    => $_POST['idbibliotecario'],
        "fechaprestamo"    => $_POST['fechaprestamo'],
        "fecharespuesta"    => $_POST['fecharespuesta'],
        "fechaentrega"    => $_POST['fechaentrega'],
        "descripcion"    => $_POST['descripcion'],
        "enbiblioteca"    => $_POST['enbiblioteca'],
        "lugardestino"    => $_POST['lugardestino']
      ];
  
      $respuesta = $prestamo->registrarPrestamo($datosGuardar);
      echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'listarEpendientes'){

      $datos = $prestamo->listarEpendientes();
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'listarDpendientes'){

      $datos = $prestamo->listarDpendientes();
      if($datos){
        echo json_encode($datos);
      }
    }
    // prestamos update

    if($_POST['operacion'] == 'updateEpendiente'){
      $datosActulizar = [
        "idprestamo" => $_POST['idprestamo']
      ];
      $respuesta = $prestamo->updateEpendiente($datosActulizar);
      echo json_encode($respuesta);
    }
  
    if($_POST['operacion'] == 'registrarLibroentregado'){
      $datosGuardar = [
        "idprestamo"     => $_POST['idprestamo'],
        "idlibro"       => $_POST['idlibro'],
        "cantidad"      => $_POST['cantidad'],
        "condicionentrega" => $_POST['condicionentrega'],
        "fechadevolucion" => $_POST['fechadevolucion']
      ];

      $respuesta = $prestamo->registrarlibroentregado($datosGuardar);
      echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'registrarlibroentregadoReserva'){
      $datosGuardar = [
        "idprestamo"     => $_POST['idprestamo'],
        "idlibro"       => $_POST['idlibro'],
        "cantidad"      => $_POST['cantidad'],
        "condicionentrega" => $_POST['condicionentrega'],
        "fechadevolucion" => $_POST['fechadevolucion']
      ];

      $respuesta = $prestamo->registrarlibroentregadoReserva($datosGuardar);
      echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'updatedevoluciones'){
      $datosActulizar = [
        "idlibroentregado"    => $_POST['idlibroentregado'],
        "condiciondevolucion" => $_POST['condiciondevolucion'],
        "observaciones"       => $_POST['observaciones'],
        "idprestamo"          => $_POST['idprestamo']
      ];
  
      $respuesta = $prestamo->updatedevoluciones($datosActulizar);
      echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'selectcategoria'){

      $datos = $prestamo->selectcategoria();
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'selectsubcategoria'){
      $datos = $prestamo->selectsubcategoria($_POST['idcat']);
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'mostrarlibro'){
      $datos = $prestamo->mostrarlibro($_POST['idsubcat']);
      if($datos){
        echo json_encode($datos);
      }
    }
    
    if($_POST['operacion'] == 'fichaprestamo'){
      $datos = $prestamo->fichaprestamo($_POST['idlibroentregado']);
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'obtenerprestamo'){
      $datos = $prestamo->obtenerprestamo($_POST['idprestamo']);
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'conseguirlibro'){
      $datos = $prestamo->conseguirlibro($_POST['nombre']);
      if($datos){
        echo json_encode($datos);
      }
    }
    if($_POST['operacion'] == 'guardarLibro'){
      $datos = $prestamo->guardarLibro($_POST['idprestamo']);
      if($datos){
        echo json_encode($datos);
      }
    }
  }