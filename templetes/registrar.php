<?php
    session_name("usuario");
    session_id("12345");
    session_start();
    if(isset($_SESSION["nombre"])){
        header("location:../dynamics/add_img_casa.php");
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Casa halcones</title>
</head>
<body>
    <nav>
        <br>
        <a href="../inicio.php">Iniciar sesión</a>
        <a href="">Registrar</a>
        <br><br>
    </nav>
    <hr>
    <form action="../dynamics/registro.php" method="post">
        <legend><h2>Registro</h2></legend>
        <label for="nombre">Nombre</label>
        <input type="text" name="nombre" required>
        <br><br>
        <label for="apodo">Apodo</label>
        <input type="text" name="apodo" required>
        <br><br>
        <label for="casa">Casa</label>
        <select name="casa" id="casa">
            <option value="halcones">Halcón</option>
            <option value="teporingos">Teporingos</option>
            <option value="ajolotes">Ajolote</option>
            <option value="vaquitas">Vaquitas marinas</option>
        </select>
        <br><br>
        <button type="submit">Registrar</button>
        <button type="reset">Borrar</button>
    </form>
    <aside>Regístrate para unirte a una casa ¡Ya!</aside>

</body>
</html>