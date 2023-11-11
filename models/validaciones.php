<?php
require_once '../config/conexion.php';

class Validacion extends conexion{

    private $acesso;

    public function __CONSTRUCT()
    {
        $this->acesso = parent::getConexion();
    }
    public function CancelarReserva($datos = []){
    $respuesta = [
        "status" => false,
        "message" =>""
    ];
    
    try{
        $consulta = $this->acesso->prepare("CALL spu_cancelar_reserva(?,?,?)");
        $respuesta["status"] = $consulta->execute(
            array(
            $datos["idprestamo"],
            $datos["idlibro"],
            $datos["cantidad"]
            )
        );
    }
    catch(Exception $e){
        $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
    }

}