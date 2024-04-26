
<?php

session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $userLogin = $_POST["userLogin"];
    $passLogin = $_POST["passLogin"];

    include "datos-conexion.php";
    global $username, $password;
    try {
        $conexion = new PDO("mysql:host=localhost;dbname=pokedex", $username, $password);
        $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }catch(Exception $e) {
        die("Error de conexión: " .  $e->getMessage());
    }

    $stmt = $conexion->prepare("SELECT * FROM usuario WHERE nombre=:userLogin");
    $stmt->bindParam(":userLogin", $userLogin);
    $stmt->execute();

    if ($user = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $contraseña = $user["contraseña"];
        echo "La contraseña del usuario es: " . $contraseña  .  "<br>";

        echo $passLogin .  "<br>";
        // Verificar la contraseña
        if (password_verify($passLogin, $user["contraseña"])) {
            // Iniciar la sesión y guardar el nombre de usuario en una variable de sesión
            $_SESSION["username"] = $userLogin;
            $_SESSION["userLogin"] = $userLogin;

            // Guardar el nombre de usuario en una cookie que expira en un día
            setcookie("userLogin", $userLogin, time() + (86400 * 30), "/");
        } else {
            echo "La contraseña es incorrecta.";
        }
    } else {
        echo "El usuario no existe.";
    }
}

$loggedIn = isset($_SESSION["userLogin"]) || isset($_COOKIE["userLogin"]);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pokedex</title>
</head>
<body>
<header>
    <h1><img src="img/Poke_Ball.png" alt="logo" width="27px" height="27px"> POKEDEX</h1>

    <?php if ($loggedIn): ?>
        <p>Usuario: Admin</p>
    <?php else: ?>
        <form action="" method="post">
            <label for="userLogin">Nombre:</label>
            <input type="text" id="userLogin" name="userLogin" required>

            <label for="passLogin">Contraseña:</label>
            <input type="password" id="passLogin" name="passLogin" value="passLogin" required>

            <input type="submit" value="Iniciar sesión">
        </form>
    <?php endif; ?>
</header>
</body>
</html>