<?php require_once 'permisos.php'; ?>


<div class="modal fade" id="modal-id">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">EDITE SU PERFIL AQUI</h5>
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
                        <input type="text" class="form-control" id="Enombres">
                    </div>
                    <div class="col-md-4">
                        <input type="text" class="form-control" id="Eapellidos">
                    </div>
                </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3" id="divPrestamo">
                            <label for="" style="color:#000000;">FECHA NACIMIENTO</label>
                            <input type="date"  class="form-control" id="Efnacimiento">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#000000;">ROL</label>
                            <input type="text" class="form-control" id="Erol">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#000000;">DNI</label>
                            <input type="text" class="form-control" id="Edni" maxlength="8">
                        </div>
                        <div class="col-md-3" id="lugarD">
                            <label for="" style="color:#000000;">TELEFONO</label>
                            <input type="text" class="form-control" maxlength="9" id="Etelefono">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-4">
                            <label for="Libro" style="color:#000000;">CORREO</label>
                            <input type="text" class="form-control" id="Ecorreo">
                        </div>
                        <div class="col-md-4">
                            <label style="color:#000000;">DIRECCION</label>
                            <input type="text" name="" id="Edireccion" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label style="color:#000000;">USUARIO</label>
                            <input type="text" class="form-control" id="Eusuario">
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


<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:rgb(11, 90, 147) ;">DATOS DEL ADMINISTRADOR</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-prestamos mt-3">
                    <div class="ml-5 row">
                        <div class="col-md-3">
                            <label style="color:#000000;">NOMBRES Y APELLIDOS :</label>
                        </div>
                        <div class="col-md-7">
                            <input type="text" class="form-control" id="datos" disabled>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3" id="divPrestamo">
                            <label for="" style="color:#000000;">FECHA NACIMIENTO</label>
                            <input type="text"  class="form-control" required=""id="fnacimiento" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#000000;">ROL</label>
                            <input type="text" class="form-control" id="rol" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#000000;">DNI</label>
                            <input type="text" class="form-control" id="dni" disabled>
                        </div>
                        <div class="col-md-3" id="lugarD">
                            <label for="" style="color:#000000;">TELEFONO</label>
                            <input type="text" class="form-control" maxlength="20" id="telefono" disabled>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-4">
                            <label for="Libro" style="color:#000000;">CORREO</label>
                            <input type="text" class="form-control"id="correo" disabled>
                        </div>
                        <div class="col-md-4">
                            <label style="color:#000000;">DIRECCION</label>
                            <input type="text" name="" id="direccion" class="form-control" disabled>
                        </div>
                        <div class="col-md-4">
                            <label style="color:#000000;">USUARIO</label>
                            <input type="text" class="form-control" id="usuario" disabled>
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <a href="#modal-id" class="btn btn-primary" id="btguardar" data-bs-toggle="modal" data-toggle="modal"><i class="bi bi-pencil-square"></i></a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // const btEditar = document.querySelector("#guadarlibro");

    function traerDatos(){
        // console.log(idusuario);
        const parametros = new URLSearchParams();
        parametros.append("operacion","TraerDatos");
        parametros.append("idusuario", idUsuario);
        fetch("../controller/validacion.php", {
            method: 'POST',
            body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
            datos.forEach(element => {
                document.querySelector("#datos").value = element.nombres+ " " + element.apellidos
                document.querySelector("#Eapellidos").value = element.apellidos
                document.querySelector("#Enombres").value = element.nombres
                document.querySelector("#rol").value = element.nombrerol
                document.querySelector("#Erol").value = element.nombrerol
                document.querySelector("#dni").value = element.nrodocumento
                document.querySelector("#Edni").value = element.nrodocumento
                document.querySelector("#telefono").value = element.telefono 
                document.querySelector("#Etelefono").value = element.telefono 
                document.querySelector("#correo").value = element.email
                document.querySelector("#Ecorreo").value = element.email
                document.querySelector("#direccion").value = element.direccion
                document.querySelector("#Edireccion").value = element.direccion
                document.querySelector("#usuario").value = element.nombreusuario
                document.querySelector("#Eusuario").value = element.nombreusuario
                document.querySelector("#Efnacimiento").value = element.fechanac
                document.querySelector("#fnacimiento").value = element.fechanac
            });
        })
    }

    // function UpdateUsers(){
    //     if(confirm("¿Esta seguro de guardar?")){
    //         //Para binarios
    //         const fd = new URLSearchParams();
    //         fd.append("operacion","updateAdmin");
    //         fd.append("idusuario", idUsuario);
    //         fd.append("apellidos",document.querySelector("#Enombres").value);
    //         fd.append("nombres",document.querySelector("#Eapellidos").value);
    //         fd.append("dni", document.querySelector("#Edni").value);
    //         fd.append("fecha",document.querySelector("#Efnacimiento").value);
    //         fd.append("direccion",document.querySelector("#direccion").value);
    //         fd.append("telefono",document.querySelector("#Etelefono").value);
    //         fd.append("email",document.querySelector("#Ecorreo").value);
    //         fd.append("nombreusuario",document.querySelector("#Eusuario").value);
            
    //         fetch("../controller/usuario.controller.php",{
    //             method: "POST",
    //             body: fd
    //         }) 
    //         .then(response => response.json())
    //         .then(datos => {
    //             if(datos.status){
    //                 console.log("echo")
    //                 toast("Actualizado");
    //                 listarEstudiante();
    //                 // Editar.toggle();
    //             }else{
    //                 console.log("no echo")
    //                 toastError("Error de Actualización");
    //             }
    //         });
    //     }
    // }
    // btEditar.addEventListener("click", UpdateUsers);
    traerDatos();
</script>