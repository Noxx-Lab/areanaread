<?php
include 'config.php'; // Conexão com o banco de dados
include "navbar.php";

$sqlmangas = "SELECT id_manga, titulo, status, tipo, capa FROM mangas";
$resultmangas = $ligaDB->query($sqlmangas);

/*$sql_count = "SELECT count(num_capitulo) from capitulos where id_manga = ?";
$stmt_count = $ligaDB ->prepare($sql_count);
$stmt_count -> bind_param("i", $manga['id_manga'] );
$stmt_count ->execute();
$result_count = $stmt_count->get_result();
$count = $result_count->fetch_assoc()*/
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
    <div class="manga-grid">
        <?php while ($manga = $resultmangas->fetch_assoc()): ?>
            <div class="manga-card">
                <a href="mostrar_capa.php?id=<?php echo $manga['id_manga']; ?>">
                    <img src="<?php echo $manga['capa']; ?>" alt="<?php echo $manga['titulo']; ?>">
                </a>
                <h3><?php echo $manga['titulo']; ?></h3>
                <p>Status: <?php echo $manga['status']; ?></p>
                <p>Tipo: <?php echo $manga['tipo']; ?></p>
            </div>
        <?php endwhile; ?>
    </div>
</div>

</body>
</html>
