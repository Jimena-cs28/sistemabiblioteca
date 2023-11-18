<?php
require_once '../config/conexion.php';

class Estudiantes extends conexion{

  private $acesso;

  public function __CONSTRUCT(){
    $this->acesso = parent::getConexion();
  }

  public function listarestudiante(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_listar_estudiantes()");
      $consulta->execute();
  
      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }catch(Exception $e){
        die($e->getMessage());
    }
  }

  public function mostrarRol(){
    try {
      $consulta = $this->acesso->prepare("SELECT nombrerol FROM roles WHERE idrol = 3");
      $consulta->execute();
  
      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarEstudiante($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_estudiante(?,?,?,?,?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["apellidos"],
          $datos["nombres"],
          $datos["nrodocumento"],
          $datos["tipodocumento"],
          $datos["fechanac"],
          $datos["direccion"],
          $datos["telefono"],
          $datos["email"],
          $datos["nombreusuario"],
          $datos["claveacceso"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getCode();
    }
    return $respuesta;
  
  }
  
  public function registrarDocente($datos = []){
      $respuesta = [
        "status" => false,
        "message" =>""
      ];
      
      try{
        $consulta = $this->acesso->prepare("CALL spu_registrar_profesor(?,?,?,?,?,?,?,?,?,?)");
        $respuesta["status"] = $consulta->execute(
          array(
            $datos["apellidos"],
            $datos["nombres"],
            $datos["nrodocumento"],
            $datos["tipodocumento"],
            $datos["fechanac"],
            $datos["direccion"],
            $datos["telefono"],
            $datos["email"],
            $datos["nombreusuario"],
            $datos["claveacceso"]
          )
        );
      }
      catch(Exception $e){
        $respuesta["message"] = "No se pudo completar". $e->getCode();
      }
      return $respuesta;
  }
  
  public function listarDocente(){
      try {
        $consulta = $this->acesso->prepare("CALL spu_listar_profesor()");
        $consulta->execute();
    
        $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
        return $datosObtenidos; 
      }catch(Exception $e){
        die($e->getMessage());
      }
  }

  public function EstudianteInactivo(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_inactivo_estudiantes()");
      $consulta->execute();
  
      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }catch(Exception $e){
        die($e->getMessage());
    }
  }

  public function ProfesorInactivo(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_inactivo_profesores()");
      $consulta->execute();
  
      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }catch(Exception $e){
        die($e->getMessage());
    }
  }

  public function SentenciarUser($idusuario){
    try {
      $consulta = $this->acesso->prepare("CALL spu_inabilitar_usuario(?)");
      $consulta->execute(array($idusuario));

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function HabilitarUser($idusuario){
    try {
      $consulta = $this->acesso->prepare("CALL spu_abilitar_usuario(?)");
      $consulta->execute(array($idusuario));

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}