<?php
    session_name("usuario");
    session_id("12345");
    session_start();

    if(!isset($_SESSION["nombre"])){
        header("location:../inicio.php");
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Avatar</title>
</head>
<body>
        <nav>
            <a href='./add_img_casa.php'>Casa</a>
            <a href='./galeria.php'>Galería</a>
            <a href=''>Avatar</a>
            <form action='./cerrar_sesion.php' method='post'>
                <button type='submit'>Cerrar sesión</button>
            </form>
        </nav>
        <hr>
    <h1>Tu avatar</h1>
</body>
</html>