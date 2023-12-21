<?php require_once 'permisos.php'; ?>


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
                        <div class="col-md-2">
                            <label style="color:#000000;">NOMBRES Y APELLIDOS :</label>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="datos" disabled>
                        </div>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="apellidos" disabled>
                        </div>
                        <div class="col-md-2">
                            <div class="form-check-inline">
                                <input class="form-check-input" type="checkbox" id="ckEDITAR" value="option1">
                                <label class="form-check-label" for="inlineCheckbox1">EDITAR</label>
                            </div>
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
                        <a style="display:none;" class="btn btn-primary" id="btguardar"><i class="bi bi-pencil-square"></i>  EDITAR</a>
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    const btEditar = document.querySelector("#btguardar");
    const ckEditar = document.querySelector("#ckEDITAR");
    const datosN = document.querySelector("#datos");
    const fechanac = document.querySelector("#fnacimiento");
    const rol = document.querySelector("#rol");
    const dni = document.querySelector("#dni");
    const correo = document.querySelector("#correo");
    const direc = document.querySelector("#direccion");
    const user = document.querySelector("#usuario");
    const telefono = document.querySelector("#telefono");
    const apellidos = document.querySelector("#apellidos");

    ckEditar.addEventListener('change', function() {
        // Habilitar o deshabilitar el input según el estado del ckEditar
        datosN.disabled = !ckEditar.checked;
        fechanac.disabled = !ckEditar.checked;
        dni.disabled = !ckEditar.checked;
        correo.disabled = !ckEditar.checked;
        direc.disabled = !ckEditar.checked;
        user.disabled = !ckEditar.checked;
        telefono.disabled = !ckEditar.checked;
        apellidos.disabled = !ckEditar.checked;
        btEditar.style.display = ckEditar.checked ? 'inline-block' : 'none';
    });

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
                datosN.value = element.nombres
                apellidos.value = element.apellidos
                rol.value = element.nombrerol
                dni.value = element.nrodocumento
                telefono.value = element.telefono 
                correo.value = element.email
                direccion.value = element.direccion
                user.value = element.nombreusuario
                fechanac.value = element.fechanac
            });
        })
    }

    // function UpdateUsers(){
    //     if(confirm("¿Esta seguro de guardar?")){
    //         //Para binarios
    //         const fd = new URLSearchParams();
    //         fd.append("operacion","updateAdmin");
    //         fd.append("idusuario", idUsuario);
    //         fd.append("apellidos",apellidos.value);
    //         fd.append("nombres",datosN.value);
    //         fd.append("dni", dni.value);
    //         fd.append("fechanc",fechanac.value);
    //         fd.append("direccion",direccion.value);
    //         fd.append("telefono",telefono.value);
    //         fd.append("email",correo.value);
    //         fd.append("usuario",user.value);
            
    //         fetch("../controller/usuario.controller.php",{
    //             method: "POST",
    //             body: fd
    //         }) 
    //         .then(response => response.json())
    //         .then(datos => {
    //             if(datos.status){
    //                 console.log("echo")
    //                 toast("Actualizado");
    //                 datosN.disabled = ckEditar.checked;
    //                 fechanac.disabled = ckEditar.checked;
    //                 dni.disabled = ckEditar.checked;
    //                 correo.disabled = ckEditar.checked;
    //                 direc.disabled = ckEditar.checked;
    //                 user.disabled = ckEditar.checked;
    //                 telefono.disabled = ckEditar.checked;
    //                 apellidos.disabled = ckEditar.checked;
    //                 btEditar.style.display = ckEditar.checked ? 'inline-none' : 'block';
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