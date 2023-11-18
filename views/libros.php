<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <div class="row mt-4 mb-5">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="../img/book.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
                    Bienvenido a la sección para agregar nuevos libros a la biblioteca, deberas de llenar todos los campos para poder registrar el libro
                </div>
            </div>
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
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">CATEGORIA</label>
                            <select class="form-control form-control-sm" id="selectcategoria">
                                
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="">SUBCATEGORIA</label>
                            <select class="form-control form-control-sm" id="selectsubcategoria">
                                
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="">EDITORIAL</label>
                            <select class="form-control form-control-sm" id="selecteditorial">
                            
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="">NOMBRE</label>
                            <input type="text" id="libro" class="form-control form-control-sm" required="" maxlength="70">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">CANTIDAD</label>
                            <input type="number" class="form-control form-control-sm" id="cantidad">
                        </div>
                        <div class="col-md-3">
                            <label for="">NUMERO DE PAGINA</label>
                            <input type="number" class="form-control form-control-sm" placeholder="123456789" id="paginas">
                        </div>
                        <div class="col-md-3">
                            <label for="">CODIGO</label>  
                            <input type="text" class="form-control form-control-sm" required="" id="codigo">
                        </div>
                        <div class="col-md-3">
                            <label for="">FORMATO</label>
                            <input type="text" class="form-control form-control-sm" required="" maxlength="50"id="formato">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">Descripcion</label>
                            <input type="text" id="descripcion" class="form-control form-control-sm">
                        </div>
                        <div class="col-md-3">
                            <label for="">IDIOMA</label>
                            <select class="form-control form-control-sm" id="idioma">
                                <option value="" disabled="" selected="">Seleccione</option>
                                <option value="Español">Español</option>
                                <option value="Ingles">Ingles</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="">AÑO</label>
                            <input type="date" id="anio" class="form-control form-control-sm" required="">
                        </div>
                        <div class="col-md-3">
                            <label for="">TIPO</label>
                            <input type="text" id="tipo" class="form-control form-control-sm">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">Imagen</label>
                            <input type="file" id="fotografia" class="form-control form-control-sm" placeholder="imagen del libro">
                        </div>
                        <div class="col-md-3">
                            <img class="visor" alt="" id="img" width="200px">
                        </div>
                        <div class="col-md-3">
                            <label for="">EDICION</label>
                            <input type="text" id="edicion" class="form-control form-control-sm" placeholder="nose" required="">
                        </div>
                        <div class="col-md-3">
                            <label for="">Autor</label>
                            <select name="" id="autor" class="form-control form-control-sm">

                            </select>
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-success" style="margin-right: 20px;">Limpiar</button>
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
                        <a href="index.php?view=listlibros.php" class="btn btn-info ml-2">Ver Libros</a>
                    </p>  
                </form>
            </div>
        </div>
    </div>
</div>        
<script>
    const selectcategoria = document.querySelector("#selectcategoria");
    const selectsubcategoria = document.querySelector("#selectsubcategoria");
    const selectEditorial = document.querySelector("#selecteditorial");
    const selectAutores  = document.querySelector("#autor");
    const img = document.querySelector("#img");
    const inputFile = document.querySelector("#fotografia");
    const btGuardar = document.querySelector("#btguardar");


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

    function register(){
        if(confirm("¿Esta seguro de guardar?")){
            //Para binarios
            const fd = new FormData();
            fd.append("operacion","registrarLibro");
            fd.append("idsubcategoria",selectsubcategoria.value);
            fd.append("ideditorial",selectEditorial.value);
            fd.append("nombre",document.querySelector("#libro").value);
            fd.append("tipo",document.querySelector("#tipo").value);
            fd.append("cantidad",document.querySelector("#cantidad").value);
            fd.append("numeropaginas",document.querySelector("#paginas").value);
            fd.append("codigo",document.querySelector("#codigo").value);
            fd.append("edicion",document.querySelector("#edicion").value);
            fd.append("formato",document.querySelector("#formato").value);
            fd.append("anio",document.querySelector("#anio").value);
            fd.append("idioma",document.querySelector("#idioma").value);
            fd.append("descripcion",document.querySelector("#descripcion").value);
            fd.append("imagenportada",document.querySelector("#fotografia").files[0]);
            fd.append("idautor",selectAutores.value);
            
            fetch("../controller/libros.php",{
                method: "POST",
                body: fd
            })
            .then(response => response.json())
            .then(datos => {
                if(datos.status){
                    document.querySelector("#form-libro").resert();
                    alert("Se guardo el Libro correctamente")
                }else{
                    alert("no se guardo");
                }
            })
        }
    }

    inputFile.addEventListener("change", (e) => {
        if(inputFile.files.length > 0) {  
            const patchImg = URL.createObjectURL(inputFile.files[0]);
            img.src = patchImg;
            console.log(img.src);
        }
    });

    selectcategoria.addEventListener("change", selectsubCategoria);
    listarCategoria();
    listarEditorial();
    SelectActor();
    btGuardar.addEventListener("click", register);
</script>