<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro a casa halcones</title>
</head>
<body>
<?php
    include("./config.php");
    $conexion = connect();

    $nombre = (isset($_POST["nombre"]) && $_POST["nombre"] != "") ? $_POST["nombre"] : "No se ingresa valor";
    $apodo = (isset($_POST["apodo"]) && $_POST["apodo"] != "") ? $_POST["apodo"] : "No se ingresa valor";
    $casa = (isset($_POST["casa"]) && $_POST["casa"] != "") ? $_POST["casa"] : "No se ingresa valor";

    $casas = [
        "halcones" => 1,
        "teporingos" => 2,
        "vaquitas" => 3,
        "ajolotes" => 4,
    ];

    $peticion = "INSERT INTO USUARIO (NOMBRE,APODO,ID_CASA) VALUES ('$nombre','$apodo',".$casas[$casa].")";
    //Petición
    $query = mysqli_query($conexion, $peticion);
    header("location:../inicio.php");
?>
</body>
</html>