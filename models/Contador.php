<?php
require_once '../config/conexion.php';

class Contador extends conexion{

  private $acesso;

  public function __CONSTRUCT()
  {
    $this->acesso = parent::getConexion();
  }

  public function cantAdmin(){
    try {
        $consulta = $this->acesso->prepare("CALL spu_cantidad_Administrador()");
        $consulta->execute();
        $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
        return $datosObtenidos; 
    }
    catch(Exception $e){
        die($e->getMessage());
    }  
  }
  public function cantDocente(){
    try {
        $consulta = $this->acesso->prepare("CALL spu_cantidad_profesor()");
        $consulta->execute();
        $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
        return $datosObtenidos; 
    }
    catch(Exception $e){
        die($e->getMessage());
    }  
  }

  public function cantEstudiantes(){
    try {
        $consulta = $this->acesso->prepare("CALL spu_cantidad_estudiantes()");
        $consulta->execute();
        $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
        return $datosObtenidos; 
    }
    catch(Exception $e){
        die($e->getMessage());
    }  
  }

    public function cantLibro(){
        try {
            $consulta = $this->acesso->prepare("CALL spu_cantidad_libros()");
            $consulta->execute();
            $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
            return $datosObtenidos; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }  
    }

    public function cantCategoria(){
        try {
            $consulta = $this->acesso->prepare("CALL spu_cantidad_categorias()");
            $consulta->execute();
            $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
            return $datosObtenidos; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }  
    }

    public function cantReservacion(){
        try {
            $consulta = $this->acesso->prepare("CALL spu_cantidad_reservaciones()");
            $consulta->execute();
            $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
            return $datosObtenidos; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }  
    }

    public function cantDevolucion(){
        try {
            $consulta = $this->acesso->prepare("CALL spu_cantidad_devoluciones()");
            $consulta->execute();
            $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
            return $datosObtenidos; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }  
    }
    public function cantPrestamo(){
        try {
            $consulta = $this->acesso->prepare("CALL spu_cantidad_prestamos()");
            $consulta->execute();
            $datosObtenidos = $consulta->fetchAll(PDO::FETCH_ASSOC);    //Arreglo asociativo
            return $datosObtenidos; 
        }
        catch(Exception $e){
            die($e->getMessage());
        }  
    }
  
}