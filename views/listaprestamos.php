<?php
session_start();
if(!isset($_SESSION['login']) || (!$_SESSION['login']['status']))
{
    header("Location:../");
}

$datoID = json_encode($_SESSION['login']);
?>

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
                <form id="form-prestamos">
                    <div class="ml-5 row">
                        <div class="col-md-3">
                            <label style="color:#574E4E;">NOMBRES Y APELLIDOS :</label>
                        </div>
                        <div class="col-md-8">
                            <select class="form-control" id="filtronombres">
                            
                            </select>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">FECHA PRESTAMO</label>
                            <input type="date" class="form-control" required=""id="fprestamo">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">EN BIBLIOTECA</label>
                            <select class="form-control" id="enbiblioteca">
                                <option value="SI">SI</option>
                                <option value="NO">NO</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">DESCRIPCION</label>
                            <input type="text" class="form-control" placeholder="Grado o Curso" id="descripcion">
                        </div>
                        
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">DESTINO</label>
                            <input type="text" class="form-control" maxlength="20" placeholder="Salon 1" id="lugardestino">
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="button" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
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
                                <th style="color:#574E4E;">#</th>
                                <th style="color:#574E4E;">Nombres</th>
                                <th style="color:#574E4E;">Apellidos</th>
                                <th style="color:#574E4E;">Usuario</th>
                                <th style="color:#574E4E;">F. Solicitud</th>
                                <th style="color:#574E4E;">F. Prestamo</th>
                                <th style="color:#574E4E;">Rol</th>
                                <th style="color:#574E4E;">Ahora</th>
                                <th style="color:#574E4E;">Reservar</th>
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
                            <select name="" id="libro2" class="form-control">

                            </select>
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
                                <div class="input-group-append" id="a">
                                    <button class="btn btn-outline-warning" type="button" id="Rguardarlibro">Apuntar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <table class="table table-bordered mt-4" id="tabla2" width="100%" cellspacing="0">
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

<!-- modal nuevo -->
<div class="modal fade" id="modal-nuevo" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
                            <select class="form-control" id="libro">
                            </select>
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
                                    <button class="btn btn-outline-warning" type="button" id="gudarlibro">Agregar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row p-5">
                        <table class="table table-bordered mt-4" id="tablalibros" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>SubCategoria</th>
                                    <th>Libro</th>
                                    <th>Cantidad</th>
                                    <th>F.Devolucion</th>
                                    <th>Condicion</th>
                                    <th>Eliminar</th>
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
<script src="../js/prestamos.js">
        
    const filtroStudent = document.querySelector("#filtronombres");
    const cuerpo = document.querySelector("tbody");
    const Guardar = document.querySelector("#btguardar");

    function fecha(){        
        const fecharegistar = document.querySelector("#fprestamo").value;
        var fechactual =  new Date();

        var fechaRegistro = new Date(fecharegistar);

        if(fechaRegistro > fechactual){
            registrarPrestamo();
        }else{
            alert("No pueder realizar un prestamos antes del dia de hoy");
        }
    }

    function registrarPrestamo(){
        const respuesta = <?php echo $datoID;?>;
        const idusuario = respuesta.idbibliotecario;
        if(confirm("estas seguro de guardar?")){
            const parametros = new URLSearchParams();
            parametros.append("operacion","registrarPrestamo");
            parametros.append("idbeneficiario", filtroStudent.value);
            parametros.append("idbibliotecario", idUsuario);
            parametros.append("fechaprestamo", fecharegistar.value);
            parametros.append("descripcion", document.querySelector("#descripcion").value);
            parametros.append("enbiblioteca", document.querySelector("#enbiblioteca").value);
            parametros.append("lugardestino", document.querySelector("#lugardestino").value);

            fetch("../controller/prestamos.php" ,{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                console.log(datos);
                if(datos.status){
                    alert("Datos guardados correctamente")
                    // document.querySelector("#form-prestamos").reset();
                }
            })
        }
    }

    function listarUsuario(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","filtrobeneficiario");

        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // console.log(datos);
            filtroStudent.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let select = `
                    <option value='${element.idusuario}'>${element.nombres} ${element.apellidos}</option> 
                `;
                filtroStudent.innerHTML +=select;
            });
        })
    }
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
                        <a href='#modal-nuevo' class='Rnuevo' data-toggle='modal' data-idprestamo='${element.idprestamo}'>libros</a>
                    </td>
                    <td>
                        <a href='#LReservar'  class='Rreservar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>libros</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += pres;
            });
        })
    }

    listarUsuario();
    listarprestamo();
    Guardar.addEventListener("click", fecha);
</script>
