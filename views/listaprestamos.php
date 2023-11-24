<?php
session_start();
if(!isset($_SESSION['login']) || (!$_SESSION['login']['status']))
{
    header("Location:../");
}

$datoID = json_encode($_SESSION['login']);
?>
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
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR UN NUEVO PRESTAMO</h3>
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
                            <select class="form-control" id="filtronombres">
                            
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
                            <label for="" style="color:#574E4E;">FECHA PRESTAMO</label>
                            <input type="date"  class="form-control" required=""id="fprestamo">
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
                            <label for="" style="color:#574E4E;">DESCRIPCION</label>
                            <input type="text" class="form-control" id="descripcion">
                        </div>
                        <div class="col-md-3" id="lugarD">
                            <label for="" style="color:#574E4E;">DESTINO</label>
                            <input type="text" class="form-control" maxlength="20" placeholder="Salon 1" id="lugardestino">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="Libro">Libro</label>
                            <select name="" id="libro" class="form-control">

                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Ejemplar</label>
                            <select name="" id="filtroEjemplar" class="form-control mb-3">
                                <!-- <option value="">Hola</option> -->
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label>Cantidad</label>
                            <input type="number" class="form-control" id="cantidad" value="1">
                        </div>
                        <div class="col-md-2">
                            <label>Condicion Entrega</label>
                            <input type="text" class="form-control mb-3" id="condicionentrega">
                        </div>
                        <div class="col-md-2">
                            <label>Fecha devolucion</label>
                            <div class="input-group mb-4">
                                <input type="date" class="form-control" id="fechadevolucion">
                                <div class="input-group-append" id="a">
                                    <button class="btn btn-outline-warning" type="button" id="Rguardarlibro">Apuntar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <table class="table table-bordered mt-4" id="tabla2" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Libro</th>
                                    <th>F.Devolucion</th>
                                    <th>Condicion</th>
                                    <th>Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                    <p class="text-center mt-4">
                        <button type="button" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
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
    // const bt = document.querySelector("#kk");
    const divLugar = document.querySelector("#lugarD");
    const lugarDesti = document.querySelector("#lugardestino");
    const filtroStudent = document.querySelector("#filtronombres");
    const libro = document.querySelector("#libro");
    const Agregar = document.querySelector("#Rguardarlibro");
    const des = document.querySelector("#descripcion");
    // const cuerpo = document.querySelector("tbody");
    //const cantidad = document.querySelector("#cantidad");
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
                let select = `
                    <option value='${element.idusuario}'>${element.nombres}</option> 
                `;
                filtroStudent.innerHTML +=select;
            });
            choiselistarStudent.setChoices([], 'value','label',true);
            choiselistarStudent.setChoices(datos, 'idusuario','nombres', true);
        })
    }

    function conseguirlibro(){
        const choiselistarlibro= new Choices(libro, {
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
            filtroEjempla.innerHTML++;
            datos.forEach(element => {
                let Select = `
                    <option value='${element.idejemplar}'>${element.Ejemplares}</option> 
                `
                filtroEjempla.innerHTML +=Select;
            });
            choicesLibro.setChoices([], 'value','label',true);
            choicesLibro.setChoices(datos, 'idejemplar','Ejemplares', true);
        });
    }

    // function agregarLibros() {
    //     const cantidadLibros = parseInt(document.getElementById('cantidad').value, 10);
    //     const elementosSelect = Array.from(filtroEjempla.options);

    //     // Iterar sobre la cantidad especificada de libros
    //     for (let i = 0; i < cantidadLibros; i++) {
    //         // Obtener el índice actual
    //         const indiceActual = i % elementosSelect.length;

    //         // Obtener el elemento del select en el índice actual
    //         const idlejemplarSeleccionado = elementosSelect[indiceActual];
    //         const idejemplar = idlejemplarSeleccionado.value;
    //         const nombreLibro = idlejemplarSeleccionado.label;
    //         const fechaDevolucion = fechadevolucion.value;
    //         const condicion = Condicionentrega.value;

    //         // No agregar el libro si las fechas no son válidas o si ya ha sido agregado
    //         if (libroAgregados.has(idejemplar)) {
    //             alert("Este libro ya ha sido agregado");
    //         } else {
    //             let nuevaFila = `
    //                 <tr>
    //                     <td>${idejemplar}</td>
    //                     <td>${nombreLibro}</td>
    //                     <td>${fechaDevolucion}</td>
    //                     <td>${condicion}</td>
    //                     <td>
    //                         <a href='#' class='eliminar'>Eliminar</a>
    //                     </td>
    //                 </tr>`;
    //             tablalibro.innerHTML += nuevaFila;

    //             libroAgregados.add(idejemplar);
    //         }
    //     }
    // }

// Variable para rastrear los libros agregados
    let librosAgregados = [];

    function agregarFilaTabla(idejemplar, nombreLibro, fechaDevolucion, condicion) {
        const nuevaFila = document.createElement('tr');

        nuevaFila.innerHTML = `
            <td>${idejemplar}</td>
            <td>${nombreLibro}</td>
            <td>${fechaDevolucion}</td>
            <td>${condicion}</td>
            <td>
                <a href='#' class='eliminar'>Eliminar</a>
            </td>`;

        // Agregar la nueva fila a la tabla
        tablalibro.appendChild(nuevaFila);
    }

    function agregarLibros() {
        const cantidadLibros = parseInt(document.getElementById('cantidad').value, 10);
        const elementosSelect = filtroEjempla.options;

        // Obtener el último índice de libros agregados o 0 si no hay ninguno
        const ultimoIndice = librosAgregados.length > 0 ? librosAgregados[librosAgregados.length - 1] : 0;

        // Iterar sobre la cantidad especificada de libros
        for (let i = 0; i < cantidadLibros; i++) {
            // Obtener el índice actual
            const indiceActual = (i + ultimoIndice) % elementosSelect.length;

            // Obtener el elemento del select en el índice actual
            const idlejemplarSeleccionado = elementosSelect[indiceActual];
            const idejemplar = idlejemplarSeleccionado.value;
            const nombreLibro = idlejemplarSeleccionado.label;
            const fechaDevolucion = fechadevolucion.value;
            const condicion = Condicionentrega.value;

            // No agregar el libro si ya ha sido agregado
            if (librosAgregados.includes(idejemplar)) {
                alert("Este libro ya ha sido agregado");
            } else {
                agregarFilaTabla(idejemplar, nombreLibro, fechaDevolucion, condicion);
                librosAgregados.push(idejemplar);
            }
        }
    }

    Agregar.addEventListener("click", agregarLibros);


    tablalibro.addEventListener("click", function(event) {
        // Verificar si el clic fue en un botón de clase "btn-danger"
        if (event.target.classList.contains("eliminar")) {
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
        const respuesta = <?php echo $datoID;?>;
        const idusuario = respuesta.idusuario;
        // console.log(idusuario);
        const parametros = new URLSearchParams();
        parametros.append("operacion","registrarSoloPrestamo");
        parametros.append("idbeneficiario", filtroStudent.value);
        parametros.append("idbibliotecario", idusuario);
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
            }else{
                console.log(datos.message);
            }
        })
    }

    function AddPrestamoAhora(){
        const respuesta = <?php echo $datoID;?>;
        const idusuario = respuesta.idusuario;
        // console.log(idusuario);
        const parametros = new URLSearchParams();
        parametros.append("operacion","registrarAhora");
        parametros.append("idbeneficiario", filtroStudent.value);
        parametros.append("idbibliotecario", idusuario);
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
            }else{
                console.log(datos.message);
            }
        })
    }

    function registrarLibroentregado(idprestamo){
        if(confirm("estas seguro de guardar?")){
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
                        document.querySelector("#form-prestamos").reset();
                        tablalibro.reset();
                    }else{
                        datos.message();
                    }
                })
            }
        }
    }

    function registrarLibroentregado2(idprestamo){
        if(confirm("estas seguro de guardar?")){
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
                // fetch("../controller/prestamos.php",{
                //     method:'POST',
                //     body: parametros
                // })
                // .then(respuesta => respuesta.json())
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
        }
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

    conseguirlibro();
    listarUsuario();
    // listarprestamo();
    filtroEjempla.addEventListener("change", TraerDescripcion);
    Guardar.addEventListener("click", ValidarRegistrar);
    libro.addEventListener("change", listarEjemplares);

</script>
