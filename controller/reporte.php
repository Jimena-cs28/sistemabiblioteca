<?php

require_once '../models/reporte.php';

if (isset($_POST['operacion'])){

    $reporte = new Reporte();

    if($_POST['operacion'] == 'tablareporte'){
        $datos = $reporte->tablareporte($_POST['descripcion']);
        if($datos){
            echo json_encode($datos);
        }
    }

    if($_POST['operacion'] == 'reporteSolicitud'){
        $datos = [
            "fechasolicitud"      => $_POST['fechasolicitud'],
            "fechasolicitud1"      => $_POST['fechasolicitud1']
        ];
        echo json_encode($reporte->reporteSolicitud($datos));
    }

    if($_POST['operacion'] == 'listarReporte'){
        $datos = $reporte->listarReporte();
        if($datos){
            echo json_encode($datos);
        }
    }
}