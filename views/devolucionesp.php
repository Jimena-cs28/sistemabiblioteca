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

<div id="customAlert" class="custom-alert"></div>
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
                        <th style="color:#574E4E;">#</th>
                        <th style="color:#574E4E;">Usuario</th>
                        <th style="color:#574E4E;">Datos</th>
                        <th style="color:#574E4E;">F.Solicitud</th>
                        <th style="color:#574E4E;">F.Entrega</th>
                        <th style="color:#574E4E;">F.Prestamo</th>
                        <th style="color:#574E4E;">Recibir</th>
                        <th style="color:#574E4E;">Eliminar</th>
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
                                <input type="text" class="form-control form-control-sm" id="condicion">
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
                                        <th style="color:#574E4E;">F. Devolucion</th>
                                        <th style="color:#574E4E;">Recibir</th>
                                        <th style="color:#574E4E;">Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="checklibro" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox1">Retirar Libro</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class=" form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="checkuser" value="option2">
                                    <label class="form-check-label" for="inlineCheckbox2">Sancionar Usuario</label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="cerrar">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="guadarlibro">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- detallado -->
<div> 
    <div class="modal fade" id="modal">
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
                                <input type="text" class="form-control form-control-sm" id="condicionD">
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
                                    <label class="form-check-label" for="inlineCheckbox1">Retirar Libro</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class=" form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="checkuser" value="option2">
                                    <label class="form-check-label" for="inlineCheckbox2">Sancionar Usuario</label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" id="cerrar">Cerrar</button>
                    <button type="button" class="btn btn-primary" id="guadarlibroD">Guardar</button>
                </div>
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
</style>

<script>
    let idlibro = '';
    let idusuario = '';
    let idejemplar = '';
    const cuerpo = document.querySelector("tbody");
    //const modal = new bootstrap.Modal(document.querySelector("#modal-id"));
    //const modal = $('#modal-id').modal();
    const tabla = document.querySelector("#tabla");
    const CuerpoP = tabla.querySelector("tbody");
    const condicion = document.querySelector("#condicionD");
    const btGuadar = document.querySelector("#guadarlibro");
    const observaciones = document.querySelector("#observacionD");
    const GuadarD = document.querySelector("#guadarlibroD");
    let idprestamos = ''; //variable que almacena el id del prestamo
    let idlibroentregado = '';
    // Obtén la fecha actual
    const fechaActual = new Date();
    // Supongamos que obtienes la fecha de la tabla del elemento con id "fechaEnTabla"
    const fechaEnTabla = document.querySelectorAll('#tablaD tbody td.fechaEnTabla');

    // Convierte la cadena de fecha en un objeto Date
    //var fechaTabla = new Date(fechaEnTablaString);

    fechaEnTabla.forEach(function (fechaElement) {
        var fechaEnTablaString = fechaElement.innerText;
        var fechaTabla = new Date(fechaEnTablaString);

        // Compara las fechas
        if (fechaActual < fechaTabla) {
            fechaElement.classList.add('fechaPasada');
            // Muestra la alerta personalizada
            //showCustomAlert('La fecha en la tabla es mayor que la fecha actual.');

            // Establece un temporizador para ocultar la alerta después de 3 segundos
            //setTimeout(function() {
              //  hideCustomAlert();
            //}, 3000);
        } else {
            // showCustomAlert('La fecha en la tabla no es mayor que la fecha actual.');
        }
    })

    function showCustomAlert(message) {
        var customAlert = document.getElementById('customAlert');
        customAlert.innerText = message;
        customAlert.style.display = 'block';
    }

    function hideCustomAlert() {
        var customAlert = document.getElementById('customAlert');
        customAlert.style.display = 'none';
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
                //idprestamos = element.idprestamo; 
                idlibroentregado = element.idlibroentregado;
                //idlibro = element.idlibro;
                const recibir = `
                <tr>
                    <td>${element.idprestamo}</td>
                    <td>${element.nombres}</td>
                    <td>${element.descripcion}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaentrega}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>
                        <a href='#modal-id' type='button' data-toggle='modal' class='recibir' data-idprestamo='${element.idprestamo}'>recibir</a>
                    </td>
                    <td>
                        <button class='uno'>Devolucion</button>
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
            CuerpoP.innerHTML = ``;
            if(datos){
                datos.forEach(element => {
                idejemplar = element.idejemplar;
                const Vopcion1 = `
                <tr>
                    <td>${element.idlibroentregado}</td>
                    <td>${element.libro}</td>
                    <td>${element.codigo_libro}</td>
                    <td>${element.condicionentrega}</td>
                    <td>${element.ocupado}</td>
                    <td>${element.fechadevolucion}</td>
                    <td>
                        <a href='#modal' type='button' class='detallitos' data-toggle='modal' data-idejemplar='${element.idejemplar}' data-idlibroentregado='${element.idlibroentregado}' data-idprestamo='${element.idprestamo}'>recibir</a>
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

    function Inavilitarlibro(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","SentenciaLibro");
        parametros.append("idlibro", idlibro);
        fetch("../controller/librosentregados.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // btGuadar.addEventListener("click", updatedevoluciones);
            listarDevoluciones();
        });
    }

    function InavilitarUser(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","SentenciarUser");
        parametros.append("idusuario", idusuario);
        fetch("../controller/estudiantes.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // btGuadar.addEventListener("click", updatedevoluciones);
            listarDevoluciones();
        });
    }

    function updatedevolucionesTodo(){
        if(confirm("estas seguro de guardar?")){
            const parametros = new URLSearchParams();
            parametros.append("operacion","updatedevolucionesTodos");
            parametros.append("idprestamo", idprestamo);
            parametros.append("idlibroentregado", idlibroentregado);
            parametros.append("condiciondevolucion",document.querySelector("#condicion").value);
            parametros.append("observaciones", document.querySelector("#observacion").value);
            fetch("../controller/validacion.php",{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                if(datos.status){
                    document.querySelector("#form-devolucion").reset();
                }
            })
            
        }
    };

    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'recibir'){
            idprestamo = parseInt(event.target.dataset.idprestamo);
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
                listarEjemplare();
                btGuadar.addEventListener("click", updatedevolucionesTodo);
            });
        }
    });

    CuerpoP.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'detallitos'){
            idejemplar = parseInt(event.target.dataset.idejemplar);
            idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
            function updatedevolucionesUno(){
                if(confirm("estas seguro de guardar?")){
                    const parametros = new URLSearchParams();
                    parametros.append("operacion","updatedevolucionesUno");
                    parametros.append("idejemplar", idejemplar);
                    parametros.append("condiciondevolucion",condicion.value);
                    parametros.append("observaciones", observaciones.value);
                    parametros.append("idlibroentregado", idlibroentregado);
                    fetch("../controller/validacion.php",{
                        method:'POST',
                        body: parametros
                    })
                    .then(respuesta => respuesta.json())
                    .then(datos => {
                        if(datos.status){
                            document.querySelector("#form-detallito").reset();
                        }
                    })
                    
                }
            };
            GuadarD.addEventListener("click", updatedevolucionesUno);
        }
    });

    function validarRecibirlibro(){
        const CheckLibro = document.querySelector("#checklibro");
        const CheckEstu = document.querySelector("#checkuser");
        if(CheckEstu.checked && CheckLibro.checked){
            InavilitarUser();
            Inavilitarlibro();
        }else{
            if(CheckLibro.checked){
                Inavilitarlibro();
            }else if (CheckEstu.checked){
                InavilitarUser();
            }
        }
    }

    // btGuadar.addEventListener("click", () => {
    //     updatedevoluciones();
    //     validarRecibirlibro();
    // });

    listarDevoluciones();
    // bt.addEventListener("click", ValidarRegistrar);
</script>