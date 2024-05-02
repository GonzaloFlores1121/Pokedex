<?php
    include_once("datos-conexion.php");
    global $username, $password;

    try{
        $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);

        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        if(isset($_GET["tipo"])) {//verifica que se haya tocado uno de los botones del index tanto modificar como nuevo pokemon
            if($_GET["tipo"]=="actualizar"){//en el caso de que se haya apretado el btn modificar se creara la variable pokemon con los datos del mismo
                $stmt = $conexion->prepare("SELECT * FROM pokemon WHERE id=:id");
                $stmt->execute(array(":id"=>$_GET["idPokemon"]));//en el btn modificar como param tambien se envia el id para el where del query
                $pokemon = $stmt->fetch(PDO::FETCH_ASSOC);
            }
        }else {//en caso de no tocar ninguno de los dos btn del index te redirige al index
            header("location:index.php");
            exit();
        }        
    
    }catch(Exception $e) {
        die("Error de conexión: " . $e->getMessage());
    }finally {
        $conexion=null;
    }


?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario POKEMON</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<header class="text-center mb-4">
    <h1><img src="img/Poke_Ball.png" alt="logo" width="27px" height="27px">   POKEDEX</h1>
</header>
<div class="container">
    <section>

        <form action="acciones-bdpokemon.php" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" id="id" value="<?php if(isset($pokemon)){echo $pokemon['id'];} ?>">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre:</label>
                <input type="text" class="form-control" name="nombre" id="nombre" value="<?php if(isset($pokemon)){echo $pokemon['nombre'];} ?>" required>
            </div>
            <div class="mb-3">
                <label for="numero" class="form-label">Número:</label>
                <input type="number" min="1" class="form-control" name="numero" id="numero" value="<?php if(isset($pokemon)){echo $pokemon['numero'];} ?>" required>
            </div>
            <div class="mb-3">
                <label for="primer_tipo" class="form-label">Primer Tipo:</label>
                <div class="mb-3">
                    <select class="form-control" name="primer_tipo" id="primer_tipo" >
                        <option value="">Seleccione tipo</option>
                        <?php
                        $tipos = array("planta", "fuego", "acero", "bicho", "dragon", "electrico", "fantasma", "volador", "tierra", "siniestro", "roca", "psiquico", "normal", "lucha", "hielo", "hada");
                        foreach($tipos as $tipo) {
                            if(isset($pokemon) && $pokemon['primer_tipo'] == $tipo){
                                echo "<option value='" . $tipo . "' selected>" . ucfirst($tipo) . "</option>";
                            } else {
                                echo "<option value='" . $tipo . "'>" . ucfirst($tipo) . "</option>";
                            }
                        }
                        ?>
                    </select>

                </div>

            </div>
            <div class="mb-3">
                <label for="segundo_tipo" class="form-label">Segundo Tipo:</label>
                <div class="mb-3">
                    <select class="form-control" name="segundo_tipo" id="segundo_tipo" >
                        <option value="">Seleccione tipo</option>
                        <?php
                        $tipos = array("planta", "fuego", "acero", "bicho", "dragon", "electrico", "fantasma", "volador", "tierra", "siniestro", "roca", "psiquico", "normal", "lucha", "hielo", "hada");
                        foreach($tipos as $tipo) {
                            if(isset($pokemon) && $pokemon['segundo_tipo'] == $tipo){
                                echo "<option value='" . $tipo . "' selected>" . ucfirst($tipo) . "</option>";
                            } else {
                                echo "<option value='" . $tipo . "'>" . ucfirst($tipo) . "</option>";
                            }
                        }
                        ?>
                    </select>

                </div>

            </div>

            <div class="mb-3">
                <label for="imgName" class="form-label">Nombre de la imagen:</label>
                <input type="text" class="form-control" name="imgName" id="imgName" value="<?php if(isset($pokemon)){echo $pokemon["imagen"];} ?>" required>
            </div>

            <div class="mb-3">
                <label for="img" class="form-label">Subir imagen(Solo se acepta formato .png):</label>
            <input type="file" name="img" value="img" >

            </div>

            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <textarea class="form-control" rows="10" cols="40" name="descripcion" id="descripcion" required><?php if(isset($pokemon)){echo $pokemon["descripcion"];} ?></textarea>
            </div>
            <div class="mb-3">
                <?php if(isset($_GET["idPokemon"])): ?>
                    <input type="submit" class="btn btn-primary" name="actualizar" value="Actualizar POKEMON">
                <?php else: ?>
                    <input type="submit" class="btn btn-primary" name="agregar" value="Agregar POKEMON">
                <?php endif; ?>
            </div>
        </form>
        <a href="index.php" class="btn btn-secondary">Volver atrás</a>
    </section>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
