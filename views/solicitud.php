
<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/calendar.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran las reservaciones de libros hechas por los docentes y estudiantes, las cuales están pendientes para ser aprobadas por ti
        </div>
    </div>
</div>
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE SOLICITUDES</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th>Libro</th>
                        <th>Descripcion</th>
                        <th>F. Solicitud</th>
                        <th>F. Prestamo</th>
                        <th>F. Devolucion</th>
                        <th>Aceptar</th>
                        <th>Rechazar</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<script>
    let idprestamo = '';
    cuerpo = document.querySelector("tbody");

    function listarSolicitud(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listarSolicitud")

        fetch("../controller/librosentregados.php", {
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
                    <td>${element.idlibroentregado}</td>
                    <td>${element.Nombres}</td>
                    <td>${element.libro}</td>
                    <td>${element.descripcion}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>${element.fechadevolucion}</td>
                    <td>
                        <a href='#' class='Aceptar' data-toggle='modal' data-idprestamo='${element.idprestamo}'>Aceptar</a>
                    </td>
                    <td>
                        <a href='#'  class='' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>libros</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += pres;
            });
        })
    }

    cuerpo.addEventListener("click", (event) => {
        if(event.target.classList[0] === 'Aceptar'){
            idprestamo = parseInt(event.target.dataset.idprestamo);
            const parametros = new URLSearchParams();
            parametros.append("operacion","aceptarSolicitud");
            parametros.append("idprestamo", idprestamo);
            fetch("../controller/librosentregados.php",{
                method: 'POST',
                body: parametros
            })
            // console.log(idprestamo)
            .then(response => response.json())
            .then(datos => {
                listarSolicitud();
            })
        }
    });
    listarSolicitud();
</script>