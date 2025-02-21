<?php
session_start();

// Conexão ao banco de dados
include('config.php'); // Substitua pelo seu arquivo de conexão ao banco de dados

    $email_username = $_POST['email_username'];
    $password = $_POST['password'];

    // Consultar o banco de dados
    $consulta_user = "SELECT * FROM users WHERE email = ? or username = ?";
    $stmt = $ligaDB->prepare($consulta_user);
    $stmt->bind_param("ss", $email_username, $email_username);
    $stmt->execute();
    $result = $stmt->get_result();

    // Verifica se foi encontrado algum usuário com o email encontrado
    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        // Verificar a senha
        if (password_verify($password, $user['senha'])) {
            // Login bem-sucedido
            $_SESSION['iduser'] = $user['iduser'];
            $_SESSION['username'] = $user['username'];
            header("Location: /pap/index.php");
            exit(); 
        } else {
            $_SESSION['error'] = "Password incorreta.";
            header("Location: /pap/login.php");
            exit();
        }
    } else {
        $_SESSION['error'] = "Email ou Username incorreto.";
        header("Location: /pap/login.php");
        exit();
    }
?>
