<?php
    include_once("datos-conexion.php");
    global $username, $password;

    if(isset($_GET["idPokemon"])) {//verifica que se haya presionado el boton borrar del index en dicho caso borra el pokemon de la bd
        try {
            $idPokemon = $_GET["idPokemon"];

            $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);

            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


            $stmt = $conexion->prepare("SELECT imagen FROM pokemon WHERE id=:id");
            $stmt->execute(array(":id"=>$idPokemon));
            $pokemon = $stmt->fetch(PDO::FETCH_ASSOC);
            $imagen = $pokemon["imagen"];


            $stmt = $conexion->prepare("DELETE FROM pokemon WHERE id=:id");
            $stmt->execute(array(":id"=>$idPokemon));


            if (file_exists("img/" . $imagen)) {
                unlink("img/" . $imagen);
            }

        }catch(Exception $e) {
            die("Error de conexión: " . $e->getMessage());
        }finally {
            $conexion = null;
        }
    }

    //vuelve al index al finalizar 
    header("location: index.php");
    exit();
?>