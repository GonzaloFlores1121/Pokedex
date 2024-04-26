<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
</head>
<body>
    <header>
        
        <h1><img src="img/Poke_Ball.png" alt="logo" width="27px" height="27px">   POKEDEX</h1>
    </header>
    <section>
        <?php
            include_once("datos-conexion.php");
            global $username, $password;
            $idPokemon = 12;

            try {
                $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);
                $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            }catch(Exception $e) {
                die("Error de conexión: " .  $e->getMessage());
            }

            $stmt = $conexion->prepare("SELECT * FROM pokemon WHERE id=:id");

            $stmt->bindParam(":id", $idPokemon);

            $stmt->execute();

            if($pokemon = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<figure><img src='img/" . $pokemon["imagen"] . ".png' alt='" . $pokemon["imagen"] . "' width='360px' height='360px'></figure>";
                echo "<h2><img src='img/Tipo_" . $pokemon["primer_tipo"] . ".png' alt='" . $pokemon["primer_tipo"] . "' width='120px' height='30px'>";
                if($pokemon["segundo_tipo"]) {
                    echo "<img src='img/Tipo_" . $pokemon["segundo_tipo"] . ".png' alt='" . $pokemon["segundo_tipo"] . "' width='120px' height='30px'>";
                }
                echo " " . $pokemon["numero"] . " " . $pokemon["nombre"] . "</h2>";
                echo "<p>" . $pokemon["descripcion"] . "</p>";
            }else {
                header("location: index.php");
                exit();
            }

            $conexion = null;
        ?>
    </section>
</body>
</html>