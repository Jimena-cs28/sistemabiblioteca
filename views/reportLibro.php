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
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE REPORTER</h6>
    </div>
    <div class="card-body">
        <div class="row mb-3">
            <div class="col-md-6">
                <select name="" id="selectBook" class="form-control">

                </select>
            </div>
            <div class="col-md-2">
                <button class="btn btn-success" id="TraerL">Exportar PDF</button>
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered" id="" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th style="color:#574E4E;">#</th>
                        <th style="color:#574E4E;">Usario</th>
                        <th style="color:#574E4E;">Curso/Grado</th>
                        <th style="color:#574E4E;">Rol</th>
                        <th style="color:#574E4E;">Codigo</th>
                        <th style="color:#574E4E;">C.entrega</th>
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
    const btlibro = document.querySelector("#TraerL");
    const cuerpo = document.querySelector("tbody");
    const SelectBook = document.querySelector("#selectBook");

    function Selectlibro(){
        const choiselistarlibro= new Choices(SelectBook, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","conseguirlibro");

        fetch("../controller/prestamos.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            SelectBook.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                const optionTag = document.createElement("option");
                optionTag.value = element.idlibro;
                optionTag.text = element.libro;
                optionTag.dataset.subcategoria = element.subcategoria;
                optionTag.dataset.categoria = element.categoria;

                SelectBook.appendChild(optionTag);
            });
            choiselistarlibro.setChoices([], 'value','label',true);
            choiselistarlibro.setChoices(datos, 'idlibro','libro', true);
            
            // listarEjemplares();
        });
    }

    function listarprestamoReporteLibro(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","reporteLibro")
        parametros.append("idlibro",SelectBook.value)

        fetch("../controller/reporte.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                const pres = `
                <tr>
                    <td>${element.idlibroentregado}</td>
                    <td>${element.nombres}</td>
                    <td>${element.descripcion}</td>
                    <td>${element.nombrerol}</td>
                    <td>${element.codigo_libro}</td>
                    <td>${element.condicionentrega}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>${element.fechadevolucion}</td>
                </tr>
                `;
                cuerpo.innerHTML += pres;
            });
        })
    }

    function PDFlibro(){
        const parametros = new URLSearchParams();
        parametros.append("idlibro", parseInt(document.querySelector("#selectBook").value));
        window.open(`../reports/libro.r.php?${parametros}`,'_blank');
    }

    btlibro.addEventListener("click", PDFlibro);
    SelectBook.addEventListener("change", listarprestamoReporteLibro);
    Selectlibro();

</script>
