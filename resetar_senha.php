<?php
session_start();
include "config.php";

$aviso = "";
$user = null;

if (!isset($_GET['token'])){
    $aviso = "<p style='color:red;'>Token inválido ou em falta.</p>";
}
else{
    $token = $_GET['token'];
}

$sql_verifica = "SELECT * from users where token_esqueceu = ? and token_tempo > now()";
$stmt_verifica = $ligaDB->prepare($sql_verifica);
$stmt_verifica ->bind_param("s", $token);
$stmt_verifica ->execute();
$resultado_verifica = $stmt_verifica->get_result();

if ($resultado_verifica->num_rows === 1){
    $user = $resultado_verifica->fetch_assoc();

    if($_SERVER["REQUEST_METHOD"] === "POST"){
        $nova = trim($_POST["nova"]);
        $confirmar = trim($_POST["confirmar"]);

        if($nova !== $confirmar){
            $aviso = "<p style='color:red;'>As passwords não são iguais</p>";
        }
        else{
            $password_encriptada = password_hash($nova, PASSWORD_DEFAULT);
            $sql_troca = "UPDATE users set senha = ?, token_esqueceu = null, token_tempo = null where iduser = ?";
            $stmt_troca = $ligaDB->prepare($sql_troca);
            $stmt_troca -> bind_param("si", $password_encriptada,$user['iduser']);
            $stmt_troca ->execute();

            $aviso = "<p style='color:green;'>Senha atualizada com sucesso <a href='login.php'>Entrar</a></p>";
            unset($user);
        }

    }
}
else{
    $aviso = "<p style='color:red;'>Este link é invalido ou o token expirou </p>";
}

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trocar a Password</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-box">
        <h2>Definir a Password</h2>

        <?php if(!empty($aviso)) echo $aviso; ?>

        <?php if(isset($user)): ?>
            <form method="POST">
                <label>Nova Password:</label>
                <input type="password" name="nova" pattern="^(?=.*[A-Za-z])(?=.*\d).+$" minlength="6" required>

                <label>Confirmar password:</label>
                <input type="password" name="confirmar" pattern="^(?=.*[A-Za-z])(?=.*\d).+$" minlength="6" required>

                <button type="submit">Atualizar a Password</button>
            </form>
        <?php endif; ?>

        <a href="/arenaread/login.php" class="voltar-link">Voltar ao login</a>

    </div>
    
</body>
</html>