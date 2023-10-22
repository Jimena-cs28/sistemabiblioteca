<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <!-- <img src="../assets/img/calendar.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;"> -->
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
                <form id="">
                    <div class="ml-5 row">
                        <div class="col-md-3">
                            <label>NOMBRES Y APELLIDOS :</label>
                        </div>
                        <div class="col-md-8">
                            <select class="form-control form-control-sm" id="filtronombres">
                            </select>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">FECHA PRESTAMO</label>
                            <input type="date" class="form-control form-control-sm" required=""id="fprestamo">
                        </div>
                        <div class="col-md-3">
                            <label for="">DESCRIPCION</label>
                            <input type="text" class="form-control form-control-sm" placeholder="Grado o Curso" id="descripcion">
                        </div>
                        <div class="col-md-3">
                            <label for="">EN BIBLIOTECA</label>
                            <select class="form-control form-control-sm" required="" data-placement="top" id="enbiblioteca">
                                <option value="NO" selected="">NO</option>
                                <option value="SI" selected="">SI</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="">DESTINO</label>
                            <input type="text" class="form-control form-control-sm" maxlength="20" placeholder="Salon 1" id="lugardestino">
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
                                <th>#</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Usuario</th>
                                <th>F. Solicitud</th>
                                <th>F. Prestamo</th>
                                <th>Rol</th>
                                <th>Ahora</th>
                                <th>Reservar</th>
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
<div class="modal fade" id="modal-id" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
<div class="modal fade" id="LReservar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
</div>

<script>
    
    let idprestamo = '';
    const tablas = document.querySelector("#tablalibros");
    const cuerpoT = tablas.querySelector("tbody");
    const cuerpo = document.querySelector("tbody");
    const btguardar = document.querySelector("#guardar");
    const Rbtguardar = document.querySelector("#Rguardarlibro")
    const btBuscarLibro = document.querySelector("#btBuscarLibro");
    const btguardarlibro = document.querySelector("#gudarlibro");
    const selectcategoria = document.querySelector("#filtrocategoria");
    const filtrosubcategoria = document.querySelector("#filtrosubcategoria");            
    const cantidad = document.querySelector("#cantidad");
    const libro = document.querySelector("#libro");
    const condicionentrega = document.querySelector("#condicionentrega");
    const fechadevolucion = document.querySelector("#fechadevolucion");
    const RbtBuscarLibros = document.querySelector("#RbtBuscarLibro");
    
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
                        <a href='#LReservar' class='Rnuevo' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>Nuevo</a>
                    </td>
                    <td>
                        <a href='#modal-id'  class='Rreservar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>Reservar</a>
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
            .then(response => response.json())
            .then(datos => {
                listarLibros();
                btguardarlibro.addEventListener("click", registrarLibroentregadosnuevo);
                // btguardar.addEventListener("click", registrarLibroentregados);
            })  
        }
    })

    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'Rreservar'){
            idprestamo = parseInt(event.target.dataset.idprestamo);
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerprestamo");
            parametros.append("idprestamo", idprestamo);
            fetch("../controller/prestamos.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                Rbtguardar.addEventListener("click", registrarlibroentregadoReserva);
            })  
        }
    })

    function registrarLibroentregadosnuevo(){
        if(confirm("estas seguro de guardar?")){
            const parametros = new URLSearchParams();
            parametros.append("operacion","registrarLibroentregado");
            parametros.append("idprestamo", idprestamo);
            parametros.append("idlibro", libro.value);
            parametros.append("cantidad", cantidad.value);
            parametros.append("condicionentrega", condicionentrega.value);
            parametros.append("fechadevolucion", fechadevolucion.value);

            fetch("../controller/prestamos.php" ,{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                console.log(datos);
                if(datos.status){
                alert("Datos guardados correctamente")
                    document.querySelector("#modal-registrarlibro").reset();
                }
            })
        }
    }

    function registrarlibroentregadoReserva(){
        if(confirm("estas seguro de guardar?")){
            const parametros = new URLSearchParams();
            parametros.append("operacion","registrarlibroentregadoReserva");
            parametros.append("idprestamo", idprestamo);
            parametros.append("idlibro", document.querySelector("#Rlibro").value);
            parametros.append("cantidad", document.querySelector("#Rcantidad").value);
            parametros.append("condicionentrega", document.querySelector("#Rcondicionentrega").value);
            parametros.append("fechadevolucion", document.querySelector("#Rfechadevolucion").value);

            fetch("../controller/prestamos.php" ,{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                console.log(datos);
                if(datos.status){
                alert("Datos guardados correctamente")
                    document.querySelector("#modal-registrarlibroreserva").reset();
                }
            })
        }
    }

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
                libro.value = element.idlibro;
                selectcategoria.value = element.categoria;
                filtrosubcategoria.value = element.subcategoria;
            });
        });
    }

    function conseguirlibro2(){
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
                libro.value = element.idlibro;
                selectcategoria.value = element.categoria;
                filtrosubcategoria.value = element.subcategoria;
            });
        });
    }

    function listarLibros(){
        const para = new URLSearchParams();
        para.append("operacion", "guardarLibro");
        para.append("idprestamo", idprestamo);
        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: para
        })
        .then(response => response.json())
        .then(datos => {
            cuerpoT.innerHTML = ``;
            if(datos){
                datos.forEach(element => {
                    const libro = `
                    <tr>
                        <td>${element.idlibroentregado}</td>
                        <td>${element.subcategoria}</td>
                        <td>${element.nombre}</td>
                        <td>${element.cantidad}</td>
                        <td>${element.fechadevolucion}</td>
                        <td>${element.condicionentrega}</td>
                    </tr>`;
                    cuerpoT.innerHTML +=libro;
                });
            }else{
                tablas.reset();
            }
        });
    }

    listarprestamo();
    // listarLibros();
    // btBuscarLibro.addEventListener("click", conseguirlibro);
    btBuscarLibro.addEventListener("click", conseguirlibro2);

    // libro.addEventListener("keypress", (evt) => {
    //     if(evt.charCode == 13) conseguirlibro();
    // });

</script>
