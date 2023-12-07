<?php require_once 'permisos.php'; ?>
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/calendar_book.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran todos los prestamos hechos por docentes y estudiantes tambien se podra ver detalladamente los prestamos
        </div>
    </div>
</div>

<style>
    body {
        font-size: 12pt;
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,
        Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    }
</style>

<!-- <button id="excel" class="btn btn-blue">exportar excel</button> -->
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE PRESTAMO</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <div id="dataTable_filter" class="dataTables_filter">
                <label for="">Search
                    <input type="search" class="form-control form-control-sm" id="PrestamoSearch">
                </label>
            </div>
            <table class="table table-bordered" id="dataTable">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th>Datos</th>
                        <th>Biblioteca</th>
                        <th>F. Solicitud</th>
                        <th>F. Entrega</th>
                        <th>F. Prestamo</th>
                        <th>Operacion</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- modal -->
<!-- modal ejemplar-->
<div class="modal fade" id="ejemplar" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #2e4edf;">LIBROS</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form id="form-ejemplar">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-4">
                                    <label>Rol</label>                                
                                    <input type="text" class="form-control" id="rol" disabled>
                                </div>
                                <div class="col-sm-3">
                                    <label>Descripcion</label>
                                    <input type="text" class="form-control" id="descripcion" disabled>
                                </div>
                                <div class="col-sm-5">
                                    <label>Nombres</label>
                                    <input type="text" class="form-control" id="nombres" disabled>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-5">
                                <label>Categoria</label>
                                    <input type="text" class="form-control" id="categoria" disabled>
                                </div>
                                <div class="col-sm-7">
                                    <label>Sub Categoria</label>
                                    <input type="text" class="form-control" id="subcategoria" disabled>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label>Libro</label>
                                    <input type="text" class="form-control" id="libro" disabled>
                                </div>
                                <div class="col-sm-4">
                                    <label>F.Solicitud</label>
                                    <input type="text" class="form-control" id="Fsolicitud" disabled>
                                </div>
                                <div class="col-sm-4">
                                    <label>F.Prestamo</label>
                                    <input type="text" class="form-control" id="Fprestamo" disabled>
                                </div>
                                
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4">
                                    <label>F.Entrega</label>
                                    <input type="text" class="form-control" id="Fentrega" disabled>
                                </div>
                                <div class="col-sm-4">
                                    <label>F.Aceptacion</label>
                                    <input type="text" class="form-control" id="Frespuesta" disabled>
                                </div>
                                <div class="col-sm-4">
                                    <label>Lugar Destino</label>
                                    <input type="text" class="form-control" id="lugardestino" disabled>
                                </div>
                            </div>
                            <div class="row mt-3" id="divcancelacion">
                                <div class="col-sm-6">
                                    <label>Motivo de Cancelacion</label>
                                    <input type="text" class="form-control" id="motivocancel" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="content ml-3 mt-3">
                                <img class="visor" alt="" id="img" width="200px" src="">
                            </div>
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-12">
                            <table class="table table-bordered" id="tabla" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Libro</th>
                                        <th>C. Entrega</th>
                                        <th>Codigo</th>
                                        <th>Observacion</th>
                                        <th>F. Devolucion</th>
                                        <th>C. Devolucion</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default btn-danger" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<button id="exportButton">Exportar a Excel</button>

<script>
    let idlibroentregado = '';
    const secharP = document.querySelector("#PrestamoSearch");
    // const tablasExcel = document.querySelector("#dataTable");
    const cuerpo = document.querySelector("tbody");
    const tabla = document.querySelector("#tabla");
    const CuerpoT = tabla.querySelector("tbody");
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
                    <td>${element.idprestamo}</td>
                    <td>${element.Nombres}</td>
                    <td>${element.descripcion}</td>
                    <td>${element.enbiblioteca}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaentrega || "---------------"}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>
                        <a href='#ejemplar' class='btn btn-primary todo' data-toggle='modal' data-idprestamo='${element.idprestamo}'>Ficha</a>
                    </td>               
                </tr>
                `;
                cuerpo.innerHTML += pres;
            });
        })
    }

    function listarEjemplare(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "fichaprestamo");
        parametros.append("idprestamo", idprestamo);
        fetch("../controller/prestamos.php",{
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            CuerpoT.innerHTML = ``;
            datos.forEach(element => {
                const Vopcion1 = `
                <tr>
                    <td>${element.idejemplar}</td>
                    <td>${element.libro}</td>
                    <td>${element.condicionentrega}</td>
                    <td>${element.codigo} - ${element.codigo_libro}</td>
                    <td>${element.observaciones || "---------------"}</td>
                    <td>${element.fechadevolucion || "---------------"}</td>
                    <td>${element.condiciondevolucion || "---------------"}</td>
                </tr>`
                ;
                CuerpoT.innerHTML +=Vopcion1;
            });
        });
    }

    cuerpo.addEventListener("click", (event) => {
        const element = event.target.closest(".todo");
        if(element){
            idprestamo = parseInt(event.target.dataset.idprestamo);
            // console.log(idprestamo);
            const parametros = new URLSearchParams();
            parametros.append("operacion","fichaprestamo");
            parametros.append("idprestamo", idprestamo);
            fetch("../controller/prestamos.php",{
                method: 'POST',
                body: parametros
            })
            .then(response => response.json())
            .then(datos => {
                datos.forEach(element => {
                    if(element.estado =='T'){
                        document.querySelector("#divcancelacion").style.display='none'
                    }else{
                        document.querySelector("#divcancelacion").style.display='block'
                    }
                    rol.value = element.nombrerol;
                    nombres.value = element.nombres;
                    descripcion.value = element.descripcion;
                    categoria.value = element.categoria;
                    //document.querySelector("#entrega").value = element.condicionentrega;
                    subcategoria.value = element.subcategoria;
                    libro.value = element.libro;
                    fsolicitud.value = element.fechasolicitud;
                    fprestamo.value = element.fechaprestamo;
                    fentrega.value = element.fechaentrega;
                    //fdevolucion.value = element.fechadevolucion;
                    document.querySelector("#Frespuesta").value = element.fecharespuesta;
                    document.querySelector("#img").src = `./img/${element.imagenportada}`;
                    document.querySelector("#lugardestino").value = element.lugardestino;
                    document.querySelector("#motivocancel").value = element.motivorechazo;
                });
                listarEjemplare();
            });
        }
    });

    function searchPrestamo(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "SeachPrestamo");
        parametros.append("nombres", secharP.value);
        fetch("../controller/prestamos.php",{
            method : 'POST',
            body:parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                const pres = `
                <tr>
                    <td>${element.idprestamo}</td>
                    <td>${element.Nombres}</td>
                    <td>${element.descripcion}</td>
                    <td>${element.enbiblioteca}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaentrega}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>
                        <a href='#ejemplar' class='btn btn-primary todo' data-toggle='modal' data-idprestamo='${element.idprestamo}'>Ficha</a>
                    <td>               
                </tr>
                `;
                cuerpo.innerHTML += pres;
            });
        });
    }

    listarprestamo();

    secharP.addEventListener("keypress", (evt) => {
        if(evt.charCode == 13) searchPrestamo();
    });

    document.getElementById('exportButton').addEventListener('click', function () {
        exportToExcel('#dataTable');
    });

    function exportToExcel(tableId) {
        var table = document.getElementById(tableId);
        var sheet = XLSX.utils.table_to_sheet(table);
        var blob = XLSX.write(sheet, { bookType: 'xlsx', bookSST: true, type: 'blob' });

        saveAs(blob, 'tabla_excel.xlsx');
    }

    function saveAs(blob, fileName) {
        var link = document.createElement('a');
        link.href = window.URL.createObjectURL(blob);
        link.download = fileName;
        link.click();
    }
</script>