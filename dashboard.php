<?php
include "config.php";
include "navbar.php";
$pagina_atual = "dashboard";
include "sidebar.php";

if (!isset($_SESSION['rank']) || !in_array($_SESSION['rank'], ['admin', 'editor'])) {
    header("Location: index.php");
    exit;
}
//Total de obras (Manga)
$total_obras = $ligaDB->query("SELECT count(*) from mangas")->fetch_column();

//Capitulos por obra (Manga)
$capitulos_por_obras = $ligaDB->query("SELECT 
    SUM(total_capitulos BETWEEN 1 AND 20) AS '1_20',
    SUM(total_capitulos BETWEEN 21 AND 80) AS '21_80',
    SUM(total_capitulos BETWEEN 81 AND 150) AS '81_150',
    SUM(total_capitulos BETWEEN 151 AND 250) AS '151_250',
    SUM(total_capitulos >= 251) AS '251+'
FROM (
    SELECT COUNT(c.id_capitulos) AS total_capitulos
    FROM mangas m
    LEFT JOIN capitulos c ON m.id_manga = c.id_manga
    GROUP BY m.id_manga
    HAVING total_capitulos > 0
) AS obra_caps
")->fetch_assoc();


//Obra mais lida
$mais_lido = $ligaDB->query("SELECT m.titulo, count(DISTINCT up.id_manga) as leitures
from mangas m join user_progress up on m.id_manga = up.id_manga group by m.id_manga
order by leitures DESC limit 1")->fetch_assoc();


//Obtas por genero
$obra_genero = $ligaDB->query("SELECT g.*, count(*) as total from manga_generos mg inner join generos g on mg.id_genero = g.id_genero group by g.nome_genero")->fetch_all(MYSQLI_ASSOC);

$nome_genero = [];
$total_genero = [];

foreach($obra_genero as $genero_obra){
    $nome_genero [] = $genero_obra["nome_genero"];
    $total_genero [] = $genero_obra["total"];
}

//Informação das contas de todos os utilizadores 
$user_info = $ligaDB->query("SELECT email, rank from users group by rank")->fetch_all(MYSQLI_ASSOC);

//Quantidade total de utilizadores registados no site
$total_users = $ligaDB->query("SELECT count(*) as total from users")->fetch_assoc();
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="graficos.js"></script>
</head>
<body>

    <div class="main-content">
        <h1 class="dashboard-titulo">Dashboard</h1>
        <div class="dashboard-cards">
            <div class="dashboard-card">
                <div class="dashboard-card-linha">
                <span class="dashboard-card-titulo">Quantidade total de obras: </span>
                <span class="dashboard-card-valor"><?php echo $total_obras; ?></span>
            </div>
        </div>
        <div class="dashboard-card-obra">
            <div class="dashboard-card-linha">
            <span class="dashboard-card-titulo-obra">A Obras mais Lida: </span>
            <span class="dashboard-card-valor-obra"><?php echo $mais_lido["titulo"]; ?></span>
            </div>
            <span class="dashboard-card-total">Total de leitures: <?php echo $mais_lido["leitures"]; ?></span>

        </div>
        <div class="dashboard-card">
            <div class="dashboard-card-linha">
            <span class="dashboard-card-titulo">Quantidade total de utilizadores: </span>
            <span class="dashboard-card-valor"><?php echo $total_users["total"]; ?></span>
            </div>
        </div>
    </div>
    <div class="dashboard-graficos">
        <div class="grafico-container">
            <h2 class="grafico-obra-titulo">Distribuição de Obras por Capítulos</h2>
            <canvas id="grafico-obras"></canvas>
        </div>
        <div class="dashboard-grafico-box">
            <h2 class="grafico-obra-titulo">Obras por Género</h2>
            <canvas id="grafico-generos"></canvas>
            <div id="legenda-generos"></div>
        </div>
    </div>
</div>

<script>
const obrasPorIntervalo = {
  "1-20": <?php echo $capitulos_por_obras['1_20'] ?? 0 ?>,
"21-80": <?php echo $capitulos_por_obras['21_80'] ?? 0 ?>,
"81-150": <?php echo $capitulos_por_obras['81_150'] ?? 0 ?>,
"151-250": <?php echo $capitulos_por_obras['151_250'] ?? 0 ?>,
"251+": <?php echo $capitulos_por_obras['251+'] ?? 0 ?>
};

const generosLabels = <?php echo json_encode($nome_genero); ?>;
const generosData = <?php echo json_encode($total_genero); ?>;
</script>
    
</body>
</html>