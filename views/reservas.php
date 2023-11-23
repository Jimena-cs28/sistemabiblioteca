<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/calendar.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los libros registrados por el estudiante, se podra editar y eliminar los libros que usted desee
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header ">
                    <h6 class="m-0 font-weight-bold text-primary text-center">LISTADO DE ENTREGAS PENDIENTES</h6>
                </div>
                <div class="card-body">
                    <div class="row" id="cardreserva">
            
                    </div>
    
                </div>
            </div>

        </div>
    </div>
</div>

<style>
    .aviso-flotante {
        position: fixed;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        background-color: rgb(86, 1, 17); /* Color de fondo rojo, ajusta según tus preferencias */
        color: #fdfdfd; /* Color del texto blanco, ajusta según tus preferencias */
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
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

    function mostrarAvisoFlotante(mensaje) {
        // Crear un elemento div para el aviso flotante
        const avisoFlotante = document.createElement('div');
        avisoFlotante.className = 'aviso-flotante';
        avisoFlotante.textContent = mensaje;

        // Agregar el aviso flotante al cuerpo del documento
        document.body.appendChild(avisoFlotante);

        // Después de un tiempo, eliminar el aviso flotante
        setTimeout(() => {
            avisoFlotante.remove();
        }, 5000); // 5000 milisegundos (5 segundos)
    }

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
                if(fechapasada){
                    mostrarAvisoFlotante(`${element.nombres} no ha recogido su libro`);
                }
                const style = fechapasada ? 'color: red;' : '';
                const reserva = `
                <div class="col-md-4 card-deck">
                    <div class="card mb-3" style="max-width: 500px;">
                        <div class="row g-0">
                            <div class="col-md-5">
                                <img class="img-fluid rounded-start" src="./img/${element.imagenportada}" alt="imagenLibro" width="600px">
                            </div>
                            <div class="col-md-7" >
                                <div class="card-body">
                                    <h5 class="card-title text-center" style="${style}">${element.libro} - ${element.codigo_libro}</h5>
                                    <p class="card-text" style="color:#635555;">Usuario: ${element.nombres} -  ${element.descripcion}</p>
                                </div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item" style="color:#635555;">F.Solicitud: ${element.fechasolicitud}</li>
                                    <li class="list-group-item" style="${style}">F.Prestamo: ${element.fechaprestamo}</li>
                                    <div class="row">
                                        <div class="col-md-4"><a href='#' class='entrega' data-idprestamo='${element.idprestamo}'>Entregar</a></div>
                                        <div class="col-md-4"><a href='#' class='borrar' data-idprestamo='${element.idprestamo}' data-idlibro='${element.idlibro}'>Borrar</a></div>
                                        <div class="col-md-4"><a href='#Meditar' class='editar' data-toggle='modal' data-idprestamo='${element.idprestamo}' data-idlibroentregado='${element.idlibroentregado}'>Editar</a></div>
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
            idprestamo = parseInt(event.target.dataset.idprestamo)
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
                    libro.value = element.libro;
                    fechadevolucion.value = element.fechadevolucion;
                    fechaprestamo.value = element.fechaprestamo;
                });
                btguardar.addEventListener("click", EditarEpendiente);
        
            })
        }
    });

    card.addEventListener("click", (event) => {
        idlibro = parseInt(event.target.dataset.idlibro)
        if(event.target.classList[0] === 'borrar'){
            idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
            // console.log(idlibroentregado);
            const parametros = new URLSearchParams();
            parametros.append("operacion","CancelarReserva");
            parametros.append("idprestamo", idprestamo);
            parametros.append("idlibro" , idlibro)
            const filaReserva = card.rows;
            for (let i = 1; i < filaReserva.length; i++){
                const stock = parseInt(filaReserva[i].cells[1].innerHTML);  // Ajusta el índice según tu estructura HTML
                parametros.append("cantidad")
                fetch("../controller/librosentregados.php",{
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    listarEntregas();
                    datos.forEach(element => {
                    });
                    // btguardar.addEventListener("click", EditarEpendiente);
            
                })
            }
            
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