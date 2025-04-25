<?php
session_start();
include "config.php";

$aviso = "";

if($_SERVER['REQUEST_METHOD'] === "POST"){
    $email = trim($_POST["email"]);

    $sql_existe = "SELECT * from users where email = ?";
    $stmt_existe = $ligaDB->prepare($sql_existe);
    $stmt_existe ->bind_param("s",$email);
    $stmt_existe ->execute();
    $resultado_existe = $stmt_existe->get_result();

    if($resultado_existe->num_rows === 1){
        $user = $resultado_existe->fetch_assoc();

        $token = bin2hex(random_bytes(50)); //Vai criar um token para fazer o recuperar password mais seguro obg stackoverflow
        date_default_timezone_set('Europe/Lisbon');
        $tempo = date("Y-m-d H:i:s", strtotime("+5 min"));

        $sql_atualizar = "UPDATE users set token_esqueceu = ?, token_tempo = ? where email = ?";
        $stmt_atualizar = $ligaDB->prepare($sql_atualizar);
        $stmt_atualizar ->bind_param("sss",$token, $tempo, $email);
        $stmt_atualizar ->execute();

        $link = "http://localhost/arenaread/resetar_senha.php?token=$token";
        $assunto = "Recuperação de Senha - ArenaRead";
        $mensagem = "
        <html>
            <head>
                <style>
                    body { background: #0f0f1a; color: #fff; font-family: Arial, sans-serif; padding: 20px; }
                        .email-box { max-width: 600px; margin: auto; background: #1e1e2e; border-radius: 10px; padding: 30px; text-align: center; color:rgb(255, 255, 255);}
                        .btn { display: inline-block; padding: 12px 20px; margin-top: 20px; background:rgb(161, 148, 245); color:rgb(255, 255, 255) ; border-radius: 5px; text-decoration: none; }
                        h1 { color: #b48cff; }
                        .logo { max-width: 120px; margin-bottom: 15px; }
                </style>
            </head>
            <body>
                <div class='email-box'>
                <img src = 'https://res.cloudinary.com/dghfkjx36/image/upload/v1744680702/logo1_nbbqav.png' alt='ArenaRead logo' class='logo'>
                <h1>Recuperação da Password</h1>
                <p>Recebemos o pedido de trocar a passoword no <strong>ArenaRead</strong>,</p>
                <p>Para trocar a password, clique no link abaixo:
                <a href='$link' class='btn'>Trocar a Password</a>
                <p>Se não pediste por está alterção, ignora está mensagem..</p>
                </div>
            </body>
        </html>";

        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
        $headers .= "From: ArenaRead <arenaread.devv@gmail.com>" . "\r\n";

        if(mail($email, $assunto, $mensagem,$headers)){
            $aviso = "<p style='color:green;'>O email de recuperação. foi enviado para o seu email.</p>";
        }
        else{
            $aviso = "<p style='color:red;'>Erro ao enviar o email.Tente novamente.</p>";
        }   
    }
    else{
        $aviso = "<p style='color:red;'>Este email que inseriu não está registado</p>";
    }

}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Esqueceu a Password</title>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
    <div class="login-box">
        <h2>Recuperar a senha</h2>
        <form method="POST" action="">
            <label>Insere o seu Email:</label>
            <input type="email" name="email" required>
            <button type="submit">Enviar link de recuperação</button> 
        </form>
        <?php echo $aviso; ?>
        <a href="/arenaread/login.php" class="voltar-link">Voltar ao login</a>
    </div>
    
</body>
</html>
