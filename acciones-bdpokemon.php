<?php
    include_once("datos-conexion.php");
    global $username, $password;
    
    try{
        //parametros de los pokemons del formulario
        $id = $_POST["id"];
        $nombre = $_POST["nombre"];
        $numero = $_POST["numero"];
        $primer_tipo = $_POST["primer_tipo"];
        $segundo_tipo = $_POST["segundo_tipo"];
        $imagen = $_POST["imagen"];
        $descripcion = $_POST["descripcion"];

        $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);

        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if(isset($_POST["actualizar"])) { //actualiza los datos del pokemon, menos el id
            $stmt = $conexion->prepare("UPDATE pokemon SET nombre=:nombre, numero=:numero, primer_tipo=:primer_tipo, 
            segundo_tipo=:segundo_tipo, imagen=:imagen, descripcion=:descripcion WHERE id=:id");
            $stmt->execute(array("id"=>$id, ":nombre"=>$nombre, ":numero"=>$numero, ":primer_tipo"=>$primer_tipo, 
            ":segundo_tipo"=>$segundo_tipo, ":imagen"=>$imagen, ":descripcion"=>$descripcion));   
        }elseif(isset($_POST["agregar"])) {//agregar un nuevo pokemon a la bd pokedex
            $stmt = $conexion->prepare("INSERT INTO pokemon(nombre, numero, primer_tipo, segundo_tipo, imagen, descripcion) 
            VALUES (:nombre, :numero, :primer_tipo, :segundo_tipo, :imagen, :descripcion)");
            $stmt->execute(array(":nombre"=>$nombre, ":numero"=>$numero, ":primer_tipo"=>$primer_tipo, ":segundo_tipo"=>$segundo_tipo,
            ":imagen"=>$imagen, ":descripcion"=>$descripcion));
        }

    }catch(Exception $e) { 
        die("Error de conexión: " . $e->getMessage());
    }finally {
        $conexion = null;
    }

    //al finalizar independiente de lo que suceda volvera al index
    header("location:index.php");
    exit();
?>