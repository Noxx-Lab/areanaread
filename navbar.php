<?php session_start();


?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    
    <!-- Estilo da navbar -->
    <link rel="stylesheet" href="/arenaread/css/navbar.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
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
            <img src="https://res.cloudinary.com/dghfkjx36/image/upload/v1749142660/logo1_dc4amd_qhvcsr.png" alt="ArenaRead" class="logo">
        </a>

        <!-- Links de navegação -->
        <a href="/arenaread/index.php" class="nav-home">Home</a>
        <a href="/arenaread/projetos.php" class="nav-projetos">Projetos</a>
    </div>

    <!-- Seção central da navbar (barra de pesquisa) -->
    <div class="nav-center">
        <div class="search-wrapper">
            <input type="text"  placeholder="Pesquisar" class="search-bar" id="search-bar" autocomplete="off">
            <div id="search-result" class="search-result"></div>
        </div>
    </div>

    <div class="nav-right">
        <?php if (isset($_SESSION['nome'])): ?>
         <div class="user-area"></div>
         <?php if (isset($_SESSION['rank']) && in_array($_SESSION['rank'], ['admin', 'editor'])): ?>
            <a href="/arenaread/dashboard.php" class="nav-btn">Dashboard</a>
        <?php endif; ?>
        <div class="user-dropdown">
        <span class="user-name">Olá, <?php echo htmlspecialchars($_SESSION['nome']) ?></span>
        <form action="logout.php" method="POST" class="logout-form">
            <button type="submit" class="nav-btn logout-btn">Logout</button>
        </form>
    </div>
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
const barra = document.getElementById('search-bar');
const caixa = document.getElementById('search-result');

barra.oninput = function() {
    let texto = barra.value.trim();
    if (texto.length < 1) {
        caixa.innerHTML = '';
        caixa.style.display = 'none';
        return;
    }
    // AJAX simples:
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'pesquisa.php?pesquisa=' + encodeURIComponent(texto));
    xhr.onload = function() {
        if (xhr.status == 200) {
            caixa.innerHTML = xhr.responseText;
            caixa.style.display = 'block';
        }
    }
    xhr.send();
};

// Esconde ao clicar fora
document.onclick = function(e) {
    if (!e.target.closest('.search-wrapper')) {
        caixa.style.display = 'none';
    }
};


</script>

</body>
</html>
