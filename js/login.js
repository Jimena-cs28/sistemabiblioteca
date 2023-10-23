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
          window.location.href = './views/index.php';
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