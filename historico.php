<?php
include "config.php";
include "navbar.php";

$id_conta = $_SESSION["iduser"];
$historico = [];

// Busca todos os progressos do utilizador
$sql_historico = "SELECT up.link_manga, up.capitulos_lidos, up.data_update, m.titulo, m.capa, m.link from user_progress up inner join mangas m on up.link_manga = m.link where up.iduser = ?  order by up.data_update DESC";

$stmt_historico = $ligaDB->prepare($sql_historico);
$stmt_historico->bind_param("i", $id_conta);
$stmt_historico->execute();
$result_historico = $stmt_historico->get_result();

$obras = [];
while ($linha = $result_historico->fetch_assoc()) {
    $capitulos = json_decode($linha['capitulos_lidos'], true);
    if (is_array($capitulos) && count($capitulos) > 0) {
        rsort($capitulos); // Ordena decrescente
        $linha['capitulos_recentes'] = array_reverse(array_slice($capitulos, 0, 3));
        $linha['data_leitura'] = date("d/m/Y H:i", strtotime($linha['data_update']));
        $obras[] = $linha;
    }
}
?>

<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Histórico</title>
    <link rel="stylesheet" href="css/historico.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>

<body>
    <h1 class="titulo">Histórico</h1>
    <div class="historico-lista">
        <?php foreach ($obras as $obra): ?>
            <div class="historico-card">
                <img src="<?php echo htmlspecialchars($obra['capa']) ?>" alt="Capa" class="historico-capa">
                <div class="historico-info">
                    <div class="historico-titulo"><?php echo htmlspecialchars($obra['titulo']) ?></div>
                    <div class="historico-capitulos">
                        <span class="historico-legenda">Últimos capítulos lidos:</span>
                        <?php foreach ($obra['capitulos_recentes'] as $cap): ?>
                            <a class="historico-cap" href="/arenaread/<?php echo $obra['link'] ?>/capitulo-<?php echo $cap ?>">
                                Capítulo <?php echo $cap ?>
                            </a>
                        <?php endforeach; ?>
                    </div>
                    <div class="historico-data">
                        <small>Última leitura: <?php echo $obra['data_leitura']; ?></small>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>

    <footer class="footer">
        <p><a href="termos.php">Termos e Condições</a> |
            <a href="privacidade.php">Política de Privacidade</a>
        </p>
        <p>Contacto: arenaread.devv@gmail.com</a></p>
    </footer>
</body>

</html>