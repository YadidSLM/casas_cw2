<?php
    session_name("usuario");
    session_id("12345");
    session_start();

    if(isset($_SESSION["nombre"])){
        header("location:./dynamics/add_img_casa.php");
    } elseif(isset($_SESSION["name_not_found"])){
        echo "Nombre ingresado no registrado.";
        session_unset();
        session_destroy();
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicia sesión</title>
</head>
<body>
    <nav>
        <br>
        <a href="">Iniciar sesión</a>
        <a href="./templetes/registrar.php">Registrar</a>
        <br><br>
    </nav>
    <hr>
    <aside>¡Modifica tu casa! Y viste a tu avatar con lo ¡mejor!</aside>
    <form action="./dynamics/add_img_casa.php" method="post">
        <label for="nombre"><h2>Usuario</h2></label>
        <input type="text" name="nombre" id="nombre" required>
        <br><br>
        <button type="submit">Iniciar sesión</button>
        <button type="reset">Borrar</button>
        <br><br>
        <a href="./templetes/registrar.php">Registrar</a>
        <br><br>
    </form>
</body>
</html>