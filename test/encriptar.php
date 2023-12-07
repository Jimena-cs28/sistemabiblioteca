<?php

$claveBase = "73194188";      //Clave ORIGINAL
$claveEncriptada = password_hash($claveBase, PASSWORD_BCRYPT); //

var_dump($claveEncriptada);


?>