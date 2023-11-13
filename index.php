<!DOCTYPE html>
<html lang="es">
<head>
  <title>Inicio de sesión</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <link rel="Shortcut Icon" type="image/x-icon" href="assets/icons/book.ico" /> -->
  <!-- <link rel="stylesheet" href="./views/css/login.css"> -->
      <!-- Custom fonts for this template-->
    <!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="./views/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="full-cover-background">
  <div class="container">
        <!-- Outer Row -->
      <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
          <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Bienvenido!</h1>
                            </div>
                            <form class="user">
                                <div class="form-group">
                                  <input type="email" class="form-control form-control-user" id="nombreusuario" placeholder="Escriba su user">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user" id="claveacceso" placeholder="Contraseña">
                                </div>
                                <button id="iniciar" class="btn btn-primary btn-user btn-block">
                                    Login
                                </button>
                                <!-- 
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Login with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                </a> -->
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="" href="register.html">Create an Account!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          </div>

        </div>

      </div>

    </div>
    
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./js/sb-admin-2.min.js"></script>
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