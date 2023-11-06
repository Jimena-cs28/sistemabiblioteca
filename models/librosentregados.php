<?php
require_once '../config/conexion.php';

class LibroEntregado extends conexion{

  private $acesso;

  public function __CONSTRUCT()
  {
    $this->acesso = parent::getConexion();
  }
  
  public function obtenerlibroentregado($idlibroentregado){
    try{
      $consulta = $this->acesso->prepare("CALL spu_obtener_libroentregado(?)");
      $consulta->execute(array($idlibroentregado));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }  
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function traerlibroentregado($idlibroentregado){
    try{
      $consulta = $this->acesso->prepare("CALL spu_traer_datosD(?)");
      $consulta->execute(array($idlibroentregado));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }  
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function EditarEpendiente($datos = []){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_editar_Ependientes(?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idlibroentregado"],
          $datos["idprestamo"],
          $datos["fechadevolucion"],
          $datos["fechaprestamo"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. Codigo error: " . $e->getCode();
    }
    return $respuesta;
  } 
  
  public function obtenerDetalleautores($iddetalleautor){
    try{
      $consulta = $this->acesso->prepare("CALL spu_obtener_detalleautores(?)");
      $consulta->execute(array($iddetalleautor));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }  
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function listarSolicitud(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_solicitud_listar()");
      $consulta->execute();
      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function aceptarSolicitud($idprestamo){
    try {
      $consulta = $this->acesso->prepare("CALL spu_aceptar_solicitud(?)");
      $consulta->execute(array($idprestamo));

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function updatedevoluciones($datos = []){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_update_devoluciones(?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idlibroentregado"],
          $datos["idprestamo"],
          $datos["condiciondevolucion"],
          $datos["observaciones"],
          $datos["idlibro"],
          $datos["cantidad"]
          
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. Codigo error: " . $e->getCode();
    }

    return $respuesta;
  } 


}