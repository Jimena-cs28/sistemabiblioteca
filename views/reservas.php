<?php require_once 'permisos.php'; ?>
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/calendar.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
        Bienvenido a esta sección, aquí se muestran las reservas pedidas por estudiantes y profesores, estas reservas faltan recojer 
        por parte de los usuarios y se podra ver detalladamente que cantidad de libro se registro
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header ">
                <h6 class="m-0 font-weight-bold text-primary text-center">LISTADO DE RESERVAS</h6>
            </div>
        </div>
    </div>
</div>

<div class="row mt-4" id="cardreserva">

</div>

<style>
#hrfve{
    color: #12970E;
}
#id{
    color: #D81919;
}
</style>

<div class="modal fade" id="Meditar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #6980e6;">Registrar Libro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="off" id="modal-editar">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="Libro">Libro</label>
                            <input type="text" class="form-control" id="libro" disabled>
                        </div>
                        <div class="col-md-6">
                            <label for="">Usuario</label>
                            <input type="text" class="form-control" id="persona" disabled>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-4">
                            <label>Descripcion</label>
                            <input type="text" class="form-control mb-3" id="descripcion" disabled>
                        </div>
                        <div class="col-md-4">
                            <label>Fecha Prestamo</label>
                            <input type="text" class="form-control mb-3" id="fechaprestamo">
                        </div>
                        <div class="col-md-4">
                            <label>Fecha devolucion</label>
                            <input type="text" class="form-control" id="fechadevolucion" disabled>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-success" id="guardar">Guardar</button>
            </div>
        </div>
    </div>
</div>

<div> 
    <div class="modal fade" id="traerE">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">Condicion de devolucion</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form autocomplete="off" id="form-devolucion" class="p-3">
                        <div class="row">
                            <div class="col-md-2">
                                <label>Usuario: </label>
                            </div>
                            <!-- DESCRIPCION -->
                            <div class="col-md-10">
                                <input type="text" class="form-control form-control-sm" id="user" disabled>
                            </div>
                        </div>
                        <div class="row mt-4">
                            <table class="table table-bordered" id="tabla" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th style="color:#574E4E;" width="5%">#</th>
                                        <th style="color:#574E4E;" width="40%">Librós</th>
                                        <th style="color:#574E4E;" width="20%">Código</th>
                                        <th style="color:#574E4E;" width="15%">C. Entrega</th>
                                        <th style="color:#574E4E;" width="20%">F. Devolución</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="cerrar">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- modal cancelar -->
<div class="modal fade" id="rechazareserva">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">Cancelar Reserva</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <label for="">Motivo de cancelacion</label>
                <input type="text" placeholder="Motivo" id="rechazarreserva" class="form-control">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button id="btnrechazareserva" type="button" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div>


<script>
    let idprestamo = '';
    let idlibroentregado = '';
    let usuario = '';
    const user = document.querySelector("#user");
    const card = document.querySelector("#cardreserva");
    const cuerpo = document.querySelector("tbody");
    const descripcion = document.querySelector("#descripcion");
    const persona = document.querySelector("#persona");
    const cantidad = document.querySelector("#cantidad");
    const libro = document.querySelector("#libro");
    const fechadevolucion = document.querySelector("#fechadevolucion");
    const fechaprestamo = document.querySelector("#fechaprestamo");
    const btguardar = document.querySelector("#guardar");
    const btcancelar = document.querySelector("#btnrechazareserva");
    const ModalCancelarReserva = new bootstrap.Modal(document.querySelector("#rechazareserva"));


    const tabla = document.querySelector("#tabla");
    const CuerpoP = tabla.querySelector("tbody");

    function listarEntregas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listarEpendientes")

        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            const actual = new Date();
            card.innerHTML = ``;
            datos.forEach(element => {
                const FechaPrestamo = new Date(element.fechaprestamo);
                const fechapasada = FechaPrestamo < actual;
                // if(fechapasada){
                //     mostrarAvisoFlotante(`${element.nombres} no ha recogido su libro`);
                // }
                const style = fechapasada ? 'color: red;' : '';
                const reserva = `
                <div class="col-md-4 card-deck">
                    <div class="card mb-3 overflow-hidden rounded-2" style="max-width: 500px;" >
                        <div class="row g-0">
                            <div class="col-md-5">
                                <img class="img-fluid rounded-start" src="./img/${element.imagenportada}" alt="imagenLibro">
                            </div>
                            <div class="col-md-7" >
                                <div class="card-body">
                                    <h5 class="card-title text-center" style="${style}">${element.libro} - ${element.codigo}</h5>
                                    <p class="card-text" style="color:#635555;">Usuario: ${element.nombres} -  ${element.descripcion}</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="color:#635555;">F.Solicitud: ${element.fechasolicitud}</li>
                                    <li class="list-group-item" style="${style}">F.Prestamo: ${element.fechaprestamo}</li>
                                    <div class="row">
                                        <div class="col-md-4"><a href='#' id='hrfve' class='entrega' data-idprestamo='${element.idprestamo}'>Entregar</a></div>
                                        <div class="col-md-4"><a href='#' id='id' class='cancelar' data-toggle='modal' data-nombres='${element.nombres}' data-idprestamo='${element.idprestamo}' data-idlibroentregado='${element.idlibroentregado}'>Cancelar</a></div>
                                        <div class="col-md-4"><a href='#traerE' class='editar' data-toggle='modal' data-nombres='${element.nombres}' data-idprestamo='${element.idprestamo}' data-idlibroentregado='${element.idlibroentregado}'>Ver</a></div>
                                    </div>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                `
                ;
                card.innerHTML +=reserva;
            });
        })
    }

    function listarEjemplare(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "traerEjemplar");
        parametros.append("idprestamo", idprestamo);
        fetch("../controller/librosentregados.php",{
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            const actual = new Date();
            CuerpoP.innerHTML = ``;
            if(datos){
                datos.forEach(element => {
                idejemplar = element.idejemplar;
                const Vopcion1 = `
                <tr>
                    <td>${element.idejemplar}</td>
                    <td>${element.libro}</td>
                    <td>${element.codigo} - ${element.codigo_libro}</td>
                    <td>${element.condicionentrega}</td>
                    <td>${element.fechadevolucion}</td>
                </tr>`
                ;
                CuerpoP.innerHTML +=Vopcion1;
                });
            }else{
                table.reset();
            }
        });
    }

    card.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'entrega'){
            mostrarPregunta("ENTREGAR", "¿Estas seguro de entregar el libro?").then((result)=>{
                if(result.isConfirmed){
                    idprestamo = parseInt(event.target.dataset.idprestamo);
                    console.log(idprestamo);
                    const parametros = new URLSearchParams();
                    parametros.append("operacion","updateEpendiente");
                    parametros.append("idprestamo", idprestamo);

                    fetch("../controller/prestamos.php",{
                        method: 'POST',
                        body: parametros
                    })
                    .then(response => response.json())
                    .then(datos => {
                        listarEntregas();
                    })
                }
            })
        }
    });

    card.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'cancelar'){
            ModalCancelarReserva.toggle();
            function ni(){
                mostrarPreguntaEliminar("ELIMINAR","¿Estas seguro de Cancelar la Reserva?").then((result)=>{
                    if(result.isConfirmed){
                        idprestamo = parseInt(event.target.dataset.idprestamo);
                        // console.log(idprestamo);
                        
                        const parametros = new URLSearchParams();
                        parametros.append("operacion","cancelarRevesva");
                        parametros.append("idprestamo", idprestamo);
                        parametros.append("motivo", document.querySelector("#rechazarreserva").value);

                        fetch("../controller/prestamos.php",{
                                method: 'POST',
                                body: parametros
                            })
                            .then(response => response.json())
                            .then(datos => {
                                listarEntregas();
                                ModalCancelarReserva.toggle()
                            })
                    }
                })
            }
            btcancelar.addEventListener("click", ni);
        }
    });

    card.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'editar'){
            idprestamo = parseInt(event.target.dataset.idprestamo)
            idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
            usuario = String(event.target.dataset.nombres);
            // console.log(idlibroentregado);
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerprestamo");
            parametros.append("idprestamo", idprestamo);

            fetch("../controller/prestamos.php",{
                method: 'POST',
                body: parametros
            }) // console.log(idlibroentregado)
            .then(response => response.json())
            .then(datos => {
                listarEjemplare();
                user.value = usuario;
            });
        }
    });

    function EditarEpendiente(){
        if(confirm("estas seguro de guardar?")){
            const parametros = new URLSearchParams();
            parametros.append("operacion","EditarEpendiente");
            parametros.append("idprestamo", idprestamo);
            parametros.append("idlibroentregado", idlibroentregado);
            parametros.append("fechadevolucion", fechadevolucion.value);
            parametros.append("fechaprestamo",fechaprestamo.value);
            
            fetch("../controller/librosentregados.php",{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                console.log(datos);
                if(datos.status){
                    listarEntregas();
                    document.querySelector("#modal-editar").reset();
                }
            })
        }
    };
    listarEntregas();

</script>