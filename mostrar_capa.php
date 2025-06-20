<?php
include "navbar.php";
include 'config.php'; 

$link = $_GET["manga"] ?? null;
$generos = [];
$lidos = [];

// Busca os dados do mangá pelo link
$manga = buscar_obra_mais($ligaDB,null,$link);

if(!$manga){
    header("Location:/arenaread/404.php");
    exit;
}

// Se o mangá for encontrado, pega o ID
if ($manga) {
    $id_manga = $manga['id_manga'];
}

// Busca os capítulos do mangá
$consulta_capitulos = "SELECT DISTINCT c.* from capitulos c inner join paginas p on c.id_capitulos = p.id_capitulos where c.id_manga = ? order by c.num_capitulo ASC";

$stmt_capitulos = $ligaDB->prepare($consulta_capitulos);
$stmt_capitulos->bind_param("i", $id_manga);
$stmt_capitulos->execute();
$result_capitulos = $stmt_capitulos->get_result();

// Busca os géneros do mangá
$consulta_generos = "SELECT g.nome_genero from manga_generos mg join generos g ON mg.id_genero = g.id_genero  where mg.id_manga = ?";
$stmt_generos = $ligaDB->prepare($consulta_generos);
$stmt_generos->bind_param("i", $id_manga);
$stmt_generos->execute();
$result_generos = $stmt_generos->get_result();

// Adiciona os géneros ao array
while ($row = $result_generos->fetch_assoc()) {
    $generos[] = $row['nome_genero'];
}

$lidos = [];
if (isset($_SESSION["iduser"])) {
$lidos = capitulos_lidos($ligaDB, $_SESSION["iduser"], $manga["link"]);
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($manga['titulo']) ?></title>
    <link rel="stylesheet" href="css/capa.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>

<div class="container">
    <div class="manga-header">
        <img src="<?php echo $manga['capa'] ?>" alt="Capa do Mangá">
        <div class="manga-info">
            <h1><?php echo htmlspecialchars($manga['titulo']) ?></h1>

            <?php if (!empty($generos)): ?>
                <div class="generos-tags">
                    <?php foreach ($generos as $genero): ?>
                        <span class="genero-tag"><?php echo htmlspecialchars($genero) ?></span>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>

            <p class="status">Status: <?php echo htmlspecialchars($manga['status']) ?></p>
            <p class="tipo">Tipo: <?php echo htmlspecialchars($manga['tipo']) ?></p>
            <p class="autor">Autor: <?php echo htmlspecialchars($manga['autor']) ?></p>
            <p class="artista">Artista: <?php echo htmlspecialchars($manga['artista']) ?></p>
            <p class="ano">Ano de Lançamento: <?php echo htmlspecialchars($manga['ano_lancado']) ?></p>
        </div>
    </div>

    <div class="manga-sinopse">
        <h2>Sinopse</h2>
        <p><?php echo nl2br(htmlspecialchars($manga['sinopse'])) ?></p>
    </div>
</div>

<div class="chapter-list">
    <h2>Capítulos</h2>
    <div class="chapters">
        <?php while ($capitulo = $result_capitulos->fetch_assoc()): ?>
            <?php
                $classe_lido = '';
                if (isset($_SESSION['iduser']) && in_array((int) $capitulo['num_capitulo'], $lidos)) {
                    $classe_lido = 'capitulo-lido';
                }
            ?>
        <form action="/arenaread/<?php echo $manga['link'] ?>/capitulo-<?php echo $capitulo['num_capitulo'] ?>" method="POST" class="hidden-form">
            <input type="hidden" name="id_capitulo" value="<?php echo $capitulo['id_capitulos'] ?>">
                <button type="submit" class="chapter-button <?php echo $classe_lido ?>">
                    Capítulo <?php echo $capitulo['num_capitulo'] ?>
                        <span class="chapter-date"><?php echo date('d M, Y', strtotime($capitulo['data_lancamento'])) ?></span>
                </button>
        </form>
        <?php endwhile; ?>
    </div>
</div>

</body>
</html>

