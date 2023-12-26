<?php require_once 'permisos.php'; ?>
<h4 class="fw-semibold text-center mb-4" style="color:#0B5993 ;">CONFIGURACIONES</h4>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link" aria-current="page" href="index.php?view=categoria.php">Categoria</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="index.php?view=config.php">Autores</a>
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
                        <h3 class="fw-semibold text-center" style="color:#235384;">REGISTRAR AUTOR</h3>
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
                        <button type="button" class="btn btn-primary" style="margin-right: 20px;" id="">Ver</button>
                        <button type="button" class="btn btn-info" id="btAutor" >Guardar</button>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="table-responsive">
            <table class="table table-bordered" id="tablaAutores" width="100%" cellspacing="0" style="color: #504a4a;">
                <thead >
                    <tr>
                        <th>#</th>
                        <th>NOMBRE</th>
                        <th>APELLIDOS</th>
                        <th>SEUDONIMO</th>
                        <th>NACIONALIDAD</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    const btAutor = document.querySelector("#btAutor");
    const cuerpoAutor = document.querySelector("tbody")
    // const tablaAutore = document.querySelector("#tablaAutores");
    
    const tablaAutore = new DataTable('#tablaAutores', {        
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

    function listadoAutor(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectAutores");

        fetch("../controller/libros.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            tablaAutore.clear();
            datos.forEach(element => {

                tablaAutore.row.add([
                    element.idautor,
                    element.autor,
                    element.apellidos, 
                    element.pseudonimio,
                    element.nacionalidad
                ]);
            });
            tablaAutore.draw();
        })
    }
    listadoAutor();
    btAutor.addEventListener("click", RegisterAutor);
</script>
