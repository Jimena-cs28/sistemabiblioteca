<?php require_once 'permisos.php'; ?>

<style>
    /* Estilo para ocultar el div inicialmente */
    #divPrestamo {
        display: none;
        /* display: block; */
    }
</style>
<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR UN NUEVO PRÉSTAMO</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-prestamos">
                    <div class="ml-5 row">
                        <div class="col-md-3">
                            <label style="color:#574E4E;">NOMBRES Y APELLIDOS :</label>
                        </div>
                        <div class="col-md-7">
                            <select class="form-control" id="filtronombres" required>
                            
                            </select>
                        </div>
                        <div class="col-md-2">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="ahora" checked>
                                <label class="form-check-label" for="flexRadioDefault1">AHORA</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="reservar">
                                <label class="form-check-label" for="flexRadioDefault2">RESERVAR</label>
                            </div>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3" id="divPrestamo">
                            <label for="" style="color:#574E4E;">FECHA PRÉSTAMO</label>
                            <input type="date"  class="form-control" id="fprestamo">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">EN BIBLIOTECA</label>
                            <select class="form-control" id="enbiblioteca">
                                <option value="">Eliga</option>
                                <option value="SI">SI</option>
                                <option value="NO">NO</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">DESCRIPCIÓN</label>
                            <input type="text" class="form-control" id="descripcion" placeholder="Grado o curso" required>
                        </div>
                        <div class="col-md-3" id="lugarD">
                            <label for="" style="color:#574E4E;">DESTINO</label>
                            <input type="text" class="form-control" maxlength="20" placeholder="ejemplo: laboratorio" id="lugardestino" required>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-5">
                            <label for="libro">Libro</label>
                            <select name="" id="selectlibro" class="form-control">

                            </select>
                        </div>
                        <div class="col-md-4">
                            <label>Codigo</label>
                            <select name="" id="filtroEjemplar" class="form-control mb-3">
                                <!-- <option value="">Hola</option> -->
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Cantidad</label>
                            <input type="number" class="form-control" id="cantidad" value="1" required>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-4">
                            <label>Condición Entrega</label>
                            <input type="text" class="form-control mb-3" id="condicionentrega" required>
                        </div>
                        <div class="col-md-4">
                            <label>Fecha devolucion</label>
                            <div class="input-group mb-4">
                                <input type="date" class="form-control" id="fechadevolucion" required>
                                
                            </div>
                        </div>
                        <div class="col-md-4 mt-4">
                        <button class="btn btn-outline-info" type="button" id="Rguardarlibro"><i class="bi bi-cart-plus-fill"></i></button>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <table class="table table-bordered mt-4" id="tabla2" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Libro</th>
                                    <th>F.Devolucion</th>
                                    <th>Condición</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                    <p class="text-center mt-4">
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    let idprestamo = '';
    
    const biblioteca = document.querySelector("#enbiblioteca");
    // const tablareset = document.querySelector("#tbody1");
    const divPrestamo =  document.querySelector("#divPrestamo");
    // const bt = document.querySelector("#kk");
    const divLugar = document.querySelector("#lugarD");
    const lugarDesti = document.querySelector("#lugardestino");
    const filtroStudent = document.querySelector("#filtronombres");
    const libro = document.querySelector("#selectlibro");
    const Agregar = document.querySelector("#Rguardarlibro");
    const des = document.querySelector("#descripcion");
    // const cuerpo = document.querySelector("tbody");
    const cantidad = document.querySelector("#cantidad");
    const tablalibro = document.querySelector("#tabla2")
    const Guardar = document.querySelector("#btguardar");
    const fecharegistar = document.querySelector("#fprestamo");
    const fechadevolucion = document.querySelector("#fechadevolucion");
    const Condicionentrega = document.querySelector("#condicionentrega");
    const Filtrosubcategoria = document.querySelector("#filtrosubcategoria");
    const selectcategoria = document.querySelector("#filtrocategoria");
    const filtroEjempla = document.querySelector("#filtroEjemplar");
    // const segund modal
    const GuardarR = document.querySelector("#Rguardar");
    const libroAgregados =  new Set();
    const ahora = document.querySelector("#ahora");
    const Reservar = document.querySelector("#reservar");

    const fechaActual = new Date(); 
    const fechaMinima = fechaActual.toISOString().split('T')[0];
    fechaActual.setDate(fechaActual.getDate()+3)
    const fechamaxima = fechaActual.toISOString().split('T')[0];
    fecharegistar.max = fechamaxima
    fecharegistar.min = fechaMinima
    fecharegistar.value = fechaMinima
    const fecham = fechaActual
    fechadevolucion.min = fechaMinima
    fechadevolucion.max = fechamaxima
    fechadevolucion.value = fecham
    Reservar.addEventListener("change", function (){
        if (Reservar.checked) {
            divPrestamo.style.display = 'block';
        }else{
            
        }
    });

    ahora.addEventListener("change", function() {
        if(ahora.checked){
            divPrestamo.style.display = 'none';
        }
    });

    function ValidarRegistrar(){
        const Reservar = document.querySelector("#reservar");
        if(Reservar.checked){
            AddPrestamoReservar();
            //console.log("ja");
            //alert("es ahoraR");
        }else{
            AddPrestamoAhora();
            //console.log("es ahora");
            
        }
    }

    function traerPrestamo(){
        const para = new URLSearchParams();
        para.append("operacion", "traerprestamo");
        para.append("idbeneficiario", filtroStudent.value);
        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: para
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.length > 0){
                datos.forEach(element => {
                    idprestamo = element.idprestamo;
                    console.log(idprestamo);
                    registrarLibroentregado(idprestamo);
                    
                });
            }else{
                console.log("sin datos");
            }
        })
    }

    function traerPrestamoAhora(){
        const para = new URLSearchParams();
        para.append("operacion", "traerprestamoAhora");
        para.append("idbeneficiario", filtroStudent.value);
        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: para
        })
        .then(response => response.json())
        .then(datos => {
            if(datos.length > 0){
                datos.forEach(element => {
                    idprestamo = element.idprestamo;
                    console.log(idprestamo);
                    registrarLibroentregado2(idprestamo);
                    
                });
            }else{
                console.log("sin datos");
            }
        })
    }

    biblioteca.addEventListener("change", function(event){
        const valor = event.target.value

        if(valor == 'NO'){
            divLugar.classList.remove("d-none")
        }else if(valor == 'SI'){
            divLugar.classList.add("d-none")
        }
    })

    function listarUsuario(){
        const choiselistarStudent = new Choices(filtroStudent, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","filtrobeneficiario");

        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // console.log(datos);
            filtroStudent.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                const optionE = document.createElement("option");
                optionE.value = element.idusuario;
                optionE.text = element.nombres;
                const nombrerols =  optionE.dataset.nombrerol = element.nombrerol;
                filtroStudent.appendChild(optionE);
            });
            choiselistarStudent.setChoices([], 'value','label',true);
            choiselistarStudent.setChoices(datos, 'idusuario','nombres', true);
        })
    }
    listarUsuario()

    function conseguirlibros(){
        const choiselistarlibro = new Choices(libro, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","conseguirlibro");
        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            libro.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                const optionTag = document.createElement("option");
                optionTag.value = element.idlibro;
                optionTag.text = element.libro;
                optionTag.dataset.subcategoria = element.subcategoria;
                optionTag.dataset.categoria = element.categoria;

                libro.appendChild(optionTag);
            });
            choiselistarlibro.setChoices([], 'value','label',true);
            choiselistarlibro.setChoices(datos, 'idlibro','libro', true);
            
            // listarEjemplares();
        });
    }

    const choicesLibro= new Choices(filtroEjempla, {
        searchEnabled: true,
        itemSelectText: '',
        allowHTML:true
    });
    // choicesLibro.setChoices([], 'value','label',true);

    function listarEjemplares(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","filtroEjemplar");
        parametros.append("idlibro", libro.value);

        fetch("../controller/validacion.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            console.log(datos);
            filtroEjempla.innerHTML++;
            datos.forEach(element => {
                const option = document.createElement("option");
                option.value = element.idejemplar;
                option.text = element.Ejemplares;
                const jimena =  option.dataset.condicion = element.condicion;
                // option.dataset.categoria = element.categoria;
                filtroEjempla.appendChild(option);
            });
            choicesLibro.setChoices([], 'value','label',true);
            choicesLibro.setChoices(datos, 'idejemplar','Ejemplares', true);
        });
    } 

    // function agregarLibros() {
    //     const cantidadLibros = parseInt(document.getElementById('cantidad').value, 10);
    //     const elementosSelect = Array.from(filtroEjempla.options);

    //     // Verificar si el estudiante ya ha seleccionado un libro
    //     if (filtroStudent.dataset.nombrerol = 'Estudiante' && libroAgregados.size > 0) {
    //         toastError("Los estudiantes solo pueden agregar un libro a la vez.");
    //         return;
    //     }

    //     // Iterar sobre la cantidad especificada de libros
    //     for (let i = 0; i < cantidadLibros; i++) {
    //         // Obtener el índice actual
    //         const indiceActual = i % elementosSelect.length;

    //         // Obtener el elemento del select en el índice actual
    //         const idlejemplarSeleccionado = elementosSelect[indiceActual];
    //         const idejemplar = idlejemplarSeleccionado.value;
    //         const nombreLibro = idlejemplarSeleccionado.label;
    //         const fechaDevolucion = fechadevolucion.value;
    //         const condicion = idlejemplarSeleccionado.dataset.condicion || Condicionentrega.value;

    //         // No agregar el libro si las fechas no son válidas o si ya ha sido agregado
    //         if (libroAgregados.has(idejemplar)) {
    //             toastError("Este libro ya ha sido agregado");
    //         } else {
    //             let nuevaFila = `
    //                 <tr>
    //                     <td>${idejemplar}</td>
    //                     <td>${nombreLibro}</td>
    //                     <td>${fechaDevolucion}</td>
    //                     <td>${condicion}</td>
    //                     <td>
    //                         <a href='#' class='btn btn-danger eliminar'>Eliminar</a>
    //                     </td>
    //                 </tr>`;
    //             tablalibro.innerHTML += nuevaFila;
    //             libroAgregados.add(idejemplar);
    //         }
    //     }
    // }

    function agregarLibros() {
        const cantidadLibros = parseInt(document.getElementById('cantidad').value, 10);
        const elementosSelect = Array.from(filtroEjempla.options);

        // Verificar si el estudiante ya ha seleccionado un libro
        // if (filtroStudent.dataset.nombrerol = 'Estudiante' && libroAgregados.size > 0) {
        //     toastError("Los estudiantes solo pueden agregar un libro a la vez.");
        //     return;
        // }
        // Iterar sobre la cantidad especificada de libros
        for (let i = 0; i < cantidadLibros; i++) {
            // Obtener el índice actual
            const indiceActual = i % elementosSelect.length;

            // Obtener el elemento del select en el índice actual
            const idlejemplarSeleccionado = elementosSelect[indiceActual];
            const idejemplar = idlejemplarSeleccionado.value;
            const nombreLibro = idlejemplarSeleccionado.label;
            const fechaDevolucion = fechadevolucion.value;
            const condicion = idlejemplarSeleccionado.dataset.condicion || Condicionentrega.value;

            // No agregar el libro si las fechas no son válidas o si ya ha sido agregado
            if (libroAgregados.has(idejemplar)) {
                toastError("Este libro ya ha sido agregado");
            } else {
                let nuevaFila = `
                    <tr>
                        <td>${idejemplar}</td>
                        <td>${nombreLibro}</td>
                        <td>${fechaDevolucion}</td>
                        <td>${condicion}</td>
                        <td>
                            <a href='#' class='btn btn-danger eliminar'>Eliminar</a>
                        </td>
                    </tr>`;
                tablalibro.innerHTML += nuevaFila;
                libroAgregados.add(idejemplar);
            }
        }
    }

    Agregar.addEventListener("click", agregarLibros);

    tablalibro.addEventListener("click", function(event) {
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
            libroAgregados.delete(idejemplarAEliminar);
        }
    });

    function AddPrestamoReservar(){
        // console.log(idusuario);
        const parametros = new URLSearchParams();
        parametros.append("operacion","registrarSoloPrestamo");
        parametros.append("idbeneficiario", filtroStudent.value);
        parametros.append("idbibliotecario", idUsuario);
        parametros.append("fechaprestamo", fecharegistar.value);
        parametros.append("descripcion", document.querySelector("#descripcion").value);
        parametros.append("enbiblioteca", biblioteca.value);
        parametros.append("lugardestino", lugarDesti.value);
        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
            if(datos.status){
                traerPrestamo();
                biblioteca.value = ''
                des.value = ''
                fecharegistar.value = ''
                filtroStudent.value = ''
                // document.querySelector("#formk-prestamos").reset();
                // tablareset.reset();
                tablalibro.querySelector("tbody").innerHTML = '';
                Condicionentrega.value = ''
                fechadevolucion.value = ''
                cantidad.value = ''
            }else{
                console.log(datos.message);
            }
        })
    }

    function AddPrestamoAhora(){
        // console.log(idusuario);
        if(fecharegistar.value ==''){
            toastError('Debe seleccionar elegir fecha de prestamo')
        }
        if(filtroStudent.value ==''){
            toastError('Debe elegir al estudiante')
        }
        if(biblioteca.value ==''){
            toastError('Debe elegir el lugar')
        }
        const parametros = new URLSearchParams();
        parametros.append("operacion","registrarAhora");
        parametros.append("idbeneficiario", filtroStudent.value);
        parametros.append("idbibliotecario", idUsuario);
        parametros.append("descripcion", document.querySelector("#descripcion").value);
        parametros.append("enbiblioteca", biblioteca.value);
        parametros.append("lugardestino", lugarDesti.value);
        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
            if(datos.status){
                traerPrestamoAhora();
                biblioteca.value = ''
                des.value = ''
                fecharegistar.value = ''
                filtroStudent.value = ''
                // document.querySelector("#formk-prestamos").reset();
                // tablareset.reset();
                tablalibro.querySelector("tbody").innerHTML = '';
                Condicionentrega.value = ''
                fechadevolucion.value = ''
                cantidad.value = ''
            }else{
                console.log(datos.message);
            }
        })
    }

    function registrarLibroentregado(idprestamo){
        if(fecharegistar.value ==''){
            toastError('Debe seleccionar elegir fecha de prestamo')
        }
        if(filtroStudent.value ==''){
            toastError('Debe elegir al estudiante')
        }
        if(biblioteca.value ==''){
            toastError('Debe elegir el lugar')
        }
        if(fechadevolucion.value ==''){
            toastError('Debe seleccionar la fecha devolucion')
        }
        mostrarPregunta("PRESTAMO", "¿Estas seguro de realizar el Prestamo?").then((result)=>{
            if(result.isConfirmed){
                const row = tablalibro.rows;
                for (let i = 1; i < row.length; i++) {
                    const idejemplar = parseInt(row[i].cells[0].innerText);
                    const condicionEntre   = String(row[i].cells[3].innerText);
                    const fechaD = String(row[i].cells[2].innerText);
                    const parametros = new URLSearchParams();
                    parametros.append("operacion", "registrarLibroentregado");
                    parametros.append("idprestamo", idprestamo);
                    parametros.append("idejemplar", idejemplar);
                    parametros.append("condicionentrega", condicionEntre);
                    parametros.append("fechadevolucion", fechaD);

                    fetch("../controller/prestamos.php",{
                        method:'POST',
                        body: parametros
                    })
                    .then(respuesta => respuesta.json())
                    .then(datos => {
                        // console.log(datos);
                        if(datos.status){
                            
                        }
                    })
                }
            }
        })
    }

    function registrarLibroentregado2(idprestamo){
        if(fechadevolucion.value ==''){
            toastError('Debe seleccionar la fecha devolucion')
        }
        mostrarPregunta("PRESTAMO", "¿Estas seguro de realizar el prestamo?").then((result)=>{ 
            if(result.isConfirmed){
                const filaAhora = tablalibro.rows;
                const promesas = [];
                for (let i = 1; i < filaAhora.length; i++) {
                    const idejemplo = parseInt(filaAhora[i].cells[0].innerText);
                    const fecha     = String(filaAhora[i].cells[2].innerText);
                    const condicionEntre = String(filaAhora[i].cells[3].innerText);
                    console.log(idejemplo);
                    const parametros = new URLSearchParams();
                    parametros.append("operacion", "AddLibroentregadonow");
                    parametros.append("idprestamo", idprestamo);
                    parametros.append("idejemplar", idejemplo);
                    parametros.append("condicionentrega", condicionEntre);
                    parametros.append("fechadevolucion", fecha);

                    const fetchPromise = fetch("../controller/prestamos.php", {
                        method: "POST",
                        body: parametros
                    })
                    .then(response => {
                        if (response.ok) {
                        // Si la respuesta es exitosa, puedes realizar acciones adicionales aquí si es necesario.
                        console.log(`Detalle ${idejemplo} registrado con éxito.`);
                        } else {
                        // Manejar errores de solicitud aquí
                        console.error(`Error al registrar el detalle ${idejemplo}.`);
                        }
                    })
                    .catch(error => {
                        // Manejar errores de red aquí
                        console.error(`Error de red al registrar el detalle ${idejemplo}.`, error);
                    });
                    promesas.push(fetchPromise);
                }
                tablalibro.querySelector("tbody").innerHTML = '';
            }
        });
    }

    function TraerDescripcion(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "traerDescripcion");
        parametros.append("idusuario", filtroStudent.value);
        fetch("../controller/prestamos.php", {
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            console.log(datos);
            datos.forEach(element => {
                des.value = element.descripcion; 
            });
        });
    }

    function traercondicion(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "traerCondicion");
        parametros.append("idejemplar", filtroEjempla.value);
        fetch("../controller/prestamos.php", {
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            console.log(datos);
            datos.forEach(element => {
                Condicionentrega.value = element.condicion; 
            });
        });
    }

    function TraerDescripcion() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "traerDescripcion");
        parametros.append("idusuario", filtroStudent.value);

        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            console.log(datos);
            // Check if datos array is empty
            if (datos.length === 0) {
                alert("No data available");
            } else {
                // Assuming you want to update 'des' with the first item in the array
                des.value = datos[0].descripcion;
            }
        })
    }

    conseguirlibros();
    // listarprestamo();
    
    Guardar.addEventListener("click", ValidarRegistrar);
    libro.addEventListener("change", listarEjemplares);
    filtroStudent.addEventListener("change", TraerDescripcion);
    filtroEjempla.addEventListener("change", traercondicion);
</script>
