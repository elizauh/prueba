<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<?php echo constant('URL'); ?>public/css/login.css">
    <title>Signup</title>
</head>

<body>
    <?php require 'views/header.php'; ?>
    <?php $this->showMessages(); ?>
    <div id="login-main">

        <form action="<?php echo constant('URL'); ?>signup/newUser" method="POST">
            <div></div>
            <h2>Registrarse</h2>

            <p>
                <label for="username">Username</label>
                <input type="text" name="username" id="username" pattern="[A-Za-z0-9]+" title="Solo se permiten caracateres alfanuméricos" require>
                <!-- <input type="text" name="username" id="username"> -->
            </p>
            <p>
                <label for="password">password</label>
                <input type="password" name="password" id="password" require>
            </p>
            <p>
                <input type="submit" value="Registrar" />
            </p>
            <p>
                ¿Tienes una cuenta? <a href="<?php echo constant('URL'); ?>">Iniciar sesion</a>
            </p>
        </form>
    </div>
</body>

</html>