<?php require_once 'permisos.php'; ?>       
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <!-- <img src="../views/img/user01.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;"> -->
        </div>
        <div class="col-xs-12 col-sm-8 col-md-9 text-justify lead">
            Bienvenido a esta sección, aquí se muestran las reservaciones de libros hechas por los docentes y estudiantes, las cuales están pendientes para ser aprobadas por ti
        </div>
    </div>
</div>
    
<!-- tabla -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE DOCENTE</h6>
    </div>
    <div class="card-body">
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#docente">Docentes</button>

        <div class="table-responsive">
            <table class="table table-bordered" id="" width="100%" cellspacing="0">
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
                        <th>Operacion</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- modal -->
<div class="modal fade" id="docente">
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
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-success" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>  

    <script> 
        const cuerpo = document.querySelector("tbody");
        const tabla = document.querySelector("#dataTable");
        const cuerpoI = tabla.querySelector("tbody");
        
        function listarDocente(){
            const parametros = new URLSearchParams();
            parametros.append("operacion","listarDocente")

            fetch("../controller/estudiantes.php", {
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                cuerpo.innerHTML = ``;
                datos.forEach(element => {
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

        function ProfesorInactivo(){
            const parametros = new URLSearchParams();
            parametros.append("operacion","ProfesorInactivo")

            fetch("../controller/estudiantes.php", {
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                cuerpoI.innerHTML = ``;
                datos.forEach(element => {
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
                    cuerpoI.innerHTML += estu;
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
                    listarDocente();
                    ProfesorInactivo();
                });
            }
        });

        cuerpoI.addEventListener("click", (event) => {
            if(event.target.classList[0] === 'inactivo'){
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
                    listarDocente();
                    ProfesorInactivo();
                });
            }
        });

        listarDocente();
        ProfesorInactivo();
    </script>