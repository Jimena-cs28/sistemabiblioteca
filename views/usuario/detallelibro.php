<?php
session_start();
if (!isset($_SESSION['login']) || !$_SESSION['login']['status']){
    header("Location:../");
 }
?>
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
        <a class="btn btn-outline-dark" href="../../views/usuario/historialuser.php">Historial</a>
        <a class="btn btn-outline-dark" href="../../controller/usuario.controller.php?operacion=destroy">Cerrar sesión</a>
        

    </nav>

    <section class="grid mt-4">
        <div id="infoLibro">
            
        </div>
        <div>
        <form>
        <div class="form-row mt-4">
          <h4>Solicitud de préstamo</h4>
   
    <div class="form-group col-md-6 mt-2">
      <label for="nombres" class="form-label bold">Nombres y Apellidos</label>
      <input type="text" readonly class="form-control" id="nombres" value="<?php echo $_SESSION["login"]["nombres"]?>">
    </div>
  

  <div class="form-group col-md-3 mt-2">
    <label for="fechaprestamo" >Fecha préstamo</label>
    <input type="date" class="form-control" id="fechaprestamo">
  </div>

  <div class="form-group col-md-3 mt-2">
      <label for="">Cantidad</label>
      <input type="number" class="form-control form-control-sm" id="cantidad">
    </div>

  <div class="form-group col-md-3 mt-2">
   <label for="" style="color:#574E4E;">En Biblioteca</label>
   <select class="form-control" required="" data-placement="top" id="enbiblioteca">
    <option value="">Seleccione</option>
    <option value="SI">Sí</option>
    <option value="NO">No</option>
  </select>
  </div>

  <div id="contenedor-lugar" class="form-group col-md-6 mt-2 d-none">
      <label for="lugar" class="form-label bold">Lugar</label>
      <input type="text" class="form-control" id="lugar">
  </div>

  <div class="form-group col-md-6 mt-2">
      <label for="descripcion" class="form-label bold">Descripción</label>
      <input type="text" class="form-control" id="descripcion">
  </div>

  <div class="form-group col-md-6 mt-2">
      <label for="nombrelibro" class="form-label bold">Nombre de libro</label>
      <input type="text" class="form-control" id="nombrelibro" disabled>
    </div>

    <div class="form-group col-md-3 mt-2">
      <label for="">Stock</label>
      <input type="number" class="form-control form-control-sm" id="stock" disabled>
    </div>

    <div class="form-group col-md-3 mt-2">
    <label for="fechadevolucion" >Fecha devolución</label>
    <input type="date" class="form-control" id="fechadevolucion">
  </div>
                      

  <div class="mt-4 mb-4">
  <button type="button" class="btn btn-primary" id="solicitar">Solicitar</button>
  </div>
</form>
  </div>
  </div>
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
          const Solicitar =document.querySelector("#solicitar");
          const urlParams = new URLSearchParams(queryString);
          const idlibro = urlParams.get("idlibro");
          const fordata = new FormData()
          const containerLibro = document.querySelector("#infoLibro")
          const stock = document.querySelector("#stock")
          const nombrelibro = document.querySelector("#nombrelibro")
          const enbiblioteca = document.querySelector("#enbiblioteca")
          const contenedorlugar = document.querySelector("#contenedor-lugar")
          
          fordata.append("operacion", "buscarlibro")
          fordata.append("idlibro", idlibro)
          fetch("../../controller/userlibros.php", {
              method: "POST",
              body: fordata
          }).then(res=>res.json())
          .then(datos=>{
              stock.value = datos.cantidad
              nombrelibro.value = datos.nombre
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
          enbiblioteca.addEventListener("change", function(e){
            const value = e.target.value
            
            if(value == 'NO'){
              console.log(contenedorlugar)
              contenedorlugar.classList.remove("d-none")
            }else {
              contenedorlugar.classList.add("d-none")
            }
          })

          function RegistrarPrestamo(){
            if(confirm("esta seguro de guardar")){
            const parametros = new URLSearchParams();
            parametros.append("operacion", "prestamousuario");
            parametros.append("idlibro", idlibro.value);
            parametros.append("idbeneficiario",documento.querySelector("#nombres").value);
            parametros.append("cantidad", document.querySelector("#dni").value);
            parametros.append("descripcion", document.querySelector("#descripcion").value);
            parametros.append("enbiblioteca", enbiblioteca);
            parametros.append("lugardestino", document.querySelector("#lugar").value);
            parametros.append("fechaprestamo", document.querySelector("#fechaprestamo").value);
            parametros.append("fechadevolucion", document.querySelector("#fechadevolucion").value)
            fetch("../../controller/userlibros.php" ,{
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

          Solicitar.addEventListener("")
      })
    </script>
</body>

</html>