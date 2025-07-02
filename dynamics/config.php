<?php

define("DBHOST", "localhost");
define("DBUSER", "root");
define("PASSWORD", "");
define("DB", "casa_halcones_cw2");

function connect(){
    $conexion = mysqli_connect(DBHOST, DBUSER, PASSWORD, DB);
    if(!$conexion){
        mysqli_error();
        echo "No se pudo conectar a la base de datos";
    }
    return $conexion;
}



?>