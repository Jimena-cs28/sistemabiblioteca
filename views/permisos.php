<?php
session_start();

//1. Obteniendo nivel de acceso (LOGIN)
$nivelacceso = $_SESSION['login']['nombrerol'];

//2. Obtener el nombre de la vista
$url = $_SERVER['REQUEST_URI'];
$url_array = explode("/", $url);
$vistaActiva = $url_array[count($url_array) - 1];

//3. Definir los permisos
$permisos = [
    "Subdirector" => ["reportLibro.php", "ReportStudent.php", "prestamos.php", "reportmes.php","reportes.php","report.php", "dashboard.php","listprestamo.php"],
    "Administrador" => ["reportLibro.php", "ReportStudent.php", "prestamos.php", "reportmes.php","reportes.php","report.php", 
    "dashboard.php", "listlibros.php", "libros.php","category.php","liststudent.php","listteacher.php","config.php",
    "listaprestamos.php","reservar.php","devolucionesp.php","prestamos.php", "reservas.php","solicitud.php", "listprestamo.php",
    "profesores.php", "editorial.php","categoria.php"]
];

//4. Validar el acceso
$autorizado = false;

//5. Comprobar los permisos
$vistasPermitidas = $permisos[$nivelacceso];

foreach($vistasPermitidas as $item){
    if ($item == $vistaActiva){
        $autorizado = true;
    }
}

if (!$autorizado){
 // Cargar una vista
    echo "<h1>Acceso restringido</h1>";
    exit();
}

?>