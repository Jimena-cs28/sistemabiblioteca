<?php
require_once '../config/conexion.php';

class Reporte extends conexion{

    private $acesso;

    public function __CONSTRUCT(){
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

    public function reporteSolicitud($fecha1, $fecha2){
        try{
            $consulta = $this->acesso->prepare("CALL spu_reporte_fechasolicitud(?,?)");
            $consulta->execute(array($fecha1, $fecha2));
            $data = $consulta->fetchAll(PDO::FETCH_ASSOC);
            return $data;
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    public function listarReporte(){
        try {
            $consulta = $this->acesso->prepare("CALL spu_listar_reporte()");
            $consulta->execute();
    
            $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
            return $datosObtenidos; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    public function reporteUsuario($idusuario){
        try {
            $consulta = $this->acesso->prepare("CALL spu_reporte_idusuario(?)");
            $consulta->execute(array($idusuario));
            $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
            return $datosObtenidos; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }
    }
}