<?php require_once 'permisos.php'; ?>

<style>
    /* Estilo para ocultar el div inicialmente */
    #divPrestamo {
        display: none;
        /* display: block; */
    }
    .error-input {
        border: 1px solid red;
    }

</style>
<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-lighter text-center" style="color:#08426e ;">REGISTRAR UN NUEVO PRÉSTAMO</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-prestamos">
                    <div class="ml-5  row">
                        <div class="col-md-3">
                            <label style="color:#000000;" class="fw-bold">NOMBRES Y APELLIDOS :</label>
                        </div>
                        <div class="col-md-7">
                            <select class="form-control" id="filtroUser">
                            
                            </select>
                        </div>
                    </div>
                    <!-- aqui va lo que dijo irene -->
                    <div class="ml-5 row mt-3">
                        <label style="color:#000000;" class="fw-bold">TIPO DE PRÉSTAMOS</label>
                        <div class="form-check ml-3">
                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="ahora" checked>
                            <label class="form-check-label" for="flexRadioDefault1">PRESTAR</label>
                            <input class="form-check-input ml-4" type="radio" name="flexRadioDefault" id="reservar">
                            <label class="form-check-label ml-5" for="flexRadioDefault2">RESERVAR</label>
                            
                        </div>
                        <div class="ml-4">
                            <h6>---------------------------------------------------------------------------------------------------------------</h6>
                        </div>
                    </div>
                    
                        <div class="row ml-5 mt-4">
                            <div class="col-md-3" id="divPrestamo">
                                <label for="" style="color:#000000;" class="fw-bolder">FECHA PRÉSTAMO</label>
                                <input type="date"  class="form-control" id="fprestamo">
                            </div>
                            <div class="col-md-3">
                                <label for="" style="color:#000000;" class="fw-bolder">EN BIBLIOTECA</label>
                                <select class="form-control" id="enbiblioteca">
                                    <option value="">Eliga</option>
                                    <option value="SI">SI</option>
                                    <option value="NO">NO</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="" style="color:#000000;" class="fw-bolder">DESCRIPCIÓN</label>
                                <input type="text" class="form-control" id="descripcion" placeholder="Grado o curso" required>
                            </div>
                            <div class="col-md-3" id="lugarD">
                                <label for="" style="color:#000000;" class="fw-bolder">DESTINO</label>
                                <input type="text" class="form-control" maxlength="20" placeholder="ejemplo: laboratorio" id="lugardestino" required>
                            </div>
                        </div>
                        <div class="row ml-5 mt-4">
                            <div class="col-md-3">
                                <label for="libro" class="fw-bolder" style="color:#000000;">Libro</label>
                                <select name="" id="selectlibro" class="form-control">

                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="fw-bolder" style="color:#000000;">Código</label>
                                <select name="" id="filtroEjemplar" class="form-control mb-3">
                                    <!-- <option value="">Hola</option> -->
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label class="fw-bolder" style="color:#000000;">Cantidad</label>
                                <input type="number" class="form-control" id="cantidad" value="1" required>
                            </div>
                            <div class="col-md-2">
                                <label class="fw-bolder" style="color:#000000;">Condición Entrega</label>
                                <input type="text" class="form-control mb-3" id="condicionentrega" required>
                            </div>
                            <div class="col-md-2">
                                <label class="fw-bolder" style="color:#000000;">Fecha devolución</label>
                                <div class="input-group mb-4">
                                    <input type="date" class="form-control" id="fechadevolucion" required>
                                    
                                </div>
                            </div>
                            <div class="col-md-1 mt-4">
                                <button class="btn btn-outline-info" type="button" id="Rguardarlibro"><i class="bi bi-cart-plus-fill"></i></button>
                            </div>
                        </div>
                    <div class="row ml-5 mt-2">
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
    const divPrestamo =  document.querySelector("#divPrestamo");
    const divLugar = document.querySelector("#lugarD");
    const lugarDesti = document.querySelector("#lugardestino");
    const filtroStudent = document.querySelector("#filtroUser");
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

    //validacionCalor
    const cantidarol = '';
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
    // fechadevolucion.value = fecham

    filtroStudent.addEventListener("change", function() {
        traerRol();
    })

    function Reseteartabla(){
        const row = tablalibro.querySelectorAll('tbody tr');
        row.forEach((fila) => {
            fila.remove();
        })
    }

    Reservar.addEventListener("change", function (){
        if (Reservar.checked) {
            // prestamoDiv.style.display = 'block';
            divPrestamo.style.display = 'block';
        }
    });

    ahora.addEventListener("change", function() {
        if(ahora.checked){
            // prestamoDiv.style.display = 'block';
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

    let nombrerolUser = 0;
    function listarUser(){
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
                optionE.setAttribute('data-nombrerol', element.nombrerol);
                // const nombrerols =  optionE.dataset.nombrerol;
                nombrerolUser = element.nombrerol;
                // console.log(optionE);
                
                filtroStudent.appendChild(optionE);
            });
            choiselistarStudent.setChoices([], 'value','label',true);
            choiselistarStudent.setChoices(datos, 'idusuario','nombres', true);
        })
    }

    listarUser();

    biblioteca.addEventListener("change", function(event){
        const valor = event.target.value

        if(valor == 'NO'){
            divLugar.classList.remove("d-none")
        }else if(valor == 'SI'){
            divLugar.classList.add("d-none")
        }
    })

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

    // let ultimoIndiceSeleccionado = 0;
    function agregarLibros(){
        const cantidadLibros = parseInt(document.getElementById('cantidad').value);
        const elementosSelect = Array.from(filtroEjempla.options);
        const usuarioSeleccionado = filtroStudent.value;
        const rolUsuario = filtroStudent.selectedOptions[0].dataset.nombrerol;

        const ultimoI = tablalibro.rows.length - 1;
        for (let i = 0; i < cantidadLibros; i++) {

            if (nombrerolUser == 'Estudiante' && tablalibro.rows.length > 1) {
                toastError("Los estudiantes solo pueden agregar un ejemplar.");
                return;
            }
            const indiceActual = (ultimoI + i) % elementosSelect.length;
            // Obtener el elemento del select en el índice actual
            const idlejemplarSeleccionado = elementosSelect[indiceActual];
            const idejemplar = idlejemplarSeleccionado.value;
            const nombreLibro = idlejemplarSeleccionado.label;
            const fechaDevolucion = fechadevolucion.value;
            const condicion = idlejemplarSeleccionado.dataset.condicion || Condicionentrega.value;

            if (!fechaDevolucion) {
                marcarErrorInput(fechadevolucion);
                toastError("Complete la fecha de devolucion");
                return;
            }

            const fechaHoy = new Date();
            const fechaAyer = new Date();
            const fechaLimite = new Date();
            fechaAyer.setDate(fechaHoy.getDate() - 1); // Obtener la fecha de ayer
            fechaLimite.setDate(fechaHoy.getDate() + 3); 

            const fechaDevolucionDate = new Date(fechaDevolucion);

            if (fechaDevolucionDate <= fechaAyer) {
                toastError("La fecha de devolución no puede ser anterior al día de ayer");
                return;
            }

            if (fechaDevolucionDate > fechaLimite) {
                toastError("Solo se permiten devoluciones hasta cuatro días después de mañana");
                return;
            }
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
                            <a href='#' class=' btn btn-sm btn btn-danger eliminar'>Eliminar</a>
                        </td>
                    </tr>`;
                tablalibro.innerHTML += nuevaFila;
                libroAgregados.add(idejemplar);
            }
            // ultimoIndiceSeleccionado = indiceActual;
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

    function marcarErrorInput(inputElement) {
        inputElement.classList.add('error-input');
    }

    // Función para quitar el marcado de error del input
    function quitarErrorInput(inputElement) {
        inputElement.classList.remove('error-input');
    }

    function AddPrestamoReservar(){
        if(fecharegistar.value ==''){
            marcarErrorInput(fecharegistar);
            toastError('Debe seleccionar elegir fecha de prestamo');
            return
        }else{
            quitarErrorInput(fecharegistar);
        }

        if(filtroStudent.value ==''){
            // marcarErrorInput(filtroStudent);
            toastError('Debes elegir al estudiante')
            return
        }
        // else{
        //     quitarErrorInput(filtroStudent);
        // }

        if(biblioteca.value ==''){
            marcarErrorInput(biblioteca);
            toastError('Debes elegir el lugar');
            return
        }else{
            quitarErrorInput(biblioteca);
        }

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
                Condicionentrega.value = ''
                fechadevolucion.value = ''
                cantidad.value = ''
            }else{
                console.log(datos.message);
            }
        })
    }

    function AddPrestamoAhora(){
        if(filtroStudent.value ==''){
            marcarErrorInput(filtroStudent);
            toastError('Debes elegir al estudiante')
        }else{
            quitarErrorInput(filtroStudent);
        }

        if(biblioteca.value == ''){
            toastError('Debes elegir el lugar');
        }

        if(document.querySelector("#selectlibro").value == ''){
            toastError('Escoga el libro');
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
                Condicionentrega.value = ''
                fechadevolucion.value = ''
                cantidad.value = ''
            }else{
                console.log(datos.message);
            }
        })
    }

    function registrarLibroentregado(idprestamo){
        mostrarPregunta("PRESTAMO", "¿Estas seguro de realizar el Prestamo?").then((result)=>{
            if(result.isConfirmed){
                const row = tablalibro.rows;
                const promesas1 = [];
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

                    const fetchPromises = fetch("../controller/prestamos.php", {
                        method: "POST",
                        body: parametros
                    })
                    .then(response => {
                        if (response.ok) {
                            // Si la respuesta es exitosa, puedes realizar acciones adicionales aquí si es necesario.
                            // console.log(`Detalle ${idejemplo} registrado con éxito.`);
                            filtroEjempla.value = ''
                            libro.value = ''
                            filtroStudent.value = ''
                            Reseteartabla();
                        } else {
                        // Manejar errores de solicitud aquí
                        console.error(`Error al registrar el detalle ${idejemplo}.`);
                        }
                    })
                    .catch(error => {
                        // Manejar errores de red aquí
                        console.error(`Error de red al registrar el detalle ${idejemplo}.`, error);
                    });
                    promesas1.push(fetchPromises);
                }
            }
        })
    }

    function registrarLibroentregado2(idprestamo){
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
                        filtroEjempla.value = ''
                        libro.value = ''
                        filtroStudent.value = ''
                        Reseteartabla();
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
            // console.log(datos);
            datos.forEach(element => {
                des.value = element.descripcion; 
            });
        });
    }

    function traerRol(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "traerRol");
        parametros.append("idrol", filtroStudent.value);
        fetch("../controller/prestamos.php", {
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            // console.log(datos);
            datos.forEach(element => {
                nombrerolUser = element.nombrerol;
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

    conseguirlibros();

    Guardar.addEventListener("click", ValidarRegistrar);
    libro.addEventListener("change", listarEjemplares);
    filtroStudent.addEventListener("change", TraerDescripcion);
    filtroEjempla.addEventListener("change", traercondicion);
</script>
