<?php
require_once '../config/conexion.php';
date_default_timezone_set('America/Lima');
class Libro extends conexion{

  private $acesso;

  public function __CONSTRUCT()
  {
    $this->acesso = parent::getConexion();
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

  public function selectAutor(){
    try {
      $consulta = $this->acesso->prepare("SELECT * FROM autores");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function listarSubcategoria(){
    try {
      $consulta = $this->acesso->prepare("SELECT * FROM subcategorias");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarLibro($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    
    try{
      

      $consulta = $this->acesso->prepare("CALL spu_registrar_libro(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idsubcategoria"],
          $datos["ideditorial"],
          $datos["nombre"],
          $datos["tipo"],
          $datos["cantidad"],
          $datos["numeropaginas"],
          $datos["codigo"],
          $datos["edicion"],
          $datos["formato"],
          $datos["anio"],
          $datos["idioma"],
          $datos["descripcion"],
          $datos["imagenportada"],
          $datos["idautor"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  
  }

  public function listadolibro(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_listado_libros()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  
  }

  public function listarSubcategorias(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_listar_subcategorias()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  
  }

  public function librosInactivo(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_inactivo_libros()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function ActivarLibro($idcat){
    try{
      $consulta = $this->acesso->prepare("CALL spu_abilitar_libro(?)");
      $consulta->execute(array($idcat));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

}