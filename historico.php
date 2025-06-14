<?php
include "config.php";
include "navbar.php";

$id_conta = $_SESSION["iduser"];
$historico = [];

// Busca todos os capítulos lidos pelo user, ordenados por data_leitura
$sql_historico = "SELECT up.id_manga, m.titulo, m.capa, m.link, c.num_capitulo, c.id_capitulos from user_progress up inner join mangas m on up.id_manga = m.id_manga inner join capitulos c on up.id_capitulo = c.id_capitulos where up.id_user = ? order by up.data_leitura DESC";
$stmt_historico = $ligaDB->prepare($sql_historico);
$stmt_historico->bind_param("i", $id_conta);
$stmt_historico->execute();
$result_historico = $stmt_historico->get_result();

$obras = [];
while ($historico = $result_historico->fetch_assoc()) {
    $id_manga = $historico['id_manga'];
    // Se ainda não foi mostrada esta obra, guarda só o primeiro registo (capítulo mais recente)
    if (!isset($obras[$id_manga])) {
        $obras[$id_manga] = $historico;
    }
}
?>

<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historico</title>
    <link rel="stylesheet" href="css/historico.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>

<body>
    <h1 class="titulo">Historico</h1>
    <div class="historico-lista">
        <?php foreach ($obras as $obra): ?>
                <div class="historico-card">
                    <img src="<?php echo htmlspecialchars($obra['capa']) ?>" alt="Capa" class="historico-capa">
                    <div class="historico-info">
                        <div class="historico-titulo"><?php echo htmlspecialchars($obra['titulo']) ?></div>
                        <div class="historico-capitulos">
                            <span class="historico-legenda">Último capítulo lido foi:</span>
                            </div>
                             <a class="historico-cap"
                                href="/arenaread/<?php echo $obra['link'] ?>/capitulo-<?php echo $obra['num_capitulo'] ?>">
                               Capítulo <?php echo $obra['num_capitulo'] ?>
                            </a>
                        </div>
                    </div>
        <?php endforeach; ?>
    </div>

    <footer class="footer">
  <p><a href="termos.php">Termos e Condições</a> | 
     <a href="privacidade.php">Política de Privacidade</a></p>
  <p>Contacto: arenaread.devv@gmail.com</a></p>
</footer>
</body>


</html>