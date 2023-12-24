<?php require_once 'permisos.php'; ?>
<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <div class="row mt-4 mb-5">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="../img/undraw_profile.svg" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
                    Bienvenido a la sección para registrar nuevos docentes. Para registrar un docente debes de llenar todos los campos del siguiente formulario, también puedes ver el listado de docentes registrados
                </div>
            </div>
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR UN NUEVO DOCENTE O ESTUDIANTE</h3>
                </div>
            </div> 
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-docente">
                    <div class="ml-5 row">
                        <div class="col-md-4">
                            <label style="color:#574E4E;">NOMBRES</label>
                            <input class="form-control" maxlength="70"  required id="nombres">
                        </div>
                        <div class="col-md-4">
                            <label style="color:#574E4E;">APELLIDOS</label>
                            <input class="form-control" maxlength="70"  required id="apellidos">
                        </div>
                        <div class="col-md-4">
                            <label for="" style="color:#574E4E;">ELEGIR</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="c-profesor" checked>
                                <label class="form-check-label" for="flexRadioDefault1">Profesor</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="c-estudiante">
                                <label class="form-check-label" for="flexRadioDefault2">Estudiante</label>
                            </div>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">TIPO</label>
                            <select class="form-control" id="documento">
                                <option value="DNI" disabled="" selected="">DNI</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">DNI</label>
                            <input type="text" class="form-control"  id="dni" placeholder="1234567" maxlength="8">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">FECHA NACIMIENTO</label>
                            <input type="date" class="form-control" id="fechanacimiento">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">DIRECCIÓN</label>
                            <input type="text" class="form-control" maxlength="20" id="direccion">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">CORREO ELECTRÓNICO</label>
                            <input type="text" class="form-control" placeholder="correo@com.pe"  id="correo" maxlength="50">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">TELEFONO</label>
                            <input type="text" class="form-control" placeholder="123456789" id="telefono" maxlength="9">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">NOMBRE USUARIO</label>  
                            <input type="text" class="form-control" required=""  id="usuario" maxlength="50" id="nombreusuario">
                        </div>
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">CONTRASEÑÁ</label>
                            <input type="text" class="form-control" required=""  id="contraseña" maxlength="50" id="contraseña">
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
                        <a href="index.php?view=listteacher.php" class="btn btn-success ml-2">Ver Profesores</a>
                        <a href="index.php?view=liststudent.php" class="btn btn-info ml-2">Ver Estudiantes</a>
                    </p>  
                </form>
            </div>
        </div>
    </div>
</div>

<script>            
    const btGuadar = document.querySelector("#btguardar");

    
    function fecha(){        
        
        const checkP = document.querySelector("#c-profesor");
        const checkE = document.querySelector("#c-estudiante")
        const fechaInput = document.getElementById('fechanacimiento');

        // Calcular la fecha actual
        const fechaActual = new Date();

        // Restar 10 años a la fecha actual
        fechaActual.setFullYear(fechaActual.getFullYear() - 10);

        // Formatear la fecha en el formato YYYY-MM-DD (compatible con el tipo date)
        const fechaLimite = fechaActual.toISOString().split('T')[0];

        // Establecer el atributo min en el input de fecha
        fechaInput.setAttribute('min', fechaLimite);
        if(checkP.checked){
            profesor();
        }else{
            estudiante();
        }
        
    }

    function profesor(){
        if(confirm("esta seguro de guardar")){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "registrarDocente");
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
                    document.querySelector("#form-docente").reset();
                }else{
                    toastError("Ese dni ya ha sido ingresado");
                }
            })
        }
    }

    function estudiante(){
        if(confirm("esta seguro de guardar?")){
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
                    document.querySelector("#form-docente").reset();
                }else{
                    toastError("Ese dni ya ha sido ingresado");
                }
            })
        }
    }

    btGuadar.addEventListener("click", fecha);
</script>