<?php require_once 'permisos.php'; ?>
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-md-3">
            <img src="../img/clock.png" alt="clock" class="img-responsive center-box" style="max-width: 120px;">
        </div>
        <div class="col-md-9 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los libros que faltan regresar y podra registrar el libro para que se pueda completar el prestamo
        </div>
    </div>
</div>
<!-- <tr id="fechaEnTabla">2023-11-18</tr> -->

<h5 id="customAlert" class="custom-alert"></h5>
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE DEVOLUCIONES</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="tablaD" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="color:#574E4E;" width="2%">#</th>
                        <th style="color:#574E4E;">Usuario</th>
                        <th style="color:#574E4E;">Datos</th>
                        <th style="color:#574E4E;">F.Solicitud</th>
                        <th style="color:#574E4E;">F.Entrega</th>
                        <th style="color:#574E4E;">F.Prestamo</th>
                        <th style="color:#574E4E;">Operacion</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- modalejemplar -->
<div> 
    <div class="modal fade" id="modal-id">
        <div class="modal-dialog modal-dialog-centered modal-xl">
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
                                <label>Condicion: </label>
                            </div>
                            <!-- DESCRIPCION -->
                            <div class="col-md-4">
                                <select name="" id="condicion" class="form-control form-control-sm">
                                    <option value="Bien">Bien</option>
                                    <option value="Deteriorado">Deteriorado</option>
                                    <option value="Mal">Mal</option>
                                </select>
                                <!-- <input type="text" class="form-control form-control-sm" id="condicion"> -->
                            </div>
                            <div class="col-md-2">
                                <label>Observaciones</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" class="form-control form-control-sm"  id="observacion">
                            </div>
                        </div>
                        <div class="row mt-4">
                            <table class="table table-bordered" id="tabla" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th style="color:#574E4E;">#</th>
                                        <th style="color:#574E4E;">Libro</th>
                                        <th style="color:#574E4E;">Codigo</th>
                                        <th style="color:#574E4E;">C. Entrega</th>
                                        <th style="color:#574E4E;">Ocupado</th> 
                                        <th style="color:#574E4E;">C. Devolucion</th> 
                                        <th style="color:#574E4E;">F. Devolucion</th>
                                        <th style="color:#574E4E;">Recibir</th>
                                        <th style="color:#574E4E;">Recibir</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class=" form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="checkuser">
                                    <label class="form-check-label" for="inlineCheckbox2">Sancionar Usuario</label>
                                </div>
                                <div class=" form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="checkejemplar">
                                    <label class="form-check-label" for="inlineCheckbox2">Dar de baja</label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cerrar">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="guadarlibro">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- detallado -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">Condicion de devolucion</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form autocomplete="off" id="form-detallito" class="p-3">
                    <div class="row">
                        <div class="col-md-3">
                            <label>Condicion:</label>
                        </div>
                        <!-- DESCRIPCION -->
                        <div class="col-md-8">
                            <select name=""  id="condicionD" class="form-control">
                                <option value="Mal">Mal</option>
                                <option value="Deteriorado">Deteriorado</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-3">
                            <label>Observaciones:</label>
                        </div>
                        <div class="col-md-8">
                            <input type="text" class="form-control form-control-sm"  id="observacionD">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <div class="form-check-inline">
                                <input class="form-check-input" type="checkbox" id="checklibro" value="option1">
                                <label class="form-check-label" for="inlineCheckbox1">Dar de Baja</label>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="cerrar">Cerrar</button>
                <button type="button" class="btn btn-primary" id="guadarlibroD">Guardar</button>
            </div>
        </div>
    </div>
</div>

<style>
    .fechaEnTabla {
        /* Estilo predeterminado para las fechas */
        color: black;
    }
    .fechaPasada {
        /* Estilo para las fechas que son mayores que la fecha actual */
        color: red;
    }
    .aviso-flotante {
        position: fixed;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        background-color: rgb(238, 47, 47); /* Color de fondo rojo, ajusta según tus preferencias */
        color: #090404; /* Color del texto blanco, ajusta según tus preferencias */
        padding: 10px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
</style>
<script>
    let idlibro = '';
    let idusuario = '';
    let idejemplar = '';
    const cuerpo = document.querySelector("tbody");
    // const modal = new bootstrap.Modal(document.querySelector("#modal-id"));
    //const modal = $('#modal-id').modal();
    const tabla = document.querySelector("#tabla");
    const CuerpoP = tabla.querySelector("tbody");
    const condicion = document.querySelector("#condicionD");
    const btGuadar = document.querySelector("#guadarlibro");
    const observaciones = document.querySelector("#observacionD");
    const GuadarD = document.querySelector("#guadarlibroD");
    let idprestamo = ''; //variable que almacena el id del prestamo
    let idlibroentregado = '';

    const modaldetallitos = new bootstrap.Modal(document.querySelector("#modal"));

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
                const recibir = `
                <tr>
                    <td>${element.idprestamo}</td>
                    <td>${element.nombres }</td>
                    <td>${element.descripcion}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaentrega}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>
                        <a href='#modal-id' type='button' data-toggle='modal' class="btn btn-info recibir" data-idprestamo='${element.idprestamo}' 
                        data-idlibroentregado='${element.idlibroentregado}' data-idbeneficiario='${element.idbeneficiario}'>recibir</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += recibir;
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
                const fechadevolucion = new Date(element.fechadevolucion);
                const fechaPasada = fechadevolucion > actual;
                if (fechaPasada) {
                    mostrarAvisoFlotante(`No ha devuelto a tiempo el libro`);
                }
                const style = fechaPasada ? 'color: red;' : ''; 
                idejemplar = element.idejemplar;
                const Vopcion1 = `
                <tr style='${style}'>
                    <td>${element.idejemplar}</td>
                    <td>${element.libro}</td>
                    <td>${element.codigo} - ${element.codigo_libro}</td>
                    <td>${element.condicionentrega}</td>
                    <td>${element.ocupado}</td> 
                    <td>${element.condiciondevolucion || "-------------"}</td>
                    <td>${element.fechadevolucion}</td>
                    <td>
                        <a href='#modal' type='button' class='btn btn-danger btn-sm detallitosMala' data-toggle='modal' data-idejemplar='${element.idejemplar}' data-idlibroentregado='${element.idlibroentregado}' data-idprestamo='${element.idprestamo}'>recibir</a>
                    </td>
                    <td>
                        <a href='' type='button' class='btn btn-success btn-sm detallitosBien' data-idejemplar='${element.idejemplar}' data-idlibroentregado='${element.idlibroentregado}' data-idprestamo='${element.idprestamo}'>recibir</a>
                    </td>
                </tr>`
                ;
                CuerpoP.innerHTML +=Vopcion1;
                });
            }else{
                table.reset();
            }
        });
    }

    function DesacEjem(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","DesactivarEjem");
        parametros.append("idejemplar", idejemplar);
        fetch("../controller/validacion.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // btGuadar.addEventListener("click", updatedevoluciones);
            listarDevoluciones();
        });
    }

    function SancionarUser(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","SentenciarUsuario");
        parametros.append("idusuario", idusuario);
        fetch("../controller/estudiantes.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            listarDevoluciones();
        });
    }

    function AbilitarUser(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","HabilitarUser");
        parametros.append("idusuario", idusuario);
        fetch("../controller/estudiantes.php",{
            method: 'POST',
            body: parametros
        }) 
        .then(response => response.json())
        .then(datos => {
            listarDevoluciones();
        });
    }

    function updatedevolucionesTodo(){
        mostrarPregunta("DEVOLUCION", "¿Estas seguro de devolver el libro?").then((result)=>{
            if(result.isConfirmed){
                const parametros = new URLSearchParams();
                parametros.append("operacion","updatedevolucionesTodos");
                parametros.append("idprestamo", idprestamo);
                parametros.append("condiciondevolucion",document.querySelector("#condicion").value);
                parametros.append("observaciones", document.querySelector("#observacion").value);
                fetch("../controller/validacion.php",{
                    method:'POST',
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    if(datos.status){
                        listarDevoluciones();
                        document.querySelector("#form-devolucion").reset();
                    }
                })
            }
        })
    };

    cuerpo.addEventListener("click", (event) => {
        const element = event.target.closest(".recibir");
        if(element){
            idprestamo = parseInt(event.target.dataset.idprestamo);
            idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
            idusuario = parseInt(event.target.dataset.idbeneficiario);
            const CheckEjemplar = document.querySelector("#checkejemplar");
            const CheckEstu = document.querySelector("#checkuser");
            const parametros = new URLSearchParams();
            parametros.append("operacion","obtenerprestamo");
            parametros.append("idprestamo", idprestamo);
            fetch("../controller/prestamos.php",{
                method: 'POST',
                body: parametros
            }) // console.log(idlibroentregado)
            .then(response => response.json())
            .then(datos => {
                //console.log(idlibroentregado)
                listarDevoluciones();
                listarEjemplare();
                btGuadar.addEventListener("click", () => {
                    if (CheckEstu.checked){
                        SancionarUser();
                    }else if(CheckEjemplar.checked){
                        cambiarEstado();
                    }else{
                        AbilitarUser();
                    }
                    updatedevolucionesTodo();
                });
            });
        }
    });

    function cambiarEstado(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","CambiarEstado");
        parametros.append("idprestamo", idprestamo);
        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            listarDevoluciones();
        });
    }

    function updatedevolucionesUno(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","updatedevolucionesUno");
        parametros.append("idejemplar", idejemplar);
        parametros.append("idlibroentregado", idlibroentregado);
        fetch("../controller/validacion.php",{
            method:'POST',
            body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
            if(datos.status){
                listarEjemplare();
            }
        })
    };

    // FALTA ALERTA
    CuerpoP.addEventListener("click", (event) => {
        const elementoDetalle = event.target.closest(".detallitosBien");
        if(elementoDetalle){
            if(confirm("¿estas seguro de entrega?")){
                idejemplar = parseInt(event.target.dataset.idejemplar);
                idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
                idprestamo = parseInt(event.target.dataset.idprestamo);
                updatedevolucionesUno();
                listarEjemplare();
            }
        }
    });

    function updatedevolucionesUnoMala(){
        mostrarPregunta("DEVOLVER", "¿Estas seguro de devolver el libro?").then((result)=>{
            if(result.isConfirmed){
                const parametros = new URLSearchParams();
                parametros.append("operacion","updatedevolucionesUnoMal");
                parametros.append("idejemplar", idejemplar);
                parametros.append("idlibroentregado", idlibroentregado);
                parametros.append("observaciones", observaciones.value);
                parametros.append("condiciondevoluciones",condicion.value );
                fetch("../controller/validacion.php",{
                    method:'POST',
                    body: parametros
                })
                .then(respuesta => respuesta.json())
                .then(datos => {
                    if(datos.status){
                        listarEjemplare();
                    }
                })
            }
        })
    };

    CuerpoP.addEventListener("click", (event) => {
        const elementoDetalle = event.target.closest(".detallitosMala");
        if(elementoDetalle){
            idejemplar = parseInt(event.target.dataset.idejemplar);
            idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
            idprestamo = parseInt(event.target.dataset.idprestamo);
            GuadarD.addEventListener("click", () => {
                validarRecibirlibro(); updatedevolucionesUnoMala(); modaldetallitos.toggle();
            });
        }
    });

    

    function validarRecibirlibro(){
        const CheckLibro = document.querySelector("#checklibro");
        if(CheckLibro.checked){
            DesacEjem();
        }
    }

    listarDevoluciones();
    // bt.addEventListener("click", ValidarRegistrar);
</script>