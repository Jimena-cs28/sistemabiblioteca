<?php require_once 'permisos.php'; ?>
<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <!-- <div class="row mt-4 mb-5">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="../img/book.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
                    Bienvenido a la sección para agregar nuevos libros a la biblioteca, deberas de llenar todos los campos para poder registrar el libro
                </div>
            </div> -->
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR UN NUEVO LIBRO</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-libro">
                    <div class="row">
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-sm-4">
                                    <label for="">CATEGORIA</label>
                                    <select class="form-control" id="Rselectcategoria">
                                        
                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <label for="">SUBCATEGORIA</label>
                                    <select class="form-control" id="Rselectsubcategoria">
                                        
                                    </select>
                                </div>
                                <div class="col-sm-4">
                                    <label for="">NOMBRE</label>
                                    <input type="text" id="Rnombre" class="form-control">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-3">
                                    <label for="">CANTIDAD</label>
                                    <input type="number" class="form-control" id="Rcantidad">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">CODIGO</label>  
                                    <input type="text" class="form-control" id="Rcodigo">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">EDITORIAL</label>
                                    <select name="" id="Rselecteditorial" class="form-control">

                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <label for="">Condicion</label>
                                    <select name="" id="Rcondicion" class="form-control">
                                        <option value="Nuevo">Nuevo</option>
                                        <option value="Usado" selected>Usado</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-3">
                                    <label for="">Nº PAGINAS</label>
                                    <input type="number" class="form-control"  id="Rpaginas">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">EDICION</label>
                                    <input type="text" class="form-control"  id="Redicion">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">FORMATO</label>
                                    <input type="text" class="form-control" id="Rformato"> 
                                </div>
                                <div class="col-sm-3">
                                    <label for="">Imagen</label>
                                    <input type="file" id="fotografia" class="form-control">
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-3">
                                    <label for="">IDIOMA</label>
                                    <select class="form-control" id="Ridioma">
                                        <option value="Español" selected>Español</option>
                                        <option value="Ingles">Ingles</option>
                                    </select>
                                </div>
                                <div class="col-sm-3">
                                    <label for="">TIPO</label>
                                    <input type="text" id="Rtipo" class="form-control">
                                </div>
                                <div class="col-sm-6">
                                    <label for="">Descripcion</label>
                                    <textarea name=""id="Rdescripcion" class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-3">
                                    <label for="">AÑO</label>
                                    <input type="date" id="Ranio" class="form-control">
                                </div>
                                <div class="col-sm-3">
                                    <label for="">AUTOR</label>
                                    <select name="" id="Rautor" class="form-control">

                                    </select>
                                </div>
                                <div class="col-sm-1 mt-4">
                                    <a href="#" class="btn btn-danger" id="jimena">+</a>
                                </div>
                                <div class="col-sm-5 mt-3">
                                    <table class="table table-bordered" id="tablaAutor"  width="100%">
                                        <thead>
                                            <tr>    
                                                <th style="color:#574E4E;">ID</th>
                                                <th style="color:#574E4E;">AUTOR</th>
                                                <th style="color:#574E4E;">QUITAR</th>
                                            </tr>
                                        </thead>
                                        <tbody  id="cuerpoAutor">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="content ml-3 mt-3">
                                <img class="visor" alt="" id="img" width="300px" src="">
                            </div>
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <!-- <button class="btn btn-success" style="margin-right: 20px;">Limpiar</button> -->
                        <a href="#" class="btn btn-primary" id="btguardar">Guardar</a>
                        <!-- <button  class="btn btn-primary" id="btguardar">Guardar</button> -->
                        <a href="index.php?view=listlibros.php" class="btn btn-info ml-2">Ver Libros</a>
                    </p>  
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    const selectcategoria = document.querySelector("#Rselectcategoria");
    const selectsubcategoria = document.querySelector("#Rselectsubcategoria");
    const selectEditorial = document.querySelector("#Rselecteditorial");
    const selectAutores  = document.querySelector("#Rautor");
    const img = document.querySelector("#img");
    const Rnombre = document.querySelector("#Rnombre");
    const inputFile = document.querySelector("#fotografia");
    const btGuardar = document.querySelector("#btguardar");
    const BtagregarAutor = document.querySelector("#jimena");
    const tablaAutors = document.querySelector("#tablaAutor");
    const cuerpoA = tablaAutors.querySelector("#cuerpoAutor");
    let idlibro = '';

    function agregarAutor(){
        if(selectAutores.value > 0){
        const AytirSeleccionada = selectAutores.options[selectAutores.selectedIndex];

        if(AytirSeleccionada.value != ""){
            let autorRepetida = false;
            const filas  = tablaAutors.rows;
            
            for(let i=1; i < filas.length; i++){
            const autorCelda = filas[i].cells[1].innerText;
            console.log(autorCelda);
            if(autorCelda === AytirSeleccionada.text){
                autorRepetida = true;
                break;
            }          
            } 
            if(!autorRepetida){
                let filanueva =            
                `
                <tr>
                <td>${AytirSeleccionada.value}</td>
                <td>${AytirSeleccionada.text}</td>
                <td>
                    <a class ="eliminar btn btn-sm btn-danger">Eliminar</a>
                </td>
                </tr>
                `;
                tablaAutors.innerHTML += filanueva;
                selectAutores.value = 0;
                SelectActor();
            }
            else{
            toastError("No se puede repetir los autores");
            }
        }
        }
    }

    tablaAutors.addEventListener("click", function(event) {
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

    BtagregarAutor.addEventListener("click", function(){
        agregarAutor()
    });

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
                    <option value='${element.idcategoria}'>${element.categoria} - ${element.codigo}</option> 
                `;
                selectcategoria.innerHTML += select;
            });
        })
    }

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
                    <option value='${element.idsubcategoria}'>${element.subcategoria} - ${element.codigo}</option>`;
                    selectsubcategoria.innerHTML += opcion1;  
            });
                
        });
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

    function traerLibro(){
        const para = new URLSearchParams();
        para.append("operacion", "traerIdlibro");
        fetch("../controller/libros.php", {
            method: 'POST',
            body: para
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.length > 0){
                datos.forEach(element => {
                    idlibro = element.idlibro;
                    console.log(idlibro);
                    registrarAutor(idlibro);
                });
            }else{
                console.log("sin datos");
            }
        })
    }
    // traerLibro();
    function register(){

        if(Rnombre.value = ''){
            toastError("Escriba el nombre")
        }

        if(selectsubcategoria.value = ''){
            toastError("Seleccione la subcategoria")
        }
        if(document.querySelector("#Rcodigo").value = ''){
            toastError("Escriba el codigo")
        }
        if(document.querySelector("#Rcantidad").value = ''){
            toastError("Escriba la cantidad")
        }
        if(document.querySelector("#Rcondicion").value = ''){
            toastError("Escriba la condicion del libro")
        }

        const fd = new FormData();
        fd.append("operacion","registrarLibro");
        fd.append("idsubcategoria",selectsubcategoria.value);
        fd.append("ideditorial",selectEditorial.value);
        fd.append("nombre",Rnombre.value);
        fd.append("tipo",document.querySelector("#Rtipo").value);
        fd.append("cantidad",document.querySelector("#Rcantidad").value);
        fd.append("numeropaginas",document.querySelector("#Rpaginas").value);
        fd.append("codigo",document.querySelector("#Rcodigo").value);
        fd.append("edicion",document.querySelector("#Redicion").value);
        fd.append("formato",document.querySelector("#Rformato").value);
        fd.append("anio",document.querySelector("#Ranio").value);
        fd.append("idioma",document.querySelector("#Ridioma").value);
        fd.append("descripcion",document.querySelector("#Rdescripcion").value);
        fd.append("imagenportada",document.querySelector("#fotografia").files[0]);
        fd.append("condicion", document.querySelector("#Rcondicion").value)

        fetch("../controller/libros.php",{
            method: "POST",
            body: fd
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.status){
                traerLibro();
            }
        });
    }

    function registrarAutor(idlibro){
        mostrarPregunta("LIBRO", "¿Estas seguro de registrar un libro?").then((result)=>{
            if(result.isConfirmed){
                const filas = tablaAutors.rows;
                for (let i = 1; i < filas.length; i++) {
                    const idautors = parseInt(filas[i].cells[0].innerText);
                    const parametros = new URLSearchParams();
                    parametros.append("operacion", "RegistrarAutor");
                    parametros.append("idlibro", idlibro);
                    parametros.append("idautor", idautors);
                    
                    fetch("../controller/libros.php",{
                        method:'POST',
                        body: parametros
                    })
                    .then(respuesta => respuesta.json())
                    .then(datos => {
                        if(datos.status){
                            toast("Excelente");
                        }
                    })
                }
            }
        })
    }

    inputFile.addEventListener("change", (e) => {
        if(inputFile.files.length > 0) {  
            const patchImg = URL.createObjectURL(inputFile.files[0]);
            img.src = patchImg;
            console.log(img.src);
        }
    });

    selectcategoria.addEventListener("change", selectsubCategoria);
    //selectsubCategoria();
    listarCategoria();
    listarEditorial();
    SelectActor();
    btGuardar.addEventListener("click",register );
</script>