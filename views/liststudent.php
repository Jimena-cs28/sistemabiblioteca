    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">LISTADO DE ESTUDIANTES</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>DNI</th>
                            <th>Telefono</th>
                            <th>Email</th>
                            <th>Direccion</th>
                            <th>nombreusuario</th>
                            <th>claveacceso</th>
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
            
            function listarEsetudiante(){
                const parametros = new URLSearchParams();
                parametros.append("operacion","listarestudiantes")

                fetch("../controller/estudiantes.php", {
                    method: 'POST',
                    body: parametros
                })
                .then(response => response.json())
                .then(datos => {
                    cuerpo.innerHTML = ``;
                    datos.forEach(element => {
                        const estu = `
                        <tr>
                            <td>${element.idusuario}</td>
                            <td>${element.nombres}</td>
                            <td>${element.apellidos}</td>
                            <td>${element.nrodocumento}</td>
                            <td>${element.telefono}</td>
                            <td>${element.email}</td>
                            <td>${element.direccion}</td>
                            <td>${element.nombreusuario}</td>
                            <td>${element.claveacceso}</td>
                        </tr>
                        `;
                        cuerpo.innerHTML += estu;
                    });
                })
            }

            listarEsetudiante();
    </script>