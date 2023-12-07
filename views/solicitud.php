<?php require_once 'permisos.php'; ?>

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

<div> 
    <div class="modal fade" id="registrarejemplares">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">Registrar Ejemplares</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        
                        <div class="col-md-4">
                            <input id="fechadevolucion" type="date" class="form-control">
                        </div>
                        <!-- <div class="col-md-4">
                            <button id="aplicar" class="btn btn-primary">Aplicar a todo</button>
                        </div> -->
                    </div>
                    <div id="listejemplares" class="mt-5">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button id ="aceptarsolicitud" type="button" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div> 
    <div class="modal fade" id="rechazarsolicitud">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel" style="color: #5075da;">Rechazar Solicitud</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="text" placeholder="Motivo" id="txt-rechazarsolicitud" style="width: 80%;">
                    <div id="listejemplaresrechazar" class="mt-5">

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button id ="btnrechazarsolicitud" type="button" class="btn btn-primary">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<!-- <div class="modal fade" id="registrarejemplares" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Registrar Ejemplares</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4">
                        <input id="condicionlibro" type="text" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <input id="fechadevolucion" type="date" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <button id="aplicar" class="btn btn-primary">Aplicar a todo</button>
                    </div>
                </div>
                <div id="listejemplares" class="mt-5">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button id ="aceptarsolicitud" type="button" class="btn btn-primary">Guardar</button>
            </div>
        </div>
    </div>
</div> -->

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
                        <th>Aceptar</th>
                        <th>Cancelar</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    let idprestamo = '';
    let idlibro = '';
    let cantidad = '';
    const btnaceptarsolicitud = document.querySelector("#aceptarsolicitud")
    // const aplicar = document.querySelector("#aplicar")
    const fechadevolucion = document.querySelector("#fechadevolucion")
    cuerpo = document.querySelector("tbody");
    listejemplares = document.querySelector("#listejemplares");
    const modal = new bootstrap.Modal(document.querySelector("#registrarejemplares"));
    const modalrechazarsolicitud = new bootstrap.Modal (document.querySelector("#rechazarsolicitud"));
    const btnrechazarsolicitud = document.querySelector("#btnrechazarsolicitud");
    const txtrechazarsolicitud = document.querySelector("#txt-rechazarsolicitud"); 
    const listejemplaresrechazar = document.querySelector("#listejemplaresrechazar");

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
                    <td>${element.idprestamo}</td>
                    <td>${element.Nombres}</td>
                    <td>${element.libro}</td>
                    <td>${element.descripcion}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>
                    <a  class="btn btn-info btn-sm editar" data-fechasolicitud="${element.fechaprestamo}"data-id="${element.idlibro}" data-idprestamo="${element.idprestamo}" data-cantidad="${element.cantidad}">Registrar</a>
                    </td>
                    <td>
                    <a  class="btn btn-danger btn-sm cancelar" data-id="${element.idlibro}" data-cantidad="${element.cantidad}" data-idprestamo="${element.idprestamo}">Rechazar</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += pres;
            });
        })
    }

    // aplicar.addEventListener("click", (event) => {
    //     const inputlist = document.querySelectorAll(".item-ejemplar input")
    // })
    cuerpo.addEventListener("click", (event) => {
    const element = event.target.closest(".editar");
    if (element) {
        //Validación fechas
        idlibro = element.dataset.id;
        cantidad = element.dataset.cantidad;
        idprestamo = element.dataset.idprestamo;
        console.log(element.dataset.fechasolicitud);
        fechadevolucion.min = new Date(element.dataset.fechasolicitud).toISOString().split('T')[0];
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarEjemplaresdisponibles");
        parametros.append("idlibro", idlibro);
        parametros.append("cantidad", cantidad);

        fetch("../controller/userlibros.php", {
            method: "POST",
            body: parametros,
        })
            .then((res) => res.json())
            .then((datos) => {
                // Tabla en el modal
                const table = document.createElement("table");
                table.classList.add("table", "table-bordered");

                // Agregar una fila de encabezado
                const headerRow = table.createTHead().insertRow(0);

                // Encabezado 1: Código del Libro
                const codigoLibroHeader = headerRow.insertCell(0);
                codigoLibroHeader.textContent = "Código del libro";

                // Encabezado 2: Condición de Entrega
                const condicionEntregaHeader = headerRow.insertCell(1);
                condicionEntregaHeader.textContent = "Condición de entrega";

                // Agregar datos a la tabla en dos columnas
                datos.forEach((el) => {
                    const row = table.insertRow(-1);
                    row.classList.add("item-ejemplar")

                    // Columna 1: Código del Libro
                    const codigoLibroCell = row.insertCell(0);
                    codigoLibroCell.innerHTML = `${el.codigo_libro} <span class= "idejemplar" style= "display:none">${el.idejemplar}</span>`;

                    // Columna 2: Condición de Entrega
                    const condicionEntregaCell = row.insertCell(1);

                    // Input debajo del texto                   
                    condicionEntregaCell.textContent = el.condicion;
                });

                // Limpiar el contenido anterior del listejemplares
                listejemplares.innerHTML = "";

                // Agregar la tabla al listejemplares
                listejemplares.appendChild(table);
            });

        //apertura del modal
        modal.toggle();
    }
});

cuerpo.addEventListener('click', function(event){
    const element = event.target.closest(".cancelar");
    if(element){
        idprestamo = element.dataset.idprestamo;
        idejemplar = element.dataset.idejemplar;
        idlibro = element.dataset.id;
        cantidad = element.dataset.cantidad;
        const parametros = new URLSearchParams();
        parametros.append("operacion", "listarEjemplaresdisponibles");
        parametros.append("idlibro", idlibro);
        parametros.append("cantidad", cantidad);

        fetch("../controller/userlibros.php", {
            method: "POST",
            body: parametros,
        })
            .then((res) => res.json())
            .then((datos) => {
                // Tabla en el modal
                const table = document.createElement("table");
                table.classList.add("table", "table-bordered");

                // Agregar una fila de encabezado
                const headerRow = table.createTHead().insertRow(0);

                // Encabezado 1: Código del Libro
                const codigoLibroHeader = headerRow.insertCell(0);
                codigoLibroHeader.textContent = "Código del libro";

                // Encabezado 2: Condición de Entrega
                const condicionEntregaHeader = headerRow.insertCell(1);
                condicionEntregaHeader.textContent = "Condición de entrega";

                // Agregar datos a la tabla en dos columnas
                datos.forEach((el) => {
                    const row = table.insertRow(-1);
                    row.classList.add("item-ejemplar-editar")

                    // Columna 1: Código del Libro
                    const codigoLibroCell = row.insertCell(0);
                    codigoLibroCell.innerHTML = `${el.codigo_libro} <span class= "idejemplar" style= "display:none">${el.idejemplar}</span>`;

                    // Columna 2: Condición de Entrega
                    const condicionEntregaCell = row.insertCell(1);

                    // Input debajo del texto                   
                    condicionEntregaCell.textContent = el.condicion;
                });

                // Limpiar el contenido anterior del listejemplares
                listejemplaresrechazar.innerHTML = "";

                // Agregar la tabla al listejemplares
                listejemplaresrechazar.appendChild(table);
                modalrechazarsolicitud.toggle()
            });

        //apertura del modal

    }
} )
btnrechazarsolicitud.addEventListener('click', function(){
    const motivo = txtrechazarsolicitud.value
    const listaejemplares = document.querySelectorAll(".item-ejemplar-editar")
    //Validación para colocar el motivo de rechazo del libro
    if(motivo.trim()===''){
        alert('Debe ingresar el motivo')
    }
    else{
        const arrListejemplar = []
        listaejemplares.forEach(el=>{
        const idejemplar = el.querySelector(".idejemplar").textContent
        arrListejemplar.push({idejemplar})
    })
        const formData = new FormData()
        formData.append("operacion", "cancelarsolicitud")
        formData.append("idprestamo", idprestamo)
        formData.append("listejemplar", JSON.stringify(arrListejemplar))
        formData.append("motivo", motivo)
        fetch("../controller/userlibros.php", {
            method: 'POST',
            body: formData
        })
        .then(res=>res.json())
        .then(datos=>{
            if(datos.estado){
                location.reload()
            }
        })
    }
})

btnaceptarsolicitud.addEventListener('click', function(){
    const listaejemplares = document.querySelectorAll(".item-ejemplar")
    const arrListejemplar = []
    //Validación fechadevolucion
    if(fechadevolucion.value == ''){
        alert('Debe colocar la fecha devolución')
        return
    }
    listaejemplares.forEach(el=>{
        const idejemplar = el.querySelector(".idejemplar").textContent
        const observacion = el.querySelectorAll("td")[1].textContent
        console.log(el) 
        arrListejemplar.push({idejemplar,observacion,fechadevolucion:fechadevolucion.value})
    })
    console.log(arrListejemplar)
    const formData = new FormData()
    formData.append("operacion", "registrarlibrosentregados")
    formData.append("idprestamo", idprestamo)
    formData.append("listejemplar", JSON.stringify(arrListejemplar))
    btnaceptarsolicitud.setAttribute("disabled", "")
    fetch("../controller/userlibros.php", {
        method: 'POST',
        body: formData
    }).then(res=>res.json())
    .then(datos=>{
        btnaceptarsolicitud.removeAttribute("disabled")
        modal.toggle();
        location.reload()
    })
})



    listarSolicitud();



</script>