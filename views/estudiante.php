<!-- REPORTES -->

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

<h5 id="customAlert" class="custom-alert"></h5>
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE DEVOLUCIONES</h6>
    </div>
    <div class="card-body">
        <div class="row mb-3">
            <div class="col-md-1">
                <h5 class="card-title fw-semibold font-weight-bold text-primary">Reportes :</h5>
            </div>
            <div class="col-md-3">
                <input type="date" id="fechasolicitud" class="form-control">
            </div>
            <div class="col-md-3">
                <input type="date" name="" id="fechasolicitud1" class="form-control">
            </div>
            <div class="col-md-3">
                <button class="btn btn-info" id="Traer">Exportar PDF</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered" id="tablareporte" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="color:#574E4E;">#</th>
                        <th style="color:#574E4E;">Categoria</th>
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
    const Fsolicitud = document.querySelector("#fechasolicitud");
    const Fsolicitud1 = document.querySelector("#fechasolicitud1");
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
                    <td>${element.CantidadPrestada}</td>
                </tr>
                `;
                cuerpo.innerHTML += recibir;
            });
        })
    }

    function listarSolicitud(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","reporteSolicitud")
        parametros.append("fechasolicitud",Fsolicitud.value)
        parametros.append("fechasolicitud1",Fsolicitud1.value)
        fetch("../controller/reporte.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                const reporte = `
                <tr>
                    <td>${element.idcategoria}</td>
                    <td>${element.categoria}</td>
                    <td>${element.CantidadPrestada}</td>
                </tr>
                `;
                cuerpo.innerHTML += reporte;
            });
        })
    }

    Fsolicitud1.addEventListener("keypress", (evt) => {
        if(evt.charCode == 13) listarSolicitud();
    });
    btGuardar.addEventListener("click", listarSolicitud);
    listarReporte();
</script>