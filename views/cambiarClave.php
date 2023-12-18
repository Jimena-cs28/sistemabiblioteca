<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>    
    <div class="container">
            <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                            <div class="col-lg-6 d-none d-lg-block" style="background-image: url('/img/logo2.png');"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">CAMBIAR CONTRASEÑA</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group mt-3">
                                            <input type=""  placeholder="Escriba su usuario" class="form-control form-control-user" id="exampleInputEmail">
                                        </div>
                                        <div class="form-group mt-3">
                                            <!-- <input type="password" class="form-control form-control-user" id="claveacceso" placeholder="Contraseña"> -->
                                            <input type="email" class="form-control form-control-user" id="passwordInput" placeholder="Contraseña">
                                        </div>
                                        <button id="init" class="btn btn-primary btn-user btn-block mt-3">
                                            Cambiar
                                        </button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="" href="../index.php">Iniciar Sesion</a>
                                    </div>
                                    <!-- <div class="text-center">
                                        <a class="" href="register.html">Create an Account!</a>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../js/sweetalert.js"></script>
    <script>
        const btiniciar = document.querySelector("#init");
        function NewClave(){
            mostrarPregunta("CONTRASEÑA", "¿Estas seguro de cambiar la clave").then((result)=>{
                if(result.isConfirmed){
                    const fd = new URLSearchParams();
                    fd.append("operacion","nuevaclave");
                    fd.append("usuario",document.querySelector("#exampleInputEmail").value);
                    fd.append("clave",document.querySelector("#passwordInput").value);
                    
                    fetch("../controller/usuario.controller.php",{
                        method: "POST",
                        body: fd
                    })
                    .then(response => response.json())
                    .then(datos => {
                        if(datos.status){
                            toast("Excelente")
                            document.querySelector("#exampleInputEmail").value = ''
                            document.querySelector("#passwordInput").value = ''
                        }else{
                            toastError("Vuelva a Intertarlo");
                        }
                    });
                }
            })
        }

        btiniciar.addEventListener("click", NewClave);
    </script>
</body>
</html>