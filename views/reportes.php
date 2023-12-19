<!-- REPORTES -->
<!-- <h3 class="mb-4 text-center">REPORTES</h3> -->
<?php require_once 'permisos.php'; ?>
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
        <!-- <div class="row mb-3">
            <div class="col-md-2">
                <button class="btn btn-info" id="Traer">Exportar PDF</button>
            </div>
            <div class="col-md-2">
                <button class="btn btn-info" id="TraerE">Exportar EXCEL</button>
            </div>
        </div> -->
        <div class="table-responsive">
        <table class="table table-bordered me-3" id="tablareporte" width="100%" cellspacing="0">
            <thead>
                <tr>
                    <th style="color:#574E4E; width: 5%;">#</th>
                    <th style="color:#574E4E; width: 5%;">Categoria</th>
                    <th style="color:#574E4E; width: 5%;">Codigo</th>
                    <th style="color:#574E4E; width: 5%;">Cantidad</th>
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

    function listarReporte() {
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarReporte");

        fetch("../controller/reporte.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // Destruir la tabla existente antes de agregar nuevas filas
            if ($.fn.DataTable.isDataTable('#tablareporte')) {
                $('#tablareporte').DataTable().destroy();
            }

            // Crear la tabla nuevamente con los nuevos datos
            tablaP = $('#tablareporte').DataTable({
                dom: 'Bfrtip',
                buttons: [ 'print','excel', 'pdf', 'copy'],
                language: {
                    url: '../js/Spanish.json'
                },
                order: [[0, "desc"]],
                columnDefs: [
                    {
                        visible: true,
                        searchable: true,
                        serverSide: true,
                        pageLength: 10
                    }
                ],
                data: datos, // Utilizar el arreglo de datos directamente
                columns: [
                    { data: 'idcategoria' },
                    { data: 'categoria' },
                    { data: 'codigo' },
                    { data: 'CantidadPrestada' }
                ]
            });
        });
    }

    // Inicializar la tabla vacía al principio
    // $('#tablareporte').DataTable({
    //     dom: 'Bfrtip',
    //     buttons: ['excel', 'pdf', 'copy'],
    //     language: {
    //         url: '../js/Spanish.json'
    //     },
    //     order: [[0, "desc"]],
    //     columnDefs: [
    //         {
    //             visible: true,
    //             searchable: true,
    //             serverSide: true,
    //             pageLength: 10
    //         }
    //     ]
    // });

    function PDF(){
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarReporte");
        window.open(`../reports/categoria.report.php?${parametros}`, '_blank');
    }  

    // btGuardar.addEventListener("click", PDF);
    listarReporte()
</script>