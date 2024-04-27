<?php
    session_start();

    include_once("datos-conexion.php");
    global $username, $password;
    
    //verifica si se envio el formulario de logeo del admin, si se ingresa mal los datos se mandara un mensaje informdo del mismo
    if (isset($_POST["enviar"])) {
        $nombre = $_POST["nombre"];
        $contra = $_POST["contraseña"];    

        try {
            $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);
            
            $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            $stmt = $conexion->prepare("SELECT * FROM usuario WHERE nombre=:nombre AND contra=:contra");

            $stmt->execute(array(":nombre"=>$nombre, ":contra"=>$contra));

            if ($stmt->rowCount()!=0) {
                
                $_SESSION["admin"] = $nombre;
            }else {
                echo "Error: nombre de usuario y/o contraseña incorrectos";
            }        
        
        }catch(Exception $e) {
            die("Error de conexión: " .  $e->getMessage());
        }finally {
            $conexion = null;
        }
        
    } 

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POKEDEX</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>

<header class="bg-light p-3">
    <div class="container d-flex justify-content-between align-items-center">
        <h1 class="m-0"><img src="img/Poke_Ball.png" alt="logo" width="27px" height="27px"> POKEDEX</h1>
        <?php if(isset($_SESSION["admin"])): ?>
            <p class="m-0">Usuario: Admin</p>
            <form action="cerrar-sesion.php" method="post" class="m-0">
                <input type=submit name="cerrar" value="Cerrar Sesión" class="btn btn-danger">
            </form>
        <?php else: ?>
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" class="m-0">
                <div class="row gx-2 align-items-center">
                    <div class="col-auto">
                        <label for="nombre" class="visually-hidden">Nombre:</label>
                        <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Nombre" required>
                    </div>
                    <div class="col-auto">
                        <label for="contraseña" class="visually-hidden">Contraseña:</label>
                        <input type="password" name="contraseña" id="contraseña" class="form-control" placeholder="Contraseña" required>
                    </div>
                    <div class="col-auto">
                        <input type="submit" name="enviar" value="Ingresar" class="btn btn-primary">
                    </div>
                </div>
            </form>
        <?php endif; ?>
    </div>
</header>

    <section>
        <!--el action reenvia a la misma pagina para actualizar los resultados de la busqueda-->

            <h1 class="my-4">Quién es ese pokémon?</h1>
            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" class="mb-3">
                <div class="input-group">
                    <input type="search" name="busqueda" id="busqueda" class="form-control" placeholder="Ingrese el nombre, tipo o número de pokemón" aria-label="Buscar" aria-describedby="button-addon2">
                    <button name="buscar" class="btn btn-primary" type="submit" id="button-addon2">Buscar</button>
                </div>
            </form>


            <div class="container">
                <h1 class="my-4">Tabla de Pokemones</h1>
                <table class="table">
                    <thead>
                    <tr>
                        <th>imagen</th>
                        <th>tipo</th>
                        <th>número</th>
                        <th>nombre</th>
                        <?php if(isset($_SESSION["admin"])): ?>
                            <th>acciones</th>
                        <?php endif; ?>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    try {
                        $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);

                        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

                        //verifica si se apreto buscar
                        if(isset($_POST["buscar"])) {
                            $busqueda = htmlentities(addslashes($_POST["busqueda"]));
                            $stmt = $conexion->prepare("SELECT * FROM pokemon WHERE nombre=:busqueda OR primer_tipo=:busqueda OR segundo_tipo=:busqueda OR numero=:busqueda");
                            $stmt->execute(array(":busqueda"=>$busqueda));
                            //en caso de no hayarse nada se muestran todos los pokemon de la bd pero con la leyenda pokemon no encontrado
                            if($stmt->rowCount()==0) {
                                echo "<p><strong>pokemon no encontrado</strong></p>";
                                $stmt = $conexion->prepare("SELECT * FROM pokemon");
                                $stmt->execute();
                            }
                            //en el caso de que no se haya apretado nada o es la primera vez ke se entre al index se mostrara todos los pokemon de la bd
                        }else {
                            $stmt = $conexion->prepare("SELECT * FROM pokemon");
                            $stmt->execute();
                        }

                        //inserta la tabla de los pokemones
                        while($pokemon = $stmt->fetch(PDO::FETCH_ASSOC)) {
                            echo "<tr onclick=" . '"window.location.href=' . "'pokemon-vista.php?idpokemon=" . $pokemon["id"] . "'" . ';">';
                            echo "<td><img src='img/" . $pokemon["imagen"] . ".png' alt='" . $pokemon["imagen"] . "' width='40px' height='40px'></td>";
                            echo "<td><img src='img/Tipo_" . $pokemon["primer_tipo"] . ".png' alt='" . $pokemon["primer_tipo"] . "' width='40px' height='10px'>";
                            if($pokemon["segundo_tipo"]) {
                                echo "<img src='img/Tipo_" . $pokemon["segundo_tipo"] . ".png' alt='" . $pokemon["segundo_tipo"] . "' width='40px' height='10px'>";
                            }
                            echo "</td>";
                            echo "<td>" . $pokemon["numero"] . "</td>";
                            echo "<td>" . $pokemon["nombre"] . "</td>";
                            if(isset($_SESSION["admin"])) {
                                //un btn para borrar pokemon solo para el modo admin
                                echo "<td ><a href='borrar-bdpokemon.php?idPokemon=" . $pokemon["id"] . "'><input type='button' value='Baja'></a>";
                                //un boton para modificar pokemon solo para el modo admin
                                echo "<a href='formulario-pokemon.php?tipo=actualizar&idPokemon=" . $pokemon["id"] . "'><input type='button' value='Modificación'></a></td>";
                            }
                            echo "</tr>";
                        }

                    }catch(Exception $e) {
                        die("Error de conexión: " .  $e->getMessage());
                    }finally {
                        $conexion = null;
                    }

                    ?>
                    </tbody>
                </table>
            </div>
        </form><br>

        <!--un btn para agregar un nuevo pokemon solo si se logea el admin-->
        <?php if(isset($_SESSION["admin"])): ?>
            <form action="formulario-pokemon.php?tipo=agregar" method="post">
                <input type="submit" name="agregar" value="Nuevo Pokémon">
            </form>
        <?php endif; ?>
    </section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>