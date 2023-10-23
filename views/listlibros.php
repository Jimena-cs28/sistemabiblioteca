<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../views/img/book.png" alt="clock" class="img-responsive center-box" style="max-width: 129px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los libros registrados por el estudiante, se podra editar y eliminar los libros que usted desee
        </div>
    </div>
</div>
<!-- tablas -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">LISTADO DE LIBROS</h6>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Categoria</th>
                        <th>SubCategoria</th>
                        <th>Libro</th>
                        <th>apellidos</th>
                        <th>Cantidad</th>
                        <th>Paginas</th>
                        <th>Codigo</th>
                        <th>idioma</th>
                        <th>Ver Todo</th>
                        <th>Editar</th>
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

    function listadoLibro(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listadolibro")

        fetch("../controller/libros.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                const libro = `
                <tr>
                    <td>${element.iddetalleautor}</td>
                    <td>${element.categoria}</td>
                    <td>${element.subcategoria}</td>
                    <td>${element.nombre}</td>
                    <td>${element.autor}</td>
                    <td>${element.cantidad}</td>
                    <td>${element.numeropaginas}</td>
                    <td>${element.codigo}</td>
                    <td>${element.idioma}</td>
                    <td>
                        <a href='#modal-id' class='btn btn-success registrar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'><i class='glyphicon glyphicon-book'></i></a>
                    </td>
                    <td>
                        <a href='' class='btn btn-info registrar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'><i class='glyphicon glyphicon-book'></i></a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += libro;
            });
        })
    }

    listadoLibro();
</script>