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
      $consulta = $this->acesso->prepare("SELECT *  FROM categorias");
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
          $datos["condicion"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function EditarLibro($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_aumentar_libro(?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idlibro"],
          $datos["cantidad"],
          $datos["condicion"]
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

  public function TraerEjemplar($idlibro){
    try{
      $consulta = $this->acesso->prepare("CALL spu_ejemplar_idlibro(?)");
      $consulta->execute(array($idlibro));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }  
  public function buscarBook($nombre){
    try{
      $consulta = $this->acesso->prepare("CALL spu_search_book(?)");
      $consulta->execute(array($nombre));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function ActivarEstado($dato = []){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_activar_estado_ejem(?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $dato["idejemplar"],
          $dato["condicion"]
        )
      );
      // return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Codigo error: " . $e->getMessage();
    }
    return $respuesta;
  }

  public function registrarCategoria($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_subcategory(?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idcategoria"],
          $datos["subcategoria"],
          $datos["codigo"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function UpdateBook($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_update_libro(?,?,?,?,?,?,?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idlibro"],
          $datos["idsubcategoria"],
          $datos["ideditorial"],
          $datos["libro"],
          $datos["tipo"],
          $datos["numeropaginas"],
          $datos["codigo"],
          $datos["edicion"],
          $datos["formato"],
          $datos["anio"],
          $datos["idioma"],
          $datos["descripcion"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function traerSibcategoria($idcategoria){
    try{
      $consulta = $this->acesso->prepare("CALL spu_traer_subcategoria(?)");
      $consulta->execute(array($idcategoria));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function UpdateImg($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_update_img(?,?,?,?,?,?,?,?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idlibro"],         
          $datos["idsubcategoria"],
          $datos["ideditorial"],
          $datos["libro"],
          $datos["tipo"],
          $datos["numeropaginas"],
          $datos["codigo"],
          $datos["edicion"],
          $datos["formato"],
          $datos["anio"],
          $datos["idioma"],
          $datos["descripcion"],
          $datos["imagenportada"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function traerIdlibroA(){
    try{
      $consulta = $this->acesso->prepare("CALL spu_traer_idlibro_autor()");
      $consulta->execute();

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarAutor($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_autores(?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idlibro"],
          $datos["idautor"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function TraerAutor($idlibro){
    try{
      $consulta = $this->acesso->prepare("CALL spu_traer_Autor(?)");
      $consulta->execute(array($idlibro));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function UpdateActor($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_actualizar_actores(?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["iddetalleautor"],
          $datos["idlibro"],
          $datos["idautor"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function DesactivarDetalleautor($iddetalleautor){
    try{
      $consulta = $this->acesso->prepare("CALL spu_desactivar_detalleautor(?)");
      $consulta->execute(array($iddetalleautor));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}