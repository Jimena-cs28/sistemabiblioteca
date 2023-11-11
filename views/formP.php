<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <!-- <img src="../assets/img/calendar.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;"> -->
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran las reservaciones de libros hechas por los docentes y estudiantes, las cuales están pendientes para ser aprobadas por ti
        </div>
    </div>
</div>
<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <!-- fila del titulo -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <h3 class="fw-semibold text-center" style="color:#0B5993 ;">REGISTRAR UN NUEVO PRESTAMO</h3>
                </div>
            </div>  
        </div>
        <div class="card border-0">
            <div class="card-body">            
                <form id="">
                    <div class="ml-5 row">
                        <div class="col-md-3">
                            <label>NOMBRES Y APELLIDOS :</label>
                        </div>
                        <div class="col-md-8">
                            <select class="form-control form-control-sm" id="filtronombres">
                            </select>
                        </div>
                    </div>
                    <div class="row ml-5 mt-4">
                        <div class="col-md-3">
                            <label for="">FECHA PRESTAMO</label>
                            <input type="date" class="form-control form-control-sm" required=""id="fprestamo">
                        </div>
                        <div class="col-md-3">
                            <label for="">DESCRIPCION</label>
                            <input type="text" class="form-control form-control-sm" placeholder="Grado o Curso" id="descripcion">
                        </div>
                        <div class="col-md-3">
                            <label for="">EN BIBLIOTECA</label>
                            <select class="form-control form-control-sm" required="" data-placement="top" id="enbiblioteca">
                                <option value="NO" selected="">NO</option>
                                <option value="SI" selected="">SI</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label for="">DESTINO</label>
                            <input type="text" class="form-control form-control-sm" maxlength="20" placeholder="Salon 1" id="lugardestino">
                        </div>
                    </div>
                    <p class="text-center mt-4">
                        <button type="reset" class="btn btn-info" style="margin-right: 20px;">Limpiar</button>
                        <button type="button" class="btn btn-primary" id="btguardar">Guardar</button>
                    </p>  
                </form>
            </div>
        </div>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="fw-semibold text-center m-0 font-weight-bolder" style="color:#0B5993 ;">LISTADO DE PRESTAMOS</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombres</th>
                                <th>Apellidos</th>
                                <th>Usuario</th>
                                <th>F. Solicitud</th>
                                <th>F. Prestamo</th>
                                <th>Rol</th>
                                <th>Ahora</th>
                                <th>Reservar</th>
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
<script>
    const filtronombre = document.querySelector("#filtronombres");
    // const btGuadar = document.querySelector("#btguardar");
    // let idprestamo = '';
    const cuerpo = document.querySelector("tbody");
    // const selectcategoria = document.querySelector("#filtrocategoria");
    // const selectsubcategoria = document.querySelector("#filtrosubcategoria");            
    // const cantidad = document.querySelector("#cantidad");
    // const libro = document.querySelector("#libro");
    // const condicionentrega = document.querySelector("#condicionentrega");

    function filtrobene(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","filtrobeneficiario");

        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            filtronombre.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let opcion = `
                <option value='${element.idbeneficiario}'>${element.nombres}</option> 
                `;
                filtronombre.innerHTML += opcion;
            });
            
        });
    }

    // function registrarV(){
    //     const respuesta = <?php echo $datoID;?>;
    //     const idbibliotecario = respuesta.idusuario;
    //     if(confirm("esta seguro de guardar")){
    //         const parametros = new URLSearchParams();
    //         parametros.append("operacion", "registrarPrestamo");
    //         parametros.append("idbeneficiario", filtronombre.value);
    //         parametros.append("idbibliotecario", parseInt(idbibliotecario));
    //         parametros.append("fechaprestamo", document.querySelector("#fprestamo").value);
    //         parametros.append("descripcion", document.querySelector("#descripcion").value);
    //         parametros.append("enbiblioteca", document.querySelector("#enbiblioteca").value);
    //         parametros.append("lugardestino", document.querySelector("#lugardestino").value);

    //         fetch("../controller/prestamos.php" ,{
    //             method: 'POST',
    //             body: parametros
    //         })
    //         .then(response => response.json())
    //         .then(datos => {
    //             if(datos.status){
    //                 document.querySelector("#form-prestamo").reset();
    //             }
    //         })
    //     }
    // }

        
    function listarprestamo(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","listarprestamo");
        fetch("../controller/prestamos.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            cuerpo.innerHTML = ``;
            datos.forEach(element => {
                // console.log(datos);
                const list = `
                <tr>
                    <td>${element.idprestamo}</td>
                    <td>${element.nombres}</td>
                    <td>${element.apellidos}</td>
                    <td>${element.nombreusuario}</td>
                    <td>${element.fechasolicitud}</td>
                    <td>${element.fechaprestamo}</td>
                    <td>${element.nombrerol}</td>
                    <td>
                        <a href='#modal-id' class='btn btn-success registrar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>ja</a>
                    </td>
                    <td>
                        <a href='' class='btn btn-info registrar' data-toggle='modal' type='button' data-idprestamo='${element.idprestamo}'>ja</a>
                    </td>
                </tr>
                `;
                cuerpo.innerHTML += list;
            });
        })
    }

    // cuerpo.addEventListener("click", (event) => {
    //     if(event.target.classList[0] === 'registrar'){
    //         idprestamo = parseInt(event.target.dataset.idprestamo);
    //         const parametros = new URLSearchParams();
    //         parametros.append("operacion","obtenerprestamo");
    //         parametros.append("idprestamo", idprestamo);

    //         fetch("../controller/prestamos.php",{
    //             method: 'POST',
    //             body: parametros
    //         })
    //         .then(response => response.json())
    //         .then(datos => {
    //             btguardar.addEventListener("click", registrarLibroentregado);
    //         })  
    //     }
    // })

    // function registrarLibroentregado(){
    //     if(confirm("estas seguro de guardar?")){
    //         const parametros = new URLSearchParams();
    //         parametros.append("operacion","registrarLibroentregado");
    //         parametros.append("idprestamo", idprestamo);
    //         parametros.append("idlibro", libro.value);
    //         parametros.append("cantidad", cantidad.value);
    //         parametros.append("condicionentrega", condicionentrega.value);

    //         fetch("../controller/prestamos.php" ,{
    //             method:'POST',
    //             body: parametros
    //         })
    //         .then(respuesta => respuesta.json())
    //         .then(datos => {
    //             console.log(datos);
    //             if(datos.status){
    //             alert("Datos guardados correctamente")
    //             document.querySelector("#modal-registrarlibro").reset();
    //             }
    //         })
    //     }
    // }

    // function SelectCategoria(){
    //     const parametros = new URLSearchParams();
    //     parametros.append("operacion","selectcategoria");

    //     fetch("../controller/prestamos.php", {
    //     method: 'POST',
    //     body: parametros
    //     })
    //     .then(response => response.json())
    //     .then(datos => {
    //     selectcategoria.innerHTML = "<option value=''>Seleccione</option>";
    //     datos.forEach(element => {
    //         let opcion = `
    //             <option value='${element.idcategoria}'>${element.categoria}</option>`;
    //             selectcategoria.innerHTML += opcion;
    //         });
    //     });
    // }

    // function selectsubCategoria(){
    //     const parametros = new URLSearchParams();
    //     parametros.append("operacion", "selectsubcategoria");
    //     parametros.append("idcat", selectcategoria.value);
    //     fetch("../controller/prestamos.php", {
    //         method : 'POST',
    //         body:parametros
    //     })
    //     .then(response => response.json())
    //     .then(datos => {
    //         datos.forEach(element => {
    //             let opcion1 = `
    //                 <option value='${element.idsubcategoria}'>${element.subcategoria}</option>`;
    //                 selectsubcategoria.innerHTML += opcion1;  
    //         });
                
    //     });
    // }
    
    // function mostrarlibros(){
    //     const parametros = new URLSearchParams();
    //     parametros.append("operacion", "mostrarlibro");
    //     parametros.append("idsubcat", selectsubcategoria.value);
    //     fetch("../controller/prestamos.php",{
    //         method : 'POST',
    //         body:parametros
    //     })
    //     .then(response => response.json())
    //     .then(datos => {
    //         datos.forEach(element => {
    //             let libros = `
    //                 <option value='${element.idlibro}'>${element.nombre}</option>`;
    //                 libro.innerHTML += libros; 
    //         });
                
    //     }
    //     );
    // }
    // filtrobene();
    listarprestamo();
    // SelectCategoria();
    // selectcategoria.addEventListener("change", selectsubCategoria);
    // selectsubcategoria.addEventListener("change", mostrarlibros);
    // btGuadar.addEventListener("click",registrarV);

</script>

<div class="container-fluid border-0">
    <div class="card border-0">
        <div class="card-body border-0">
            <!-- fila del titulo -->
            <div class="row">
                <div class="col-md-12">
                    <h3 class="fw-semibold mb-2 text-center" style="color:#ff7619 ;">REGISTRAR ATENCIÓN DE SERVICIOS</h3>
                </div>
            </div>  
        </div>      
        <div class="card border-0">
            <div class="card-body">            
                <form id="form-atenciones" class="needs-validation">
                    <div class="mb-3 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#ff7619 ;">PACIENTE:</label>
                        </div>                                                               
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-2">
                            <label for="DNI_personas">N° Doc:</label>          
                        </div>
                        <div class="col-md-3">                                  
                            <input class="form-control form-control-sm" id="DNI_personas" placeholder="12345678" maxlength="10" type="tel" required>
                            <div class="invalid-feedback">
                            Complete este campo para continuar
                            </div>       
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-sm" id="agregarPaciente" data-bs-toggle="modal" data-bs-target="#registrar-personas" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-2">
                            <label for="">Nombre completo:</label>          
                        </div>
                        <div class="col-md-9">                                  
                            <input class="form-control form-control-sm bg-light" id="nombrePaciente" type="text" readonly>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-2">
                            <label for="">Edad:</label>          
                        </div>
                        <div class="col-md-1">                                  
                            <input class="form-control form-control-sm bg-light" id="edadPaciente" type="text" readonly>
                        </div>
                        <div class="col-md-2">                                  
                            <label class="form-control form-control-sm bg-light" id="mesesAños" ></label>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-sm" style="background-color: #ff7619; color: white;" id="ordenMedica" type="button">Orden médica</button>
                        </div>
                    </div>
                    <!-- familiar -->
                    <div id="familiar" style="display: none;">
                        <div class="mb-3 row g-2">
                            <div class="col-md-10">
                                <label for="" class="card-title" style="color:#ff7619 ;">FAMILIAR:</label>
                            </div>                                                               
                        </div>
                        <div class="mb-3 row g-2">
                            <div class="col-md-2">
                                <label for="DNI_familiar">N° Doc: </label>
                            </div>
                            <div class="col-md-3">
                                <input type="text" class="form-control form-control-sm" id="DNI_familiar" placeholder="12345678" maxlength="10" type="tel">
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-sm" id="agregarPaciente" data-bs-toggle="modal" data-bs-target="#registrar-personas" type="button"><i class="fa-solid fa-circle-plus fa-2xl" style="color: #e66814;"></i></button>
                            </div>
                        </div>
                        <div class="mb-3 row g-2">
                            <div class="col-md-2">
                                <label for="nombreFamiliar">Nombre completo:</label>          
                            </div>
                            <div class="col-md-9">                                  
                                <input class="form-control form-control-sm bg-light" id="nombreFamiliar" type="text" readonly>
                            </div>
                        </div>
                        <div class="mb-3 row g-2">
                            <div class="col-md-2">
                                <label for="">Parentesco:</label>          
                            </div>
                            <div class="col-md-3">                                  
                                <input class="form-control form-control-sm" id="parentescoFamilar" type="text" maxlength="100" disabled>
                            </div>
                        </div>
                    </div>
                    <!-- orden medica -->
                    <div id="ordenM" style="display: none;">
                        <div class="mb-3 row g-2">
                            <div class="col-md-10">
                                <label for="" class="card-title" style="color:#ff7619 ;">ORDEN MÉDICA:</label>
                            </div>                                                               
                        </div>
                        <div class="mb-3 row g-2">
                            <div class="col-md-2">
                                <label for="">Doctor:</label>          
                            </div>
                            <div class="col-md-3">                                  
                                <select name="" id="listaEspecialidades" class="form-control form-control-sm" >
                                    <option value="">Seleccione</option>
                                </select> 
                            </div>
                            <div class="col-md-4">                                  
                                <select name="" id="listaOrdenDoctor" class="form-control form-control-sm" >
                                    <option value="">Seleccione</option>
                                </select> 
                            </div>  
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#ff7619 ;">FECHA:</label>
                        </div>                                                               
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-2">
                            <label for="">Fecha atención:</label>          
                        </div>
                        <div class="col-md-3">                                  
                            <input type="date" class="form-control form-control-sm" id="FechaActual" >
                        </div>
                    </div>
                    <!-- servicio -->
                    <div class="mb-3 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#ff7619 ;">SERVICIOS:</label>
                        </div>                                                               
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-2">
                            <label for="">Servicio:</label>          
                        </div>
                        <div class="col-md-3">                                  
                            <select name="" id="listaServicios" class="form-control form-control-sm">
                                <option value="">Seleccione</option>
                            </select> 
                        </div>
                        <div class="col-md-4">                                  
                            <select name="" id="listaServiciosFiltro" class="form-control form-control-sm">
                                <option value="">Seleccione</option>
                            </select> 
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-sm" id="agregarServicio" type="button"><i class="fa-solid fa-cart-plus fa-2xl" style="color: #f96f12;"></i></button>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-md-12 mb-2">
                            <table class="table table-sm " id="tabla_atenciones_procedimientos">
                                <colgroup>
                                    <col width="10%"> <!-- # -->
                                    <col width="60%"> <!-- titulo -->
                                    <col width="20%"> <!-- precio-->
                                    <col width="10%"> <!-- eliminar-->
                                </colgroup>
                                <thead class="thead-danger">
                                    <tr>
                                        <th>Servicio</th>
                                        <th>id</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Eliminar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="mb-3 row g-2 text-end">
                        <div class="col-md-11">
                            <label for="">SubTotal:</label>          
                        </div>
                        <div class="col-md-1">                                  
                            <input class="form-control form-control-sm bg-light" id="subTotal" type="text" readonly>
                        </div>
                    </div>
                    <div class="mb-3 row g-2 text-end">
                        <div class="col-md-11">
                            <label for="">I.G.V:</label>          
                        </div>
                        <div class="col-md-1">                                  
                            <input class="form-control form-control-sm bg-light" id="IGV" type="text" readonly>
                        </div>
                    </div>
                    <div class="mb-3 row g-2 text-end">
                        <div class="col-md-11">
                            <label for="">Total:</label>          
                        </div>
                        <div class="col-md-1">                                  
                            <input class="form-control form-control-sm bg-light" id="total" type="text" readonly>
                        </div>
                    </div>                          
                    <div class="mb-3 row g-2">
                        <div class="col-md">
                            <div class="d-grid">
                                <button id="agregarAtencion" class="btn btn-danger btn-sm mt-1" type="button">Guardar</button>
                            </div> 
                        </div>
                    </div>                
                </form>  
            </div>
        </div>                 
    </div>
</div>
        