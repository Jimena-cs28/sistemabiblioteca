<!-- REPORTES -->
<!-- <h3 class="mb-4 text-center">REPORTES</h3> -->
<?php require_once 'permisos.php'; ?>
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-sm-4 col-md-3">
            <img src="../img/chart.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los reportes por usuario y sus detalles de sus pedidos
        </div>
    </div>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE PRESTAMOS POR USUARIO</h6>
    </div>
    <div class="card-body">
        <div class="row mb-3">
            <div class="col-md-6">
                <select name="" id="selectUser" class="form-control">

                </select>
            </div>
            <div class="col-md-2">
                <button class="btn btn-info" id="TraerD">Exportar PDF</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered" id="tablareporte" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="color:#574E4E;">#</th>
                        <th style="color:#574E4E;">Usario</th>
                        <th style="color:#574E4E;">Codigo</th>
                        <th style="color:#574E4E;">Libro</th>
                        <th style="color:#574E4E;">F.Solicitud</th>
                        <th style="color:#574E4E;">F.entrega</th>
                        <th style="color:#574E4E;">F.Prestamo</th>
                        <th style="color:#574E4E;">F.Devolucion</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    const selectUser = document.querySelector("#selectUser");
    const bodys = document.querySelector("tbody");
    const TraerD = document.querySelector("#TraerD");

    function listarUsuario(){
        const choiselistarStudent = new Choices(selectUser, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","filtrobeneficiario");

        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // console.log(datos);
            selectUser.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let select1 = `
                    <option value='${element.idusuario}'>${element.nombres}</option> 
                `;
                selectUser.innerHTML +=select1;
            });
            choiselistarStudent.setChoices([], 'value','label',true);
            choiselistarStudent.setChoices(datos, 'idusuario','nombres', true);
        })
    }

    function listarprestamoReporte(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","reporteDescripcion")
        parametros.append("descripcion",selectUser.value)

        fetch("../controller/reporte.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            bodys.innerHTML = ``;
            datos.forEach(element => {
                const pres = `
                <tr>
                    <td>${element.idlibroentregado}</td>
                    <td>${element.nombres}</td>
                    <td>${element.codigo} - ${element.codigo_libro}</td>
                    <td>${element.libro}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaentrega}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>${element.fechadevolucion}</td>
                </tr>
                `;
                bodys.innerHTML += pres;
            });
        })
    }

    function PDFdescripcion(){
        const parametros = new URLSearchParams();
        parametros.append("descripcion", parseInt(document.querySelector("#selectUser").value));
        parametros.append("titulo", selectUser.options[selectUser.selectedIndex].text);
        window.open(`../reports/descripcion.r.php?${parametros}`,'_blank');
    }
    TraerD.addEventListener("click", PDFdescripcion);
    listarUsuario();
    selectUser.addEventListener("change",listarprestamoReporte);
</script>
