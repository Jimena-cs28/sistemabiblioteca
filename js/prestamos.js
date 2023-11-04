const libro = document.querySelector("#libro");
const btguardar = document.querySelector("#guardar");
const selectcategoria = document.querySelector("#filtrocategoria");
const filtrosubcategoria = document.querySelector("#filtrosubcategoria"); 
const AgregarLibro = document.querySelector("#gudarlibro");     
const tablalibro = document.querySelector("#tablalibros");
const cantidad = document.querySelector("#cantidad");
const cuerpo = document.querySelector("tbody");


const libroAgregados =  new Set();
// input del segundo modal
const tabla2 = document.querySelector("#tabla2");
const Agregarlibro2 = document.querySelector("#Rguardarlibro");
const filtrosub2 = document.querySelector("#Rfiltrosubcategoria");
const cantidad2 = document.querySelector("#Rcantidad");
const fechadevolucion2 =  document.querySelector("#Rfechadevolucion");
const condicionEntrega2 = document.querySelector("#Rcondicionentrega");
const fecharegistar = document.querySelector("#fprestamo");
const fechadevolucion =  new Date(document.querySelector("#fechadevolucion"));

function validarFdevolucion(){
    const file = tablalibro.rows;
    for (let i = 0; i < file.length; i++){
        const fP = new Date(file[i].cells[5].innerText);
        if(fechadevolucion.value >= fP.value){
            agregarLibros();
        }else{
            alert("Debes entregar despues de la fecha prestamo");
        }
    }
}

function agregarLibros(){
    const idlibroSeleccionado = libro.options[libro.selectedIndex];
    const idlibro = idlibroSeleccionado.value;
    const nombreLibro = idlibroSeleccionado.text;
    const fechaPrestamo = fecharegistar.value;
    const fechaDevolucion = fechadevolucion.value;
    //no agregar el libro si las fehas no son validas
    if(libroAgregados.has(idlibro)){
        alert("este libro ya se ah sido agregado");
        return;
    }else{
        let nuevaFila = `
        <tr>
            <td>${idlibro}</td>
            <td>${filtrosubcategoria.value}</td>
            <td>${nombreLibro}</td>
            <td>${cantidad.value}</td>
            <td>${fechadevolucion.value}</td>
            <td>${condicionentrega.value}</td>
            <td>Eliminar</td>
        </tr>  
        `;
        tablalibro.innerHTML += nuevaFila;
        libro.value="";
        filtrosubcategoria.value = "";
        selectcategoria.value = "";
        cantidad.value = "";
        condicionentrega.value = "";
        fechadevolucion.value = "";
    }
    libroAgregados.add(idlibro);
}



function conseguirlibro2(){
    const parametros = new URLSearchParams();
    parametros.append("operacion","conseguirlibro");
    // parametros.append("nombre", libro2.value);

    fetch("../controller/prestamos.php",{
        method: 'POST',
        body: parametros
    })
    .then(response => response.json())
    .then(datos => {
        Libro2.innerHTML = "<option value=''>Seleccione</option>";
        datos.forEach(element => {
            const optionstag =document.querySelector("option");
            optionstag.value = element.idlibro;
            optionstag.text =element.nombre;
            optionstag.dataset.subcategoria = element.subcategoria;
            optionstag.dataset.categoria = element.categoria;
            Libro2.appendChild(optionstag);
        });
    });
}

Libro2.addEventListener("change", () => {
    // console.log(libro.dataset.idlibro);
    const libroselect = Libro2.options[Libro2.selectedIndex];
    document.querySelector("#Rfiltrocategoria").value = libroselect.dataset.categoria;
    filtrosub2.value = libroselect.dataset.subcategoria;
})

function agregarLibros2(){
    const idlibroSeleccionado2 = Libro2.options[Libro2.selectedIndex];
    const idlibro2 = idlibroSeleccionado2.value;
    const nombreLibro2 = idlibroSeleccionado2.text;

    if (libroAgregados.has(idlibro2)) {
        alert("este libro ya se ah sido agregado");
        return;
    }else{
        let nuevaFilas = `
        <tr>
            <td>${idlibro2}</td>
            <td>${filtrosub2.value}</td>
            <td>${nombreLibro2}</td>
            <td>${cantidad2.value}</td>
            <td>${fechadevolucion2.value}</td>
            <td>${condicionEntrega2.value}</td>
            
        </tr>  
        `;
        tabla2.innerHTML += nuevaFilas;
        Libro2.value="";
        document.querySelector("#Rfiltrocategoria").value="";
        filtrosub2.value = "";
        cantidad2.value = "";
        fechadevolucion2.value = "";
        condicionEntrega2.value = "";
    }

    libroAgregados.add(idlibro2);
}

function registrarLibroentregados(){
    const filas = tablalibro.rows;
    if(confirm("¿estas seguro de Guardar?")){
        for (let i = 1; i < filas.length; i++) {
            const idlibros = parseInt(filas[i].cells[0].innerText);
            const cantidadd = parseInt(filas[i].cells[3].innerText);
            const fechas    = String(filas[i].cells[4].innerText);
            const condicionEntre = String(filas[i].cells[5].innerText);
            const parametros = new URLSearchParams();
            parametros.append("operacion","registrarLibroentregado");
            parametros.append("idprestamo", idprestamo);
            parametros.append("idlibro", idlibros);
            parametros.append("cantidad", cantidadd);
            parametros.append("condicionentrega", condicionEntre);
            parametros.append("fechadevolucion", fechas);

            fetch("../controller/prestamos.php",{
                method:'POST',
                body: parametros
            })
            .then(respuesta => respuesta.json())
            .then(datos => {
                // console.log(datos);
                if(datos.status){
                    alert("Prestamo guardados correctamente")
                    document.querySelector("#modal-registrarlibro").reset();
                    tablalibro.reset();
                }
            })
        }
    }
}

function registrarlibroentregadoReserva(){
    const fila = tabla2.rows;
    for (let i = 1; i < fila.length; i++) {
        const idlibros  = parseInt(fila[i].cells[0].innerText);
        const cantidadd = parseInt(fila[i].cells[3].innerText);
        const fecha     = String(fila[i].cells[4].innerText);
        const condicionEntre = String(fila[i].cells[5].innerText);
        const parametros = new URLSearchParams();
        parametros.append("operacion","registrarlibroentregadoReserva");
        parametros.append("idprestamo", idprestamo);
        parametros.append("idlibro", idlibros);
        parametros.append("cantidad", cantidadd);
        parametros.append("condicionentrega", condicionEntre);
        parametros.append("fechadevolucion", fecha);
        fetch("../controller/prestamos.php" ,{
            method:'POST',
            body: parametros
        })
        .then(respuesta => respuesta.json())
        .then(datos => {
            // console.log(datos);
            if(datos.status){
                alert("Prestamo guardados correctamente")
                document.querySelector("#modal-registrarlibro").reset();
                tabla2.reset();
            }
        })
    }
}


libro.addEventListener("change" , () => {
    const libroSeleccionado = libro.options[libro.selectedIndex];
    filtrosubcategoria.value = libroSeleccionado.dataset.subcategoria;
    selectcategoria.value = libroSeleccionado.dataset.categoria;
});

Agregarlibro2.addEventListener("click", agregarLibros2);

AgregarLibro.addEventListener("click", validarFdevolucion);


conseguirlibro();
conseguirlibro2();