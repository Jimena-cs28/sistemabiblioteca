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

<div class="row">
    <div class="col-xl-3">
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
    </div>

    <div class="col-xl-3">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between mb-9">
                <div class="mb-3 mb-sm-0">
                    <h5 class="card-title fw-semibold font-weight-bold text-primary"> Libro por rol:</h5>
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
                    <canvas id="grafico2"></canvas>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between mb-9">
            <div class="mb-3 mb-sm-0">
                <h5 class="card-title fw-semibold font-weight-bold text-primary"> Libros:</h5>
            </div>
            </div>
            <div class="card-body">
                <div class="chart-area">
                    <canvas id="bar"></canvas>
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
        type: 'pie',
        data: {
            labels:[],
            datasets: [
                {        
                    label: '',
                    data: [],
                    backgroundColor: ['#6C5BDD','#DD5B88']
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
                    backgroundColor: ['#6C5BDD','#D9B954']
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
        graficoBarras.data.labels = etiqueta;
        graficoBarras.data.datasets[0].data = datos;
        graficoBarras.update();
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