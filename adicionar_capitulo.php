<?php
include 'config.php';
include 'navbar.php';

$mensagem = "";
if (isset($_SESSION['mensagem'])) {
    $mensagem = $_SESSION['mensagem'];
    unset($_SESSION['mensagem']);
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_manga = $_POST["id_manga"];
    $num_capitulo = $_POST['num_capitulo'];

    // Verifica se já existe esse capítulo para o mangá
    $verificar_cap = "Select count(*) From capitulos Where id_manga = ? and num_capitulo = ?";
    $stmt_verificar = $ligaDB->prepare($verificar_cap);
    $stmt_verificar->bind_param("ii", $id_manga, $num_capitulo);
    $stmt_verificar->execute();
    $stmt_verificar->bind_result($existe);
    $stmt_verificar->fetch();
    $stmt_verificar->close();


    if ($existe > 0){
        $_SESSION['mensagem'] = "<p class='erro'> Este capítulo já existe para este manga </p>";
    }
    else{
        // Inserir os dados do capítulo na base de dados
        $sql_insert = "INSERT into capitulos (id_manga, num_capitulo) values (?, ?)";
        $stmt_insert = $ligaDB->prepare($sql_insert);
        $stmt_insert->bind_param("ii", $id_manga, $num_capitulo);

        if ($stmt_insert->execute()) {
            $_SESSION['mensagem'] = "<p class='sucesso'> Capítulo adicionado com sucesso!</p>";
        } else {
            $_SESSION['mensagem'] = "<p class='erro'> Erro ao adicionar o Capítulo.</p>";
        }
        }
        header("Location: adicionar_capitulo.php?id_manga=$id_manga");
        exit;
    }
    $id_manga = isset($_GET["id_manga"]) ? $_GET["id_manga"] : null;

    // Busca os dados da obra selecionado
    $sqlmanga = "SELECT * from mangas where id_manga = ?";
    $stmtManga = $ligaDB->prepare($sqlmanga);
    $stmtManga->bind_param("i", $id_manga);
    $stmtManga->execute();
    $resultManga = $stmtManga->get_result();
    $manga = $resultManga->fetch_assoc();
    $stmtManga->close();

    // Busca os capítulos da obra selecionado
    $capitulos = [];
    $sql_cap = "SELECT num_capitulo, data_lancamento from capitulos where id_manga = ? order by num_capitulo Desc";
    $stmt_cap = $ligaDB->prepare($sql_cap);
    $stmt_cap->bind_param("i", $id_manga);
    $stmt_cap->execute();
    $result_cap = $stmt_cap->get_result();
    while ($res = $result_cap->fetch_assoc()) {
    $capitulos[] = $res;
    }
    $stmt_cap->close();

?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Capítulo</title>
    <link rel="stylesheet" href="css/adicionar_capitulos.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
    <div class="container">
        <div class="capitulos-container">
        <a href="uploud.php" class="btn-voltar">
        <i class="bi bi-arrow-left-square"></i> Voltar</a>
            <div class="manga-info">
                <?php if ($manga): ?>
                <img src="<?php echo $manga['capa']; ?>" alt="Capa do Mangá">
                <p><strong>Tipo:</strong> <?php echo $manga['tipo']; ?></p>
                <?php endif; ?>
            </div>

            <!-- Lista de Capítulos -->
            <div class="capitulos-list">
                <h3>Capítulos Disponíveis</h3>
                <?php if (!empty($capitulos) && count($capitulos) > 0): ?>
                <div class="capitulos-grid">
                    <?php foreach ($capitulos as $capitulo): ?>
                        <div class="capitulo-card">
                            <strong>Capítulo <?php echo $capitulo['num_capitulo']; ?></strong>
                            <p><?php echo date("d M, Y", strtotime($capitulo['data_lancamento'])); ?></p>
                        </div>
                        <?php endforeach; ?>
                </div>
                <?php else: ?>
                    <p class="sem-cap">Esta obra não tem capítulos adicionados</p>
                <?php endif ?>
            </div>

            <!-- Formulário para adicionar capítulo -->
            <div class="capitulo-form">
                <h2><i class="bi bi-plus-circle"></i> Adicionar Capítulo</h2>
                    <div class="mensagem">
                        <?php echo $mensagem; ?>
                    </div>

            <form action="adicionar_capitulo.php?id_manga=<?php echo $id_manga; ?>" method="post">
                <input type="hidden" name="id_manga" value="<?php echo $id_manga; ?>">
                <input type="number" name="num_capitulo" placeholder="Número do Capítulo Ex: 1, 2, 3..." required>
                <button type="submit">Adicionar Capítulo</button>
            </form>
        </div>
    </div>
</body>
</html>
