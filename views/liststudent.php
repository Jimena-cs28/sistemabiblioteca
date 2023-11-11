    
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/undraw_profile_1.svg" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran las reservaciones de libros hechas por los docentes y estudiantes, las cuales están pendientes para ser aprobadas por ti
        </div>
    </div>
</div>
    
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE ESTUDIANTES</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <div id="dataTable_filter" class="dataTables_filter">
                <label for="">Search
                    <input type="search" class="form-control form-control-sm" placeholder aria-controls="dataTable">
                </label>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-id">Estudiantes</button>
            </div>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>DNI</th>
                        <th>Telefono</th>
                        <th>Email</th>
                        <th>Direccion</th>
                        <th>nombreusuario</th>
                        <th>operacion</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- modal -->
<div class="modal fade" id="modal-id">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="staticBackdropLabel" style="color: #5075da;">Estudiantes Inactivos</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="">
                    <table class="table table-bordered" id="tablaInactivo" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombres</th>
                                <th>DNI</th>
                                <th>Telefono</th>
                                <th>Direccion</th>
                                <th>nombreusuario</th>
                                <th>Inactivo</th>
                                <th>operacion</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>  

<script> 
        let idusuario = '';
        const cuerpo = document.querySelector("tbody");
        const Tabla = document.querySelector("#tablaInactivo");
        const cuerpo2 = Tabla.querySelector("tbody");
        
        function listarEstudiante(){
            const parametros = new URLSearchParams();
            parametros.append("operacion","listarestudiantes")

            fetch("../controller/estudiantes.php", {
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                cuerpo.innerHTML = ``;
                datos.forEach(element => {
                    // idusuario = element.idusuario;
                    const estu = `
                    <tr>
                        <td>${element.idusuario}</td>
                        <td>${element.nombres}</td>
                        <td>${element.apellidos}</td>
                        <td>${element.nrodocumento}</td>
                        <td>${element.telefono}</td>
                        <td>${element.email}</td>
                        <td>${element.direccion}</td>
                        <td>${element.nombreusuario}</td>
                        <td>
                            <a href='#' type='button' class='inactivo' data-idusuario='${element.idusuario}'>Inavilitar</a>
                        </td>
                    </tr>
                    `;
                    cuerpo.innerHTML += estu;
                });
            })
        }

        function EstudianteInactivo(){
            const parametros = new URLSearchParams();
            parametros.append("operacion","EstudianteInactivo");

            fetch("../controller/estudiantes.php", {
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                cuerpo2.innerHTML = ``;
                datos.forEach(element => {
                    const estudiante = `
                    <tr>
                        <td>${element.idusuario}</td>
                        <td>${element.Nombres}</td>
                        <td>${element.nrodocumento}</td>
                        <td>${element.telefono}</td>
                        <td>${element.direccion}</td>
                        <td>${element.nombreusuario}</td>
                        <td>${element.inactive_at}</td>
                        <td>
                            <a href='#' type='button' class='inabilitar' data-idusuario='${element.idusuario}'>Inavilitar</a>
                        </td>
                    </tr>
                    `;
                    cuerpo2.innerHTML += estudiante;
                });
            })
        }

        cuerpo.addEventListener("click", (event) => {
            if(event.target.classList[0] === 'inactivo'){
                idusuarios = parseInt(event.target.dataset.idusuario);
                console.log(idusuarios);
                const parametros = new URLSearchParams();
                parametros.append("operacion","SentenciarUser");
                parametros.append("idusuario", idusuarios);
                fetch("../controller/estudiantes.php",{
                    method: 'POST',
                    body: parametros
                }) 
                .then(response => response.json())
                .then(datos => {
                    listarEstudiante();
                });
            }
        });

        cuerpo2.addEventListener("click", (event) => {
            if(event.target.classList[0] === 'inabilitar'){
                idusuarios = parseInt(event.target.dataset.idusuario);
                // console.log(idusuarios);
                const parametros = new URLSearchParams();
                parametros.append("operacion","HabilitarUser");
                parametros.append("idusuario", idusuarios);
                fetch("../controller/estudiantes.php",{
                    method: 'POST',
                    body: parametros
                }) 
                .then(response => response.json())
                .then(datos => {
                    listarEstudiante();
                });
            }
        });

        listarEstudiante();
        EstudianteInactivo();
</script>