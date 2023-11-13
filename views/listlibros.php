<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/book.png" alt="clock" class="img-responsive center-box" style="max-width: 129px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los libros registrados por el estudiante, se podra editar y eliminar los libros que usted desee
        </div>
    </div>
</div>
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE LIBROS</h6>
    </div>
    <div class="card-body">
    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#libroI">Docentes</button>

        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Categoria</th>
                        <th>SubCategoria</th>
                        <th>Libro</th>
                        <th>Autor</th>
                        <th>Cantidad</th>
                        <th>Codigo</th>
                        <th>Ver Todo</th>
                        <th>Editar</th>
                        <th>Sancionar</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- modal libro -->
<div class="modal fade" id="mdl-libro" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #6980e6;">Registrar Libro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form id="">
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">CATEGORIA</label>
                            <input type="text" class="form-control" disabled id="categoria">
                        </div>
                        <div class="col-md-3">
                            <label for="">SUBCATEGORIA</label>
                            <input type="text" class="form-control" disabled id="subcategoria">
                        </div>
                        <div class="col-md-3">
                            <label for="">EDITORIAL</label>
                            <input type="text" class="form-control" disabled id="editorial">
                        </div>
                        <div class="col-md-3">
                            <label for="">NOMBRE</label>
                            <input type="text" class="form-control" disabled maxlength="70" id="libro">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">CANTIDAD</label>
                            <input type="number" class="form-control"  disabled id="cantidad">
                        </div>
                        <div class="col-md-3">
                            <label for="">NUMERO DE PAGINA</label>
                            <input type="number" class="form-control" disabled id="paginas">
                        </div>
                        <div class="col-md-3">
                            <label for="">CODIGO</label>  
                            <input type="text" class="form-control" disabled id="codigo">
                        </div>
                        <div class="col-md-3">
                            <label for="">FORMATO</label>
                            <input type="text" class="form-control" maxlength="50"id="formato" disabled>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">Descripcion</label>
                            <input type="text" id="descripcion" class="form-control" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">IDIOMA</label>
                            <input type="text" class="form-control" id="idioma" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">AÑO</label>
                            <input type="date" id="anio" class="form-control" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">TIPO</label>
                            <input type="text" id="tipo" class="form-control" disabled>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-6">
                            <div class="row">
                                <label for="">Imagen</label>                                
                            </div>
                            <div class="row">
                                <img class="visor" alt="" id="img" width="200px">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <label for="">EDICION</label>
                            <input type="text" id="edicion" class="form-control" disabled id="edicion">
                        </div>
                        <div class="col-md-3">
                            <label for="">Autor</label>
                            <input type="text" class="form-control" disabled id="autor">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
<!-- modal Inactivo -->
<div class="modal fade" id="libroI">
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
                    <table class="table table-bordered" id="tabla" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Categoria</th>
                                <th>Libro</th>
                                <th>Autor</th>
                                <th>Cantidad</th>
                                <th>Paginas</th>
                                <th>Codigo</th>
                                <th>inactivo</th>
                                <th>Activar</th>
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
    const tabla =  document.querySelector("#tabla");
    const cuerpoL = tabla.querySelector("tbody");
    let iddetalleautor = ''

    function listadoLibro(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listadolibro")

        fetch("../controller/libros.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                const libro = `
                <tr>
                    <td>${element.iddetalleautor}</td>
                    <td>${element.categoria}</td>
                    <td>${element.subcategoria}</td>
                    <td>${element.libro}</td>
                    <td>${element.autor}</td>
                    <td>${element.cantidad}</td>
                    <td>${element.codigo}</td>
                    <td>
                        <a href='#mdl-libro' class='registrar' data-toggle='modal' type='button' data-iddetalleautor='${element.iddetalleautor}'>Libros</a>
                    </td>
                    <td>
                        <a href='' class='btn btn-info registrar' data-toggle='modal' type='button' data-iddetalleautor='${element.iddetalleautor}'>Actualizar</a>
                    </td>
                    <td>
                        <a href='' class='inabilitar' data-idlibro='${element.idlibro}'>Sancionar</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += libro;
            });
        })
    }

    function LibrosInactivo(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","librosInactivo")

        fetch("../controller/libros.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpoL.innerHTML = ``;
            datos.forEach(element => {
                const libro = `
                <tr>
                    <td>${element.iddetalleautor}</td>
                    <td>${element.categoria}</td>
                    <td>${element.libro}</td>
                    <td>${element.autor}</td>
                    <td>${element.cantidad}</td>
                    <td>${element.numeropaginas}</td>
                    <td>${element.codigo}</td>
                    <td>${element.inactive_at}</td>
                    <td>
                        <a href='#' class='activar' type='button' data-idlibro='${element.idlibro}'>Activar</a>
                    </td>
                </tr>
                `;
                cuerpoL.innerHTML += libro;
            });
        })
    }

    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'registrar'){
            iddetalleautor = parseInt(event.target.dataset.iddetalleautor);
            console.log(iddetalleautor);
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerDetalleautores");
            parametros.append("iddetalleautor", iddetalleautor);

            fetch("../controller/librosentregados.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                
                datos.forEach(element => {
                    // const sdf = './img/'
                    document.querySelector("#categoria").value = element.categoria;
                    document.querySelector("#subcategoria").value = element.subcategoria;
                    document.querySelector("#editorial").value = element.Editorial;
                    document.querySelector("#libro").value = element.libro;
                    document.querySelector("#cantidad").value = element.cantidad;
                    document.querySelector("#paginas").value = element.numeropaginas;
                    document.querySelector("#codigo").value = element.codigo;
                    document.querySelector("#formato").value = element.formato;
                    document.querySelector("#descripcion").value = element.descripcion;
                    document.querySelector("#idioma").value = element.idioma;
                    document.querySelector("#anio").value = element.anio;
                    document.querySelector("#tipo").value = element.tipo;
                    document.querySelector("#img").src = `./img/${element.imagenportada}`;
                    document.querySelector("#edicion").value = element.edicion;
                    document.querySelector("#autor").value = element.Autor;
                });
            })  
        }
    });

    cuerpoL.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'activar'){
            idlibro = parseInt(event.target.dataset.idlibro);
            // console.log(idlibro);
            const parametros = new URLSearchParams();
            parametros.append("operacion","ActivarLibro");
            parametros.append("idlibro", idlibro);

            fetch("../controller/libros.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                LibrosInactivo();
                listadoLibro();
            })  
        }
    });

    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'inabilitar'){
            idlibro = parseInt(event.target.dataset.idlibro);
            // console.log(idlibro);
            const parametros = new URLSearchParams();
            parametros.append("operacion","SentenciaLibro");
            parametros.append("idlibro", idlibro);

            fetch("../controller/librosentregados.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                listadoLibro();
            })  
        }
    });

    LibrosInactivo();
    listadoLibro();
</script>