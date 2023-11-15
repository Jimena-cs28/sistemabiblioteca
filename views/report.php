<div class="container-fluid" style="margin: 50px 0;">
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-3">
            <img src="../img/chart.png" alt="clock" class="img-responsive center-box" style="max-width: 110px;">
        </div>
        <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
            Bienvenido a esta sección, aquí se muestran los reportes que se pueden sacar por mes año o lo que usted desea y tambien se podra imprimir
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between mb-9">
                    
                </div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-1">
                            <h5 class="card-title fw-semibold font-weight-bold text-primary">Reportes :</h5>
                        </div>
                        <div class="col-md-4">
                            <select name="" id="descripcion" class=" form-control">
                            </select>
                        </div>
                        <div class="col-md-7">
                            <button class="btn btn-info">Exportar PDF</button>
                        </div>
    
                    </div>

                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Categoria</th>
                                    <th>Sub Categoria</th>
                                    <th>Libro</th>
                                    <th>Cantidad</th>
                                    <th>Estudiante</th>
                                    <th>Descripcion</th>
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
</div>
<div id="customAlert" class="custom-alert"></div>
<style>
        .fechaEnTabla {
            /* Estilo predeterminado para las fechas */
            color: black;
        }
        .fechaPasada {
            /* Estilo para las fechas que son mayores que la fecha actual */
            color: red;
        }
    </style>
<!-- <tr id="fechaEnTabla">2023-11-18</tr> -->
<table>
    <tr>
        <td class="fechaEnTabla">2023-10-1</td>
        <td class="fechaEnTabla">2023-11-19</td>
        <td class="fechaEnTabla">2023-11-1</td>
    </tr>
</table>

<script>
        // Obtén la fecha actual
        var fechaActual = new Date();

        // Supongamos que obtienes la fecha de la tabla del elemento con id "fechaEnTabla"
        var fechaEnTabla = document.querySelectorAll('.fechaEnTabla');

        // Convierte la cadena de fecha en un objeto Date
        //var fechaTabla = new Date(fechaEnTablaString);

        fechaEnTabla.forEach(function (fechaElement) {
            var fechaEnTablaString = fechaElement.innerText;
            var fechaTabla = new Date(fechaEnTablaString);

            // Compara las fechas
            if (fechaActual < fechaTabla) {
                fechaElement.classList.add('fechaPasada');
                // Muestra la alerta personalizada
                showCustomAlert('La fecha en la tabla es mayor que la fecha actual.');

                // Establece un temporizador para ocultar la alerta después de 3 segundos
                setTimeout(function() {
                    hideCustomAlert();
                }, 3000);
            } else {
               // showCustomAlert('La fecha en la tabla no es mayor que la fecha actual.');
            }
        })

    function showCustomAlert(message) {
        var customAlert = document.getElementById('customAlert');
        customAlert.innerText = message;
        customAlert.style.display = 'block';
    }

    function hideCustomAlert() {
        var customAlert = document.getElementById('customAlert');
        customAlert.style.display = 'none';
    }

    const descripcion = document.querySelector("#descripcion");
    const tabla = document.querySelector("tbody");

    function listarDescripcion(){
        const choiselistarStudent = new Choices(descripcion, {
            searchEnabled: true,
            itemSelectText: '',
            allowHTML:true
        });
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectGrado");

        fetch("../controller/librosentregados.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            // console.log(datos);
            descripcion.innerHTML = "<option value=''>Seleccione</option>";
            datos.forEach(element => {
                let select = `
                    <option value='${element.descripcion}'>${element.descripcion}</option> 
                `;
                descripcion.innerHTML +=select;
            });
            choiselistarStudent.setChoices([], 'value','label',true);
            choiselistarStudent.setChoices(datos, 'descripcion','descripcion', true);
        })
    }

    function listarprestamo(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","tablareporte")
        parametros.append("descripcion", descripcion.value);
        
        fetch("../controller/librosentregados.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            tabla.innerHTML = ``;
            datos.forEach(element => {
                const pres = `
                <tr>
                    <td>${element.idlibroentregado}</td>
                    <td>${element.categoria}</td>
                    <td>${element.subcategoria}</td>
                    <td>${element.libro}</td>
                    <td>${element.cantidad}</td>
                    <td>${element.nombres}</td>
                    <td>${element.descripcion}</td>
                </tr>
                `;
                tabla.innerHTML += pres;
            });
        })
    }
    listarprestamo();
    descripcion.addEventListener("change", listarprestamo);

    listarDescripcion();
</script>
