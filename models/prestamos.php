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

  public function filtroStudent(){
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

  public function filtroTeacher(){
    try {
      $consulta = $this->acesso->prepare("CALL spu_filtro_teacher()");
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

  public function fichaprestamo($idprestamo){
    try{
      $consulta = $this->acesso->prepare("CALL spu_listar_fichaprestamo(?)");
      $consulta->execute(array($idprestamo));

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

  public function conseguirlibro(){
    try{
      $consulta = $this->acesso->prepare("CALL spu_conseguir_libro()");
      $consulta->execute();

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function traerprestamo($idbeneficiario){
    try{
      $consulta = $this->acesso->prepare("CALL spu_traer_prestamo(?)");
      $consulta->execute(array($idbeneficiario));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarSoloPrestamo($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_prestamo_reservar(?,?,?,?,?,?)");
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
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function registrarLibroentregado($datos = []){
    try{
      $consulta = $this->acesso->prepare("CALL spu_libroentregado_register(?,?,?,?)");
      // $respuesta["status"] = 
      $consulta->execute(
        array(
          $datos["idprestamo"],
          $datos["idejemplar"],
          $datos["condicionentrega"],
          $datos["fechadevolucion"]
        )
      );
      return $consulta->fetchAll(PDO::FETCH_NUM);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function registrarAhora($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_prestamo_ahora(?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idbeneficiario"],
          $datos["idbibliotecario"],
          $datos["descripcion"],
          $datos["enbiblioteca"],
          $datos["lugardestino"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function AddLibroentregadonow($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    try{
      $consulta = $this->acesso->prepare("CALL spu_libroentregado_AddAhora(?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idprestamo"],
          $datos["idejemplar"],
          $datos["condicionentrega"],
          $datos["fechadevolucion"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e->getMessage();
    }
    return $respuesta;
  }

  public function traerDescripcion($idusuario){
    try{
      $consulta = $this->acesso->prepare("CALL spu_traer_grado(?)");
      $consulta->execute(array($idusuario));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function CambiarEstadoDev($idprestamo){
    try{
      $consulta = $this->acesso->prepare("CALL spu_cambiarEstado_Devolucion(?)");
      $consulta->execute(array($idprestamo));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function SeachPrestamo($nombres){
    try{
      $consulta = $this->acesso->prepare("CALL spu_search_prestamo(?)");
      $consulta->execute(array($nombres));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function cancelarRevesva($datos){
    try{
      $consulta = $this->acesso->prepare("CALL spu_cancelar_reserva(?,?)");
      $consulta->execute(
        array(
          $datos["idprestamo"],
          $datos["motivo"]
        )
      );
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function traerCondicion($idejemplar){
    try{
      $consulta = $this->acesso->prepare("CALL spu_traercondicion_ejemplar(?)");
      $consulta->execute(array($idejemplar));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function conseguirlibroH(){
    try{
      $consulta = $this->acesso->prepare("CALL spu_conseguir_libro_historial()");
      $consulta->execute();

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function traerRol($idrol){
    try{
      $consulta = $this->acesso->prepare("CALL spu_traer_rol(?)");
      $consulta->execute(array($idrol));

      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

}
