<?php
    //cierra la sesion
    if(isset($_POST["cerrar"])) {
        
        session_start();

        session_unset();

        session_destroy();
    }

    //vuelve al index al finalizar
    header("location: index.php");
    exit();
?>