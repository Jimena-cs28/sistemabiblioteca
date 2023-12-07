<?php require_once 'permisos.php'; ?>
<h4 class="fw-semibold text-center mb-4" style="color:#0B5993 ;">CONFIGURACIONES</h4>

<div class="row">
    <div class="col-md-6">
        <div class="card border-0">
            <div class="card-body border-0">
                <!-- fila del titulo -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR AUTOR</h3>
                    </div>
                </div>  
            </div>
            <div class="card border-0">
                <div class="card-body">            
                    <form id="form-autor">
                        <div class="ml-3 row">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">AUTOR:</label>
                            </div>
                            <div class="row col-md-9">
                                <div class="col-md-5">
                                    <input type="text" id="nombre" class="form-control" placeholder="nombres">
                                </div>
                                <div class="ml-2 col-md-6">
                                    <input type="text" id="apellidos" class="form-control" placeholder="apellidos">
                                </div>
                            </div>
                        </div>
                        <div class="ml-3 mt-2 row">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">NACIONALIDAD:</label>
                            </div>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="nacion">
                            </div>
                        </div>
                        <div class="ml-3 mt-2 row">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">SEUDONIMO:</label>
                            </div>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="seudonimio">
                            </div>
                        </div>
                    </form>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="button" class="btn btn-success" id="btAutor">Guardar</button>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card border-0">
            <div class="card-body border-0">
                <!-- fila del titulo -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR EDITORIAL</h3>
                    </div>
                </div>  
            </div>
            <div class="card border-0">
                <div class="card-body">            
                    <form id="form-prestamos">
                        <div class="ml-5 row">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">NOMBRES:</label>
                            </div>
                            <div class="col-md-7">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="ml-5 row mt-2">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">TELEFONO:</label>
                            </div>
                            <div class="col-md-7 mt-2">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="ml-5 row mt-2">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">PAIS:</label>
                            </div>
                            <div class="col-md-7">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                    </form>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row mt-2">
    <div class="col-md-6">
        <div class="card border-0">
            <div class="card-body border-0">
                <!-- fila del titulo -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR CATEGORIA</h3>
                    </div>
                </div>  
            </div>
            <div class="card border-0">
                <div class="card-body">            
                    <form id="form-prestamos">
                        <div class="ml-5 row">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">CATEGORIA:</label>
                            </div>
                            <div class="col-md-7">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="ml-5 row mt-2">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">CODIGO:</label>
                            </div>
                            <div class="col-md-7 mt-2">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                    </form>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    btAutor = document.querySelector("#btAutor");

    function RegisterAutor(){
        mostrarPregunta("DEVOLVER", "¿Estas seguro de guardar el autor?").then((result)=>{
            if(result.isConfirmed){
                const parametros = new URLSearchParams();
                parametros.append("operacion","registrarAutor");
                parametros.append("nombres", document.querySelector("#nombre").value);
                parametros.append("apellidos", document.querySelector("#apellidos").value);
                parametros.append("seudonimio", document.querySelector("#seudonimio").value);
                parametros.append("nacionalidad",document.querySelector("#nacion").value );
                fetch("../controller/usuario.controller.php",{
                    method:'POST',
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    if(datos.status){
                        document.querySelector("#form-autor").reset();
                    }
                })
            }
        })
    };

    btAutor.addEventListener("click", RegisterAutor);
</script>
