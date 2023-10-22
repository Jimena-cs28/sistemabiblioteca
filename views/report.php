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
        