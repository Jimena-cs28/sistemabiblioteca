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
}