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
            <table class="table table-bordered" id="tablateacher" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>DNI</th>
                        <th>Telefono</th>
                        <th>Email</th>
                        <th>Direccion</th>
                        <th>F.Nacimiento</th>
                        <th>Usuario</th>
                        <th>Operacion</th>
                        <th>Editar</th>
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
                    <table class="table table-bordered" id="tablaInactivoT" width="100%" cellspacing="0">
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

<div class="modal fade" id="editar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">EDITAR ESTUDIANTE</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form-edit mt-4">
                    <div class="ml-5 row">
                        <div class="col-md-3">
                            <label style="color:#000000;">NOMBRES Y APELLIDOS :</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="nombres">
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="apellidos">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-4" id="divPrestamo">
                            <label for="" style="color:#000000;">FECHA NACIMIENTO</label>
                            <input type="date"  class="form-control" id="fnacimiento">
                        </div>
                        <div class="col-md-4">
                            <label for="" style="color:#000000;">DNI</label>
                            <input type="text" class="form-control" id="dni" maxlength="8">
                        </div>
                        <div class="col-md-4" id="lugarD">
                            <label for="" style="color:#000000;">TELEFONO</label>
                            <input type="text" class="form-control" maxlength="9" id="telefono">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-4">
                            <label for="Libro" style="color:#000000;">CORREO</label>
                            <input type="text" class="form-control" id="correo">
                        </div>
                        <div class="col-md-4">
                            <label style="color:#000000;">DIRECCION</label>
                            <input type="text" name="" id="direccion" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label style="color:#000000;">USUARIO</label>
                            <input type="text" class="form-control" id="usuario">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal" id="cerrar">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guadarlibro">Guardar</button>
            </div>
        </div>
    </div>
</div>

    <script> 
        let idpersona = '';
        const cuerpo = document.querySelector("tbody");
        const tabla = document.querySelector("#tablaInactivoT");
        const cuerpoI = tabla.querySelector("tbody");
        const bte = document.querySelector("#guadarlibro");
        let idusuario = '';
        const modalInactivoT = new bootstrap.Modal(document.querySelector("#editar"));
        
        function inicializarDataTablesTeacher() {
            $('#tablateacher').DataTable({
                // Personaliza según tus necesidades
                language: {
                    url: 'https://cdn.datatables.net/plug-ins/1.10.25/i18n/Spanish.json'
                },
                order: [[0, 'desc']],  // Orden inicial por la primera columna de forma descendente
                pageLength: 10  // Número de filas por página
            });
        }

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
                        <td>${element.fechanac}</td>
                        <td>${element.nombreusuario}</td>
                        <td>
                            <a href='#' type='button' class='inactivo' data-idusuario='${element.idusuario}'>Inhabilitar</a>
                        </td>
                        <td>
                            <a href='#' type='button' class='editar' data-idusuario='${element.idusuario}' data-idpersona='${element.idpersona}'>Editar</a>
                        </td>
                    </tr>
                    `;
                    cuerpo.innerHTML += estu;
                });
                inicializarDataTablesTeacher();
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
                            <a href='#' type='button' class='inactivo' data-idusuario='${element.idusuario}'>habilitar</a>
                        </td>
                    </tr>
                    `;
                    cuerpoI.innerHTML += estu;
                });
            })
        }

        cuerpo.addEventListener("click", (event) => {
            if(event.target.classList[0] === 'inactivo'){
                idusuario = parseInt(event.target.dataset.idusuario);
                console.log(idusuario);
                const parametros = new URLSearchParams();
                parametros.append("operacion","SentenciarUsuario");
                parametros.append("idusuario", idusuario);
                fetch("../controller/estudiantes.php",{
                    method: 'POST',
                    body: parametros
                }) 
                .then(response => response.json())
                .then(datos => {
                    if(datos.status){
                        listarDocente();
                        ProfesorInactivo();
                        document.querySelector("#tablateacher").innerHTML = ``;
                    }
                });
            }
        });

        cuerpoI.addEventListener("click", (event) => {
            if(event.target.classList[0] === 'inactivo'){
                idusuario = parseInt(event.target.dataset.idusuario);
                // console.log(idusuarios);
                const parametros = new URLSearchParams();
                parametros.append("operacion","HabilitarUser");
                parametros.append("idusuario", idusuario);
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

        cuerpo.addEventListener("click", (event) => {
            if(event.target.classList[0] === 'editar'){
                idusuario = parseInt(event.target.dataset.idusuario);
                idpersona = parseInt(event.target.dataset.idpersona);
                //console.log(idusuarios);
                
                const parametros = new URLSearchParams();
                parametros.append("operacion","traerUser");
                parametros.append("idusuario", idusuario);
                fetch("../controller/estudiantes.php",{
                    method: 'POST',
                    body: parametros
                }) 
                .then(response => response.json())
                .then(datos => {
                    datos.forEach(element => {
                        document.querySelector("#nombres").value = element.nombres; 
                        document.querySelector("#apellidos").value = element.apellidos; 
                        document.querySelector("#fnacimiento").value = element.fechanac; 
                        document.querySelector("#dni").value = element.nrodocumento; 
                        document.querySelector("#telefono").value = element.telefono; 
                        document.querySelector("#correo").value = element.email; 
                        document.querySelector("#direccion").value = element.direccion; 
                        document.querySelector("#usuario").value = element.nombreusuario; 
                    });
                    modalInactivoT.toggle();
                });
            }
        });

        function UpdateUser(){
            if(confirm("¿Esta seguro de guardar?")){
                //Para binarios
                const fd = new URLSearchParams();
                fd.append("operacion","updateUser");
                fd.append("idpersona", idpersona);
                fd.append("apellidos",document.querySelector("#apellidos").value);
                fd.append("nombres",document.querySelector("#nombres").value);
                fd.append("dni", document.querySelector("#dni").value);
                fd.append("fecha",document.querySelector("#fnacimiento").value);
                fd.append("direccion",document.querySelector("#direccion").value);
                fd.append("telefono",document.querySelector("#telefono").value);
                fd.append("email",document.querySelector("#correo").value);
                fd.append("nombreusuario",document.querySelector("#usuario").value);
                
                fetch("../controller/estudiantes.php",{
                    method: "POST",
                    body: fd
                }) 
                .then(response => response.json())
                .then(datos => {
                    if(datos.status){
                        toast("Actualizado");
                        listarDocente();
                        modalInactivoT.toggle();
                    }
                });
            }
        }

        bte.addEventListener("click", UpdateUser)

        listarDocente();
        ProfesorInactivo();
    </script>