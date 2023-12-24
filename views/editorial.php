<?php require_once 'permisos.php'; ?>
<h4 class="fw-semibold text-center mb-4" style="color:#0B5993 ;">CONFIGURACIONES</h4>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" aria-current="page" href="index.php?view=categoria.php">Categorias</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="index.php?view=config.php">Autores</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="">Editoriales</a>
    </li>
</ul>

<div class="row">
    <div class="col-md-6" id="cac">
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
                    <form id="form-editorial">
                        <div class="ml-5 row">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">NOMBRES:</label>
                            </div>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="nombreE">
                            </div>
                        </div>
                        <div class="ml-5 row mt-2">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">TELEFONO:</label>
                            </div>
                            <div class="col-md-7 mt-2">
                                <input type="text" class="form-control" id="telefonoE">
                            </div>
                        </div>
                        <div class="ml-5 row mt-2">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">SITIO WEB:</label>
                            </div>
                            <div class="col-md-7 mt-2">
                                <input type="text" class="form-control" id="webE" placeholder="opcional">
                            </div>
                        </div>
                        <div class="ml-5 row mt-2">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">EMAIL:</label>
                            </div>
                            <div class="col-md-7 mt-2">
                                <input type="text" class="form-control" id="emailE" placeholder="opcional">
                            </div>
                        </div>
                        <div class="ml-5 row mt-2">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">PAIS:</label>
                            </div>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="paisE">
                            </div>
                        </div>

                    </form>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Ver</button>
                        <button type="button" class="btn btn-primary" id="btguardarE">Guardar</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    
    btGuardaE = document.querySelector("#btguardarE");

    
    function RegisterEditorial(){
        mostrarPregunta("REGISTRO", "¿Estas seguro de guardar el editorial?").then((result)=>{
            if(result.isConfirmed){
                const parametros = new URLSearchParams();
                parametros.append("operacion","registrarEditorial");
                parametros.append("nombres", document.querySelector("#nombreE").value);
                parametros.append("telefono", document.querySelector("#telefonoE").value);
                parametros.append("web", document.querySelector("#webE").value);
                parametros.append("email",document.querySelector("#emailE").value);
                parametros.append("paisorigen",document.querySelector("#paisE").value);
                fetch("../controller/usuario.controller.php",{
                    method:'POST',
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    if(datos.status){
                        document.querySelector("#form-editorial").reset();
                    }
                })
            }
        })
    };

</script>