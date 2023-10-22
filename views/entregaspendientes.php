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
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE ENTREGAS PENDIENTES</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Libro</th>
                        <th>Cantidad</th>
                        <th>Nombre</th>
                        <th>Descripcion</th>
                        <th>F. Solicitud</th>
                        <th>F. Prestamo</th>
                        <th>F. Devolucion</th>
                        <th>Entregar</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

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
                datos.forEach(element => {
                    idprestamo = element.idprestamo; 
                    const pres = `
                    <tr>
                        <td>${element.idlibroentregado}</td>
                        <td>${element.nombre}</td>
                        <td>${element.cantidad}</td>
                        <td>${element.nombres}</td>
                        <td>${element.descripcion}</td>
                        <td>${element.fechasolicitud}</td>
                        <td>${element.fechaprestamo}</td>
                        <td>${element.fechadevolucion}</td>
                        <td>
                            <a href='#' type='button' class='entrega' data-idprestamo='${element.idprestamo}'>Entregar</a>
                        </td>
                        <td>
                            <a href='#Meditar' class='editar' data-toggle='modal' data-idlibroentregado='${element.idlibroentregado}'>Editar</a>
                        </td>
                    </tr>
                    `;
                    cuerpo.innerHTML += pres;
                });
            })
        }

        cuerpo.addEventListener("click", (event) => {
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

        cuerpo.addEventListener("click", (event) => {
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
                
                fetch("../controller/prestamos.php",{
                    method:'POST',
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    console.log(datos);
                    if(datos.status){
                        document.querySelector("#modal-editar").reset();
                    }
                })
            }
        };
        listarEntregas();
        
    </script>