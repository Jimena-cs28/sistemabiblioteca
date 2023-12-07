<?php require_once 'permisos.php'; ?>
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/chart.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los reportes que se pueden sacar por mes año o lo que usted desea y tambien se podra imprimir
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between mb-9">
                    
                </div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-1">
                            <h5 class="card-title fw-semibold font-weight-bold text-primary">Reportes :</h5>
                        </div>
                        <div class="col-md-4">
                            <select name="" id="idusuario" class=" form-control">
                                <option value="">Seleccione</option>
                                <option value="2">Profesor</option>
                                <option value="3">Estudiante</option>
                            </select>
                        </div>
                        <div class="col-md-7">
                            <button class="btn btn-info" id="btnexport">Exportar PDF</button>
                        </div>
    
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="color:#574E4E;">#</th>
                                    <th style="color:#574E4E;">Categoria</th>
                                    <th style="color:#574E4E;">Codigo</th>
                                    <th style="color:#574E4E;">Cantidad</th>
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
</div>

<script>
    const descripcion = document.querySelector("#descripcion");
    const tabla = document.querySelector("tbody");
    const btExportar = document.querySelector("#btnexport");

    function listarDescripcion(){
        const choiselistarStudent = new Choices(descripcion, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectGrado");

        fetch("../controller/librosentregados.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // console.log(datos);
            descripcion.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let select = `
                    <option value='${element.descripcion}'>${element.descripcion}</option> 
                `;
                descripcion.innerHTML +=select;
            });
            choiselistarStudent.setChoices([], 'value','label',true);
            choiselistarStudent.setChoices(datos, 'descripcion','descripcion', true);
        })
    }

    function listarprestamo(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","tablareporte")
        parametros.append("descripcion", descripcion.value);
        
        fetch("../controller/librosentregados.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            tabla.innerHTML = ``;
            datos.forEach(element => {
                const pres = `
                <tr>
                    <td>${element.idlibroentregado}</td>
                    <td>${element.categoria}</td>
                    <td>${element.subcategoria}</td>
                    <td>${element.libro}</td>
                    <td>${element.cantidad}</td>
                    <td>${element.nombres}</td>
                    <td>${element.descripcion}</td>
                </tr>
                `;
                tabla.innerHTML += pres;
            });
        })
    }

    function listarSolicitudUsu(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","reporteUsuario")
        parametros.append("idusuario",document.querySelector("#idusuario").value)
        fetch("../controller/reporte.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            tabla.innerHTML = ``;
            datos.forEach(element => {
                const repor = `
                <tr>
                    <td>${element.idcategoria}</td>
                    <td>${element.categoria}</td>
                    <td>${element.codigo}</td>
                    <td>${element.CantidadPrestada}</td>
                </tr>
                `;
                tabla.innerHTML += repor;
            });
        })
    }

    function PDFusuario(){
        const parametros = new URLSearchParams();
        parametros.append("idusuario", parseInt(document.querySelector("#idusuario").value));
        window.open(`../reports/usuario.report.php?${parametros}`,'_blank');
    }

    btExportar.addEventListener("click", PDFusuario)
    document.querySelector("#idusuario").addEventListener("change", listarSolicitudUsu)
    listarprestamo();
    descripcion.addEventListener("change", listarprestamo);

    listarDescripcion();
</script>
