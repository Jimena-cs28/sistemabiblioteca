<?php require_once 'permisos.php'; ?>
<h4 class="fw-semibold text-center mb-4" style="color:#0B5993 ;">CONFIGURACIONES</h4>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="">Categoría</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="index.php?view=config.php">Autores</a>
    </li>
    <li class="nav-item">
        <a class="nav-link " href="index.php?view=editorial.php">Editoriales</a>
    </li>
</ul>

<div class="row">
    <div class="col-md-6">
        <div class="card border-0">
            <div class="card-body border-0">
                <!-- fila del titulo -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR CATEGORíA</h3>
                    </div>
                </div>  
            </div>
            <div class="card border-0">
                <div class="card-body">            
                    <form id="form-categoria">
                        <div class="ml-5 row">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">CATEGORIA:</label>
                            </div>
                            <div class="col-md-7">
                                <input type="text" class="form-control" id="categoria">
                            </div>
                        </div>
                        <div class="ml-5 row mt-2">
                            <div class="col-md-3">
                                <label style="color:#574E4E;">CODIGO:</label>
                            </div>
                            <div class="col-md-7 mt-2">
                                <input type="text" class="form-control" id="codigo"> 
                            </div>
                        </div>
                    </form>
                    <p class="text-center mt-4">
                        <button type="button" class="btn btn-info" style="margin-right: 20px;">Ver</button>
                        <button type="button" class="btn btn-primary" id="btguardarC">Guardar</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="table-responsive">
            <table class="table table-bordered" style="color: #504a4a;" id="tablaCategoria" width="100%" cellspacing="0">
                <thead >
                    <tr>
                        <th>#</th>
                        <th>CATEGORIA</th>
                        <th>CODIGO</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
<script>

    btGuardarC = document.querySelector("#btguardarC");
    const CuerpoCategoria = document.querySelector("tbody")
    
    function RegisterCategoria(){
        mostrarPregunta("REGISTRO", "¿Estas seguro de guardar la categpria?").then((result)=>{
            if(result.isConfirmed){
                const parametros = new URLSearchParams();
                parametros.append("operacion","registrarCategoria");
                parametros.append("categoria", document.querySelector("#nombre").value);
                parametros.append("codigo", document.querySelector("#apellidos").value);
                const categoris = "../controller/validacion.php";
                fetch(categoris,{
                    method:'POST',
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    if(datos.status){
                        document.querySelector("#form-categoria").reset();
                        listadoCategoria();
                    }
                })
            }
        })
    };

    function listadoCategoria(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectcategoria");

        fetch("../controller/libros.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
        CuerpoCategoria.innerHTML = '';
            datos.forEach(element => {
                let litC =            
                `<tr>
                        <td>${element.idcategoria}</td>
                        <td>${element.categoria}</td>
                        <td>${element.codigo}</td>
                    </tr>
                `;
                CuerpoCategoria.innerHTML += litC;
            });
        })
    }
    listadoCategoria()
    btGuardarC.addEventListener("click", RegisterCategoria);
</script>
