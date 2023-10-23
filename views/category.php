<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <div class="row mt-4 mb-5">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="../views/img/category.png" alt="user" class="img-responsive center-box" style="max-width: 110px;">
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
                    Bienvenido a la sección para registrar nuevas subcategorías de libros, debes de llenar el siguiente formulario para registrar una categoría
                </div>
            </div>
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">AGREGAR UNA NUEVA SUBCATEGORIA</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="">
                    <div class="row ml-5 mt-4">
                        <div class="col-md-4">
                            <label for="">CATEGORIA</label>
                            <select class="form-control form-control-sm" id="selectcategoria" >
                                    
                            </select>    
                        </div>
                        <div class="col-md-4">
                            <label for="">SUBCATEGORIA</label>
                            <input type="text" class="form-control form-control-sm" placeholder="Grado o Curso" id="subcategoria">
                        </div>
                        <div class="col-md-4">
                            <label for="">CODIGO</label>
                            <input type="text" class="form-control form-control-sm" required="" id="codigo">
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="submit" class="btn btn-primary" id="btguardar">Guardar</button>
                    </p>  
                </form>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="fw-semibold text-center m-0 font-weight-bold" style="color:#0B5993 ;">LISTADO DE SUBCATEGORIAS</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Categoria</th>
                                <th>Sub Categoria</th>
                                <th>Codigo</th>
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
        
        