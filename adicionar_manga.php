<?php
include 'config.php';
include 'navbar.php';
include 'cloudinary.php';

use Cloudinary\Api\Upload\UploadApi;

$uploadApi = new UploadApi();
$mensagem = "";

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES['file']) && !empty($_FILES['file']['name'])) {
    $titulo = $_POST['titulo'];
    $tipo = $_POST['tipo'];
    $status = $_POST['status'];
    $sinopse = $_POST['sinopse'];
    $autor = $_POST['autor'];
    $artista = $_POST['artista'];

    // Formatar o nome do mangá para URL (removendo caracteres especiais e espaços)
    $nomeManga = strtolower(str_replace(' ', '-', preg_replace('/[^A-Za-z0-9 ]/', '', $titulo)));

    $nomeArquivo = basename($_FILES['file']['name']);
    $tempFile = $_FILES['file']['tmp_name'];

    if (empty($nomeArquivo) || empty($tempFile)) {
        $mensagem = "<p class = 'erro'>❌ Upload cancelado! Arquivo inválido.</p>";
    }

    $extensao = pathinfo($nomeArquivo, PATHINFO_EXTENSION);

    if (empty($extensao)) {
        $mensagem = "<p class = 'erro'>❌ Upload cancelado! O arquivo '$nomeArquivo' não tem uma extensão válida.</p>";
    }

    $extensao = strtolower($extensao);
    $extensoesPermitidas = ['jpg', 'png'];

    if (!in_array($extensao, $extensoesPermitidas)) {
        die("<p class = 'erro'>❌ Upload cancelado! Formato não permitido: '$nomeArquivo'.</p>");
    }

    try {
        // Upload para Cloudinary antes de inserir no banco de dados
        $upload = $uploadApi->upload($tempFile, [
            "folder" => "capas/",
            "use_filename" => true,
            "unique_filename" => false
        ]);

        if (!isset($upload["secure_url"])) {
            $mensagem = "<p class = 'erro'>❌ Upload cancelado! Erro ao enviar para o Cloudinary: '$nomeArquivo'.</p>";
        }

        // Define a capa do mangá com o link do Cloudinary
        $capa = $upload["secure_url"];

    } catch (Exception $e) {
        $mensagem = "<p class = 'erro'>❌ Upload cancelado! Erro: " . $e->getMessage() . "</p>";
    }

    // Inserir os dados do mangá na base de dados
    $sql = "INSERT INTO mangas (titulo, tipo, status, sinopse, autor, artista, capa) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $ligaDB->prepare($sql);
    $stmt->bind_param("sssssss", $titulo, $tipo, $status, $sinopse, $autor, $artista, $capa);

    if ($stmt->execute()) {
        $mensagem = "<p class = 'sucesso'>✅ Mangá adicionado com sucesso!</p>";
    } else {
        $mensagem = "<p class = 'erro'>❌ Erro ao adicionar o mangá.</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Manga</title>
    <link rel="stylesheet" href="css/adicionar_manga.css">
</head>
<body>

<div class="upload-container">
    <h2><i class="bi bi-plus-circle"></i> Adicionar Novo Mangá</h2>

    <div class="mensagem">
        <?php echo $mensagem; ?>
    </div>

    <form action="adicionar_manga.php" method="POST" enctype="multipart/form-data">
        <input type="text" name="titulo" placeholder="Título" required>
        <select name="tipo" required>
            <option value="">Tipo</option>
            <option value="Manga">Manga</option>
            <option value="Manhua">Manhua</option>
            <option value="Manhwa">Manhwa</option>
            <option value="Comic">Comic</option>
            <option value="Novel">Novel</option>
        </select>
        <select name="status" required>
            <option value="">Status</option>
            <option value="Ongoing">Ongoing</option>
            <option value="Hiatus">Hiatus</option>
            <option value="Finalizado">Finalizado</option>
            <option value="Dropado">Dropado</option>
            <option value="Lançamento">Lançamento</option>
        </select>
        <textarea name="sinopse" placeholder="Sinopse" required></textarea>
        <input type="text" name="autor" placeholder="Autor">
        <input type="text" name="artista" placeholder="Artista">
        
        <!-- Botão de Upload com atualização do texto -->
        <label for="file-upload" class="custom-file-upload">
            <i class="bi bi-file-earmark-arrow-up"></i> <span id="file-label">Escolher Arquivo para a Capa</span>
        </label>
        <input type="file" name="file" id="file-upload" required>

        <button type="submit" class="upload-btn">Adicionar</button>
    </form>
</div>

<script>
// Atualiza o texto do botão ao selecionar um arquivo
document.getElementById("file-upload").addEventListener("change", function() {
    let fileLabel = document.getElementById("file-label");
    if (this.files.length > 0) {
        fileLabel.textContent = "1 arquivo selecionado";
    } else {
        fileLabel.textContent = "Escolher Arquivo";
    }
});
</script>
</body>
</html>