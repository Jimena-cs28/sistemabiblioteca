<?php require_once 'permisos.php'; ?>
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-person-fill-gear" viewBox="0 0 16 16">
  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4m9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0"/>
</svg>             
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6"/>
</svg>
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
</svg>
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-book-fill" viewBox="0 0 16 16">
<path d="M8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
</svg>                    
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
                            Solicitudes
                        </div>
                        <div class="h5 mb-0 font-weight-bold text-gray-800">
                            <label for="" id="categorias"></label>
                        </div>
                    </div>
                    <div class="col-auto">
                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
<path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2m0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2"/>
</svg>                    </div>
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-calendar-date-fill" viewBox="0 0 16 16">
  <path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4zm5.402 9.746c.625 0 1.184-.484 1.184-1.18 0-.832-.527-1.23-1.16-1.23-.586 0-1.168.387-1.168 1.21 0 .817.543 1.2 1.144 1.2z"/>
  <path d="M16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2m-6.664-1.21c-1.11 0-1.656-.767-1.703-1.407h.683c.043.37.387.82 1.051.82.844 0 1.301-.848 1.305-2.164h-.027c-.153.414-.637.79-1.383.79-.852 0-1.676-.61-1.676-1.77 0-1.137.871-1.809 1.797-1.809 1.172 0 1.953.734 1.953 2.668 0 1.805-.742 2.871-2 2.871zm-2.89-5.435v5.332H5.77V8.079h-.012c-.29.156-.883.52-1.258.777V8.16a12.6 12.6 0 0 1 1.313-.805h.632z"/>
</svg>
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="35" height="35" fill="currentColor" class="bi bi-alarm-fill" viewBox="0 0 16 16">
  <path d="M6 .5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1H9v1.07a7.001 7.001 0 0 1 3.274 12.474l.601.602a.5.5 0 0 1-.707.708l-.746-.746A6.97 6.97 0 0 1 8 16a6.97 6.97 0 0 1-3.422-.892l-.746.746a.5.5 0 0 1-.707-.708l.602-.602A7.001 7.001 0 0 1 7 2.07V1h-.5A.5.5 0 0 1 6 .5m2.5 5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9zM.86 5.387A2.5 2.5 0 1 1 4.387 1.86 8.035 8.035 0 0 0 .86 5.387zM11.613 1.86a2.5 2.5 0 1 1 3.527 3.527 8.035 8.035 0 0 0-3.527-3.527"/>
</svg>
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

<div class="row">
    <!-- <div class="col-xl-3">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between mb-9">
                <div class="mb-3 mb-sm-0">
                    <h5 class="card-title fw-semibold font-weight-bold text-primary">Libro mas pedidos:</h5>
                </div>
            </div>
            <div class="card-body">
                <div class="chart-area">
                    <canvas id="grafico1"></canvas>
                </div>
            </div>
        </div>
    </div> -->

    <div class="col-xl-3">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between mb-9">
                <div class="mb-3 mb-sm-0">
                    <h5 class="card-title fw-semibold font-weight-bold text-primary">Libro por rol:</h5>
                </div>
                <div>
                    <select id="idrol" class="form-control">
                        <option value="3">Estudiante</option>
                        <option value="2">Profesor</option>
                    </select>
                </div>
            </div>
            <div class="card-body">
                <div class="chart-area">
                    <canvas class="center" id="grafico2"></canvas>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-7 ml-3">
        <!-- <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between mb-9">
            <div class="mb-3 mb-sm-0">
                <h5 class="card-title fw-semibold font-weight-bold text-primary">Libros:</h5>
            </div>
            </div>
            <div class="card-body">
                <div class="chart-area"> -->
                    <canvas id="bar"></canvas>
                <!-- </div>
            </div>
        </div> -->
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
    const rol = document.querySelector("#idrol");
    // graficos
    const grafico1 = document.querySelector("#grafico1");
    const grafico2 = document.querySelector("#grafico2");
    const bar = document.querySelector("#bar");
// GRAFICOS
    function graficrol() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "Grafico2")
        parametros.append("idrol", rol.value);
        fetch("../controller/librosentregados.php", {
            method : "POST",
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            renderGrafico2(datos);
        });
    }

    function renderGrafico2(coleccion=[]){
        let etiqueta = [];
        let datos = [];
        coleccion.forEach(element => {
            etiqueta.push(element.libro);
            datos.push(element.totales);
        });
        graficoChart.data.labels = etiqueta;
        graficoChart.data.datasets[0].data = datos;
        graficoChart.update();

    }

    const graficoChart = new Chart(grafico2, {
        type: 'doughnut',
        data: {
            labels:[],
            datasets: [
                {        
                    label: '',
                    data: [],
                    backgroundColor: ['#6C5BDD','#DD5B88','#83EE8B','#79CFF7','#F5A641']
                }
            ]
        }
    })

    const graficoChar = new Chart(bar, {
        type: 'bar',
        data: {
            labels:[],
            datasets: [
                {        
                    label: '',
                    data: [],
                    backgroundColor: ['#6C5BDD','#D9B954','#E0B89E','#DD67B7','#E0DF9E','#7FF297','#87F7F4']
                }
            ]
        }
    })

    // 1
    function renderGrafico(coleccion=[]){
        let etiqueta = [];
        let datos = [];
        coleccion.forEach(element => {
            etiqueta.push(element.libro);
            datos.push(element.totales);
        });
        // graficoBarras.data.labels = etiqueta;
        // graficoBarras.data.datasets[0].data = datos;
        // graficoBarras.update();
        graficoChar.data.labels = etiqueta;
        graficoChar.data.datasets[0].data = datos;
        graficoChar.update();
    }

    function listarLibro(){
        const para = new URLSearchParams();
        para.append("operacion", "GraficoIndex1");
        fetch("../controller/librosentregados.php", {
            method: "POST",
            body: para
        })
        .then(response => response.json())
        .then(datos => {
            renderGrafico(datos);
        })
    }

    const graficoBarras = new Chart(grafico1, {
        type: 'doughnut',
        data: {
            labels:[],
            datasets: [
                {        
                    label: '',
                    data: [],
                    backgroundColor: ['#4A60EC', '#4ACAEC','#D9B954','#6C5BDD','#DD5B88']
                }
            ]
        }
    })

    listarLibro();

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

    graficrol();

    rol.addEventListener("change",graficrol);
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