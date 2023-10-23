<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../views/img/clock.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los libros que faltan regresar y podra registrar el libro para que se pueda completar el prestamo
        </div>
    </div>
</div>
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE DEVOLUCIONES</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Libro</th>
                        <th>Nombre</th>
                        <th>Tipo</th>
                        <th>F. Solicitud</th>
                        <th>F. Entrega</th>
                        <th>F. Devolucion</th>
                        <th>Recibir</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<div>
        
    <div class="modal fade" id="modal-id">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">Condicion de devolucion</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form autocomplete="off" id="form-devolucion">
                        <div class="row">
                            <div class="col-md-3">
                                <label>Condicion: </label>
                            </div>
                            <!-- DESCRIPCION -->
                            <div class="col-md-8">
                                <input type="text" class="form-control form-control-sm" id="condicion">
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col-md-3">
                                <label>Observaciones</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" class="form-control form-control-sm"  id="observacion">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="guadarlibro">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
        const cuerpo = document.querySelector("tbody");
        //const modal = new bootstrap.Modal(document.querySelector("#modal-id"));
        //const modal = $('#modal-id').modal();
        const condicion = document.querySelector("#condicion");
        const btGuadar = document.querySelector("#guadarlibro");
        const observaciones = document.querySelector("#observacion");
        let idprestamos = ''; //variable que almacena el id del prestamo
        let idlibroentregado = '';
        
        function listarDevoluciones(){
            const parametros = new URLSearchParams();
            parametros.append("operacion","listarDpendientes")
            fetch("../controller/prestamos.php", {
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                cuerpo.innerHTML = ``;
                datos.forEach(element => {
                    idprestamos = element.idprestamo; 
                    const recibir = `
                    <tr>
                        <td>${element.idlibroentregado}</td>
                        <td>${element.nombre}</td>
                        <td>${element.nombres}</td>
                        <td>${element.tipo}</td>
                        <td>${element.fechasolicitud}</td>
                        <td>${element.fechaentrega}</td>
                        <td>${element.fechadevolucion}</td>
                        <td>
                            <a href='#modal-id' type='button' data-toggle='modal' class='recibir' data-idlibroentregado='${element.idlibroentregado}'>recibir</a>
                        </td>
                        <td>
                            <button class='btn btn-danger'><i class='zmdi zmdi-delete'></i></button>
                        </td>
                    </tr>
                    `;
                    cuerpo.innerHTML += recibir;
                });
            })
        }

        function updatedevoluciones(){
            if(confirm("estas seguro de guardar?")){
                const parametros = new URLSearchParams();
                parametros.append("operacion","updatedevoluciones");
                parametros.append("idlibroentregado", idlibroentregado);
                parametros.append("condiciondevolucion",condicion.value);
                parametros.append("observaciones", observaciones.value);
                parametros.append("idprestamo", idprestamos);
                fetch("../controller/prestamos.php",{
                    method:'POST',
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    console.log(datos);
                    if(datos.status){
                        document.querySelector("#form-devolucion").reset();
                    
                    }
                })
            }
        };


        cuerpo.addEventListener("click", (event) => {
            if(event.target.classList[0] === 'recibir'){
                idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
                const parametros = new URLSearchParams();
                parametros.append("operacion","obtenerlibroentregado");
                parametros.append("idlibroentregado", idlibroentregado);

                fetch("../controller/librosentregados.php",{
                    method: 'POST',
                    body: parametros
                })
                //console.log(idlibroentregado)
                .then(response => response.json())
                .then(datos => {
                    // console.log(idlibroentregado);
                    btGuadar.addEventListener("click", updatedevoluciones);
                    listarDevoluciones();
                })  
            }
        })

        listarDevoluciones();
    
    </script>