<?php
session_start();
if(!isset($_SESSION['login']) || (!$_SESSION['login']['status']))
{
    header("Location:../");
}

$datoID = json_encode($_SESSION['login']);
?>

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
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="ahora">
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
                            <input type="text" class="form-control" placeholder="Grado o Curso" id="descripcion">
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
                            <label>Cantidad</label>
                            <select name="" id="filtroEjemplar" class="form-control mb-3">
                                <!-- <option value="">Hola</option> -->
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label>Condicion Entrega</label>
                            <input type="text" class="form-control mb-3" id="condicionentrega">
                        </div>
                        <div class="col-md-3">
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
                                    <th>F.Prestamo</th>
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

    // function fecha(){        
    //     var fechactual =  new Date();
    //     var Fprestamo = document.querySelector("#fprestamo").value
    //     var Fdevolucion = document.querySelector("#fechadevolucion").value;
    //     var Pregistrar = new Date(Fprestamo);
    //     if(Pregistrar >= fechactual && Fprestamo <= Fdevolucion){
    //         agregarLibros();
    //     }else{
    //         alert("No pueder realizar un prestamos antes del dia de hoy"); 
    //     }
    // }

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
        }else{
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

    function listarEjemplares(){
        const choiselistarlibroE= new Choices(filtroEjempla, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","filtroEjemplar");
        parametros.append("idlibro", libro.value);

        fetch("../controller/validacion.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            filtroEjempla.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let Select = `
                    <option value='${element.idejemplar}'>${element.Ejemplares}</option> 
                `
                filtroEjempla.innerHTML +=Select;
            });
            choiselistarlibroE.setChoices([], 'value','label',true);
            choiselistarlibroE.setChoices(datos, 'idejemplar','Ejemplares', true);
        });
    }

    // libro.addEventListener("change" , () => {
    //     const libroSeleccionado = libro.options[libro.selectedIndex];
    //     Filtrosubcategoria.value = libroSeleccionado.dataset.subcategoria;
    //     selectcategoria.value = libroSeleccionado.dataset.categoria;
    // });

    function agregarLibros(){
        const idlejemplarSeleccionado = filtroEjempla.options[filtroEjempla.selectedIndex];
        const idejemplar = idlejemplarSeleccionado.value;
        const nombreLibro = idlejemplarSeleccionado.label;
        const fechaPrestamo = fecharegistar.value;
        const fechaDevolucion = fechadevolucion.value;
        const condicion = Condicionentrega.value;
        // const subcate = filtrosubcategoria.value
        //no agregar el libro si las fehas no son validas
        if(libroAgregados.has(idejemplar)){
            alert("este libro ya se ah sido agregado");
            return;
        }else{
            let nuevaFila = `
            <tr>
                <td>${idejemplar}</td>
                <td>${nombreLibro}</td>
                <td>${fechaPrestamo}</td>
                <td>${fechaDevolucion}</td>
                <td>${condicion}</td>
                <td>
                    <button type="button" class="btn btn-danger">Eliminar</button>
                </td>
            </tr>`;
            tablalibro.innerHTML += nuevaFila;
        }
        libroAgregados.add(idejemplar);
    }

    Agregar.addEventListener("click", agregarLibros);

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
                const condicionEntre   = String(row[i].cells[4].innerText);
                const fechaD = String(row[i].cells[3].innerText);
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
                        alert("Prestamo guardados correctamente");
                    }
                    else{
                        datos.message();
                    }
                })
            }
        }
    }

    function registrarLibroentregado2(idprestamo){
        if(confirm("estas seguro de guardar?")){
            const filaAhora = tablalibro.rows;
            for (let i = 1; i < filaAhora.length; i++) {
                const idejemplo = parseInt(filaAhora[i].cells[0].innerText);
                const fecha     = String(filaAhora[i].cells[3].innerText);
                const condicionEntre = String(filaAhora[i].cells[4].innerText);
                const parametros = new URLSearchParams();
                parametros.append("operacion", "AddLibroentregadonow");
                parametros.append("idprestamo", idprestamo);
                parametros.append("idejemplar", idejemplo);
                parametros.append("condicionentrega", condicionEntre);
                parametros.append("fechadevolucion", fecha);

                fetch("../controller/prestamos.php",{
                    method:'POST',
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    // console.log(datos);
                    if(datos.status){
                        alert("Prestamo guardados correctamente");
                    }
                    else{
                        datos.message();
                    }
                })
            }
        }
    }

    conseguirlibro();
    listarUsuario();
    // listarprestamo();
    Guardar.addEventListener("click", ValidarRegistrar);
    libro.addEventListener("change", listarEjemplares);

</script>
