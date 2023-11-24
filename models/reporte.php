<?php
require_once '../config/conexion.php';

class Reporte extends conexion{

    private $acesso;

    public function __CONSTRUCT()
    {
        $this->acesso = parent::getConexion();
    }

    
    public function tablareporte($descripcion){
        try {
            $consulta = $this->acesso->prepare("CALL spu_reporte_descripcion(?)");
            $consulta->execute(array($descripcion));
            $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
            return $datosObtenidos; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

}