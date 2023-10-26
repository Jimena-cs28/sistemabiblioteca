<?php
session_start();
if(!isset($_SESSION['login']) || (!$_SESSION['login']['status']))
{
    header("Location:../");
}

$datoID = json_encode($_SESSION['login']);
?>
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../views/img/undraw_profile.svg" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran las reservaciones de libros hechas por los docentes y estudiantes, las cuales están pendientes para ser aprobadas por ti
        </div>
    </div>
</div>
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
                        <div class="col-md-8">
                            <select class="form-control" id="filtronombres">
                            </select>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">FECHA PRESTAMO</label>
                            <input type="date" class="form-control" required=""id="fprestamo">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">DESCRIPCION</label>
                            <input type="text" class="form-control" placeholder="Grado o Curso" id="descripcion">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">EN BIBLIOTECA</label>
                            <select class="form-control" required="" data-placement="top" id="enbiblioteca">
                                <option value="SI">SI</option>
                                <option value="NO">NO</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">DESTINO</label>
                            <input type="text" class="form-control" maxlength="20" placeholder="Salon 1" id="lugardestino">
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="submit" class="btn btn-primary" id="btguardar">Guardar</button>
                    </p>  
                </form>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="fw-semibold text-center m-0 font-weight-bolder" style="color:#0B5993 ;">LISTADO DE PRESTAMOS</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th style="color:#574E4E;">#</th>
                                <th style="color:#574E4E;">Nombres</th>
                                <th style="color:#574E4E;">Apellidos</th>
                                <th style="color:#574E4E;">Usuario</th>
                                <th style="color:#574E4E;">F. Solicitud</th>
                                <th style="color:#574E4E;">F. Prestamo</th>
                                <th style="color:#574E4E;">Rol</th>
                                <th style="color:#574E4E;">Ahora</th>
                                <th style="color:#574E4E;">Reservar</th>
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

    <!-- modal Rnuevo -->
<div class="modal fade" id="modal-nuevo" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #6980e6;">Registrar Libro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" id="modal-registrarlibro">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="Libro">Libro</label>
                            <div class="input-group mb-4">
                                <input type="text" class="form-control" id="libro">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-success" type="button" id="btBuscarLibro">Buscar</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="Categoria">Categoria</label>
                            <input type="text" class="form-control mb-3" id="filtrocategoria" disabled>
                        </div>
                        <div class="col-md-4">
                            <label for="">Sub Categoria</label>
                            <input type="text" class="form-control" id="filtrosubcategoria" disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Cantidad</label>
                            <input type="number" class="form-control mb-3" placeholder="00" id="cantidad">
                        </div>
                        <div class="col-md-4">
                            <label>Condicion Entrega</label>
                            <input type="text" class="form-control mb-3" id="condicionentrega">
                        </div>
                        <div class="col-md-4">
                            <label>Fecha devolucion</label>
                            <div class="input-group mb-4">
                                <input type="date" class="form-control" id="fechadevolucion">
                                <div class="input-group-append" id="fdevolucion">
                                    <button class="btn btn-outline-warning" type="button" id="gudarlibro">Apuntar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <table class="table table-bordered mt-4" id="tablalibros" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>SubCategoria</th>
                                    <th>Libro</th>
                                    <th>Cantidad</th>
                                    <th>F.Devolucion</th>
                                    <th>Condicion</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guardar">Guardar</button>
            </div>
        </div>
    </div>
</div>

<!-- modal reserva -->
<!-- <div class="modal fade" id="LReservar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #6980e6;">Registrar Libro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" id="modal-registrarlibroreserva">
                    <div class="row">
                        <div class="col-md-4">
                            <label for="Libro">Libro</label>
                            <div class="input-group mb-4">
                                <input type="text" class="form-control" id="Rlibro">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-success" type="button" id="RbtBuscarLibro">Buscar</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="Categoria">Categoria</label>
                            <input type="text" class="form-control mb-3" id="Rfiltrocategoria" disabled>
                        </div>
                        <div class="col-md-4">
                            <label for="">Sub Categoria</label>
                            <input type="text" class="form-control" id="Rfiltrosubcategoria" disabled>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Cantidad</label>
                            <input type="number" class="form-control mb-3" placeholder="00" id="Rcantidad">
                        </div>
                        <div class="col-md-4">
                            <label>Condicion Entrega</label>
                            <input type="text" class="form-control mb-3" id="Rcondicionentrega">
                        </div>
                        <div class="col-md-4">
                            <label>Fecha devolucion</label>
                            <div class="input-group mb-4">
                                <input type="date" class="form-control" id="Rfechadevolucion">
                                <div class="input-group-append" id="Rfdevolucion">
                                    <button class="btn btn-outline-warning" type="button" id="Rguardarlibro">Apuntar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <table class="table table-bordered mt-4" id="tablalibros" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>SubCategoria</th>
                                    <th>Libro</th>
                                    <th>Cantidad</th>
                                    <th>F.Devolucion</th>
                                    <th>Condicion</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="Rguardar">Guardar</button>
            </div>
        </div>
    </div>
</div> -->

<script>
    // console.log(idUsuario);
    let idprestamo = '';
    let idlibro = '';
    const Guardar = document.querySelector("#btguardar");
    const filtroStudent = document.querySelector("#filtronombres");
    const cuerpo = document.querySelector("tbody");
    const btguardar = document.querySelector("#guardar");
    const btguardarlibro = document.querySelector("#gudarlibro");
    const selectcategoria = document.querySelector("#filtrocategoria");
    const filtrosubcategoria = document.querySelector("#filtrosubcategoria");            
    const cantidad = document.querySelector("#cantidad");
    const libro = document.querySelector("#libro");
    const condicionentrega = document.querySelector("#condicionentrega");
    const fechadevolucion = document.querySelector("#fechadevolucion");
    const btBuscarLibro = document.querySelector("#btBuscarLibro");
    
    function listarprestamo(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listarprestamo")

        fetch("../controller/prestamos.php", {
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
                    <td>${element.idprestamo}</td>
                    <td>${element.nombres}</td>
                    <td>${element.apellidos}</td>
                    <td>${element.nombreusuario}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>${element.nombrerol}</td>
                    <td>
                        <a href='#modal-nuevo' class='Rnuevo' data-toggle='modal' data-idprestamo='${element.idprestamo}'>Nuevo</a>
                    </td>
                    <td>
                        <a href='#'  class='Rreservar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>Reservar</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += pres;
            });
        })
    }

    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'Rnuevo'){
            idprestamo = parseInt(event.target.dataset.idprestamo);
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerprestamo");
            parametros.append("idprestamo", idprestamo);

            fetch("../controller/prestamos.php",{
                method: 'POST',
                body: parametros
            })
            console.log(idprestamo)
            .then(response => response.json())
            .then(datos => {
                // listarLibros();
                // btguardarlibro.addEventListener("click", registrarLibroentregadosnuevo);
                btguardar.addEventListener("click", registrarLibroentregados);
            })
        }
    });

    // cuerpo.addEventListener("click", (event) => {
    //     if(event.target.classList[0] === 'Rreservar'){
    //         idprestamo = parseInt(event.target.dataset.idprestamo);
    //         const parametros = new URLSearchParams();
    //         parametros.append("operacion","obtenerprestamo");
    //         parametros.append("idprestamo", idprestamo);
    //         fetch("../controller/prestamos.php",{
    //             method: 'POST',
    //             body: parametros
    //         })
    //         .then(response => response.json())
    //         .then(datos => {
    //             // Rbtguardar.addEventListener("click", registrarlibroentregadoReserva);
    //         })  
    //     }
    // })

    function registrarLibroentregados(){
        if(confirm("estas seguro de guardar?")){
            const parametros = new URLSearchParams();
            parametros.append("operacion","registrarLibroentregado");
            parametros.append("idprestamo", idprestamo);
            parametros.append("idlibro", libro.dataset.idlibro);
            parametros.append("cantidad", cantidad.value);
            parametros.append("condicionentrega", condicionentrega.value);
            parametros.append("fechadevolucion", fechadevolucion.value);

            fetch("../controller/prestamos.php" ,{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                // console.log(datos);
                if(datos.status){
                alert("Datos guardados correctamente")
                    document.querySelector("#modal-registrarlibro").reset();
                }
            })
        }
    }

    // function registrarlibroentregadoReserva(){
    //     if(confirm("estas seguro de guardar?")){
    //         const parametros = new URLSearchParams();
    //         parametros.append("operacion","registrarlibroentregadoReserva");
    //         parametros.append("idprestamo", idprestamo);
    //         parametros.append("idlibro", document.querySelector("#Rlibro").value);
    //         parametros.append("cantidad", document.querySelector("#Rcantidad").value);
    //         parametros.append("condicionentrega", document.querySelector("#Rcondicionentrega").value);
    //         parametros.append("fechadevolucion", document.querySelector("#Rfechadevolucion").value);

    //         fetch("../controller/prestamos.php" ,{
    //             method:'POST',
    //             body: parametros
    //         })
    //         .then(respuesta => respuesta.json())
    //         .then(datos => {
    //             console.log(datos);
    //             if(datos.status){
    //             alert("Datos guardados correctamente")
    //                 document.querySelector("#modal-registrarlibroreserva").reset();
    //             }
    //         })
    //     }
    // }

    function conseguirlibro(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","conseguirlibro");
        parametros.append("nombre", libro.value);

        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            datos.forEach(element => {
                const idlibro = element.idlibro
                libro.dataset.idlibro = idlibro;
                // console.log(libro.dataset.idlibro);
                selectcategoria.value = element.categoria;
                filtrosubcategoria.value = element.subcategoria;
            });
        });
    }

    // listarlibros
    // function listarLibros(){
    //     const para = new URLSearchParams();
    //     para.append("operacion", "guardarLibro");
    //     para.append("idprestamo", idprestamo);
    //     fetch("../controller/prestamos.php", {
    //         method: 'POST',
    //         body: para
    //     })
    //     .then(response => response.json())
    //     .then(datos => {
    //         cuerpoT.innerHTML = ``;
    //         if(datos){
    //             datos.forEach(element => {
    //                 const libro = `
    //                 <tr>
    //                     <td>${element.idlibroentregado}</td>
    //                     <td>${element.subcategoria}</td>
    //                     <td>${element.nombre}</td>
    //                     <td>${element.cantidad}</td>
    //                     <td>${element.fechadevolucion}</td>
    //                     <td>${element.condicionentrega}</td>
    //                 </tr>`;
    //                 cuerpoT.innerHTML +=libro;
    //             });
    //         }else{
    //             tablas.reset();
    //         }
    //     });
    // }

    function listarCategoria(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","filtrobeneficiario");

        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            filtroStudent.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let select = `
                    <option value='${element.idusuario}'>${element.nombres} ${element.apellidos}</option> 
                `;
                filtroStudent.innerHTML += select;
            });
        })
    }

    function registrarPrestamo(){
        const respuesta = <?php echo $datoID;?>;
        const idusuario = respuesta.idbibliotecario;
        if(confirm("estas seguro de guardar?")){
            const parametros = new URLSearchParams();
            parametros.append("operacion","registrarPrestamo");
            parametros.append("idbeneficiario", filtroStudent.value);
            parametros.append("idbibliotecario", idUsuario);
            parametros.append("fechaprestamo", document.querySelector("#fprestamo").value);
            parametros.append("descripcion", document.querySelector("#descripcion").value);
            parametros.append("enbiblioteca", document.querySelector("#enbiblioteca").value);
            parametros.append("lugardestino", document.querySelector("#lugardestino").value);

            fetch("../controller/prestamos.php" ,{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                console.log(datos);
                if(datos.status){
                    alert("Datos guardados correctamente")
                    // document.querySelector("#form-prestamos").reset();
                }
            })
        }
    }
    
    listarprestamo();
    // listarLibros();
    listarCategoria();

    Guardar.addEventListener("click", registrarPrestamo);
    btBuscarLibro.addEventListener("click", conseguirlibro);
    libro.addEventListener("keypress", (evt) => {
        if(evt.charCode == 13) conseguirlibro();
    });
    // libro2.addEventListener("keypress", (evt) => {
    //     if(evt.charCode = 13) conseguirlibro();
    // })

</script>
