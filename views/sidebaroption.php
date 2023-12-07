<?php

//1. Necesitamos saber qué NIVEL DE ACCESO tiene el usuario
//Revise controlador...
$permiso = $_SESSION['login']['nombrerol'];


//2. Array con los permisos por cada NIVEL DE ACCESO
// $opciones = [];

switch ($permiso){
  case "Administrador":
    echo "    
    <li class='nav-item'>
        <a class='nav-link collapsed' href='#' data-toggle='collapse' data-target='#collapseTwo'
            aria-expanded='true' aria-controls='collapseTwo'>
            <i class='bi bi-person-add'></i>
            <span>Registro de usuarios</span>
        </a>
        <div id='collapseTwo' class='collapse' aria-labelledby='headingTwo' data-parent='#accordionSidebar'>
            <div class='bg-white py-2 collapse-inner rounded'>
                <h6 class='collapse-header'>Profesores:</h6>
                <a class='collapse-item' href='index.php?view=profesores.php'>Nuevo Usuario</a>
                <a class='collapse-item' href='index.php?view=listteacher.php'>Profesores</a>
                <a class='collapse-item' href='index.php?view=liststudent.php'>Estudiantes</a>
            </div>
        </div>
    </li>

    <li class='nav-item'>
        <a class='nav-link collapsed' href='#' data-toggle='collapse' data-target='#collapseUtilities'
            aria-expanded='true' aria-controls='collapseUtilities' width='16' height='16'>
            <i class='bi bi-book' ></i>
            <span>Libros</span>
        </a>
        <div id='collapseUtilities' class='collapse' aria-labelledby='headingUtilities'
            data-parent='#accordionSidebar'>
            <div class='bg-white py-2 collapse-inner rounded'>
                <a class='collapse-item' href='index.php?view=listlibros.php'>Libros</a>
                <a class='collapse-item' href='index.php?view=libros.php'>Registro libro</a>
                <a class='collapse-item' href='index.php?view=category.php'>Registro categoria</a>
            </div>
        </div>
    </li>

    <hr class='sidebar-divider'>

    <li class='nav-item'>
    <a class='nav-link' href='index.php?view=listaprestamos.php'>
        <i class='bi bi-patch-plus'></i>
        <span>Nuevo Prestamo</span></a>
  </li>
  <li class='nav-item'>
      <a class='nav-link' href='index.php?view=reservas.php'>
          <i class='fas fa-fw fa-chart-area'></i>
          <span>Reservaciones</span></a>
  </li>

  <li class='nav-item'>
      <a class='nav-link' href='index.php?view=devolucionesp.php'>
      <i class='fas fa-fw fa-table'></i>
          <span>Devoluciones</span></a>
  </li>

  <li class='nav-item'>
      <a class='nav-link' href='index.php?view=prestamos.php'>
      <i class='fas fa-fw fa-chart-area'></i>
          <span>Prestamos</span></a>
  </li> 

  <li class='nav-item'>
      <a class='nav-link' href='index.php?view=solicitud.php'>
          <i class='fas fa-fw fa-table'></i>
          <span>Solicitud</span></a>
  </li>

  <li class='nav-item'>
    <a class='nav-link collapsed' href='#' data-toggle='collapse' data-target='#reporte'
        aria-expanded='true' aria-controls='reporte'>
        <i class='fas fa-fw fa-wrench'></i>
        <span>Reportes</span>
    </a>
    <div id='reporte' class='collapse' aria-labelledby='headingUtilities'
        data-parent='#accordionSidebar'>
        <div class='bg-white py-2 collapse-inner rounded'>
            <a class='collapse-item' href='index.php?view=report.php'>Por Usuario</a>
            <a class='collapse-item' href='index.php?view=reportes.php'>Libros mas Pedidos</a>
            <a class='collapse-item' href='index.php?view=reportmes.php'>Pedidos por Mes</a>
        </div>
    </div>
  </li>

  <li class='nav-item'>
    <a class='nav-link collapsed' href='#' data-toggle='collapse' data-target='#libro'
        aria-expanded='true' aria-controls='libro'>
        <i class='fas fa-fw fa-wrench'></i>
        <span>Historiales</span>
    </a>
    <div id='libro' class='collapse' aria-labelledby='headingUtilities'
        data-parent='#accordionSidebar'>
        <div class='bg-white py-2 collapse-inner rounded'>
            <a class='collapse-item' href='index.php?view=reportLibro.php'>Libros</a>
            <a class='collapse-item' href='index.php?view=ReportStudent.php'>Usuarios</a>
        </div>
    </div>
  </li>

  <li class='nav-item'>
      <a class='nav-link' href='index.php?view=config.php'>
          <i class='fas fa-fw fa-table'></i>
          <span>Configuracion</span></a>
  </li>

    ";
  break;
  case "Subdirector":
    echo "
    <li class='nav-item'>
      <a class='nav-link' href='index.php?view=prestamos.php'>
      <i class='fas fa-fw fa-chart-area'></i>
          <span>Prestamos</span></a>
    </li> 

    <li class='nav-item'>
      <a class='nav-link collapsed' href='#' data-toggle='collapse' data-target='#reporte'
          aria-expanded='true' aria-controls='reporte'>
          <i class='fas fa-fw fa-wrench'></i>
          <span>Reportes</span>
      </a>
      <div id='reporte' class='collapse' aria-labelledby='headingUtilities'
          data-parent='#accordionSidebar'>
          <div class='bg-white py-2 collapse-inner rounded'>
              <a class='collapse-item' href='index.php?view=report.php'>Por Usuario</a>
              <a class='collapse-item' href='index.php?view=reportes.php'>Libros mas Pedidos</a>
              <a class='collapse-item' href='index.php?view=reportmes.php'>Pedidos por Mes</a>
          </div>
      </div>
    </li>

    <li class='nav-item'>
      <a class='nav-link collapsed' href='#' data-toggle='collapse' data-target='#libro'
          aria-expanded='true' aria-controls='libro'>
          <i class='fas fa-fw fa-wrench'></i>
          <span>Historiales</span>
      </a>
      <div id='libro' class='collapse' aria-labelledby='headingUtilities'
          data-parent='#accordionSidebar'>
          <div class='bg-white py-2 collapse-inner rounded'>
              <a class='collapse-item' href='index.php?view=reportLibro.php'>Libros</a>
              <a class='collapse-item' href='index.php?view=ReportStudent.php'>Usuarios</a>
          </div>
      </div>
    </li>
    
    ";
  break;
}

//Renderizar los ítems del SIDEBAR
// foreach($opciones as $item){
//   echo "
//     <li class='nav-item'>
//       <a class='nav-link' href='{$item['url']}'>
//           <i class='fas fa-fw fa-chart-area'></i>
//           <span>{$item['menu']}</span></a>
//     </li>
//   ";
// }