<?php
session_start();
include 'config.php';

$mensagem = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['senha'];
    $confirmar = $_POST['confirmar'];

    if ($password !== $confirmar) {
        $mensagem = "<p class='erro'>As passwords não coincidem.</p>";
    } else {
        // Verificar se já existe email ou username
        $sql_verifica ="SELECT * FROM users WHERE email = ? OR username = ?";
        $verifica_user = $ligaDB->prepare($sql_verifica);
        $verifica_user->bind_param("ss", $email, $username);
        $verifica_user->execute();
        $resultado_user = $verifica_user->get_result();

        if ($resultado_user->num_rows > 0) {
            $mensagem = "<p class='erro'>Email ou username já existe.</p>";
        } else {
            $password_encriptada = password_hash($password, PASSWORD_DEFAULT);

            $sql_registrar = "INSERT INTO users (username, email, senha) VALUES (?, ?, ?)";
            $registar = $ligaDB->prepare($sql_registrar);
            $registar->bind_param("sss", $username, $email, $password_encriptada);
            if ($registar->execute()) {
                // Login automático
                $_SESSION['iduser'] = $registar->insert_id;
                $_SESSION["email"] = $email;
                $_SESSION["nome"] = $username;
                $_SESSION['rank'] = "user";

                // Envio de email
                $assunto = "Bem-vindo à ArenaRead!";
                $corpo = "
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
                        <img src= 'https://res.cloudinary.com/dqn5ieptf/image/upload/v1751535819/logo1_dc4amd_qhvcsr_vfurof.png' alt='ArenaRead Logo' class='logo'>
                        <h1>Bem-vindo, $username!</h1>
                        <p>Obrigado por se registar no <strong>ArenaRead</strong>. Agora podes explorar e acompanhar as tuas obras favoritas!</p>
                        <p>Aproveita e começa a tua leitura!</p>
                        <a href='http://localhost/arenaread/index.php' class='btn'>Acessar ArenaRead</a>
                    </div>
                </body> 
                </html>";

                $headers = "MIME-Version: 1.0" . "\r\n";
                $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
                $headers .= "From: ArenaRead <arenaread.devv@gmail.com>". "\r\n";

                mail($email, $assunto, $corpo, $headers);

                header("Location: /arenaread/index.php");
                exit;
            } else {
                $mensagem = "<p class='erro'>Erro ao criar conta. Tenta novamente.</p>";
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <title>SignUp</title>
    <link rel="stylesheet" href="css/signup.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
    <div class="login-box">
        <h2>Criar Conta</h2>
        <form method="POST">
            <label>Username</label>
            <input type="text" name="username" required>

            <label>Email</label>
            <input type="email" name="email" required>

            <div class="campo-password">
                <label>Senha</label>
                <input type="password" name="senha" id="senha" required>
                <div id="password-regras">
                    <div class="regra" id="regra-tamanho">Pelo menos 8 caracteres</div>
                    <div class="regra" id="regra-upper">Pelo menos 1 letra maiúscula</div>
                    <div class="regra" id="regra-lower">Pelo menos 1 letra minúscila</div>
                    <div class="regra" id="regra-number">Pelo menos 1 número</div>
                </div>  
            </div>
            <label>Confirmar Senha</label>
            <input type="password" name="confirmar" pattern="^(?=.*[A-Za-z])(?=.*\d).+$" minlength="6" required>

            <button type="submit">Registar</button>

            <a href="login.php" class="btn-voltar">Já tem uma conta? Entrar</a>

            <a href="index.php" class="btn-voltar">Voltar</a>

        </form>
        <?php echo $mensagem ?>
    </div>
<script>
    const passwordInput = document.getElementById("senha");
    const regrasDIV = document.getElementById("password-regras");
    const regras = {
        length: document.getElementById("regra-tamanho"),
        upper: document.getElementById("regra-upper"),
        lower: document.getElementById("regra-lower"),
        number: document.getElementById("regra-number")
    };
    passwordInput.addEventListener("focus", function(){
        regrasDIV.style.display = "block";
    });
    passwordInput.addEventListener("blur", function(){
        setTimeout(() => {
            if(!passwordInput.value) regrasDIV.style.display = "none";
        }, 120);
    });

    passwordInput.addEventListener("input", function(){
        const val = passwordInput.value;
        regras.length.classList.toggle("valid", val.length >= 8);
        regras.upper.classList.toggle("valid", /[A-Z]/.test(val));
        regras.lower.classList.toggle("valid", /[a-z]/.test(val));
        regras.number.classList.toggle("valid", /\d/.test(val));

        regrasDIV.style.display= "block";
        
    });
</script>
</body>
</html>
