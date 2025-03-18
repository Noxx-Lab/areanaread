<?php session_start() ?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/arenaread/css/navbar.css"> <!-- Arquivo CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<body>
    <nav class="navbar">
        <div class="nav-left">
            <a href="/arenaread/index.php" class="logo-btn">
            <img src="/arenaread/imagens/logo1.png" alt="ArenaRead">
            </a>
            <a href="/arenaread/index.php">Home</a>
            <a href="/arenaread/mostrar_projetos.php">Projetos</a>
            <a href="/arenaread/uploud.php">Upload</a>
        </div>
        
        <div class="nav-center">
            <input type="text" placeholder="Pesquisar" class="search-bar">
            <button class="search-button"><i class="bi bi-search"></i></button>
        </div>

        <div class="nav-right">
            <button class="nav-btn"><i class="bi bi-bookmark"></i> Histórico</button>
            <a href="/arenaread/login.php"><button class="nav-btn">Login</button></a>
            <a href="/arenaread/Sign_up.php"><button class="nav-btn">Sign Up</button></a>
        </div>
    </nav>
</body>
</html>
