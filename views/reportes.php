<!-- REPORTES -->
<!-- <h3 class="mb-4 text-center">REPORTES</h3> -->
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-sm-4 col-md-3">
            <img src="../img/chart.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los reportes que son solicitados durante todo el periodo de prestamos de libros
        </div>
    </div>
</div>
<!-- <h5 id="customAlert" class="custom-alert"></h5> -->
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE CATEGORIAS</h6>
    </div>
    <div class="card-body">
        <div class="row mb-3">
            <div class="col-md-2">
                <button class="btn btn-info" id="Traer">Exportar PDF</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered" id="tablareporte" width="100%" cellspacing="0">
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

<script>
    const cuerpo = document.querySelector("tbody");
    const btGuardar = document.querySelector("#Traer");

    function listarReporte(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listarReporte")
        fetch("../controller/reporte.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                const recibir = `
                <tr>
                    <td>${element.idcategoria}</td>
                    <td>${element.categoria}</td>
                    <td>${element.codigo}</td>
                    <td>${element.CantidadPrestada}</td>
                </tr>
                `;
                cuerpo.innerHTML += recibir;
            });
        })
    }

    function PDF(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarReporte");
        window.open(`../reports/categoria.report.php?${parametros}`, '_blank');
    }  

    btGuardar.addEventListener("click", PDF);
    // listarSolicitud();
    listarReporte();
</script>