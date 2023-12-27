<?php require_once 'permisos.php'; ?>
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/undraw_profile_1.svg" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran a todos los estudiantes lo cual pueden buscar por sus datos principales, tambien podran editar sus datos
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
                <!-- <label for="">Search
                    <input type="search" class="form-control form-control-sm" placeholder aria-controls="dataTable">
                </label> -->
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#Inactivos">Estudiantes</button>
            </div>
            <table class="table table-bordered" id="tablasub" width="100%" cellspacing="0">
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
                        <th>nombreusuario</th>
                        <th>operacion</th>
                        <th>Actualizar</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- modal -->
<div class="modal fade" id="Inactivos"  data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id=" staticBackdropLabel" style="color: #5075da;">Estudiantes Inactivos</h5>
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
                                <th>Usuario</th>
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
                <button type="button" class="btn btn-default btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>  

<div class="modal fade" id="editarE" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
                <button type="button" class="btn btn-info" id="guadarEditar">Guardar</button>
            </div>
        </div>
    </div>
</div>

<script> 
    // const modalInactivos = new bootstrap.Modal(document.querySelector("#Inactivos"));
    let idusuario = '';
    let idpersona = '';
    const cuerpo = document.querySelector("tbody");
    const Tabla = document.querySelector("#tablaInactivo");
    const cuerpo2 = Tabla.querySelector("tbody");
    const btGuardarE = document.querySelector("#guadarEditar");
    const EditarEfa = new bootstrap.Modal(document.querySelector("#editarE"));

    const tablaEstudiantes = new DataTable('#tablasub', {        
        dom: 'Bfrtip',
        buttons: [],
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

    function listarEstudiante() {
        const parametros = new URLSearchParams();
        parametros.append('operacion', 'listarestudiantes');

        fetch("../controller/estudiantes.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(result => {
            // Limpiar la tabla antes de agregar nuevas filas
            tablaEstudiantes.clear();
            // Agregar filas a la tabla
            result.forEach(element => {
                const filains =`<td>
                                    <a href='#' type='button' class='btn btn-danger btn-sm inactivoS' data-idusuario='${element.idusuario}'>Inavilitar</a>
                                </td>`;
                const edit =`<td>
                                <a href='#' type='button' data-toggle='modal' class='btn btn-primary btn-sm editarS' data-idusuario='${element.idusuario}' data-idpersona='${element.idpersona}'>Editar</a>
                            </td>`;
                tablaEstudiantes.row.add([
                    element.idusuario,
                    element.nombres,
                    element.apellidos, 
                    element.nrodocumento,
                    element.telefono,
                    element.email,
                    element.direccion,
                    element.fechanac,
                    element.nombreusuario,
                    filains,
                    edit
                ]);
            });
            // Dibujar la tabla
            tablaEstudiantes.draw();
        })
        .catch(error => console.error('Error en la solicitud fetch:', error));
    }

    // function listarEstudiante(){
    //     const parametros = new URLSearchParams();
    //     parametros.append("operacion","listarestudiantes")

    //     fetch("../controller/estudiantes.php", {
    //         method: 'POST',
    //         body: parametros
    //     })
    //     .then(response => response.json())
    //     .then(datos => {
    //         cuerpo.innerHTML = ``;
    //         datos.forEach(element => {
    //             // idusuario = element.idusuario;
    //             const estu = `
    //             <tr>
    //                 <td>${element.idusuario}</td>
    //                 <td>${element.nombres}</td>
    //                 <td>${element.apellidos}</td>
    //                 <td>${element.nrodocumento}</td>
    //                 <td>${element.telefono}</td>
    //                 <td>${element.email}</td>
    //                 <td>${element.direccion}</td>
    //                 <td>${element.fechanac}</td>
    //                 <td>${element.nombreusuario}</td>
    //                 <td>
    //                     <a href='#' type='button' class='inactivo' data-idusuario='${element.idusuario}'>Inavilitar</a>
    //                 </td>
    //                 <td>
    //                     <a href='#editar' type='button' data-toggle='modal' class='editar' data-idusuario='${element.idusuario}' data-idpersona='${element.idpersona}'>Editar</a>
    //                 </td>
    //             </tr>
    //             `;
    //             cuerpo.innerHTML += estu;
    //         });
    //     })
    // }

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
                        <a href='#' type='button' class='inabilitar' data-idusuario='${element.idusuario}'>Habilitar</a>
                    </td>
                </tr>
                `;
                listarEstudiante();
                cuerpo2.innerHTML += estudiante;
            });
        })
    }

    cuerpo.addEventListener("click", (event) => {
        const elementS = event.target.closest(".inactivoS");
        if(elementS){
            idusuario = parseInt(event.target.dataset.idusuario);
            //console.log(idusuarios);
            const parametros = new URLSearchParams();
            parametros.append("operacion","SentenciarUser");
            parametros.append("idusuario", idusuario);
            fetch("../controller/estudiantes.php",{
                method: 'POST',
                body: parametros
            }) 
            .then(response => response.json())
            .then(datos => {
                if(datos.status){
                    // modalInactivos.toggle();
                    listarEstudiante();
                    // EstudianteInactivo();
                }
            });
        }
    });

    cuerpo2.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'inabilitar'){
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
                if(datos.status){
                    listarEstudiante();
                }
                
            });
        }
    });

    cuerpo.addEventListener("click", (event) => {
        const InactivoS = event.target.closest(".editarS");
        if(InactivoS){
            idusuario = parseInt(event.target.dataset.idusuario);
            idpersona = parseInt(event.target.dataset.idpersona);
            EditarEfa.toggle();
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
                method: 'POST',
                body: fd
            }) 
            .then(response => response.json())
            .then(datos => {
                if(datos.status){
                    console.log("echo")
                    toast("Actualizado");
                    listarEstudiante();
                    EditarEfa.toggle();
                }else{
                    console.log("no echo")
                    toastError("Error de Actualización");
                }
            });
        }
    }

    btGuardarE.addEventListener("click", UpdateUser);
    listarEstudiante();
    EstudianteInactivo();
</script>