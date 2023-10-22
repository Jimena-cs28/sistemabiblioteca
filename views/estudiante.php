<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <div class="row mt-4 mb-5">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <!-- <img src="../assets/img/user03.png" alt="user" class="img-responsive center-box" style="max-width: 110px;"> -->
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
                    Bienvenido a la sección para registrar nuevos estudiantes, para poder registrar un estudiante deberás de llenar todos los campos del siguiente formulario
                </div>
            </div>
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR UN NUEVO ESTUDIANTE</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-estudiante">
                    <div class="ml-5 row">
                        <div class="col-md-6">
                            <label>NOMBRES</label>
                            <input class="form-control form-control-sm" maxlength="70"  required id="nombres">
                        </div>
                        <div class="col-md-6">
                            <label>APELLIDOS</label>
                            <input class="form-control form-control-sm" maxlength="70"  required id="apellidos">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">TIPO</label>
                            <select class="form-control form-control-sm" id="documento">
                                <option value="DNI" disabled="" selected="">DNI</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="">DNI</label>
                            <input type="text" class="form-control form-control-sm"  id="dni" placeholder="1234567" maxlength="7">
                        </div>
                        <div class="col-md-3">
                            <label for="">FECHA NACIMIENTO</label>
                            <input type="date" class="form-control form-control-sm" id="fechanacimiento">
                        </div>
                        <div class="col-md-3">
                            <label for="">Dirección</label>
                            <input type="text" class="form-control form-control-sm" maxlength="20" id="direccion">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">CORREO ELECTRONICO</label>
                            <input type="text" class="form-control form-control-sm" placeholder="correo@com.pe"  id="correo" maxlength="50">
                        </div>
                        <div class="col-md-3">
                            <label for="">TELEFONO</label>
                            <input type="text" class="form-control form-control-sm" placeholder="123456789" id="telefono" maxlength="9">
                        </div>
                        <div class="col-md-3">
                            <label for="">NOMBRE USUARIO</label>  
                            <input type="text" class="form-control form-control-sm" required=""  id="usuario" maxlength="50">
                        </div>
                        <div class="col-md-3">
                            <label for="">CONTRASEÑA</label>
                            <input type="text" class="form-control form-control-sm" required=""  id="contraseña" maxlength="50">
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="submit" class="btn btn-primary" id="btguardar">Guardar</button>
                        <a href="index.php?view=liststudent.php" class="btn btn-success ml-2">Ver estudiantes</a>
                    </p>  
                </form>
            </div>
        </div>
    </div>
</div>

    <script>
        const Btguardar = document.querySelector("#btguardar");

        function registrarEstudiante(){
            if(confirm("esta seguro de guardar")){
                const parametros = new URLSearchParams();
                parametros.append("operacion", "registrarEstudiante");
                parametros.append("apellidos", document.querySelector("#apellidos").value);
                parametros.append("nombres", document.querySelector("#nombres").value);
                parametros.append("nrodocumento", document.querySelector("#dni").value);
                parametros.append("tipodocumento", document.querySelector("#documento").value);
                parametros.append("fechanac", document.querySelector("#fechanacimiento").value);
                parametros.append("direccion", document.querySelector("#direccion").value);
                parametros.append("telefono", document.querySelector("#telefono").value);
                parametros.append("email", document.querySelector("#correo").value);
                parametros.append("nombreusuario", document.querySelector("#usuario").value);
                parametros.append("claveacceso", document.querySelector("#contraseña").value);

                fetch("../controller/estudiantes.php" ,{
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    if(datos.status){
                        document.querySelector("#form-estudiante").reset();
                    }
                })
            }
        }

        Btguardar.addEventListener("click",registrarEstudiante);
    </script>