<?php session_start(); ?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página de Login</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-container">
        <!-- Formulário que envia os dados para login.php -->
        <form class="login-form" action="processalogin.php" method="POST">
            <h2>Iniciar sessão</h2>

            <?php
            if (isset($_SESSION['error'])) {
                echo '<div class="error-message">' . $_SESSION['error'] . '</div>';
                unset($_SESSION['error']);
            }
            ?>

            <div class="input-group">
                <label for="email">Email ou Username</label>
                <!-- Campo de Email -->
                <input type="text" id="email_username" name="email_username" placeholder="Email ou Username" required>
            </div>
            <div class="input-group">
                <label for="password">Senha</label>
                <!-- Campo de Senha -->
                <input type="password" id="password" name="password" placeholder="Senha" required>
            </div>
            <button type="submit" class="btn-login">Entrar</button>
            <button type="button" class="btn-signup" onclick="window.location.href='Sign_up.php'">Criar conta</button>
            <div class="links">
                <a href="#">Esqueceu sua senha?</a>
                <a href="index.php">Voltar</a>
            </div>
        </form>
    </div>
</body>
</html>


