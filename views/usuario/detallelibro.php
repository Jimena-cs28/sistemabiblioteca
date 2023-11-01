<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalle</title>
    <link rel="stylesheet" href="">
    

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/user.css">
    <link rel="stylesheet" href="../css/detalle.libro.css">
</head>

<body>
    <style>
        #p{
            margin-top: 65px;
        }
        .img1{
            margin-left: 70%;
        }
        .grid{
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            padding: 1fr;
        }
    </style>

    <nav>
      <a href="./user.php"><img class="img" src="../../img/logo2.png" alt="logo"></a>
        
        <h6>"Una santanina, una señorita de éxito"</h6>
        <a class="btn btn-outline-dark" href="">Historial</a>
        <a class="btn btn-outline-dark" href="./index.php">Cerrar sesión</a>

    </nav>

    <section class="grid mt-4">
        <div id="infoLibro">
            
        </div>
        <div>
        <form>
  <div class="form-row mt-4">
    <div class="form-group col-md-6">
      <label for="apellidos" class="form-label bold">Apellidos:</label>
      <input type="text" class="form-control form-control-sm" id="apellidos">
    </div>
    <div class="form-group col-md-6 mt-2">
      <label for="nombres" class="form-label bold">Nombres:</label>
      <input type="text" class="form-control form-control-sm" id="nombres">
    </div>
  </div>
  <div class="form-group col-md-6 mt-2">
    <label for="nrodocumento" class="form-label color-dark">N° Documento: </label>
    <input type="text" class="form-control form-control-sm" id="nrodocumento" maxlength="8">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6 mt-2">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity">
    </div>
    <div class="form-group col-md-6 mt-4">
      <label for="inputState">Tipo de documento</label>
      <select id="inputState" class="form-control">
        <option selected>DNI</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <div class="mt-2 mb-4">
  <button type="submit" class="btn btn-primary">Solicitar</button>
  </div>
</form>
    </div>
    </section>
    
    <footer id="foot">
        <div class="contenedor-footer">
            <div class="content-footer">
                <h4>Ubicación</h4>
                <p>Av. Alfonso Ugarte s/n</p>
            </div>
            <div class="content-footer">
                <h4>Facebook</h4>
                <p>I.E. Santa Ana Chincha Oficial</p>
            </div>
            <div class="content-footer">
                <h4>Email</h4>
                <p>iesantaanachincha@gmail.com</p>
            </div>
            <div class="content-footer">
                <h4>Teléfono</h4>
                <p>261941</p>
            </div>
        </div>
    </footer>

    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const idlibro = urlParams.get("idlibro");
            const fordata = new FormData()
            const containerLibro = document.querySelector("#infoLibro")
            
            fordata.append("operacion", "buscarlibro")
            fordata.append("idlibro", idlibro)
            fetch("../../controller/userlibros.php", {
                method: "POST",
                body: fordata
            }).then(res=>res.json())
            .then(datos=>{
                console.log(datos)
                containerLibro.innerHTML = `
                <ul>
                <div class="titulo">Descripción:</div>
                <li class="descripcion"">Nombre de libro: ${datos.nombre}</li>
                <li style="margin-left: 60px;">Autor: ${datos.autor}</li>
                <li style="margin-left: 60px;">Editorial: ${datos.editorial}</li>
                <li style="margin-left: 60px;">Categoría: ${datos.categoria}</li>
                <li style="margin-left: 60px;">Subcategoría: ${datos.subcategoria}</li>
                <li style="margin-left: 60px;">N° de páginas: ${datos.numeropaginas}</li>
                </ul>
                `
            })
            
        })
    </script>

</body>

</html>