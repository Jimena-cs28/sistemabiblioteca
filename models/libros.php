<?php
require_once '../config/conexion.php';
date_default_timezone_set('America/Lima');
class Libro extends conexion{

  private $acesso;

  public function __CONSTRUCT()
  {
    $this->acesso = parent::getConexion();
  }

  public function listarlibro(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_listarlibro()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
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
      $rutaDestino = '';
      $nombreArchivo = '';
      $nombreGuardar = 'NULL';

      if(isset($_FILES['imagenportada'])){

        $rutaDestino = '../views/img/';
        //Nombre archivo (host)
        $nombreArchivo = sha1(date('c')) . ".jpg";
        //Ruta completa (ruta + nombre)
        $rutaDestino .= $nombreArchivo;
        
        if(move_uploaded_file($_FILES['imagenportada']['tmp_name'], $rutaDestino)){
          $nombreGuardar = $nombreArchivo;
        }
      }

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
          $datos["idautor"],
          $nombreGuardar
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getCode();
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
}