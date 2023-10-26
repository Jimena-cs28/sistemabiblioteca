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
<!-- modal reserva -->
<div class="modal fade" id="mdl-libro" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl ">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel" style="color: #6980e6;">Registrar Libro</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            <form id="">
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">CATEGORIA</label>
                            <input type="text" class="form-control form-control-sm" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">SUBCATEGORIA</label>
                            <input type="text" class="form-control form-control-sm" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">EDITORIAL</label>
                            <input type="text" class="form-control form-control-sm" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">NOMBRE</label>
                            <input type="text" id="libro" class="form-control form-control-sm" disabled maxlength="70">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">CANTIDAD</label>
                            <input type="number" class="form-control form-control-sm"  disabled id="cantidad">
                        </div>
                        <div class="col-md-3">
                            <label for="">NUMERO DE PAGINA</label>
                            <input type="number" class="form-control form-control-sm" disabled id="paginas">
                        </div>
                        <div class="col-md-3">
                            <label for="">CODIGO</label>  
                            <input type="text" class="form-control form-control-sm" disabled id="codigo">
                        </div>
                        <div class="col-md-3">
                            <label for="">FORMATO</label>
                            <input type="text" class="form-control form-control-sm" maxlength="50"id="formato" disabled>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">Descripcion</label>
                            <input type="text" id="descripcion" class="form-control form-control-sm" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">IDIOMA</label>
                            <input type="text" class="form-control form-control-sm" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">AÑO</label>
                            <input type="date" id="anio" class="form-control form-control-sm" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">TIPO</label>
                            <input type="text" id="tipo" class="form-control form-control-sm" disabled>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-6">
                            <label for="">Imagen</label>
                            <img class="visor" alt="" id="img">
                        </div>
                        <div class="col-md-3">
                            <label for="">EDICION</label>
                            <input type="text" id="edicion" class="form-control form-control-sm" disabled>
                        </div>
                        <div class="col-md-3">
                            <label for="">Autor</label>
                            <input type="text" class="form-control" disabled>
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
                        <a href='#mdl-libro' class='btn btn-success registrar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>Libros</a>
                    </td>
                    <td>
                        <a href='' class='btn btn-info registrar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>Actualizar</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += libro;
            });
        })
    }

    listadoLibro();
</script>