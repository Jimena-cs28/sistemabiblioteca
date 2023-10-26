<?php
require_once '../config/conexion.php';

class Prestamos extends conexion{

  private $acesso;

  public function __CONSTRUCT()
  {
    $this->acesso = parent::getConexion();
  }

  public function listarcasiprestamo(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_listar_todoprestamos()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function listarprestamo(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_listar_prestamos()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarPrestamo($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_prestamo(?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idbeneficiario"],
          $datos["idbibliotecario"],
          $datos["fechaprestamo"],
          $datos["descripcion"],
          $datos["enbiblioteca"],
          $datos["lugardestino"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getCode();
    }
    return $respuesta;
  }

  public function filtrobeneficiario(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_filtro_student()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  } 
  
  public function listarEpendientes(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_listar_entregaspendiente()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function listarDpendientes(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_listar_devolucionpendientes()");
      $consulta->execute();

      $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
      return $datosObtenidos; 
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function updateEpendiente($datos = []){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_update_pentregasp(?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idprestamo"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. Codigo error: " . $e->getCode();
    }
    return $respuesta;
  } 

  public function registrarlibroentregado($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_libroentregado_ahora(?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idprestamo"],
          $datos["idlibro"],
          $datos["cantidad"],
          $datos["condicionentrega"],
          $datos["fechadevolucion"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getCode();
    }
    return $respuesta;
  }

  public function registrarlibroentregadoReserva($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_libroentregado_reservar(?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idprestamo"],
          $datos["idlibro"],
          $datos["cantidad"],
          $datos["condicionentrega"],
          $datos["fechadevolucion"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getCode();
    }
    return $respuesta;
  }

  public function updatedevoluciones($datos = []){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_update_devoluciones(?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idlibroentregado"],
          $datos["idprestamo"],
          $datos["condiciondevolucion"],
          $datos["observaciones"]
          
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ah podido completar el proceso. Codigo error: " . $e->getCode();
    }

    return $respuesta;
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

  public function selectsubcategoria($idcat){
    try{
      $consulta = $this->acesso->prepare("CALL spu_listar_subcategoria(?)");
      $consulta->execute(array($idcat));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function mostrarlibro($idsubcat){
    try{
      $consulta = $this->acesso->prepare("CALL spu_mostrar_libro(?)");
      $consulta->execute(array($idsubcat));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
  
  public function fichaprestamo($idlibroentregado){
    try{
      $consulta = $this->acesso->prepare("CALL spu_listar_fichaprestamo(?)");
      $consulta->execute(array($idlibroentregado));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function obtenerprestamo($idprestamo){
    try{
      $consulta = $this->acesso->prepare("CALL spu_obtener_prestamo(?)");
      $consulta->execute(array($idprestamo));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function conseguirlibro($nombre){
    try{
      $consulta = $this->acesso->prepare("CALL spu_conseguir_libro(?)");
      $consulta->execute(array($nombre));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function guardarLibro($idprestamo){
    try{
      $consulta = $this->acesso->prepare("CALL spu_libro(?)");
      $consulta->execute(array($idprestamo));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}