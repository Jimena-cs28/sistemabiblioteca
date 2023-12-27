<?php require_once 'permisos.php'; ?>
<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <div class="row mt-4 mb-5">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="../img/category.png" alt="user" class="img-responsive center-box" style="max-width: 110px;">
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
                    Bienvenido a la sección para registrar nuevas subcategorías de libros, debes de llenar el siguiente formulario para registrar una categoría
                </div>
            </div>
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">AGREGAR UNA NUEVA SUBCATEGORIA</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-categori">
                    <div class="row ml-5 mt-4">
                        <div class="col-md-4">
                            <label for="">CATEGORIA</label>
                            <select class="form-control form-control-sm" id="selectcategoria">
                                
                            </select>    
                        </div>
                        <div class="col-md-4">
                            <label for="">SUBCATEGORIA</label>
                            <input type="text" class="form-control" required id="subcategoria">
                        </div>
                        <div class="col-md-4">
                            <label for="">CODIGO</label>
                            <input type="text" class="form-control" required="" id="codigo">
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
                    </p>  
                </form>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="fw-semibold text-center m-0 font-weight-bold" style="color:#0B5993 ;">LISTADO DE SUBCATEGORIAS</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="tablasub" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>Categoria</th>
                                <th>Sub Categoria</th>
                                <th>Codigo</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    const cuerpo = document.querySelector("tbody");
    const selectcategoria = document.querySelector("#selectcategoria");
    const btGuardar = document.querySelector("#btguardar");

    
    function inicializarDataTablesL() {
        $('#tablasub').DataTable({
            // Personaliza según tus necesidades
            language: {
                url: 'https://cdn.datatables.net/plug-ins/1.10.25/i18n/Spanish.json'
            },
            order: [[0, 'desc']],  // Orden inicial por la primera columna de forma descendente
            pageLength: 10  // Número de filas por página
        });
    }

    function traerSubcategoria(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","traerSibcategoria")
        parametros.append("idcat",selectcategoria.value)
        fetch("../controller/libros.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                const repor = `
                <tr>
                    <td>${element.idsubcategoria}</td>
                    <td>${element.categoria}</td>
                    <td>${element.subcategoria}</td>
                    <td>${element.codigo}</td>
                </tr>
                `;
                cuerpo.innerHTML += repor;
            });
        })
    }

    function listarsubcategorias(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listarSubcategorias")

        fetch("../controller/libros.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                // console.log(datos);
                const pres = `
                <tr>
                    <td>${element.idsubcategoria}</td>
                    <td>${element.categoria}</td>
                    <td>${element.subcategoria}</td>
                    <td>${element.codigo}</td>
                </tr>
                `;
                cuerpo.innerHTML += pres;
            });
            inicializarDataTablesL();
        })
    }

    function listarCategoria(){
        const choiselistarCategoria = new Choices(selectcategoria, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectcategoria");

        fetch("../controller/prestamos.php",{
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

            choiselistarCategoria.setChoices([], 'value','label',true);
            choiselistarCategoria.setChoices(datos, 'idcategoria','categoria', true);
        })
    }

    function registrarCategory(){
        if(document.querySelector("#subcategoria").value == ''){
            toastError("Escriba la subcategoria")
            return;
        }

        if(document.querySelector("#codigo").value == ''){
            toastError("Escriba el codigo")
            return;
        }
        mostrarPregunta("SUBCATEGORIA", "¿Estas seguro de registrar?").then((result)=>{
            if(result.isConfirmed){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "RegistrarCategory");
            parametros.append("idcategoria", selectcategoria.value);
            parametros.append("subcategoria", document.querySelector("#subcategoria").value);
            parametros.append("codigo", document.querySelector("#codigo").value);

            fetch("../controller/libros.php",{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                // console.log(datos);
                if(datos.status){
                    document.querySelector("#form-categori").reset();
                }
            });
            }
        })
    }

    btGuardar.addEventListener("click", registrarCategory);
    listarCategoria();

    selectcategoria.addEventListener("change", traerSubcategoria)

    listarsubcategorias();
</script>
