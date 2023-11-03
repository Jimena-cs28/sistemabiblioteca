<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <div class="row mt-4 mb-5">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="../views/img/user01.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
                    Bienvenido a la sección para registrar nuevos docentes. Para registrar un docente debes de llenar todos los campos del siguiente formulario, también puedes ver el listado de docentes registrados
                </div>
            </div>
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR UN NUEVO DOCENTE</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-docente">
                    <div class="ml-5 row">
                        <div class="col-md-6">
                            <label style="color:#574E4E;">NOMBRES</label>
                            <input class="form-control" maxlength="70"  required id="nombres">
                        </div>
                        <div class="col-md-6">
                            <label style="color:#574E4E;">APELLIDOS</label>
                            <input class="form-control" maxlength="70"  required id="apellidos">
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
                            <label for="" style="color:#574E4E;">Dirección</label>
                            <input type="text" class="form-control" maxlength="20" id="direccion">
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="" style="color:#574E4E;">CORREO ELECTRONICO</label>
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
                            <label for="" style="color:#574E4E;">CONTRASEÑA</label>
                            <input type="text" class="form-control" required=""  id="contraseña" maxlength="50" id="contraseña">
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
                        <a href="index.php?view=listteacher.php" class="btn btn-success ml-2">Ver Profesores</a>
                    </p>  
                </form>
            </div>
        </div>
    </div>
</div>

<script>            
    const btGuadar = document.querySelector("#btguardar");
    
    function fecha(){        
        const fecharegistar =document.querySelector("#fechanacimiento").value;
        var fechactual =  new Date();
        // var añoactual =fechactual.getFullYear();
        // var mesAcutual =String(fechactual.getMonth() + 1).padStart(2,'0');
        // var diaActual =String(fechactual.getDate()).padStart(2,'0');

        var fechaRegistro = new Date(fecharegistar);
        // var fechaActualFormateada =añoactual + '-' +mesAcutual +'-' +diaActual;
        
        if(fechaRegistro < fechactual){
            registrarProfesor();
        }else{
            alert("Error en la fecha de nacimiento");
        }
    }

    function registrarProfesor(){
        if(confirm("esta seguro de guardar")){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "registrarDocente");
            parametros.append("apellidos", document.querySelector("#apellidos").value);
            parametros.append("nombres", document.querySelector("#nombres").value);
            parametros.append("nrodocumento", document.querySelector("#dni").value);
            parametros.append("tipodocumento", document.querySelector("#documento").value);
            parametros.append("fechanac", fecharegistar.value);
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
                }
            })
        }
    }

    btGuadar.addEventListener("click", fecha);
</script>