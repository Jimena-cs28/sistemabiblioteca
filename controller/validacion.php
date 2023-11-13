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
}