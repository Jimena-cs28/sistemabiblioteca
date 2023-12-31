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
      $datos = $prestamo->filtroStudent();
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'filtroTeacher'){

      $datos = $prestamo->filtroTeacher();
      if($datos){
        echo json_encode($datos);
      }
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

    if($_POST['operacion'] == 'fichaprestamo'){
      $datos = $prestamo->fichaprestamo($_POST['idprestamo']);
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
      $datos = $prestamo->conseguirlibro();
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'traerprestamo'){
      $datos = $prestamo->traerprestamo($_POST['idbeneficiario']);
      if($datos){
        echo json_encode($datos);
      }
    }
    if($_POST['operacion'] == 'traerprestamoAhora'){
      $datos = $prestamo->traerprestamo($_POST['idbeneficiario']);
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'registrarSoloPrestamo'){
      $datosGuardar = [
        "idbeneficiario"     => $_POST['idbeneficiario'],
        "idbibliotecario"    => $_POST['idbibliotecario'],
        "fechaprestamo"      => $_POST['fechaprestamo'],
        "descripcion"       => $_POST['descripcion'],
        "enbiblioteca"       => $_POST['enbiblioteca'],
        "lugardestino"       => $_POST['lugardestino']
      ];
      $respuesta = $prestamo->registrarSoloPrestamo($datosGuardar);
      echo json_encode($respuesta);
    }
  
    if($_POST['operacion'] == 'registrarLibroentregado'){
      $datosGuardar = [
        "idprestamo"      => $_POST['idprestamo'],
        "idejemplar"         => $_POST['idejemplar'],
        "condicionentrega"         => $_POST['condicionentrega'],
        "fechadevolucion"       => $_POST['fechadevolucion']
      ];
      $respuesta = $prestamo->registrarLibroentregado($datosGuardar);
      echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'registrarAhora'){
      $datosGuardar = [
        "idbeneficiario"      => $_POST['idbeneficiario'],
        "idbibliotecario"     => $_POST['idbibliotecario'],
        "descripcion"       => $_POST['descripcion'],
        "enbiblioteca"      => $_POST['enbiblioteca'],
        "lugardestino"       => $_POST['lugardestino']
      ];
      $respuesta = $prestamo->registrarAhora($datosGuardar);
      echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'AddLibroentregadonow'){
      $datosGuardar = [
        "idprestamo"        => $_POST['idprestamo'],
        "idejemplar"           => $_POST['idejemplar'],
        "condicionentrega"           => $_POST['condicionentrega'],
        "fechadevolucion"       => $_POST['fechadevolucion']
      ];
      //$respuesta = $prestamo->AddLibroentregadonow($datosGuardar);
      echo json_encode($prestamo->AddLibroentregadonow($datosGuardar));
      // echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'traerDescripcion'){
      $datos = $prestamo->traerDescripcion($_POST['idusuario']);
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'CambiarEstado'){
      $datosActulizar = $prestamo->CambiarEstadoDev($_POST['idprestamo']);
      if($datosActulizar){
        echo json_encode($datosActulizar);
      }
    }

    if($_POST['operacion'] == 'SeachPrestamo'){
      $datos = $prestamo->SeachPrestamo($_POST['nombres']);
      if($datos){
        echo json_encode($datos);
      }
    }

    if($_POST['operacion'] == 'cancelarRevesva'){
      $datosActulizar = [
        "idprestamo"      => $_POST["idprestamo"],
        "motivo"          => $_POST["motivo"]
      ];
      echo json_encode($prestamo->cancelarRevesva($datosActulizar));
    }

    if($_POST['operacion'] == 'traerCondicion'){
      $datosActulizar = $prestamo->traerCondicion($_POST['idejemplar']);
      if($datosActulizar){
        echo json_encode($datosActulizar);
      }
    }

    if($_POST['operacion'] == 'conseguirlibrohistorial'){
      $datos = $prestamo->conseguirlibroH();
      if($datos){
        echo json_encode($datos);
      }
    }
    if($_POST['operacion'] == 'traerRol'){
      $datos = $prestamo->traerRol($_POST['idrol']);
      if($datos){
        echo json_encode($datos);
      }
    }
  }
  


