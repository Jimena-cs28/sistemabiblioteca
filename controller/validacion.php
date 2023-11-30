<?php

require_once '../models/validaciones.php';

if (isset($_POST['operacion'])){
    
    $validacion = new Validacion();

    if($_POST['operacion'] == 'CancelarReserva'){
        $datosGuardar = [
            "idprestamo"     => $_POST['idprestamo'],
            "idlibro"    => $_POST['idlibro'],
            "cantidad"      => $_POST['cantidad']
        ];
        $respuesta = $prestamo->CancelarReserva($datosGuardar);
        echo json_encode($respuesta);
    }
    
    if($_POST['operacion'] == 'filtroEjemplar'){
        $datos = $validacion->filtroEjemplar($_POST['idlibro']);
        if($datos){
            echo json_encode($datos);
        }
    }
    
    if($_POST['operacion'] == 'updatedevolucionesUno'){
        $datosActulizar = [
            "idejemplar"            => $_POST['idejemplar'],
            "idlibroentregado"      => $_POST["idlibroentregado"]
        ];
    
        $respuesta = $validacion->updatedevolucionesUno($datosActulizar);
        echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'updatedevolucionesTodos'){
        $datosActulizar = [
            "idprestamo"            => $_POST['idprestamo'],
            "condiciondevolucion"   => $_POST['condiciondevolucion'],
            "observaciones"         => $_POST['observaciones']
        ];
    
        $respuesta = $validacion->updatedevolucionesTodos($datosActulizar);
        echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'DesactivarEjem'){
        $datos = $validacion->DesacEjemplar($_POST['idejemplar']);
        if($datos){
            echo json_encode($datos);
        }
    }

    if($_POST['operacion'] == 'TraerDatos'){
        $datos = $validacion->TraerDatos($_POST['idusuario']);
        if($datos){
            echo json_encode($datos);
        }
    }
}