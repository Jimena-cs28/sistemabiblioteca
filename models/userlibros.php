<?php
require_once '../config/conexion.php';
date_default_timezone_set('America/Lima');
class userlibro extends conexion{

  private $acesso;

  public function __CONSTRUCT()
  {
    $this->acesso = parent::getConexion();
  }

  public function listarLibroUser($datos){
  try {
    $consulta = $this->acesso->prepare("CALL spu_listar_libro_user(?,?,?)");
    $consulta->execute(array(
      $datos["subcategoria"],
      $datos["idcategoria"],
      $datos["nombres"]
    ));

    $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
    return $datosObtenidos; 
  }
  catch(Exception $e){
    die($e->getMessage());
  }

  }

  public function buscarlibro($idlibro){
    try {
      $consulta = $this->acesso->prepare("CALL spu_buscar_libro(?)");
      $consulta->execute(array($idlibro));
  
      $datosObtenidos = $consulta->fetch(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  
    }

    public function listlibro(){
      try {
        $consulta = $this->acesso->prepare("CALL spu_list_libro()");
        $consulta->execute();
    
        $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
        return $datosObtenidos; 
      }
      catch(Exception $e){
        die($e->getMessage());
      }
    
      } 

  public function selectsubcategoria($idcat){
    try{
      $consulta = $this->acesso->prepare("CALL spu_listar_subcategoria_user(?)");
      $consulta->execute(array($idcat));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
  
  public function selectcategoria(){
    try {
      $consulta = $this->acesso->prepare("SELECT idcategoria, categoria FROM categorias");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function selectEditorial(){
    try {
      $consulta = $this->acesso->prepare("SELECT * FROM editoriales");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

}