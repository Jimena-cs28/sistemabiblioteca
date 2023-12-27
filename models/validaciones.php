<?php
require_once '../config/conexion.php';

class Validacion extends conexion{

    private $acesso;

    public function __CONSTRUCT()
    {
        $this->acesso = parent::getConexion();
    }
    public function CancelarReserva($datos = []){
        $respuesta = [
            "status" => false,
            "message" =>""
        ];
        
        try{
            $consulta = $this->acesso->prepare("CALL spu_cancelar_reserva(?,?,?)");
            $respuesta["status"] = $consulta->execute(
                array(
                $datos["idprestamo"],
                $datos["idlibro"],
                $datos["cantidad"]
                )
            );
        }
        catch(Exception $e){
            $respuesta["message"] = "No se pudo completar". $e->getMessage();
        }
        return $respuesta;
    }
    
    public function filtroEjemplar($idlibro){
        try{
            $consulta = $this->acesso->prepare("CALL spu_filtrar_ejemplares(?)");
            $consulta->execute(array($idlibro));
    
            return $consulta->fetchAll(PDO::FETCH_ASSOC);
        }  
        catch(Exception $e){
            die($e->getMessage());
        }
    }

    public function updatedevolucionesUno($datos = []){
        $respuesta = [
            "status" => false,
            "message" => ""
        ];
        try{
            $consulta = $this->acesso->prepare("CALL spu_update_ejemplar(?,?)");
            $respuesta["status"] = $consulta->execute(
                array(
                    $datos["idejemplar"],
                    $datos["idlibroentregado"]
                    
                )
            );
        }
        catch(Exception $e){
            $respuesta["message"] = "No se ah podido completar el proceso. Codigo error: " . $e->getMessage();
        }
        return $respuesta;
    } 

    public function updatedevolucionesUnoMal($datos = []){
        $respuesta = [
            "status" => false,
            "message" => ""
        ];
        try{
            $consulta = $this->acesso->prepare("CALL spu_update_ejemplar_mal(?,?,?,?)");
            $respuesta["status"] = $consulta->execute(
                array(
                    $datos["idejemplar"],
                    $datos["idlibroentregado"],
                    $datos["observaciones"],
                    $datos["condiciondevoluciones"]
                    
                )
            );
        }
        catch(Exception $e){
            $respuesta["message"] = "No se ah podido completar el proceso. Codigo error: " . $e->getMessage();
        }
        return $respuesta;
    } 

    public function updatedevolucionesTodos($datos = []){
        $respuesta = [
            "status" => false,
            "message" => ""
        ];
        try{
            $consulta = $this->acesso->prepare("CALL spu_updateD_todo_prestamo(?,?,?)");
            $respuesta["status"] = $consulta->execute(
                array(
                    $datos["idprestamo"],
                    $datos["condiciondevolucion"],
                    $datos["observaciones"]
                    
                )
            );
        }
        catch(Exception $e){
            $respuesta["message"] = "No se ha podido completar el proceso. Codigo error: " . $e->getMessage();
        }
        return $respuesta;
    }

    public function DesacEjemplar($idejemplar){
        try{
            $consulta = $this->acesso->prepare("CALL spu_desactivar_ejemplar(?)");
            $consulta->execute(array($idejemplar));
            return $consulta->fetchAll(PDO::FETCH_ASSOC);
        }  
        catch(Exception $e){
            die($e->getMessage());
        }
    }
// sis_procedimiento
    public function TraerDatos($idusuario){
        try{
            $consulta = $this->acesso->prepare("CALL spu_datos_personales(?)");
            $consulta->execute(array($idusuario));
    
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
            $consulta = $this->acesso->prepare("CALL spu_register_autor(?,?,?,?)");
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

    public function registrarCategoria($datos = []){
        $respuesta = [
            "status" => false,
            "message" =>""
        ];
        
        try{
            $consulta = $this->acesso->prepare("CALL spu_register_categoria(?,?)");
            $respuesta["status"] = $consulta->execute(
                array(
                $datos["categoria"],
                $datos["codigo"]
                )
            );
        }
        catch(Exception $e){
            $respuesta["message"] = "No se pudo completar". $e->getMessage();
        }
        return $respuesta;
    }

    public function registrarEditorial($datos = []){
        $respuesta = [
            "status" => false,
            "message" =>""
        ];
        try{
            $consulta = $this->acesso->prepare("CALL spu_register_editorial(?,?,?,?,?)");
            $respuesta["status"] = $consulta->execute(
                array(
                $datos["nombres"],
                $datos["telefono"],
                $datos["web"],
                $datos["email"],
                $datos["paisorigen"]
                )
            );
        }
        catch(Exception $e){
            $respuesta["message"] = "No se pudo completar". $e->getMessage();
        }
        return $respuesta;
    }

    public function updateAdmin($datos = []){
        $respuesta = [
            "status" => false,
            "message" => ""
        ];
        try{
            $consulta = $this->acesso->prepare("CALL spu_update_admin(?,?,?,?,?,?,?,?,?)");
            $respuesta["status"] = $consulta->execute(
            array(
                $datos["idusuario"],
                $datos["apellidos"],
                $datos["nombres"],
                $datos["dni"],
                $datos["fechanc"],
                $datos["direccion"],
                $datos["telefono"],
                $datos["email"],
                $datos["usuario"],
            )
            );
        }
        catch(Exception $e){
        $respuesta["message"] = "No se ah podido completar el proceso. Codigo error: " . $e->getCode();
        }
        return $respuesta;
    } 

}