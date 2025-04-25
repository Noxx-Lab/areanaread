<?php session_start(); ?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    
    <!-- Estilo da navbar -->
    <link rel="stylesheet" href="/arenaread/css/navbar.css">

    <!-- Ícones do Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body>

<!-- Início da barra de navegação -->
<div class="navbar">

    <!-- Seção esquerda da navbar (logo + links principais) -->
    <div class="nav-left">
        <!-- Logo clicável que redireciona para a homepage -->
        <a href="/arenaread/index.php" class="logo-link">
            <img src="/arenaread/imagens/logo1.png" alt="ArenaRead" class="logo">
        </a>

        <!-- Links de navegação -->
        <a href="/arenaread/index.php" class="nav-home">Home</a>
        <a href="/arenaread/mostrar_projetos.php" class="nav-projetos">Projetos</a>
        
        <?php if (isset($_SESSION['rank']) && $_SESSION['rank'] === 'admin'): ?>
        <a href="/arenaread/uploud.php" class="nav-outra">Upload</a>
        <?php endif; ?>

        <?php if (isset($_SESSION['rank']) && in_array($_SESSION['rank'], ['admin', 'editor'])): ?>
            <a href="/arenaread/eliminar.php" class="nav-outra">Eliminar</a>
        <?php endif; ?>
    </div>

    <!-- Seção central da navbar (barra de pesquisa) -->
    <div class="nav-center">
        <div class="search-wrapper">
            <input type="text" placeholder="Pesquisar" class="search-bar" id="search-bar">
            <button class="search-button"><i class="bi bi-search"></i></button>
        </div>
    </div>

    <div class="nav-right">
    <?php if (isset($_SESSION['nome'])): ?>
    <div class="user-area">
        <span class="user-name">Olá, <?= htmlspecialchars($_SESSION['nome']) ?></span>
        <form action="logout.php" method="POST" class="logout-form">
            <button type="submit" class="nav-btn logout-btn">Logout</button>
        </form>
    </div>
    <?php else: ?>
        <a href="historico.php" class="nav-btn"><i class="bi bi-bookmark"></i> Histórico</a>
        <a href="login.php" class="nav-btn">Login</a>
        <a href="sign_up.php" class="nav-btn">Sign Up</a>
    <?php endif; ?>
    </div>


    <!-- Botão tipo 'hamburger' para menu responsivo (aparece em telas pequenas) -->
    <div class="hamburger" onclick="toggleMenu()">☰</div>
</div>

<!-- Script JavaScript para abrir/fechar o menu mobile -->
<script>
function toggleMenu() {
    const menu = document.getElementById("nav-right");
    menu.classList.toggle("show"); // Adiciona ou remove a classe 'show'
}
</script>

</body>
</html>
