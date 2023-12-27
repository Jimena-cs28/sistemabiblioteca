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

    if($_POST['operacion'] == 'updatedevolucionesUnoMal'){
        $datosActulizar = [
            "idejemplar"            => $_POST['idejemplar'],
            "idlibroentregado"      => $_POST["idlibroentregado"],
            "observaciones"         => $_POST["observaciones"],
            "condiciondevoluciones" => $_POST["condiciondevoluciones"]
        ];
        $respuesta = $validacion->updatedevolucionesUnoMal($datosActulizar);
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
    if($_POST['operacion'] == 'registrarAutor'){
        $datosGuardar = [
            "nombres"     => $_POST['nombres'],
            "apellidos"    => $_POST['apellidos'],
            "seudonimio"      => $_POST['seudonimio'],
            "nacionalidad"       => $_POST['nacionalidad']
        ];
        $respuesta = $validacion->registrarAutor($datosGuardar);
        echo json_encode($respuesta);
    }
    
    if($_POST['operacion'] == 'registrarCategoria'){
        $datosGuardar = [
            "categoria"     => $_POST['categoria'],
            "codigo"    => $_POST['codigo']
        ];
        $respuesta = $validacion->registrarCategoria($datosGuardar);
        echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'registrarEditorial'){
        $datosGuardar = [
            "nombres"     => $_POST['nombres'],
            "telefono"    => $_POST['telefono'],
            "web"      => $_POST['web'],
            "email"       => $_POST['email'],
            "paisorigen"       => $_POST['paisorigen']
        ];
        $respuesta = $validacion->registrarEditorial($datosGuardar);
        echo json_encode($respuesta);
    }

    if($_POST['operacion'] == 'updateAdmin'){
        $nuevo = [
            "idusuario"     => $_POST['idusuario'],
            "apellidos"       =>   $_POST['apellidos'],
            "nombres"       =>   $_POST['nombres'],
            "dni"       =>   $_POST['dni'],
            "fechanc"       =>   $_POST['fechanc'],
            "direccion"       =>   $_POST['direccion'],
            "telefono"       =>   $_POST['telefono'],
            "email"       =>   $_POST['email'],
            "usuario"       =>   $_POST['usuario']
        ];
        $respuesta = $validacion->updateAdmin($nuevo);
        echo json_encode($respuesta);
    }
}