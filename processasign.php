<?php
session_start();

include("config.php");

$username = $_POST["username"];
$email = $_POST["email"];
$password = $_POST["password"];
$confirm_password = $_POST['confirm_password'];

if ($password !== $confirm_password){
    $_SESSION['error'] = "As Password não são igual - Tente novamente.";
            header("Location: /pap/html/Sign_up.php");
            exit();
}
else{
    $password= password_hash($password,PASSWORD_DEFAULT);
    // Consultar o banco de dados
    $consulta_email = "SELECT * FROM users WHERE email = ? or username = ?";
    $stmt = $ligaDB->prepare($consulta_email);
    $stmt->bind_param("ss", $email,$username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $_SESSION['error'] = "Email ou Username já está registado.";
            header("Location: /pap/Sign_up.php");
            exit();
    }
else{
    //Query para inserir a conta do utilizador
    $insert_conta = "INSERT INTO users (username, email, senha) VALUES (?, ?, ?)";
    $insert_stmt = $ligaDB->prepare($insert_conta); //Insere a conta na base de dados
    $insert_stmt->bind_param("sss", $username, $email, $password);
    
    if ($insert_stmt->execute()) {
        // Caso a inserção seja bem-sucedida
        $_SESSION['error'] = "Conta criada com sucesso! Faça login."; 
        header("Location: /pap/login.php");
        exit();
    } else {
        // Caso haja algum erro ao inserir os dados no banco de dados
        $_SESSION['error'] = "Erro ao criar conta. Tente novamente."; 
        header("Location: /pap/Sign_up.php");
        exit();
    }
}
    
}   
?>