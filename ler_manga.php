<?php
include 'config.php'; // Conexão com o banco de dados
include "navbar.php";

$mensagem = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['id_capitulo'])) {
    $id_capitulo = intval($_POST['id_capitulo']); //Anti injeção

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

$sql_manga = "SELECT * from mangas where id_manga = ?";
$stmt_manga = $ligaDB->prepare($sql_manga);
$stmt_manga->bind_param("i",$id_manga);
$stmt_manga->execute();
$resulta_manga = $stmt_manga->get_result();
$manga = $resulta_manga->fetch_assoc();


// Busca as páginas do capítulo no Cloudinary
$sqlPaginas = "SELECT caminho_pagina FROM paginas WHERE id_capitulos = ? and id_manga = ? ORDER BY id_pagina ASC";
$stmtPaginas = $ligaDB->prepare($sqlPaginas);
$stmtPaginas->bind_param("ii", $id_capitulo, $id_manga);
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

}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $titulo_manga; ?> - Capítulo <?php echo $num_capitulo; ?></title>
    <link rel="stylesheet" href="/arenaread/css/ler_manga.css">
</head>
<body>

<div class="reader-header">
    <h1><?php echo $titulo_manga; ?></h1>
    <h1>Capítulo <?php echo $num_capitulo ?></h1>
    <p class="breadcrumbs"><a href="/arenaread/index.php">Home</a>/
    <a href="/arenaread/<?php echo htmlspecialchars($manga["link"]);?>?id=<?php echo urlencode($manga["id_manga"]); ?>">
    <?php echo htmlspecialchars($titulo_manga); ?>
    </a>/ 
    <strong>Capítulo <?php echo $num_capitulo; ?></strong></p> 


<!-- Barra de navegação superior -->
<div class="reader-controls">
    <!-- Seleção de capítulos -->
    <div class="controls-chapter-select">
        <select id="chapter-select" class="chapter-select" onchange="trocarCapitulo()">
            <?php foreach ($capitulos as $capitulo): ?>
                <option value="/arenaread/<?php echo $manga['link']; ?>/capitulo-<?php echo $capitulo['num_capitulo']; ?>" 
                    <?php echo ($capitulo['id_capitulos'] == $id_capitulo) ? 'selected' : ''; ?>>
                    Capítulo <?php echo $capitulo['num_capitulo']; ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>


    <!-- Seleção de páginas -->
    <div class="reader-controls-right">
        <select id="page-select" class="page-select" onchange="scrollParaPagina()">
            <?php foreach ($paginas as $index => $pagina): ?>
                <option value="pagina-<?php echo $index + 1; ?>">
                    <?php echo ($index + 1) . "/" . $total_paginas; ?>
                </option>
            <?php endforeach; ?>
        </select>    
        <?php if (!empty($capitulo_anterior)): ?>
            <a href="/arenaread/<?php echo htmlspecialchars($manga['link']); ?>/capitulo-<?php echo htmlspecialchars($capitulo_anterior['id_capitulos']); ?>" class="nav-button">❮ Anterior</a>
        <?php endif; ?>

        <?php if (!empty($capitulo_proximo)): ?>
            <a href="/arenaread/<?php echo htmlspecialchars($manga['link']); ?>/capitulo-<?php echo htmlspecialchars($capitulo_proximo['id_capitulos']); ?>" class="nav-button">Próximo ❯</a>
        <?php endif; ?>


    </div>
</div>

<!-- NÃO APAGA ISSO MT IMPORTANTE SEU BURRO Exibição das páginas do mangá NÃO APAGA ISSO MT IMPORTANTE SEU BURRO -->
<div class="reader-pages">
    <?php foreach ($paginas as $index => $pagina): ?>
        <img id="pagina-<?php echo $index + 1; ?>" src="<?php echo $pagina; ?>" class="manga-page">
    <?php endforeach; ?>
</div>

<!-- Rodapé da página com botões de navegação -->
<div class="reader-footer">
    <!-- Seleção de capítulos -->
    <div class="footer-chapter-select">
        <select id="chapter-select" class="chapter-select" onchange="trocarCapitulo()">
            <?php foreach ($capitulos as $capitulo): ?>
                <option value="/arenaread/<?php echo $manga['link']; ?>/capitulo-<?php echo $capitulo['num_capitulo']; ?>" 
                    <?php echo ($capitulo['id_capitulos'] == $id_capitulo) ? 'selected' : ''; ?>>
                    Capítulo <?php echo $capitulo['num_capitulo']; ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>
    <div class="reader-footer-nav">
                
    <?php if (!empty($capitulo_anterior)): ?>
            <a href="/arenaread/<?php echo htmlspecialchars($manga['link']); ?>/capitulo-<?php echo htmlspecialchars($capitulo_anterior['id_capitulos']); ?>" class="nav-button">❮ Anterior</a>
        <?php endif; ?>

        <?php if (!empty($capitulo_proximo)): ?>
            <a href="/arenaread/<?php echo htmlspecialchars($manga['link']); ?>/capitulo-<?php echo htmlspecialchars($capitulo_proximo['id_capitulos']); ?>" class="nav-button">Próximo ❯</a>
        <?php endif; ?>

    </div>
    <button id="volta_topo" class="volta_topo" onclick="scrollparatopo()">
        <i class="bi bi-arrow-up-short"></i>
    </button>
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

document.addEventListener("DOMContentLoaded", function () {
        const volta_topoButton = document.getElementById("volta_topo");

        // Exibir ou ocultar o botão conforme o usuário rola a página
        window.addEventListener("scroll", function () {
            if (window.scrollY > 80) {
                volta_topoButton.classList.add("show");
            } else {
                volta_topoButton.classList.remove("show");
            }
        });

        // Função para rolar suavemente até o topo
        window.scrollparatopo = function () {
            window.scrollTo({ top: 0, behavior: "smooth" });
        };
    });

</script>

</body>
</html>

