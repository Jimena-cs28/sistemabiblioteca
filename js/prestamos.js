
    const btAutor = document.querySelector("#btAutor");
    const cuerpoAutor = document.querySelector("tbody")
    // const tablaAutore = document.querySelector("#tablaAutores");
    
    const tablaAutore = new DataTable('#tablaAutores', {        
        dom: 'Bfrtip',
        buttons: [
        ],
        language: {
            url:'../js/Spanish.json'
        },
        "order": [[0,"desc"]],
        "columnDefs" : [
            {
                visible : true,
                searchable : true,
                serverSide : true,
                pageLength: 10
            }
        ]
    });

    function listadoAutor(){
        const parametros = new URLSearchParams();
        parametros.append("operacion","selectAutores");

        fetch("../controller/libros.php",{
            method: 'POST',
            body: parametros
        })
        .then(response => response.json())
        .then(datos => {
            tablaAutore.clear();
            datos.forEach(element => {

                tablaAutore.row.add([
                    element.idautor,
                    element.autor,
                    element.apellidos, 
                    element.pseudonimio,
                    element.nacionalidad
                ]);
            });
            tablaAutore.draw();
        })
    }

    function RegisterAutor(){
        const promesasA = [];
        const parametros = new URLSearchParams();
        parametros.append("operacion","registrarAutor");
        parametros.append("nombres", document.querySelector("#nombre").value);
        parametros.append("apellidos", document.querySelector("#apellidos").value);
        parametros.append("seudonimio", document.querySelector("#seudonimio").value);
        parametros.append("nacionalidad",document.querySelector("#nacion").value );

        const fetchPromiseA = fetch("../controller/usuario.controller.php", {
            method: 'POST',
            body: parametros
        })
        .then(response => {
            if (response.ok) {
                document.querySelector("#form-autor").reset();
                listadoAutor();
            }else{
                console.log("error");
            }
        })
        .catch(error => {
            // Manejar errores de red aquí
            console.error(`Error de red al registrar el detalle`, error);
        });
        promesasA.push(fetchPromiseA);
    }

    listadoAutor();
    btAutor.addEventListener("click", RegisterAutor);
