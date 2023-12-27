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
                <!-- <label for="">Search
                    <input type="search" class="form-control form-control-sm" placeholder aria-controls="dataTable" id="bookSearch">
                </label> -->
                <button type="button" class="btn btn-success"  data-toggle="modal" data-target="#libroI">Libros Desactivados</button>
                <button class="btn btn-primary ml-3" data-toggle="modal" data-target="#modal"><i class="bi bi-bookmark-plus-fill"></i></button>
            </div>
            <table class="table table-bordered" id="tablalibros" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th width="2%">#</th>
                        <th width="15%">Categoria</th>
                        <th width="20%">SubCategoria</th>
                        <th width="20%">Libro</th>
                        <th width="5%">Codigo</th>
                        <th width="2%">Cantidad</th>
                        <th width="8%">Autor</th>
                        <th width="2%">Disponible</th>
                        <th width="2%">Ver</th>
                        <th width="5%">Editar</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- cantidad-->
<div class="modal fade" id="modal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">Actualizacion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="form-cantidad" class="p-3">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="">Libro</label>
                            <select name="" id="libroCantidad" class="form-control mb-4">

                            </select>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-sm-6">
                            <label for="">CANTIDAD</label>
                            <input type="number" class="form-control"  id="Ecantidad">
                        </div>
                        <div class="col-sm-6">
                            <label for="">CONDICION</label>
                            <select name="" id="Econdicion" class="form-control">
                                <option value="Nuevo">Nuevo</option>
                                <option value="Usado">Usado</option>
                            </select>
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

<!-- modal ejemplar detallado-->
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
                                    <input type="text" class="form-control"  disabled id="Ccategoria">
                                </div>
                                <div class="col-sm-6">
                                    <label for="">SUB CATEGORIA</label>
                                    <input type="text" class="form-control"  disabled id="Csubcategoria">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label for="">CANTIDAD</label>
                                    <input type="" class="form-control" disabled id="Ccantidad">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">CODIGO</label>
                                    <input type="number" class="form-control"  disabled id="Ccodigo">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">AUTOR</label>
                                    <input type="text" class="form-control"  disabled id="Cautor">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-3">
                                    <label for="">Nº PAGINAS</label>
                                    <input type="number" class="form-control"  disabled id="Cpaginas">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">EDICION</label>
                                    <input type="text" class="form-control"  disabled id="Cedicion">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">FORMATO</label>
                                    <input type="text" class="form-control"  disabled id="Cformato">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">AÑO</label>
                                    <input type="text" class="form-control"  disabled id="Canio">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label for="">EDITORIAL</label>
                                    <input type="text" class="form-control"  disabled id="Ceditorial">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">IDIOMA</label>
                                    <input type="text" class="form-control"  disabled id="Cidioma">
                                </div>
                                <div class="col-sm-4">
                                    <label for="">TIPO</label>
                                    <input type="text" class="form-control"  disabled id="Ctipo">
                                </div>
                            </div>
                            <div class="content mt-3">
                                <label for="">DESCRIPCION</label>
                                <textarea name="" id="Cdescripcion" class="form-control" cols="0" rows="0" disabled></textarea>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="content ml-3 mt-3">
                                <img class="visor" alt="" id="Cimg" width="300px" src="">
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
                                        <th>Activar</th>
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
                                    <select name="" id="Ecategoria" class="form-control" disabled>

                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <label for="">SUB CATEGORIA</label>
                                    <select name="" id="Esubcategoria" class="form-control" disabled>

                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label for="">CODIGO</label>
                                    <input type="number" class="form-control"  id="Ecodigo" disabled>
                                </div>
                                <div class="col-sm-4">
                                    <label for="">Nº PAGINAS</label>
                                    <input type="number" class="form-control"  id="Epaginas">
                                </div>
                                <div class="col-md-4">
                                    <label for="">Imagen</label>
                                    <input type="file" id="Efotografia" class="form-control" placeholder="imagen del libro" disabled>
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
                                    <label for="">Libro</label>
                                    <input type="text" class="form-control"  id="Elibro">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="content col-sm-4">
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
                            <div class="row mt-3">
                                <div class="col-sm-6">
                                    <div class="content">
                                        <label for="">AUTOR</label>
                                            <div class="input-group mb-3">
                                                <select name="" class="form-control"  id="Eautor">

                                                </select>
                                                <button type="button" class="btn btn-primary mb-2" id="btautor" autocomplete="off"><i class="bi bi-bookmark-plus"></i></button>
                                            </div>
                                        
                                        <table class="table table-bordered mt-4" id="tablaA" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Autor</th>
                                                    <th>Quitar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="content">
                                        <label for="">AÑO</label>
                                        <input type="date" class="form-control  mb-3"  id="Eanio">
                                        <label for="">DESCRIPCION</label>
                                        <textarea name="" id="Edescripcion" class="form-control" cols="0" rows="0"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="content ml-3 mt-3">
                                <div class="form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="changeimg" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox1">CAMBIAR IMAGEN</label>
                                </div>
                                <img class="visor" alt="" id="Eimg" width="300px">
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">

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

<!-- modal editar ejemplar -->
<div class="modal fade" id="editarEjemplar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #2e4edf;">LIBROS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="form-devolucion" class="p-3">
                    <div class="row">
                        <!-- DESCRIPCION -->
                        <div class="col-md-12">
                            <label>Condicion: </label>
                            <select name="" id="condicionEdi" class="form-control">
                                <option value="Nuevo">Nuevo</option>
                                <option value="Usado">Usado</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default btn-danger" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-success" id="GuadEditarEjem">Guardar</button>
                    </div>
                </form>
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
    const checkAutor = document.querySelector("#idcheckA");
    const checkImg = document.querySelector("#changeimg");
    // const btPluss = document.querySelector("#btplus");
    const guardarEjem = document.querySelector("#GuadEditarEjem");
    const modalEditarE = new bootstrap.Modal(document.querySelector("#editarEjemplar"));
    const modaldetalle = new bootstrap.Modal(document.querySelector("#ejemplar"));
    const modalEditarL = new bootstrap.Modal(document.querySelector("#editar"));
    const modalCantidad = new bootstrap.Modal(document.querySelector("#modal"));
    const TAmentarA = document.querySelector("#TAmentarA");
    const cuerpo = document.querySelector("tbody");
    const tabla =  document.querySelector("#tabla");
    const cuerpoL = tabla.querySelector("tbody");
    const tablaE = document.querySelector("#ejemplarE");
    const tablaA = document.querySelector("#tablaA");
    const cuerpoA = tablaA.querySelector("tbody");
    const cuerpoE = tablaE.querySelector("tbody");
    const selectcategoria = document.querySelector("#Ecategoria");
    const selectsubcategoria = document.querySelector("#Esubcategoria");
    const selectAutore = document.querySelector("#Eautor");
    // const SeletAutorA = document.querySelector("#moreautorS");
    const GuardarEditar = document.querySelector("#guadarlibroD");
    const inputFile = document.querySelector("#Efotografia");
    const selectEditorial = document.querySelector("#Eeditorial");
    const guardarUpadte = document.querySelector("#GuadarE");
    const librocantidad = document.querySelector("#libroCantidad");
    const imgE = document.querySelector("#Efotografia");
    let iddetalleautor = '';
    let idlibro = '';
    let idautor = '';
    // let iddetalle = '';
    checkImg.addEventListener('change', function() {
        imgE.disabled = !checkImg.checked;
    });
    tablaA.addEventListener("click", function(event) {
        // Verificar si el clic fue en un botón de clase "btn-danger"
        const element = event.target.closest(".eliminar");
        if (element) {
            // Obtener la fila a la que pertenece el botón
            const filaAEliminar = event.target.closest("tr");

            // Obtener el idejemplar de la fila
            const idejemplarAEliminar = filaAEliminar.querySelector("td:first-child").textContent;

            // Eliminar la fila de la tabla
            filaAEliminar.remove();

            // Eliminar el idejemplar del conjunto libroAgregados
            // libroAgregados.delete(idejemplarAEliminar);
        }
    });

    function Selectlibro(){
        const choiceLibro= new Choices(librocantidad, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","conseguirlibrohistorial");

        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            librocantidad.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                const optionTag = document.createElement("option");
                optionTag.value = element.idlibro;
                optionTag.text = element.libro;
                // optionTag.dataset.subcategoria = element.subcategoria;
                // optionTag.dataset.categoria = element.categoria;

                librocantidad.appendChild(optionTag);
            });
            choiceLibro.setChoices([], 'value','label',true);
            choiceLibro.setChoices(datos, 'idlibro','libro', true);
        });
    }

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

    function listarSubCategoria(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listarSubcategorias");

        fetch("../controller/libros.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
        selectsubcategoria.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let selectS = `
                    <option value='${element.idsubcategoria}'>${element.subcategoria}</option> 
                `;
                selectsubcategoria.innerHTML += selectS;
            });
        })
    }

    listarSubCategoria();
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

    const tablaLibro = new DataTable('#tablalibros', {        
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

    function listadoLibro() {
        const parametros = new URLSearchParams();
        parametros.append('operacion', 'listadolibro');

        fetch("../controller/libros.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(result => {
            // Limpiar la tabla antes de agregar nuevas filas
            tablaLibro.clear();
            // Agregando filas
            result.forEach(element => {
                const filaina =`<td>
                                    <a href='#' class='btn btn-info btn-sm codigo' data-toggle='modal' type='button' data-idlibro='${element.idlibro}' data-iddetalleautor='${element.iddetalleautor}'>Detalles</a>
                                </td>`;
                const edit =`<td>
                                <a href='#' class='btn btn-secondary btn-sm editar' data-toggle='modal' data-idlibro='${element.idlibro}' data-iddetalleautor='${element.iddetalleautor}'>Editar</a>
                            </td>`;
                tablaLibro.row.add([
                    element.idlibro,
                    element.categoria,
                    element.subcategoria, 
                    element.libro,
                    element.codigo,
                    element.cantidad,
                    element.autor,
                    element.Disponible,
                    filaina,
                    edit
                ]);
            });
            // Dibujar la tabla
            tablaLibro.draw();
        })
        .catch(error => console.error('Error en la solicitud fetch:', error));
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
            const fd = new FormData();
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
            
            fetch("../controller/libros.php",{
                method: "POST",
                body: fd
            })
            .then(response => response.json())
            .then(datos => {
                if(datos.status){
                    modalEditarL.toggle();
                    toast("Se hizo bien");
                }else{
                    toastError("Seleccione la subcategoria");
                }
            });
        }
    }

    function UpdateImg(){
        if(confirm("¿Esta seguro de guardar la imagen?")){
            //Para binarios
            const fd = new FormData();
            fd.append("operacion","UpdateImg");
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
            fd.append("imagenportada",inputFile.files[0]);

            fetch("../controller/libros.php",{
                method: "POST",
                body: fd
            })
            .then(response => response.json())
            .then(datos => {
                if(inputFile == ""){
                    toastError("error en archivo");
                }else{
                    if(datos.status){
                        // document.querySelector("#form-editar").resert();
                        modalEditarL.toggle()
                        toast("Se hizo bien");
                    }else{
                        toastError("Seleccione la subcategoria");
                    }
                }
            });
        }
    }

    function UpdateCantidad(){
        if(confirm("¿Esta seguro de guardar?")){
            //Para binarios
            const fd = new URLSearchParams();
            fd.append("operacion","ActualizarLibro");
            fd.append("idlibro", librocantidad.value);
            fd.append("cantidad",document.querySelector("#Ecantidad").value);
            fd.append("condicion",document.querySelector("#Econdicion").value);
            
            fetch("../controller/libros.php",{
                method: 'POST',
                body: fd
            })
            .then(response => response.json())
            .then(datos => {
                if(datos.status){
                    listadoLibro();
                    document.querySelector("#Ecantidad").value = ' '
                    document.querySelector("#Econdicion").value = ' '
                    toast("Se hizo bien")
                }else{
                    toastError("no se guardo");
                }
            });
        }
    }

    function traerAutor() {
    const parametros = new URLSearchParams();
    parametros.append("operacion", "traerAutor");
    parametros.append("idlibro", idlibro);

    fetch("../controller/libros.php", {
        method: 'POST',
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        cuerpoA.innerHTML = ``;

        datos.forEach(element => {
            iddetalleautor = element.iddetalleautor;
            idautor = element.idautor;
            console.log(iddetalleautor);

            const ejemplar = `
                <tr>
                    <td>${element.idautor}</td>
                    <td>${element.nombres}</td>
                    ${datos.length > 1 ? `<td><a class="disminuir btn btn-sm btn-danger" data-idautor='${element.idautor}' data-iddetalleautor='${element.iddetalleautor}'>X</a></td>` : ''}
                </tr>
            `;

            cuerpoA.innerHTML += ejemplar;
        });
    });
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
                element.estado
                const estadoClase = element.estado === '0' ? 'estado-rojo' : '';
                // Verificar el estado para decidir si agregar el atributo href
                const linkHref = element.estado === '0' ? `class='btn btn-success btn-sm activarE'` : '';
                const ejemplars = `
                <tr  class='${estadoClase}'>
                    <td>${element.idejemplar}</td>
                    <td>${element.libro}</td>
                    <td>${element.codigo} - ${element.codigo_libro}</td>
                    <td>${element.ocupado}</td>
                    <td>${element.condicion}</td>
                    <td>
                        <a ${linkHref} href='#' type='button' data-idejemplar='${element.idejemplar}' data-toggle='modal' >Activar</a>
                    </td>
                </tr>`
                ;
                cuerpoE.innerHTML +=ejemplars;
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
            selectAutore.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let selectAutor = `
                    <option value='${element.idautor}'>${element.autor}-${element.apellidos}</option> 
                `;
                selectAutore.innerHTML += selectAutor;
            });
        })
    }

    function AumentarAutor(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "AumentarAutor");
        parametros.append("idlibro", idlibro);
        parametros.append("idautor", selectAutore.value);
        
        fetch("../controller/libros.php",{
            method:'POST',
            body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
            if(datos.status){
                // ModalAmentar.toggle();
                toast("Excelente");
                selectAutore.value = '';
                traerAutor();
            }
        })
        
    }

    document.querySelector("#btautor").addEventListener("click", AumentarAutor);

    SelectActor();
    // SelectActorAumentar();

    function ValidaImg(){
        if(checkImg.checked){
            UpdateImg();
        }else{
            UpdateBooks();
        }
    }

    // codigo
    cuerpo.addEventListener("click", (event) => {
        const codigoL = event.target.closest(".codigo");
        if(codigoL){
            iddetalleautor = parseInt(event.target.dataset.iddetalleautor);
            idlibro = parseInt(event.target.dataset.idlibro);
            modaldetalle.toggle();
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
                    document.querySelector("#Ccategoria").value = element.categoria;
                    document.querySelector("#Csubcategoria").value = element.subcategoria;
                    document.querySelector("#Ceditorial").value = element.nombres + " "+ element.paisorigen;
                    //document.querySelector("#libro").value = element.libro;
                    document.querySelector("#Ccantidad").value = element.cantidad;
                    document.querySelector("#Cpaginas").value = element.numeropaginas;
                    document.querySelector("#Ccodigo").value = element.codigo;
                    document.querySelector("#Cformato").value = element.formato;
                    document.querySelector("#Cdescripcion").value = element.descripcion;
                    document.querySelector("#Cidioma").value = element.idioma;
                    document.querySelector("#Canio").value = element.anio;
                    document.querySelector("#Ctipo").value = element.tipo;
                    document.querySelector("#Cimg").src = `./img/${element.imagenportada}`;
                    document.querySelector("#Cedicion").value = element.edicion;
                    document.querySelector("#Cautor").value = element.apellidos + " " + element.autor + " " + element.nacionalidad;
                    // traerEjemplar();
                });
                traerEjemplar();
            })  
        }
    });

    cuerpo.addEventListener("click", (event) => {
        const editarL = event.target.closest(".editar");
        if(editarL){
            modalEditarL.toggle();
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
            .then(result => {
                //console.log(idlibro)
                result.forEach(element => {
                    selectcategoria.value = element.idcategoria;
                    selectsubcategoria.value = element.idsubcategoria;
                    // console.log(element.idsubcategoria)
                    selectEditorial.value = element.ideditorial;
                    document.querySelector("#Elibro").value = element.libro;
                    document.querySelector("#Epaginas").value = element.numeropaginas;
                    document.querySelector("#Ecodigo").value = element.codigo;
                    document.querySelector("#Eformato").value = element.formato;
                    document.querySelector("#Edescripcion").value = element.descripcion;
                    document.querySelector("#Eidioma").value = element.idioma;
                    document.querySelector("#Eanio").value = element.anio;
                    document.querySelector("#Etipo").value = element.tipo;
                    document.querySelector("#Eimg").src = `./img/${element.imagenportada}`;
                    document.querySelector("#Eedicion").value = element.edicion;
                    // selectAutore.value = element.idautor;
                });
                traerAutor()
            })  
        }
    });

    cuerpoA.addEventListener("click", (event) => {
        const elementoDetalle = event.target.closest(".disminuir");
        if(elementoDetalle){
            idautor = parseInt(event.target.dataset.idautor);
            iddetalleautor = parseInt(event.target.dataset.iddetalleautor);
            mostrarPregunta("AUTORES", "¿Estas seguro de borrar el autor?").then((datos)=>{
                if(datos.isConfirmed){
                    const parametros = new URLSearchParams();
                    parametros.append("operacion","DesactivarDetalleautor");
                    parametros.append("iddetalleautor", iddetalleautor);
                    fetch("../controller/libros.php",{
                        method: 'POST',
                        body: parametros
                    })
                    .then(response => response.json())
                    .then(result => {
                        modalEditarL.toggle();
                        toast("Eliminado");
                    })
                }
            })
        }
    });
    // guardarUpadte.addEventListener("click", UpdateBooks);
    guardarUpadte.addEventListener("click", ValidaImg);
    GuardarEditar.addEventListener("click", UpdateCantidad);

    cuerpoL.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'activar'){
            idlibro = parseInt(event.target.dataset.idlibro);
            // console.log(idlibro);
            // modalEditarE.toggle();
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

    function activarejemplar(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","ActivarEstado");
        parametros.append("idejemplar", idejemplar);
        parametros.append("condicion", document.querySelector("#condicionEdi").value);

        fetch("../controller/libros.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.status){
                modalEditarE.toggle();
                modaldetalle.toggle();
                // traerEjemplar();
                listadoLibro();
            }
        });
    }

    cuerpoE.addEventListener("click", (event) => {
        if(event.target.closest('.activarE')){
            idlibro = parseInt(event.target.dataset.idlibro);
            idejemplar = parseInt(event.target.dataset.idejemplar);
            modalEditarE.toggle();
        }
    });

    guardarEjem.addEventListener("click",activarejemplar);

    LibrosInactivo();

    inputFile.addEventListener("change", (e) => {
        if(inputFile.files.length > 0) {  
            const patchImg = URL.createObjectURL(inputFile.files[0]);
            document.querySelector("#Eimg").src = patchImg;
            // console.log(img.src);
        }
    });

    Selectlibro();
    listarEditorial();
    listadoLibro();
    selectcategoria.addEventListener("change", selectsubCategoria);
    // nombre.addEventListener("keypress", (evt) => {
    //     if(evt.charCode == 13) seachBook();
    // });
</script>