<?php
include_once("datos-conexion.php");
global $username, $password;

function subirImagen()
{
    $resultado = null;
    if (isset($_FILES["img"]) && $_FILES["img"]["error"] == 0) {
        $name = $_FILES["img"]["name"];
        $tmp_name = $_FILES["img"]["tmp_name"];
        $type = $_FILES["img"]["type"];

        if (!file_exists("img/" . $name)) {
            if ($type == "image/jpg" || $type == "image/png" || $type == "image/jpeg" || $type == "image/gif") {
                if (move_uploaded_file($tmp_name, "img/" . $name)) {
                    $resultado = $name;
                } else {
                    echo "La imagen no pudo ser subida";
                }
            } else {
                echo "Imagen no permitida";
            }
        }
    }
    return $resultado;
}

try {
    // Parámetros de los pokemons del formulario
    $id = $_POST["id"];
    $nombre = $_POST["nombre"];
    $numero = $_POST["numero"];
    $primer_tipo = $_POST["primer_tipo"];
    $segundo_tipo = $_POST["segundo_tipo"];
    $descripcion = $_POST["descripcion"];

    $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $imagen = subirImagen();

    if (isset($_POST["actualizar"])) {
        if ($imagen === null) {

            $stmt = $conexion->prepare("SELECT imagen FROM pokemon WHERE id=:id");
            $stmt->execute(array(":id" => $id));
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $imagen = $row["imagen"];
        }

        // Actualizar los datos del pokemon
        $stmt = $conexion->prepare("UPDATE pokemon SET nombre=:nombre, numero=:numero, primer_tipo=:primer_tipo,
            segundo_tipo=:segundo_tipo, imagen=:imagen, descripcion=:descripcion WHERE id=:id");
        $stmt->execute(array(":id" => $id, ":nombre" => $nombre, ":numero" => $numero, ":primer_tipo" => $primer_tipo,
            ":segundo_tipo" => $segundo_tipo, ":imagen" => $imagen, ":descripcion" => $descripcion));
    } elseif (isset($_POST["agregar"])) {
        if ($imagen === null) {
            header("Location: formulario-pokemon.php?error=No se subió ninguna imagen");
            exit();
        }

        // Agregar un nuevo pokemon a la base de datos
        $stmt = $conexion->prepare("INSERT INTO pokemon(nombre, numero, primer_tipo, segundo_tipo, imagen, descripcion)
            VALUES (:nombre, :numero, :primer_tipo, :segundo_tipo, :imagen, :descripcion)");
        $stmt->execute(array(":nombre" => $nombre, ":numero" => $numero, ":primer_tipo" => $primer_tipo,
            ":segundo_tipo" => $segundo_tipo, ":imagen" => $imagen, ":descripcion" => $descripcion));
    }

} catch (Exception $e) {
    die("Error de conexión: " . $e->getMessage());
} finally {
    $conexion = null;
}

// Al finalizar, independientemente de lo que suceda, volverá al index
header("location:index.php");
exit();
?>