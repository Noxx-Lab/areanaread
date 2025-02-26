<?php
include 'config.php'; // Conexão com o banco de dados
include "navbar.php";

$mensagem = "";

// Obtém o ID do capítulo da URL
$id_capitulo = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id_capitulo <= 0) {
    $mensagem = "<p class='erro'> Erro: Capítulo inválido!</p>";
}

// Busca informações do capítulo
$sqlCapitulo = "SELECT c.id_capitulos, c.num_capitulo, c.id_manga, m.titulo 
                FROM capitulos c
                JOIN mangas m ON c.id_manga = m.id_manga
                WHERE c.id_capitulos = ?";
$stmt = $ligaDB->prepare($sqlCapitulo);
$stmt->bind_param("i", $id_capitulo);
$stmt->execute();
$resultCapitulo = $stmt->get_result();
$capitulo = $resultCapitulo->fetch_assoc();

if (!$capitulo) {
    $mensagem = "<p class='erro'> Erro: Capítulo não encontrado!</p>";
}

$id_manga = $capitulo['id_manga'];
$titulo_manga = $capitulo['titulo'];
$num_capitulo = $capitulo['num_capitulo'];

// Busca as páginas do capítulo no Cloudinary
$sqlPaginas = "SELECT caminho_pagina FROM paginas WHERE id_capitulos = ? ORDER BY id_pagina ASC";
$stmtPaginas = $ligaDB->prepare($sqlPaginas);
$stmtPaginas->bind_param("i", $id_capitulo);
$stmtPaginas->execute();
$resultPaginas = $stmtPaginas->get_result();
$paginas = [];

while ($row = $resultPaginas->fetch_assoc()) {
    $paginas[] = $row['caminho_pagina'];
}

// Busca capítulos anterior e próximo
$sqlAnterior = "SELECT id_capitulos FROM capitulos WHERE id_manga = ? AND num_capitulo < ? ORDER BY num_capitulo DESC LIMIT 1";
$stmtAnterior = $ligaDB->prepare($sqlAnterior);
$stmtAnterior->bind_param("ii", $id_manga, $num_capitulo);
$stmtAnterior->execute();
$resultAnterior = $stmtAnterior->get_result();
$capitulo_anterior = $resultAnterior->fetch_assoc();

$sqlProximo = "SELECT id_capitulos FROM capitulos WHERE id_manga = ? AND num_capitulo > ? ORDER BY num_capitulo ASC LIMIT 1";
$stmtProximo = $ligaDB->prepare($sqlProximo);
$stmtProximo->bind_param("ii", $id_manga, $num_capitulo);
$stmtProximo->execute();
$resultProximo = $stmtProximo->get_result();
$capitulo_proximo = $resultProximo->fetch_assoc();

$sqlCapitulos = "SELECT id_capitulos, num_capitulo FROM capitulos WHERE id_manga = ? Order by num_capitulo DESC";
$stmtCapitulos = $ligaDB->prepare($sqlCapitulos);
$stmtCapitulos->bind_param("i", $id_manga);
$stmtCapitulos->execute();
$resultCapitulos = $stmtCapitulos->get_result();

    while ($row = $resultCapitulos->fetch_assoc()) {
        $capitulos[] = $row;
    }

$total_paginas = count($paginas);

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $titulo_manga; ?> - Capítulo <?php echo $num_capitulo; ?></title>
    <link rel="stylesheet" href="css/ler_manga.css">
</head>
<body>

<div class="reader-info">
    <h1><?php echo $titulo_manga; ?> - Capítulo <?php echo $num_capitulo; ?></h1>
    <p>Leia o último capítulo de <strong><?php echo $titulo_manga; ?></strong> aqui na nossa plataforma. Não se esqueça de conferir os capítulos anteriores!</p>
</div>


<!-- Barra de navegação superior -->
<div class="reader-nav">
    <?php if ($capitulo_anterior): ?>
        <a href="ler_manga.php?id=<?php echo $capitulo_anterior['id_capitulos']; ?>" class="nav-button">❮ Anterior</a>
    <?php endif; ?>

    <!-- Seleção de capítulos -->
    <select id="chapter-select" class="chapter-select" onchange="trocarCapitulo()">
        <?php 
        $sqlCapitulos = "SELECT id_capitulos, num_capitulo FROM capitulos WHERE id_manga = ? ORDER BY num_capitulo ASC";
        $stmtCapitulos = $ligaDB->prepare($sqlCapitulos);
        $stmtCapitulos->bind_param("i", $id_manga);
        $stmtCapitulos->execute();
        $resultCapitulos = $stmtCapitulos->get_result();
        
        while ($cap = $resultCapitulos->fetch_assoc()): ?>
            <option value="ler_manga.php?id=<?php echo $cap['id_capitulos']; ?>" 
                <?php echo ($cap['id_capitulos'] == $id_capitulo) ? 'selected' : ''; ?>>
                Capítulo <?php echo $cap['num_capitulo']; ?>
            </option>
        <?php endwhile; ?>
    </select>

    <!-- Seleção de páginas -->
    <select id="page-select" class="page-select" onchange="scrollParaPagina()">
        <?php foreach ($paginas as $index => $pagina): ?>
            <option value="pagina-<?php echo $index + 1; ?>">
                <?php echo ($index + 1) . "/" . $total_paginas; ?>
            </option>
        <?php endforeach; ?>
    </select>

    <?php if ($capitulo_proximo): ?>
        <a href="ler_manga.php?id=<?php echo $capitulo_proximo['id_capitulos']; ?>" class="nav-button">Próximo ❯</a>
    <?php endif; ?>
</div>

<!-- Exibição das páginas do mangá -->
<div class="reader-pages">
    <?php foreach ($paginas as $index => $pagina): ?>
        <img id="pagina-<?php echo $index + 1; ?>" src="<?php echo $pagina; ?>" class="manga-page" loading="lazy">
    <?php endforeach; ?>
</div>

<!-- Rodapé da página com botões de navegação -->
<div class="reader-footer">
    <?php if ($capitulo_anterior): ?>
        <a href="ler_manga.php?id=<?php echo $capitulo_anterior['id_capitulos']; ?>" class="nav-button">❮ Anterior</a>
    <?php endif; ?>
    
    <?php if ($capitulo_proximo): ?>
        <a href="ler_manga.php?id=<?php echo $capitulo_proximo['id_capitulos']; ?>" class="nav-button">Próximo ❯</a>
    <?php endif; ?>
</div>

<script>
// Função para trocar de capítulo ao selecionar um no dropdown
function trocarCapitulo() {
    let select = document.getElementById("chapter-select");
    let selectedChapter = select.value;
    window.location.href = selectedChapter;
}

// Função para rolar até a página selecionada no dropdown
function scrollParaPagina() {
    let select = document.getElementById("page-select");
    let selectedPage = select.value;
    let element = document.getElementById(selectedPage);
    if (element) {
        element.scrollIntoView({ behavior: "smooth", block: "start" });
    }
}
</script>

</body>
</html>

