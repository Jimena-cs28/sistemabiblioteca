<?php require_once 'permisos.php'; ?>
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
        <div class="table-responsive">
            <div class="col-md-6">
                <label for="">Search
                    <input type="search" class="form-control form-control-sm" placeholder aria-controls="dataTable" id="bookSearch">
                </label>
                <button type="button" class="btn btn-success mb-3 ml-3" data-toggle="modal" data-target="#libroI">Libros Desactivados</button>
            </div>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th width="2%">#</th>
                        <th width="15%">Categoria</th>
                        <th width="15%">SubCategoria</th>
                        <th width="20%">Libro</th>
                        <th width="5%">Codigo</th>
                        <th width="2%">Cantidad</th>
                        <th width="8%">Autor</th>
                        <th width="2%">Disponible</th>
                        <th width="2%">Ver</th>
                        <th width="5%">Editar</th>
                        <th width="5%">cantidad</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- detallado -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">Actualizacion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="form-detallito" class="p-3">
                    <div class="row">
                        <div class="col-sm-6">
                            <label for="">CANTIDAD</label>
                            <input type="number" class="form-control"  id="Ecantidad">
                        </div>
                        <div class="col-sm-6">
                            <label for="">CONDICION</label>
                            <input type="text" class="form-control"  id="Econdicion">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cerrar">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guadarlibroD">Guardar</button>
            </div>
        </div>
    </div>
</div>

<!-- modal Inactivo -->
<div class="modal fade" id="libroI">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="staticBackdropLabel" style="color: #5075da;">Libros Inactivos</h5>
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

<!-- modal ejemplar-->
<div class="modal fade" id="ejemplar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #2e4edf;">LIBROS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form id="form-ejemplar">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="">CATEGORIA</label>
                                    <input type="text" class="form-control"  disabled id="categoria">
                                </div>
                                <div class="col-sm-6">
                                    <label for="">SUB CATEGORIA</label>
                                    <input type="text" class="form-control"  disabled id="subcategoria">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label for="">CANTIDAD</label>
                                    <input type="" class="form-control" disabled id="cantidad">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">CODIGO</label>
                                    <input type="number" class="form-control"  disabled id="codigo">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">AUTOR</label>
                                    <input type="text" class="form-control"  disabled id="autor">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-3">
                                    <label for="">Nº PAGINAS</label>
                                    <input type="number" class="form-control"  disabled id="paginas">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">EDICION</label>
                                    <input type="text" class="form-control"  disabled id="edicion">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">FORMATO</label>
                                    <input type="text" class="form-control"  disabled id="formato">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">AÑO</label>
                                    <input type="text" class="form-control"  disabled id="anio">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label for="">EDITORIAL</label>
                                    <input type="text" class="form-control"  disabled id="editorial">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">IDIOMA</label>
                                    <input type="text" class="form-control"  disabled id="idioma">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">TIPO</label>
                                    <input type="text" class="form-control"  disabled id="tipo">
                                </div>
                            </div>
                            <div class="content mt-3">
                                <label for="">DESCRIPCION</label>
                                <textarea name="" id="descripcion" class="form-control" cols="0" rows="0" disabled></textarea>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="content ml-3 mt-3">
                                <img class="visor" alt="" id="img" width="300px" src="">
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <table class="table table-bordered" id="ejemplarE" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Libro</th>
                                        <th>Codigo</th>
                                        <th>Ocupado</th>
                                        <th>Condicion</th>
                                        <th>Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
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

<!-- editar Libro -->
<div class="modal fade" id="editar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #2e4edf;">LIBROS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form id="form-editar">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-6">
                                    <label for="">CATEGORIA</label>
                                    <select name="" id="Ecategoria" class="form-control">

                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <label for="">SUB CATEGORIA</label>
                                    <select name="" id="Esubcategoria" class="form-control">

                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label for="">CODIGO</label>
                                    <input type="number" class="form-control"  id="Ecodigo">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">Nº PAGINAS</label>
                                    <input type="number" class="form-control"  id="Epaginas">
                                </div>
                                <div class="col-md-4">
                                    <label for="">Imagen</label>
                                    <input type="file" id="Efotografia" class="form-control" placeholder="imagen del libro">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-6">
                                    <label for="">AUTOR</label>
                                    <select name="" class="form-control"  id="Eautor">

                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <label for="">Libro</label>
                                    <input type="text" class="form-control"  id="Elibro">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label for="">EDICION</label>
                                    <input type="text" class="form-control"  id="Eedicion">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">FORMATO</label>
                                    <input type="text" class="form-control"  id="Eformato">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">AÑO</label>
                                    <input type="text" class="form-control"  id="Eanio">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label for="">EDITORIAL</label>
                                    <select name="" id="Eeditorial" class="form-control"></select>
                                </div>
                                <div class="col-sm-4">
                                    <label for="">IDIOMA</label>
                                    <input type="text" class="form-control"  id="Eidioma">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">TIPO</label>
                                    <input type="text" class="form-control"  id="Etipo">
                                </div>
                            </div>
                            <div class="content mt-3">
                                <label for="">DESCRIPCION</label>
                                <textarea name="" id="Edescripcion" class="form-control" cols="0" rows="0"></textarea>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="content ml-3 mt-3">
                                <img class="visor" alt="" id="Eimg" width="300px" src="">
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <table class="table table-bordered" id="ejemplarA" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Libro</th>
                                        <th>Codigo</th>
                                        <th>Ocupado</th>
                                        <th>Estado</th>
                                        <th>Activar Estado</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-success" id="GuadarE">Guardar</button>
            </div>
        </div>
    </div>
</div>

<style>
    .estado-rojo {
        background-color: rgb(242, 201, 201);
        color: rgb(0, 0, 0); /* Cambia el color del texto si es necesario para mejorar la legibilidad */
    }
</style>

<script>
    const nombre = document.querySelector("#bookSearch");
    const cuerpo = document.querySelector("tbody");
    const tabla =  document.querySelector("#tabla");
    const cuerpoL = tabla.querySelector("tbody");
    const tablaE = document.querySelector("#ejemplarE");
    const tablaA = document.querySelector("#ejemplarA");
    const cuerpoA = tablaA.querySelector("tbody");
    const cuerpoE = tablaE.querySelector("tbody");
    const selectcategoria = document.querySelector("#Ecategoria");
    const selectsubcategoria = document.querySelector("#Esubcategoria");
    const selectAutores = document.querySelector("#Eautor");
    const GuardarEditar = document.querySelector("#guadarlibroD");
    const inputFile = document.querySelector("#Efotografia");
    const selectEditorial = document.querySelector("#Eeditorial");
    const guardarUpadte = document.querySelector("#GuadarE");
    let iddetalleautor = '';
    let idlibro = '';

    function listarCategoria(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectcategoria");

        fetch("../controller/libros.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
        selectcategoria.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let select = `
                    <option value='${element.idcategoria}'>${element.categoria}</option> 
                `;
                selectcategoria.innerHTML += select;
            });
        })
    }

    listarCategoria();

    function selectsubCategoria(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "selectsubcategoria");
        parametros.append("idcat", selectcategoria.value);
        fetch("../controller/prestamos.php", {
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
        selectsubcategoria.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let opcion1 = `
                    <option value='${element.idsubcategoria}'>${element.subcategoria}</option>`;
                    selectsubcategoria.innerHTML += opcion1;  
            });
                
        });
    }

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
                    <td>${element.idlibro}</td>
                    <td>${element.categoria}</td>
                    <td>${element.subcategoria}</td>
                    <td>${element.libro}</td>
                    <td>${element.codigo}</td>
                    <td>${element.cantidad}</td>
                    <td>${element.autor}</td>
                    <td>${element.Disponible}</td>
                    <td>
                        <a href='#ejemplar' class='codigo' data-toggle='modal' type='button' data-idlibro='${element.idlibro}' data-iddetalleautor='${element.iddetalleautor}'>Detalles</a>
                    </td>
                    <td>
                        <a href='#editar' class='editar' data-toggle='modal' data-idlibro='${element.idlibro}' data-iddetalleautor='${element.iddetalleautor}'>Editar</a>
                    </td>
                    <td>
                        <a href='#modal' class='cantidad' data-toggle='modal' data-idlibro='${element.idlibro}' data-iddetalleautor='${element.iddetalleautor}'>Cantidad</a>
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
                </tr>
                `;
                cuerpoL.innerHTML += libro;
            });
        })
    }

    function listarEditorial(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectEditorial");

        fetch("../controller/libros.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
        selectEditorial.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let editorial = `
                    <option value='${element.ideditorial}'>${element.nombres} - ${element.paisorigen}</option> 
                `;
                selectEditorial.innerHTML += editorial;
            });
        })
    }

    function UpdateBooks(){
        if(confirm("¿Esta seguro de guardar?")){
            //Para binarios
            const fd = new URLSearchParams();
            fd.append("operacion","UpdateBook");
            fd.append("idlibro", idlibro);
            fd.append("idsubcategoria",selectsubcategoria.value);
            fd.append("ideditorial",selectEditorial.value);
            fd.append("libro", document.querySelector("#Elibro").value);
            fd.append("tipo",document.querySelector("#Etipo").value);
            fd.append("numeropaginas",document.querySelector("#Epaginas").value);
            fd.append("codigo",document.querySelector("#Ecodigo").value);
            fd.append("edicion",document.querySelector("#Eedicion").value);
            fd.append("formato",document.querySelector("#Eformato").value);
            fd.append("anio",document.querySelector("#Eanio").value);
            fd.append("idioma", document.querySelector("#Eidioma").value);
            fd.append("descripcion",document.querySelector("#Edescripcion").value);
            fd.append("idautor",selectAutores.value);
            fd.append("imagenportada",inputFile.value);

            fetch("../controller/libros.php",{
                method: "POST",
                body: fd
            })
            .then(response => response.json())
            .then(datos => {
                if(datos.status){
                    // document.querySelector("#form-editar").resert();
                    // notificar("LIBROS","Se Actualizo bien", 3)
                    toast("Se hizo bien")
                }else{
                    toastError("No se guardo");
                }
            });
        }
    }

    function UpdateCantidad(){
        if(confirm("¿Esta seguro de guardar?")){
            //Para binarios
            const fd = new URLSearchParams();
            fd.append("operacion","ActualizarLibro");
            fd.append("idlibro", idlibro);
            fd.append("cantidad",document.querySelector("#Ecantidad").value);
            fd.append("condicion",document.querySelector("#Econdicion").value);
            
            fetch("../controller/libros.php",{
                method: "POST",
                body: fd
            })
            .then(response => response.json())
            .then(datos => {
                if(datos.status){
                    // document.querySelector("#form-editar").resert();
                    // notificar("LIBROS","Se Actualizo bien", 3)
                    toast("Se hizo bien")
                }else{
                    alert("no se guardo");
                }
            });
        }
    }

    function traerEjemplar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "TraerEjemplar");
        parametros.append("idlibro", idlibro);
        fetch("../controller/libros.php",{
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpoE.innerHTML = ``;
            datos.forEach(element => {
                const estadoClase = element.estado === '0' ? 'estado-rojo' : '';
                const ejemplar = `
                <tr  class='${estadoClase}'>
                    <td>${element.idejemplar}</td>
                    <td>${element.libro}</td>
                    <td>${element.codigo} - ${element.codigo_libro}</td>
                    <td>${element.ocupado}</td>
                    <td>${element.condicion}</td>
                    <td>${element.estado}</td>
                </tr>`
                ;
                cuerpoE.innerHTML +=ejemplar;
            });
        });
    }

    function traerEjemplar1(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "TraerEjemplar");
        parametros.append("idlibro", idlibro);
        fetch("../controller/libros.php",{
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpoA.innerHTML = ``;
            datos.forEach(element => {
                const estadoClase = element.estado === '0' ? 'estado-rojo' : '';
                const ejemplar = `
                <tr  class='${estadoClase}'>
                    <td>${element.idejemplar}</td>
                    <td>${element.libro}</td>
                    <td>${element.codigo} - ${element.codigo_libro}</td>
                    <td>${element.ocupado}</td>
                    <td>${element.estado}</td>
                    <td>
                        <a href='#' class='activar' type='button' data-idejemplar='${element.idejemplar}'>Activar</a>
                    </td>
                </tr>`
                ;
                cuerpoA.innerHTML +=ejemplar;
            });
        });
    }

    function SelectActor(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectAutores");

        fetch("../controller/libros.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            selectAutores.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let selectAutor = `
                    <option value='${element.idautor}'>${element.autor}-${element.apellidos}-${element.nacionalidad} </option> 
                `;
                selectAutores.innerHTML += selectAutor;
            });
        })
    }

    SelectActor();

    // codigo
    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'codigo'){
            iddetalleautor = parseInt(event.target.dataset.iddetalleautor);
            idlibro = parseInt(event.target.dataset.idlibro);
            //console.log(iddetalleautor);
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerDetalleautores");
            parametros.append("idlibro", idlibro);
            fetch("../controller/librosentregados.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                //console.log(idlibro)
                datos.forEach(element => {
                    document.querySelector("#categoria").value = element.categoria;
                    document.querySelector("#subcategoria").value = element.subcategoria;
                    document.querySelector("#editorial").value = element.Editorial;
                    //document.querySelector("#libro").value = element.libro;
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
                    // traerEjemplar();
                });
                traerEjemplar();
            })  
        }
    });

    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'editar'){
            iddetalleautor = parseInt(event.target.dataset.iddetalleautor);
            idlibro = parseInt(event.target.dataset.idlibro);
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerDetalleautores");
            parametros.append("idlibro", idlibro);
            fetch("../controller/librosentregados.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                //console.log(idlibro)
                datos.forEach(element => {
                    selectcategoria.value = element.categoria;
                    selectsubcategoria.value = element.subcategoria;
                    selectEditorial.value = element.Editorial;
                    document.querySelector("#Elibro").value = element.libro;
                    // document.querySelector("#Ecantidad").value = element.cantidad;
                    document.querySelector("#Epaginas").value = element.numeropaginas;
                    document.querySelector("#Ecodigo").value = element.codigo;
                    document.querySelector("#Eformato").value = element.formato;
                    document.querySelector("#Edescripcion").value = element.descripcion;
                    document.querySelector("#Eidioma").value = element.idioma;
                    document.querySelector("#Eanio").value = element.anio;
                    document.querySelector("#Etipo").value = element.tipo;
                    document.querySelector("#Eimg").src = `./img/${element.imagenportada}`;
                    document.querySelector("#Eedicion").value = element.edicion;
                    document.querySelector("#Eautor").value = element.Autor;
                });
                guardarUpadte.addEventListener("click", UpdateBooks);
                traerEjemplar1();
            })  
        }
    });

    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'cantidad'){
            iddetalleautor = parseInt(event.target.dataset.iddetalleautor);
            idlibro = parseInt(event.target.dataset.idlibro);
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerDetalleautores");
            parametros.append("idlibro", idlibro);
            fetch("../controller/librosentregados.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                //console.log(idlibro)
                datos.forEach(element => {
                    document.querySelector("#Ecantidad").value = element.cantidad;
                });
                GuardarEditar.addEventListener("click", UpdateCantidad);
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
                //LibrosInactivo();
                listadoLibro();
            })  
        }
    });

    cuerpoA.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'activar'){
            if(confirm("¿estas seguro de activar el estado?")){
                idlibro = parseInt(event.target.dataset.idlibro);
                idejemplar = parseInt(event.target.dataset.idejemplar);
                // console.log(idlibro);
                const parametros = new URLSearchParams();
                parametros.append("operacion","ActivarEstado");
                parametros.append("idejemplar", idejemplar);

                fetch("../controller/libros.php",{
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    if(datos.estatus){
                        traerEjemplar1();
                    }
                })  
            }
        }
    });

    function seachBook(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "buscarBook");
        parametros.append("nombre", nombre.value);
        fetch("../controller/libros.php",{
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                const libro = `
                <tr>
                    <td>${element.idlibro}</td>
                    <td>${element.categoria}</td>
                    <td>${element.subcategoria}</td>
                    <td>${element.libro}</td>
                    <td>${element.codigo}</td>
                    <td>${element.cantidad}</td>
                    <td>${element.autor}</td>
                    <td>${element.Disponible}</td>
                    <td>
                        <a href='#ejemplar' class='codigo' data-toggle='modal' type='button' data-idlibro='${element.idlibro}' data-iddetalleautor='${element.iddetalleautor}'>Codigo</a>
                    </td>
                    <td>
                        <a href='#editar' class='editar' data-toggle='modal' data-idlibro='${element.idlibro}' data-iddetalleautor='${element.iddetalleautor}'>Actualizar</a>
                    </td>
                    <td>
                        <a href='#modal' class='cantidad' data-toggle='modal' data-idlibro='${element.idlibro}' data-iddetalleautor='${element.iddetalleautor}'>Cantidad</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += libro;
            });
        })
    }

    // cuerpo.addEventListener("click", (event) => {
    //     if(event.target.classList[0] === 'inabilitar'){
    //         idlibro = parseInt(event.target.dataset.idlibro);
    //         // console.log(idlibro);
    //         const parametros = new URLSearchParams();
    //         parametros.append("operacion","SentenciaLibro");
    //         parametros.append("idlibro", idlibro);

    //         fetch("../controller/librosentregados.php",{
    //             method: 'POST',
    //             body: parametros
    //         })
    //         .then(response => response.json())
    //         .then(datos => {
    //             listadoLibro();
    //         })  
    //     }
    // });

    LibrosInactivo();
    nombre.addEventListener("keypress", (evt) => {
        if(evt.charCode == 13) seachBook();
    });

    inputFile.addEventListener("change", (e) => {
        if(inputFile.files.length > 0) {  
            const patchImg = URL.createObjectURL(inputFile.files[0]);
            document.querySelector("#Eimg").src = patchImg;
            // console.log(img.src);
        }
    });
    listarEditorial();
    listadoLibro();
    selectcategoria.addEventListener("change", selectsubCategoria);
</script>