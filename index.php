<!DOCTYPE html>
<html lang="es">
<head>
  <title>Inicio de sesión</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="Shortcut Icon" type="image/x-icon" href="assets/icons/book.ico" /> -->
  <link rel="stylesheet" href="./views/css/login.css">
</head>
<body class="full-cover-background">
  <div class="form-container">
    <p class="text-center" style="margin-top: 17px;">
      <i class="zmdi zmdi-account-circle zmdi-hc-5x"></i>
    </p>
    <h4 class="text-center all-tittles" style="margin-bottom: 30px;">inicia sesión con tu cuenta</h4>
    <form>
      <div class="group-material-login">
        <input type="text" class="material-login-control" required="" maxlength="70" name="nombreuser" id="nombreusuario">
        <span class="highlight-login"></span>
        <span class="bar-login"></span>
        <label for="nombreusuario"><i class="zmdi zmdi-account"></i> &nbsp; Nombres</label>
      </div><br>
      <div class="group-material-login">
        <input type="password" class="material-login-control" name="clave" required="" maxlength="70" id="claveacceso">
        <span class="highlight-login"></span>
        <span class="bar-login"></span>
        <label for="claveacceso"><i class="zmdi zmdi-lock"></i> &nbsp; Contraseña</label>
      </div>
      <input class="btn-login" type="button" id="iniciar" name="login" value="Ingresar al sistema →"/>
    </form>
  </div>  
  <!-- <script src="./js/login.js"></script> -->
  <script>
    document.addEventListener("DOMContentLoaded", () => {
    const botonIniciarSesion = document.querySelector("#iniciar");
    const textPassword = document.querySelector("#claveacceso");

    function validarDatos() {
      const usuario = document.querySelector("#nombreusuario");
      const claveaccceso = document.querySelector("#claveacceso");

      const parametros = new URLSearchParams();
      parametros.append("operacion", "login")
      parametros.append("nombreusuario", usuario.value)
      parametros.append("claveIngresada", claveaccceso.value)
      fetch(`./controller/usuario.controller.php`, {
        method: 'POST',
        body: parametros
      })
      .then(respuesta => respuesta.json())
      .then(datos => {
        if (!datos.status){
          alert(datos.mensaje);
          usuario.focus();
        } else {
          window.location.href = './views/index.php?view=dashboard.php';
          if (datos.nombrerol==="Administrador"){
            window.location.href = './views/index.php?view=dashboard.php';
          } else {
            window.location.href = './views/usuario/user.php'
          }
        }
      })
      .catch(error => {
        console.log(error);
      })
    }

      textPassword.addEventListener("keypress", (evt) => {
        if(evt.charCode == 13) validarDatos();
      });
      
      botonIniciarSesion.addEventListener("click", validarDatos);
    });
  </script>
</body>
</html>