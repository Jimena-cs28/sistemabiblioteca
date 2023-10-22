    
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
    
    
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">LISTADO DE ESTUDIANTES</h6>
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
                            <th>Eliminar</th>
                            <th>Ver ficha</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- modal -->
    <div class="modal fade" id="modal-id">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-center" id="staticBackdropLabel" style="color: #5075da;">Todos los Datos</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="">
                        <!-- libro -->
                        <div class="row">
                            <div class="col-md-3">
                                <label>Rol</label>                                
                                <input type="text" class="form-control form-control-sm" id="rol" disabled>
                            </div>
                            <div class="col-md-3">
                                <label>Nombres</label>
                                <input type="text" class="form-control form-control-sm" id="nombres" disabled>
                            </div>
                            <div class="col-md-3">
                                <label>Apellidos</label>
                                <input type="text" class="form-control form-control-sm" id="apellidos" disabled>
                            </div>
                            <div class="col-md-3">
                                <label>Descripcion</label>
                                <input type="text" class="form-control form-control-sm" id="descripcion" disabled>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-3">
                                <label>Categoria</label>
                                <input type="text" class="form-control form-control-sm" id="categoria" disabled>
                            </div>
                            <div class="col-md-3">
                                <label>Sub Categoria</label>
                                <input type="text" class="form-control form-control-sm" id="subcategoria" disabled>
                            </div>
                            <div class="col-md-3">
                                <label>Libro</label>
                                <input type="text" class="form-control form-control-sm" id="libro" disabled>
                            </div>
                            <div class="col-md-3">
                                <label>F.Solicitud</label>
                                <input type="text" class="form-control form-control-sm" id="Fsolicitud" disabled>
                            </div>   
                        </div>
                        
                        <div class="row mt-3">
                            <div class="col-md-3">
                                <label>F.Prestamo</label>
                                <input type="text" class="form-control form-control-sm" id="Fprestamo" disabled>
                                
                            </div>
                            <div class="col-md-3">
                                <label>F.Entrega</label>
                                <input type="text" class="form-control form-control-sm" id="Fentrega" disabled>
                            </div>
                            <div class="col-md-3">
                                <label>F.Devolucion</label>
                                <input type="text" class="form-control form-control-sm" id="Fdevolucion" disabled>
                            </div>
                        </div>
                        
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-success" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>  
    <script>
        let idlibroentregado = '';
        const cuerpo = document.querySelector("tbody");
        const rol = document.querySelector("#rol");
        const nombres = document.querySelector("#nombres");
        const apellidos = document.querySelector("#apellidos");
        const descripcion = document.querySelector("#descripcion");
        const categoria = document.querySelector("#categoria");
        const subcategoria = document.querySelector("#subcategoria");
        const libro = document.querySelector("#libro");
        const fsolicitud = document.querySelector("#Fsolicitud");
        const fprestamo = document.querySelector("#Fprestamo");
        const fentrega = document.querySelector("#Fentrega");
        const fdevolucion = document.querySelector("#Fdevolucion");
        
        function listarprestamo(){
            const parametros = new URLSearchParams();
            parametros.append("operacion","listarcasiprestamo")

            fetch("../controller/prestamos.php", {
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                cuerpo.innerHTML = ``;
                datos.forEach(element => {
                    const pres = `
                    <tr>
                        <td>${element.idlibroentregado}</td>
                        <td>${element.nombre}</td>
                        <td>${element.nombres}</td>
                        <td>${element.tipo}</td>
                        <td>${element.fechasolicitud}</td>
                        <td>${element.fechaentrega}</td>
                        <td>${element.fechadevolucion}</td>
                        <td>
                            <a href='#modal-id' class='todo' data-toggle='modal' data-idlibroentregado='${element.idlibroentregado}' >Ver ficha</a>
                        <td>
                        <button class="btn btn-danger"><i class='zmdi zmdi-delete'></i></button>                  
                    </tr>
                    `;
                    cuerpo.innerHTML += pres;
                });
            })
        }

        cuerpo.addEventListener("click", (event) => {
            if(event.target.classList[0] === 'todo'){
                idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
                console.log(idlibroentregado);
                const parametros = new URLSearchParams();
                parametros.append("operacion","fichaprestamo");
                parametros.append("idlibroentregado", idlibroentregado);
                fetch("../controller/prestamos.php",{
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    datos.forEach(element => {
                        rol.value = element.nombrerol;
                        nombres.value = element.nombres;
                        apellidos.value = element.apellidos;
                        descripcion.value = element.descripcion;
                        categoria.value = element.categoria;
                        subcategoria.value = element.subcategoria;
                        libro.value = element.nombre;
                        fsolicitud.value = element.fechasolicitud;
                        fprestamo.value = element.fechaprestamo;
                        fentrega.value = element.fechaentrega;
                        fdevolucion.value = element.fechadevolucion;
                    });
                });
            }
        });

        listarprestamo();

    </script>