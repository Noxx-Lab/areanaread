<?php
include "navbar.php";
include 'config.php';
// Buscar o ID do mangá (por enquanto fixo, mas podes passar por GET)
$id_manga = 1;


$consulta = "SELECT * FROM mangas WHERE id_manga = ?";
$stmt = $ligaDB->prepare($consulta);
$stmt->bind_param("s", $id_manga);
$stmt->execute();
$result = $stmt->get_result();
$manga = $result->fetch_assoc();

$consulta_capitulos = "SELECT * FROM capitulos WHERE id_manga = ? ORDER BY num_capitulo ASC";
$stmt_capitulos = $ligaDB->prepare($consulta_capitulos);
$stmt_capitulos->bind_param("s", $id_manga);
$stmt_capitulos->execute();
$result_capitulos = $stmt_capitulos->get_result();

?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $manga['titulo']; ?></title>
    <link rel="stylesheet" href="css/capa.css">
</head>
<body>
    <div class="container">
        <div class="manga-header">
            <img src="<?php echo $manga['capa']; ?>" alt="Capa do Mangá">
            <div class="manga-info">
                <h1><?php echo $manga['titulo']; ?></h1>
                <p class="status">Status: <?php echo $manga['status']; ?></p>
                <p class="tipo">Tipo: <?php echo $manga['tipo']; ?></p>
                <p class="autor">Autor: <?php echo $manga['autor']; ?></p>
                <p class="artista">Artista: <?php echo $manga['artista']; ?></p>
                <p class="ano">Ano de Lançamento: <?php echo $manga['ano_lancado']; ?></p>
            </div>
        </div>
        <div class="manga-sinopse">
            <h2>Sinopse</h2>
            <p><?php echo $manga['sinopse']; ?></p>
        </div>
    </div>
    <div class="chapter-list">
    <h2>Capítulos</h2>
    <div class="chapters">
        <?php while ($capitulo = $result_capitulos->fetch_assoc()): ?>
            <a href="ler_capitulo.php?id=<?php echo $capitulo['id_capitulos']; ?>" class="chapter-button">
                Capítulo <?php echo $capitulo['num_capitulo']; ?>
                <span class="chapter-date"><?php echo date('d M, Y', strtotime($capitulo['data_lancamento'])); ?></span>
            </a>
        <?php endwhile; ?>
            </div>
        </div>
    </div>
</body>
</html>
