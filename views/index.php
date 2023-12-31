<?php
session_start();
if(!isset($_SESSION['login']) || (!$_SESSION['login']['status']))
{
    header("Location:../");
}

$datoID = json_encode($_SESSION['login']);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Santa Ana</title>
    <link rel="stylesheet" href="./css/datatable.min.css" />
    <!-- Custom fonts for this template-->
    <link href="./libs/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="./css/sb-admin-2.min.css" rel="stylesheet">
    <!-- choices -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/choices.js/public/assets/styles/choices.min.css">
    <link rel="icon" href="../img/logo2.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
    <!-- Agrega esta línea en el encabezado de tu archivo HTML -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.2/xlsx.full.min.js"></script> -->
    <!-- <link rel="stylesheet" href="../views/css/datatable.min.css" /> -->
    <!-- <script src="../js/table2excel.jquery.json"></script> -->

  <!-- DataTables CSS -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.2/css/buttons.dataTables.css">
  
  <!-- jQuery -->
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- DataTables JS -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<!-- DataTables Buttons Extension -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.68/pdfmake.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.html5.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.print.min.js"></script>

</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav  sidebar sidebar-dark accordion" id="accordionSidebar" style="background-color: #072436;">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php?view=dashboard.php">
                <div class="sidebar-brand-icon rotate-n-15">
                    <!-- img -->
                    <!-- <i class="fas fa-laugh-wink"></i> -->
                </div>
                <img src="../img/logo2.png" alt="logo" width="70px" >
                <div class="sidebar-brand-text" style="color: rgb(244, 224, 224);">MEDIATECA</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active mb-1">
                <a class="nav-link" href="index.php?view=dashboard.php">
                    <i class="bi bi-house-door-fill"></i>
                    <span>INICIO</span></a>
            </li>


            <!-- Heading -->
            <div class="sidebar-heading">
                Interfaces
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <!-- <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="bi bi-person-add"></i>
                    <span>Registro de usuarios</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Profesores:</h6>
                        <a class="collapse-item" href="index.php?view=profesores.php">Nuevo Usuario</a>
                        <a class="collapse-item" href="index.php?view=listteacher.php">Profesores</a>
                        <a class="collapse-item" href="index.php?view=liststudent.php">Estudiantes</a>
                    </div>
                </div>
            </li> -->

            <!-- Nav Item - Utilities Collapse Menu -->
            <!-- <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities" width="16" height="16">
                    <i class="bi bi-book" ></i>
                    <span>Libros</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="index.php?view=listlibros.php">Libros</a>
                        <a class="collapse-item" href="index.php?view=libros.php">Registro libro</a>
                        <a class="collapse-item" href="index.php?view=category.php">Registro categoria</a>
                    </div>
                </div>
            </li> -->
            <!-- Divider -->
            <!-- <hr class="sidebar-divider"> -->

            <?php require_once './sidebaroption.php'; ?>
            <!-- Heading -->
            <!-- <div class="sidebar-heading">
                PRESTAMOS
            </div> -->

            <!-- <li class="nav-item">
                <a class="nav-link" href="index.php?view=listaprestamos.php">
                    <i class="bi bi-patch-plus"></i>
                    <span>Nuevo Prestamo</span></a>
            </li> -->
            <!-- 
            <li class="nav-item">
                <a class="nav-link" href="index.php?view=reservas.php">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Reservaciones</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="index.php?view=devolucionesp.php">
                <i class="fas fa-fw fa-table"></i>
                    <span>Devoluciones</span></a>
            </li>

            <!-- Nav Item - Charts -->
            <!-- <li class="nav-item">
                <a class="nav-link" href="index.php?view=prestamos.php">
                <i class="fas fa-fw fa-chart-area"></i>
                    <span>Prestamos</span></a>
            </li> -->

            <!-- Nav Item - Tables -->
            <!-- <li class="nav-item">
                <a class="nav-link" href="index.php?view=solicitud.php">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Solicitud</span></a>
            </li>  -->
            <!-- 
            <li class="nav-item">
                <a class="nav-link" href="index.php?view=report.php">
                    <span>Reportes</span></a>
            </li> -->
            <!-- <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#reporte"
                    aria-expanded="true" aria-controls="reporte">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Reportes</span>
                </a>
                <div id="reporte" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                        <!-- <a class="collapse-item" href="index.php?view=report.php">Por Usuario</a>
                        <a class="collapse-item" href="index.php?view=reportes.php">Libros mas Pedidos</a>
                        <a class="collapse-item" href="index.php?view=reportmes.php">Pedidos por Mes</a>
                    </div>
                </div>
            </li> -->

            <!-- <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#libro"
                    aria-expanded="true" aria-controls="libro">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Historiales</span>
                </a>
                <div id="libro" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <!-- <h6 class="collapse-header">Custom Utilities:</h6> -->
                        <!-- <a class="collapse-item" href="index.php?view=reportLibro.php">Libros</a>
                        <a class="collapse-item" href="index.php?view=ReportStudent.php">Usuarios</a>
                    </div>
                </div>
            </li> --> 

            <!-- <li class="nav-item">
                <a class="nav-link" href="index.php?view=config.php">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Configuracion</span></a>
            </li> -->

            <!-- Divider -->
            <!-- <hr class="sidebar-divider d-none d-md-block"> -->

            <!-- OPCIONES QUE DEBEN SER FILTRADAS DE ACUERDO AL PERFIL -->
            
            <!-- FIN OPCIONES DEL SIDEBAR -->

            <!-- Sidebar Toggler (Sidebar) -->
            <!-- <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div> -->


        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <!-- <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form> -->
                    <marquee><h4 class="ml-5" style="color:rgb(65, 4, 4);">SISTEMA BIBLIOTECA</h4></marquee>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small" data-id="<?= $_SESSION['login']['idusuario']?>" id="id"><?= $_SESSION['login']['nombres']?></span>
                                <img class="img-profile rounded-circle"
                                    src="../img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="index.php?view=listprestamo.php">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Perfil
                                </a>
                                <!-- <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a> 
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>-->
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="../controller/usuario.controller.php?operacion=destroy">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Cerrar Session
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid" id="contenedor-vistas">


                </div>
            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>SANTA ANA &copy; SENATI 2023</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

        
    <!-- <script src="../js/sb-admin-2.min.js"></script>
    <script src="../js/sb-admin-2.js"></script> -->


    <!-- Bootstrap core JavaScript-->
    <script src="./libs/jquery/jquery.min.js"></script>
    <script src="./libs/bootstrap/js/bootstrap.bundle.min.js"></script> 

    <!-- Core plugin JavaScript-->
    <!-- <script src="./libs/jquery/jquery.min.js"></script> -->

    <!-- Custom scripts for all pages-->
    <!-- <script src="/js/sb-admin-2.min.js"></script> -->

    <!-- Page level plugins -->
    <!-- <script src="vendor/chart.js/Chart.min.js"></script> -->

    <!-- Page level custom scripts -->
    <!-- <script src="/js/demo/chart-area-demo.js"></script>
    <script src="/js/demo/chart-pie-demo.js"></script> -->
    <!-- <script src="../js/demo/datatables-demo.js"></script> -->
    <!-- <script src="../js/datatable.min.js"></script> -->
    <!-- tablas -->

    <!-- <script src="./libs/datatables/dataTables.bootstrap4.js"></script>
    <scrip src="./libs/datatables/dataTables.bootstrap4.min.js"></script>
    <script src="./libs/datatables/jquery.dataTables.min.js"></script> -->
    <!-- <script src="../js/prestamos.js"></script> -->
    <!-- choices -->
    <!-- <script src="../js/datatable.min.js"></script> -->
    <!-- <script src="./libs/jquery/datatable.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/choices.js/public/assets/scripts/choices.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../js/sweetalert.js"></script>

        <!-- DataTable -->
        <!-- <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script> -->

    <!-- Opcional
    <script src="https://cdn.datatables.net/buttons/2.3.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.2/js/buttons.print.min.js"></script> -->

    <script>
        
        document.addEventListener("DOMContentLoaded", () => {
            const usuario = document.querySelector("#id");
            let idUsuario = usuario.dataset.id;
            console.log(idUsuario);   
            function getURL(){
                const url = new URL(window.location.href);
                const vista = url.searchParams.get("view");
                const contenedor = document.querySelector("#contenedor-vistas");
                    if (vista != null){
                        fetch(vista)
                    .then(respuesta => respuesta.text())
                    .then(datos => {
                        contenedor.innerHTML = datos;
                        const scriptsTag = contenedor.getElementsByTagName("script");
                        for (i = 0; i < scriptsTag.length; i++){
                            eval(scriptsTag[i].innerText);
                        }
                    });
                }
            }  
            getURL(); 
        });
    </script>

</body>

</html>