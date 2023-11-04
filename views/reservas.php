<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <!-- <img src="../assets/img/calendar.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;"> -->
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los libros registrados por el estudiante, se podra editar y eliminar los libros que usted desee
        </div>
    </div>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary text-center">LISTADO DE ENTREGAS PENDIENTES</h6>
    </div>
    
</div>
<div class="row p-5" id="cardreserva">
    
</div>

<!-- tablas -->
<!--<div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">LISTADO DE ENTREGAS PENDIENTES</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th style="color:#574E4E;">#</th>
                            <th style="color:#574E4E;">Libro</th>
                            <th style="color:#574E4E;">Cantidad</th>
                            <th style="color:#574E4E;">Nombre</th>
                            <th style="color:#574E4E;">Descripcion</th>
                            <th style="color:#574E4E;">F. Solicitud</th>
                            <th style="color:#574E4E;">F. Prestamo</th>
                            <th style="color:#574E4E;">F. Devolucion</th>
                            <th style="color:#574E4E;">Entregar</th>
                            <th style="color:#574E4E;">Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div> -->

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
                        <div class="col-md-4">
                            <label for="Libro">Libro</label>
                            <input type="text" class="form-control" id="libro">
                        </div>
                        <div class="col-md-4">
                            <label for="Categoria">Cantidad</label>
                            <input type="number" class="form-control mb-3" id="cantidad">
                        </div>
                        <div class="col-md-4">
                            <label for="">Nombre</label>
                            <input type="text" class="form-control" id="persona">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>Descripcion</label>
                            <input type="text" class="form-control mb-3" id="descripcion">
                        </div>
                        <div class="col-md-4">
                            <label>Fecha Prestamo</label>
                            <input type="text" class="form-control mb-3" id="fechaprestamo">
                        </div>
                        <div class="col-md-4">
                            <label>Fecha devolucion</label>
                            <input type="text" class="form-control" id="fechadevolucion">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-success" id="guardar">Guardar</button>
            </div>
        </div>
    </div>
</div>

<script>
    let idprestamo = '';
    let idlibroentregado = '';
    const card = document.querySelector("#cardreserva");
    const cuerpo = document.querySelector("tbody");
    const descripcion = document.querySelector("#descripcion");
    const persona = document.querySelector("#persona");
    const cantidad = document.querySelector("#cantidad");
    const libro = document.querySelector("#libro");
    const fechadevolucion = document.querySelector("#fechadevolucion");
    const fechaprestamo = document.querySelector("#fechaprestamo");
    const btguardar = document.querySelector("#guardar");

    function listarEntregas(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listarEpendientes")

        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            card.innerHTML = ``;
            datos.forEach(element => {
                //idprestamo = element.idprestamo; 
                const reserva = `
                <div class="col-md-6 card-deck">
                    <div class="card  mb-3" style="max-width: 540px;">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img class="card-img-top" src="./img/${element.imagenportada}" alt="imagenLibro">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title text-center">${element.nombre}</h5>
                                    <p class="card-text" style="color:#635555;">Beneficiario: ${element.nombres} - ${element.descripcion} - ${element.cantidad}</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="color:#635555;">F.Solicitud: ${element.fechasolicitud}</li>
                                    <li class="list-group-item" style="color:#635555;">F.Prestamo: ${element.fechaprestamo}</li>
                                    <li class="list-group-item" style="color:#635555;">F.Devolucion: ${element.fechadevolucion}</li>
                                    <div class="row">
                                        <div class="col-md-6"><a href='#' class='entrega' data-idprestamo='${element.idprestamo}'>Entregar</a></div>
                                        <div class="col-md-6"><a href='#Meditar' class='editar' data-toggle='modal' data-idlibroentregado='${element.idlibroentregado}'>Editar</a></div>
                                    </div>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                `
                ;
                card.innerHTML +=reserva;

                // const pres = `
                // <tr>
                //     <td>${element.idlibroentregado}</td>
                //     <td>${element.nombre}</td>
                //     <td>${element.cantidad}</td>
                //     <td>${element.nombres}</td>
                //     <td>${element.descripcion}</td>
                //     <td>${element.fechasolicitud}</td>
                //     <td>${element.fechaprestamo}</td>
                //     <td>${element.fechadevolucion}</td>
                //     <td>
                //         <a href='#'  class='entrega' data-idprestamo='${element.idprestamo}'>Entregar</a>
                //     </td>
                //     <td>                            
                //         <a href='#Meditar' class='editar' data-toggle='modal' data-idlibroentregado='${element.idlibroentregado}'>Editar</a>
                //     </td>
                // </tr>
                // `;
                // cuerpo.innerHTML += pres;
            });
        })
    }

    card.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'entrega'){
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
    });

    card.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'editar'){
            idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
            // console.log(idlibroentregado);
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerlibroentregado");
            parametros.append("idlibroentregado", idlibroentregado);

            fetch("../controller/librosentregados.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                listarEntregas();
                datos.forEach(element => {
                    descripcion.value = element.descripcion;
                    persona.value = element.nombres;
                    cantidad.value = element.cantidad;
                    libro.value = element.nombre;
                    fechadevolucion.value = element.fechadevolucion;
                    fechaprestamo.value = element.fechaprestamo;
                });
                btguardar.addEventListener("click", EditarEpendiente);
        
            })
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