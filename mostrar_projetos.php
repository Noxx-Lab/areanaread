<?php
include 'config.php'; // Conexão com o banco de dados
include "navbar.php";

$sqlmangas = "SELECT id_manga, titulo, status, tipo, capa, link from mangas";
$resultmangas = $ligaDB->query($sqlmangas);

// Preparar array com os mangás + total de capítulos
$mangas_com_capitulos = [];

while ($manga = $resultmangas->fetch_assoc()) {
    $id_manga = $manga['id_manga'];

    // Buscar número de capítulos para o mangá atual
    $stmt = $ligaDB->prepare("SELECT COUNT(*) as total from capitulos where id_manga = ?");
    $stmt->bind_param("i", $id_manga);
    $stmt->execute();
    $result = $stmt->get_result();
    $capitulos = $result->fetch_assoc()['total'];

    // Adiciona o total ao array do mangá
    $manga['total_capitulos'] = $capitulos;

    $mangas_com_capitulos[] = $manga;}

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Mangás</title>
    <link rel="stylesheet" href="css/projetos.css">
</head>
<body>

<div class="lista-container">
    <h2 class="titulo-lista">Lista de Projetos</h2>
    <div class="manga-grid" id="manga-list">
        <?php foreach ($mangas_com_capitulos as $index => $manga): ?>
            <div class="manga-card" style="display: <?php echo $index < 20 ? 'block' : 'none'; ?>">
                <a href="/arenaread/<?php echo $manga['link']; ?>">
                    <img src="<?php echo $manga['capa']; ?>" alt="<?php echo $manga['titulo']; ?>">
                </a>
                <h3><?php echo $manga['titulo']; ?></h3>
                <p>Status: <?php echo $manga['status']; ?></p>
                <p>Tipo: <?php echo $manga['tipo']; ?></p>
                <p>Capítulos: <?php echo $manga['total_capitulos']; ?></p>
            </div>
        <?php endforeach; ?>
    </div>
</div>
    <div id="linha-divisoria" class="linha-divisoria" style="display: none;"></div>
    <button id="carregarMais" class="botao-carregar">CARREGUE MAIS</button>

<script>
    const cards = document.querySelectorAll('.manga-card');
    const btn = document.getElementById('carregarMais');
    const linha = document.getElementById('linha-divisoria');
    let visiveis = 20;

    btn.addEventListener('click', function () {
        let mostrados = 0;
        for (let i = visiveis; i < cards.length && mostrados < 20; i++) {
            cards[i].style.display = 'block';
            mostrados++;
        }
        visiveis += mostrados;
        linha.style.display = 'block';

        if (visiveis >= cards.length) {
            btn.style.display = 'none';
        }
    });
</script>
</body>
</html>
