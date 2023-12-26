<?php require_once 'permisos.php'; ?>       
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/undraw_profile_1.svg" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-9 text-justify lead">
            Bienvenido a esta sección, aquí se muestran a todos los docentes lo cual pueden buscar por sus datos principales, tambien podran editar sus datos
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
                        <th>ID</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>DNI</th>
                        <th>Teléfono</th>
                        <th>Email</th>
                        <th>Dirección</th>
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
                                <th>ID</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>DNI</th>
                                <th>Teléfono</th>
                                <th>Email</th>
                                <th>Dirección</th>
                                <th>Usuario</th>
                                <th>Operacion</th>
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
        
        const tablaTeacher = new DataTable('#tablateacher', {        
            dom: 'Bfrtip',
            buttons: [
            ],
            language: {
                url:'../js/Spanish.json'
            },
            "order": [[0,"desc"]],
            "columnDefs" : [
                {
                    visible : true,
                    searchable : true,
                    serverSide : true,
                    pageLength: 10
                }
            ]
        });

        function listarDocente() {
            const parametros = new URLSearchParams();
            parametros.append('operacion', 'listarDocente');

            fetch("../controller/estudiantes.php", {
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(result => {
                // Limpiar la tabla antes de agregar nuevas filas
                tablaTeacher.clear();
                // Agregar filas a la tabla
                result.forEach(element => {
                    const filaina =`<td>
                                        <a href='#' type='button' class='btn btn-danger btn-sm inactivoT' data-idusuario='${element.idusuario}'>Inhabilitar</a>
                                    </td>`;
                    const editT =`<td>
                                    <a href='#' type='button' class='btn btn-primary btn-sm editar' data-idusuario='${element.idusuario}' data-idpersona='${element.idpersona}'>Editar</a>
                                </td>`;
                    tablaTeacher.row.add([
                        element.idusuario,
                        element.nombres,
                        element.apellidos, 
                        element.nrodocumento,
                        element.telefono,
                        element.email,
                        element.direccion,
                        element.fechanac,
                        element.nombreusuario,
                        filaina,
                        editT
                    ]);
                });
                // Dibujar la tabla
                tablaTeacher.draw();
            })
            .catch(error => console.error('Error en la solicitud fetch:', error));
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
            const element = event.target.closest(".inactivoT");
            if(element){
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
                        // ProfesorInactivo();
                        // document.querySelector("#tablateacher").innerHTML = ``;
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
            const elementE = event.target.closest(".editar");
            if(elementE){
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