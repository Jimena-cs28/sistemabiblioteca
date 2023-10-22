<h4 class="mb-4">INICIO</h4>

<div class="row">
    <div class="col-xs-3 col-md-3 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            ADMINISTRADORES
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for=""  id="administradores"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="zmdi zmdi-face"></i>                    
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-3 col-md-3 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            ESTUDIANTES
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for="" id="estudiantes"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-3 col-md-3 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                            DOCENTES
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for="" id="docentes"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-3 col-md-3 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                            LIBROS
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for="" id="libros"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="bi bi-book-half"></i>                    
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-3 col-md-3 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                            CATEGORIAS
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for="" id="categorias"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="bi bi-1-circle-fill"></i>                    
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-3 col-md-3 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                            RESERVACIONES
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for="" id="reservaciones"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-3 col-md-3 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                            DEVOLUCIONES PENDIENTES
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for="" id="devoluciones"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-3 col-md-3 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                            PRESTAMOS
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for="" id="prestamos"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
            const administradores   = document.querySelector("#administradores");
            const estudiantes       = document.querySelector("#estudiantes");
            const docentes          = document.querySelector("#docentes");
            const libros            = document.querySelector("#libros");
            const categorias        = document.querySelector("#categorias");
            const reservaciones     = document.querySelector("#reservaciones");
            const devoluciones      = document.querySelector("#devoluciones");
            const prestamos         = document.querySelector("#prestamos");

            function listarCantAdmi(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","cantAdmin")

                fetch("../controller/Contador.php", {
                    method: 'POST',
                    body: parametros
                })                
                .then(response => response.json())
                .then(datos => {
                    administradores.innerHTML = ``;
                    datos.forEach(element => {
                        administradores.innerHTML= element.administrador;
                    });
                })
            }

            function listarCantEstudiante(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","cantEstudiantes")

                fetch("../controller/Contador.php", {
                    method: 'POST',
                    body: parametros
                })                
                .then(response => response.json())
                .then(datos => {
                    estudiantes.innerHTML = ``;
                    datos.forEach(element => {
                        estudiantes.innerHTML= element.estudiantes;
                    });
                })
            }

            function listarCantDocente(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","cantDocente")

                fetch("../controller/Contador.php", {
                    method: 'POST',
                    body: parametros
                })                
                .then(response => response.json())
                .then(datos => {
                    docentes.innerHTML = ``;
                    datos.forEach(element => {
                        docentes.innerHTML= element.profesor;
                    });
                })
            }

            function listarcantLibro(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","cantLibro")

                fetch("../controller/Contador.php", {
                    method: 'POST',
                    body: parametros
                })                
                .then(response => response.json())
                .then(datos => {
                    libros.innerHTML = ``;
                    datos.forEach(element => {
                        libros.innerHTML = element.libros;
                    });
                })
            }

            function listarcantCategoria(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","cantCategoria")

                fetch("../controller/Contador.php",{
                    method: 'POST',
                    body: parametros
                })                
                .then(response => response.json())
                .then(datos => {
                    categorias.innerHTML = ``;
                    datos.forEach(element => {
                        categorias.innerHTML = element.categorias;
                    });
                })
            }
            
            function listarcantReservacion(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","cantReservacion")

                fetch("../controller/Contador.php",{
                    method: 'POST',
                    body: parametros
                })                
                .then(response => response.json())
                .then(datos => {
                    reservaciones.innerHTML = ``;
                    datos.forEach(element => {
                        reservaciones.innerHTML = element.reservaciones;
                    });
                })
            }

            function listarcantDevolucion(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","cantDevolucion")

                fetch("../controller/Contador.php",{
                    method: 'POST',
                    body: parametros
                })                
                .then(response => response.json())
                .then(datos => {
                    devoluciones.innerHTML = ``;
                    datos.forEach(element => {
                        devoluciones.innerHTML = element.devoluciones;
                    });
                })
            }

            function listarcantPrestamo(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","cantPrestamo")

                fetch("../controller/Contador.php",{
                    method: 'POST',
                    body: parametros
                })                
                .then(response => response.json())
                .then(datos => {
                    prestamos.innerHTML = ``;
                    datos.forEach(element => {
                        prestamos.innerHTML = element.prestamo;
                    });
                })
            }

            //llamando funciones para la vista
            listarCantAdmi();
            listarCantEstudiante();
            listarCantDocente();
            listarcantLibro();
            listarcantCategoria();
            listarcantReservacion();
            listarcantDevolucion();
            listarcantPrestamo();
</script>