<?php
// Inicia a sessão
session_start();

// Destrói todas as variáveis de sessão
session_destroy();

// Redireciona o usuário para a página de login ou para onde você desejar
header("Location: index.php"); // Ou header("Location: index.php");
exit();
?>