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

  public function prestamousuario($datos = []){
    $respuesta = [
      "status" => false,
      "message" =>""
    ];
    
    try{
      $consulta = $this->acesso->prepare("CALL spu_registrar_solicitud_usuario(?,?,?,?,?,?,?)");
      $respuesta["status"] = $consulta->execute(
        array(
          $datos["idlibro"],
          $datos["idbeneficiario"],
          $datos["cantidad"],
          $datos["descripcion"],
          $datos["enbiblioteca"],
          $datos["lugardestino"],
          $datos["fechaprestamo"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["message"] = "No se pudo completar". $e;
    }
    return $respuesta;
  }

  public function validarprestado($idusuario){
    $consulta = $this ->acesso->prepare("CALL spu_validar_libroprestado(?)");
    $consulta->execute(array(
      $idusuario 
    ));
    return $consulta->fetch(PDO::FETCH_ASSOC);
  }

  public function historialusuario($idusuario){
    $consulta = $this ->acesso->prepare("CALL spu_historial(?)");
    $consulta->execute(array(
      $idusuario 
    ));
    return $consulta->fetchAll(PDO::FETCH_ASSOC);
  }

  public function listarejemplar($idlibro){
    $consulta = $this ->acesso->prepare("CALL spu_ejemplarlibro(?)");
    $consulta->execute(array(
      $idlibro 
    ));
    return $consulta->fetchAll(PDO::FETCH_ASSOC);
  }

  public function datospersonales($idusuario){
    $consulta = $this ->acesso->prepare("CALL spu_datos_personales(?)");
    $consulta->execute(array(
      $idusuario 
    ));
    return $consulta->fetch(PDO::FETCH_ASSOC);

  }

  public function listarejemplaresdisponibles($idlibro, $cantidad){
    $consulta = $this ->acesso->prepare("CALL spu_listar_ejemplares(?,?)");
    $consulta->execute(array(
      $idlibro, $cantidad 
    ));
    return $consulta->fetchAll(PDO::FETCH_ASSOC);
  }

  public function registrarlibrosentregados($datos){
    $consulta = $this->acesso->prepare("CALL spu_registrar_libros_entregados(?,?,?,?)");
    $consulta->execute(array(
      $datos["idejemplar"],
      $datos["observacion"],
      $datos["idprestamo"],
      $datos["fechadevolucion"],
    ));

  }

  public function cambiarestadoprestamo($estado, $idprestamo){
    $consulta = $this->acesso->prepare("CALL spu_actualizar_estados_librosentregados(?,?)");
    return $consulta->execute(array(
      $estado, $idprestamo
    ));
  }
  public function cancelarsolicitud($idprestamo, $motivo){
    $consulta = $this->acesso->prepare("CALL spu_rechazar_solicitud(?,?)");
    return $consulta->execute(array(
      $idprestamo, $motivo
    ));

  }
  

}