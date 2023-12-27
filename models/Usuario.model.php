<?php
  require_once "../config/conexion.php";

  class Usuario extends Conexion{
    private $conexion;
    public function __CONSTRUCT(){
      $this->conexion = parent::getConexion();
    }

    public function login($nombreUsuario = '') {
      try {
        $consulta = $this->conexion->prepare("CALL spu_login(?)");
        $consulta->execute(array($nombreUsuario));
        return $consulta->fetch(PDO::FETCH_ASSOC);
      } catch (Exception $e) {
        die($e->getMessage());
      }
    }

    public function NuevaContraseña($datos = []){
      $respuesta = [
        "status" => false,
        "message" => ""
      ];
      try{
        $consulta = $this->conexion->prepare("CALL spu_olvidar_contraseña(?,?)");
        $respuesta["status"] = $consulta->execute(
          array(
            $datos["usuario"],
            $datos["clave"]
          )
        );
      }
      catch(Exception $e){
        $respuesta["message"] = "No se ah podido completar el proceso. Codigo error: " . $e->getCode();
      }
      return $respuesta;
    } 
  }
?>