<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Casa</title>
</head>
<body>
    <?php

        function iniciado($usuario, $casa){
            switch ($casa){
                case 1:
                    $casa = "Halcones"; // ¡¡¡¡¡¡Que loco que guarde una cadena y antes un entero!!!!
                    break;
                case 2:
                    $casa = "Teporingos";
                    break;
                case 3:
                    $casa = "Vaquitas marinas";
                    break;
                case 4:
                    $casa = "Ajolotes";
                    break;
            }
            echo "
                    <nav>
                        <a href=''>Casa</a>
                        <a href='./galeria.php'>Galería</a>
                        <a href='./avatar.php'>Avatar</a>
                        <form action='./cerrar_sesion.php' method='post'>
                            <button type='submit'>Cerrar sesión</button>
                        </form>
                    </nav>
                    <hr>
                ";
            echo "<br><h1>$usuario, bienvenida a tu casa de $casa.</h1><br><br>";
            echo "
                <h2>Agregar parte de la casa</h2>
                <form action='./add_img_casa.php' method='post' enctype='multipart/form-data'>
                    <label for='posicion'>Posición</label>
                    <select name='posicion' id='posicion'>
                        <option value='DORMITORIO'>Dormitorio</option>
                        <option value='CHIMENEA'>Chimenea</option>
                        <option value='HABITACION'>Habitación $casa</option>
                        <option value='ELEMENTO'>Elemento $casa</option>
                    </select>
                    <label for='nombre'>Nombre de la imagen:</label>
                    <input type='text' name='nombre_img' id='nombre_img' required>
                    <br><br>
                    <label for='img'>Imagen</label>
                    <input type='file' name='img' id='img'>
                    <br><br>
                    <button type='submit'>Agregar</button>
                    <button type='reset'>Borrar</button>
                </form>
            ";
            
        }


        include("./config.php");
        $conexion = connect();
        session_name("usuario");
        session_id("12345");
        session_start();

        $user = (isset($_POST["nombre"]) && $_POST["nombre"] != "") ? $_POST["nombre"] : false;
        
        /*------------------------------Verificar el usuario------------------------------------*/
        if($user != false){

            $peticion = "SELECT nombre FROM usuario WHERE nombre='$user'";
            $query = mysqli_query($conexion, $peticion); //Mandar petición
            $match = mysqli_fetch_array($query, MYSQLI_ASSOC); //Recibir petición

            $peticion1 = "SELECT ID_CASA FROM usuario WHERE nombre='$user'";
            $query = mysqli_query($conexion, $peticion1);
            $match2 = mysqli_fetch_array($query, MYSQLI_ASSOC);

            if($match != NULL && $match["nombre"] == $user && $match2 != NULL){
                $_SESSION["nombre"] = $user;
                $_SESSION["ID_CASA_USER"] = $match2["ID_CASA"];
                echo $_SESSION["ID_CASA_USER"];
                iniciado($_SESSION["nombre"], $_SESSION["ID_CASA_USER"]);
            } else {
                $_SESSION["name_not_found"] = false;
                header("location:../inicio.php");
            }

        } elseif(isset($_SESSION["nombre"])){ //Si regresa a inicio e inicio redirecciona aquí, pero ya no hay variables $_POST, se mestra la que se guardó en la variable de sessión.

            iniciado($_SESSION["nombre"], $_SESSION["ID_CASA_USER"]);

        } else { //Redirecciona a la principal si intenta meter la dirección de este archivo
            header("location:../inicio.php");
        }
        

        /*-------------------------------------Recibir imagen y mostrarla---------------------------------------- */
        $i = 0;
        if(isset($_FILES["img"])){
            $posicion = (isset($_POST["posicion"]) && $_POST["posicion"] != "") ? $_POST["posicion"] : false;
            $nombre_img = (isset($_POST["nombre_img"]) && $_POST["nombre_img"] != "") ? $_POST["nombre_img"] : false;
            $ext = pathinfo($_FILES["img"]["name"], PATHINFO_EXTENSION);
            $rout = "../statics/".$nombre_img."_$posicion.".$ext;
            rename($_FILES["img"]["tmp_name"], $rout);
            // var_dump($_FILES["img"]);
            $peticion1 = "INSERT INTO HABITACION_CASA (POSICION, IMG_HABITACION_RUTA) VALUES ('$posicion', '$rout')";
            $query1 = mysqli_query($conexion, $peticion1);

            $peticion2 = "SELECT ID_HABITACION_CASA FROM HABITACION_CASA WHERE IMG_HABITACION_RUTA='$rout'";
            $query2 = mysqli_query($conexion, $peticion2);
            $id_hab = mysqli_fetch_array($query2, MYSQLI_ASSOC);

            $peticion3 = "INSERT INTO CASA_HAS_HABITACION (ID_CASA, ID_HABITACION) VALUES ('".$_SESSION['ID_CASA_USER']."', '".$id_hab['ID_HABITACION_CASA']."')";
            $query3 = mysqli_query($conexion, $peticion3);
        }

        /*-----------------------------------------------------Mostrar casa si hay imagenes guardadas-----------------------------------------------------------*/
        //  Para ver el numero de archivos en carpeta ya no abrimos y leemos sino vemos lo guardado en la base de datos.
        $peticion = "SELECT COUNT(ID_CASA_HAS_HABITACION) FROM CASA_HAS_HABITACION WHERE ID_CASA=". $_SESSION["ID_CASA_USER"];
        $query = mysqli_query($conexion, $peticion);
        $num_imgs_casa_actual = mysqli_fetch_array($query, MYSQLI_ASSOC); // Es un arreglo asociativo cuyo índice es  ["COUNT(ID_CASA_HAS_HABITACION)"]=> string(1) "0" 

        if($num_imgs_casa_actual["COUNT(ID_CASA_HAS_HABITACION)"] > 0){ //  Es interesante que aunque sea una string puede comparar como si fuera un número ya que no manda error o warning.
            $peticion = "SELECT ID_CASA, POSICION, IMG_HABITACION_RUTA FROM CASA_HAS_HABITACION
                        INNER JOIN HABITACION_CASA
                        ON CASA_HAS_HABITACION.ID_HABITACION=HABITACION_CASA.ID_HABITACION_CASA
                        WHERE ID_CASA=".$_SESSION['ID_CASA_USER'];
            $query = mysqli_query($conexion, $peticion);

            $img_rout_position = [
                "DORMITORIO" => "",
                "CHIMENEA" => "",
                "HABITACION" => "",
                "ELEMENTO" => "",
            ];

            while($row=mysqli_fetch_array($query, MYSQLI_ASSOC)){
                switch ($row["POSICION"]){
                    case "DORMITORIO":
                        $img_rout_position["DORMITORIO"] = $row["IMG_HABITACION_RUTA"];
                        break;
                    case "CHIMENEA":
                        $img_rout_position["CHIMENEA"] = $row["IMG_HABITACION_RUTA"];
                        break;
                    case "HABITACION":
                        $img_rout_position["HABITACION"] = $row["IMG_HABITACION_RUTA"];
                        break;
                    case "ELEMENTO":
                        $img_rout_position["ELEMENTO"] = $row["IMG_HABITACION_RUTA"];
                        break;
                }
                
            }
            echo "
                <h2>Casa </h2>
                <table cellpadding='5px' border=1 align='center'>
                    <tbody>
                        <tr>
                            <th colspan='2'><img src='".$img_rout_position["DORMITORIO"]."' width='150'></th>
                            <th colspan='2'><img src='".$img_rout_position["CHIMENEA"]."' width='150'></th>
                        </tr>
                        <tr>
                            <th rowspan='2' colspan='2'><img src='".$img_rout_position["HABITACION"]."' width='150'></th>
                            <th colspan='2'><img src='".$img_rout_position["ELEMENTO"]."' width='150'></th>
                        </tr>
                        <tr>
                            <th><img src='".$img_rout_position["ELEMENTO"]."' width='150'></th>
                            <th><img src='".$img_rout_position["ELEMENTO"]."' width='150'></th>
                        </tr>
                    </tbody>
                </table>
            ";
        } else {
            echo "Guarda una imagen";
        }
    ?>
    
</body>
</html>