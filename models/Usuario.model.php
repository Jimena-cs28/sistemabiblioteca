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

    public function registrarAutor($datos = []){
      $respuesta = [
        "status" => false,
        "message" =>""
      ];
      
      try{
        $consulta = $this->conexion->prepare("CALL spu_register_autor(?,?,?,?)");
        $respuesta["status"] = $consulta->execute(
          array(
            $datos["nombres"],
            $datos["apellidos"],
            $datos["seudonimio"],
            $datos["nacionalidad"]
          )
        );
      }
      catch(Exception $e){
        $respuesta["message"] = "No se pudo completar". $e->getMessage();
      }
      return $respuesta;
    }
  }
?>