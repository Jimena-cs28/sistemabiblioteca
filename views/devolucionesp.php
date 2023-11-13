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
                        <th style="color:#574E4E;">Libro</th>
                        <th style="color:#574E4E;">Usuario</th>
                        <th style="color:#574E4E;">Codigo</th>
                        <th style="color:#574E4E;">F. Solicitud</th>
                        <th style="color:#574E4E;">F. Entrega</th>
                        <th style="color:#574E4E;">F. Devolucion</th>
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

<script>
    let idlibro = '';
    let idusuario = '';
    const cuerpo = document.querySelector("tbody");
    //const modal = new bootstrap.Modal(document.querySelector("#modal-id"));
    //const modal = $('#modal-id').modal();
    const tabla = document.querySelector("#tablaD");
    const condicion = document.querySelector("#condicion");
    const btGuadar = document.querySelector("#guadarlibro");
    const observaciones = document.querySelector("#observacion");
    let idprestamos = ''; //variable que almacena el id del prestamo
    let idlibroentregado = '';
    // const bt = document.querySelector("#cerrar");
    function validardevolucion(){
        var Hoy =  new Date();
        const fila = cuerpo.rows
        for (let i = 0; i < fila.length; i++) {
            const devolucion = String(fila[i].cells[6].innerText);
            if(devolucion == Hoy){
                alert("Este usuario no ah entregado a tiempo su libro");
            }
        }
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
                idprestamos = element.idprestamo; 
                idlibroentregado = element.idlibroentregado;
                //idlibro = element.idlibro;
                const recibir = `
                <tr>
                    <td>${element.idlibroentregado}</td>
                    <td>${element.libro}</td>
                    <td>${element.nombres}</td>
                    <td>${element.codigo_libro}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaentrega}</td>
                    <td>${element.fechadevolucion}</td>
                    <td>
                        <a href='#modal-id' type='button' data-toggle='modal' class='recibir' data-idlibro='${element.idlibro}' data-idusuario='${element.idusuario}'  data-idlibroentregado='${element.idlibroentregado}'>recibir</a>
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

    function updatedevoluciones(){
        if(confirm("estas seguro de guardar?")){
            const parametros = new URLSearchParams();
            parametros.append("operacion","updatedevoluciones");
            parametros.append("idlibroentregado", idlibroentregado);
            parametros.append("idprestamo", idprestamos);
            parametros.append("condiciondevolucion",condicion.value);
            parametros.append("observaciones", observaciones.value);
            parametros.append("idlibro", idlibro);
            const fila = tabla.rows;
            for (let i = 1; i < fila.length; i++) {
                const cantidad = parseInt(fila[i].cells[3].innerText);
                parametros.append("cantidad", cantidad);
                fetch("../controller/librosentregados.php",{
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
        }
    };

    cuerpo.addEventListener("click", (event) => {
        idlibro = parseInt(event.target.dataset.idlibro);
        idusuario = parseInt(event.target.dataset.idusuario);
        console.log(idlibro);
        if(event.target.classList[0] === 'recibir'){
            idlibroentregado = parseInt(event.target.dataset.idlibroentregado);
            const parametros = new URLSearchParams();
            parametros.append("operacion","traerlibroentregado");
            parametros.append("idlibroentregado", idlibroentregado);
            fetch("../controller/librosentregados.php",{
                method: 'POST',
                body: parametros
            }) // console.log(idlibroentregado)
            .then(response => response.json())
            .then(datos => {
                console.log(idlibroentregado)
                listarDevoluciones();
            });
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

    btGuadar.addEventListener("click", () => {
        updatedevoluciones();
        validarRecibirlibro();
    });

    validardevolucion();
    listarDevoluciones();
    // bt.addEventListener("click", ValidarRegistrar);
</script>