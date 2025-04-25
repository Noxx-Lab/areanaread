<?php
session_start();
include 'config.php';

$erro = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email_user = trim($_POST['login']); // pode ser email ou username
    $senha = trim($_POST['password']);

    $sql_login = "SELECT * FROM users WHERE email = ? OR username = ?";
    $stmt_login = $ligaDB->prepare($sql_login);
    $stmt_login->bind_param("ss", $email_user, $email_user);
    $stmt_login->execute();
    $resultado_login = $stmt_login->get_result();

    if ($resultado_login->num_rows === 1) {
        $user = $resultado_login->fetch_assoc();
        if (password_verify($senha, $user["senha"])) {
            $_SESSION['iduser'] = $user['iduser'];
            $_SESSION['nome'] = $user['username'];
            $_SESSION['rank'] = $user['rank'];
            header("Location: index.php");
            exit;
        } else {
            $erro = "Senha incorreta!";
        }
    } else {
        $erro = "Conta não encontrada!";
    }
}
?>



<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-box">
        <h2>Iniciar sessão</h2>
        <form method="POST" action="">
            <label>Email ou Username</label>
            <input type="text" name="login">

            <label>Senha</label>
            <input type="password" name="password" required>

            <button type="submit">Entrar</button>
            <div class="link-group">
                <a href="/arenaread/sign_up.php">Criar conta</a>
                <span class="separator">|</span>
                <a href="/arenaread/esqueceu_senha.php">Esqueceu sua senha?</a>
            </div>
            <a href="index.php" class="voltar-link">Voltar</a>

        </form>
        <?php if (!empty($erro)) echo "<p class='erro'>$erro</p>"; ?>
    </div>
</body>
</html>
