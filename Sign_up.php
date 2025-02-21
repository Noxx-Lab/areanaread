<?php session_start(); ?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <link rel="stylesheet" href="css/signup.css">
</head>
<body>
    <div class="signup-container">
        <!-- Formulário de Cadastro -->
        <form class="signup-form" action="processasign.php" method="POST">
            <h2>Criar Conta</h2>

            <?php
            if (isset($_SESSION['error'])) {
                echo '<div class="error-message">' . $_SESSION['error'] . '</div>';
                unset($_SESSION['error']);
            }
            ?>

            <div class="input-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Digite seu username" required maxlength="16">
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Digite seu email" required>
            </div>
            <div class="input-group">
                <label for="password">Senha</label>
                <input type="password" id="password" name="password" placeholder="Escreva a sua senha" required minlength="6">
            </div>
            <div class="input-group">
                <label for="confirm-password">Confirmar Senha</label>
                <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirme a sua senha" required minlength="6">
            </div>
            <button type="submit" class="btn-signup">Registar</button>
            <div class="links">
                <a href="login.php">Já tem uma conta? Entrar</a>
                <a href="index.php">Voltar</a>
            </div>
        </form>
    </div>
</body>
</html>
