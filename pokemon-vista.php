<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POKEMON</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
    <header>
        
        <h1><img src="img/Poke_Ball.png" alt="logo" width="27px" height="27px">   POKEDEX</h1>
    </header>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <?php
                    include_once("datos-conexion.php");
                    global $username, $password;

                    $idPokemon = $_GET["idpokemon"];

                    try {
                        $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);

                        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                        $stmt = $conexion->prepare("SELECT * FROM pokemon WHERE id=:id");

                        $stmt->execute(array(":id"=>$idPokemon));

                        // Mostrar los detalles básicos del Pokemon
                        if($pokemon = $stmt->fetch(PDO::FETCH_ASSOC)) {
                            echo "<h2>" . $pokemon["numero"] . " " . $pokemon["nombre"] . "</h2>";
                            echo "<figure><img src='img/" . $pokemon["imagen"] . "' alt='" . $pokemon["imagen"] . "' width='360px' height='360px'></figure>";
                            echo "<p>";
                            echo "<img src='img/Tipo_" . $pokemon["primer_tipo"] . ".png' alt='" . $pokemon["primer_tipo"] . "' width='120px' height='30px'>";
                            if($pokemon["segundo_tipo"]) {
                                echo "<img src='img/Tipo_" . $pokemon["segundo_tipo"] . ".png' alt='" . $pokemon["segundo_tipo"] . "' width='120px' height='30px'>";
                            }
                            echo "</p>";
                        } else {
                            header("location: index.php");
                            exit();
                        }

                    } catch(Exception $e) {
                        die("Error de conexión: " .  $e->getMessage());
                    } finally {
                        $conexion = null;
                    }
                    ?>
                </div>

                <div class="col-md-6">
                    <h2>Descripción</h2>
                    <p class="fs-5">
                        <?php

                        if(isset($pokemon["descripcion"])) {
                            echo $pokemon["descripcion"];
                        } else {
                            echo "No hay descripción disponible.";
                        }
                        ?>
                    </p>
                </div>
            </div>
        </div>


        <a href="index.php" class="btn btn-secondary">Volver atrás</a>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>