<?php
session_start();
include("config.php");

$pesquisa = isset($_GET["pesquisa"]) ? $_GET["pesquisa"] :"";
if(strlen($pesquisa) < 1) exit;

$sql_pesquisa = "Select id_manga, titulo, capa, status,link from mangas where titulo like ?  limit 7";
$stmt_pesquisa = $ligaDB->prepare($sql_pesquisa);
$pesquisa = "%$pesquisa%";
$stmt_pesquisa->bind_param("s", $pesquisa);
$stmt_pesquisa->execute();
$result_pesquisa = $stmt_pesquisa->get_result();

if($result_pesquisa->num_rows == 0) {
    echo "<div class='search-item'>Nenhuma obra encontrada.</div>";
    exit;
}       
while($obra = $result_pesquisa->fetch_assoc()){
    $id_manga = $obra["id_manga"];
    $contar = contar($ligaDB,$id_manga, "cap_por_obra");


    $generos = [];
    $gen = generos($ligaDB,$id_manga);
    foreach($gen as $g){
        $generos[] = $g["nome_genero"];
    }
    $generos_str = implode(", ",$generos);
    ?>
    <div class="search-item" onclick="window.location.href='/arenaread/<?php echo $obra['link']; ?>'">
    <img src="<?= htmlspecialchars($obra['capa']) ?>" class="search-cover" alt="Capa">
        <div class="search-info">
            <div class="search-title"><?php echo htmlspecialchars($obra['titulo']) ?></div>
            <div class="search-status"><?php echo htmlspecialchars($obra['status']) ?> . Cap. <?php echo $contar ?></div>
            <div class="search-genres"><?php echo htmlspecialchars($generos_str) ?></div>
        </div>
    </div>
    <?php
}

?>