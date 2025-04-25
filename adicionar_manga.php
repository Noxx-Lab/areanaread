<?php
include 'config.php';
include 'navbar.php';
include 'cloudinary.php';

$mensagem = isset($_SESSION['mensagem']) ? $_SESSION['mensagem'] : "";
unset($_SESSION['mensagem']); // Remove a mensagem após exibi-la


use Cloudinary\Api\Upload\UploadApi;

// Buscar todos os géneros da base de dados
$sql_generos = "SELECT id_genero, nome_genero FROM generos ORDER BY nome_genero ASC";
$result_generos = $ligaDB->query($sql_generos);


$uploadApi = new UploadApi();

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES['file']) && !empty($_FILES['file']['name'])) {
    $titulo = $_POST['titulo'];
    $link = $_POST['link'];
    $tipo = $_POST['tipo'];
    $status = $_POST['status'];
    $sinopse = $_POST['sinopse'];
    $autor = $_POST['autor'];
    $artista = $_POST['artista'];
    $ano_lancado = $_POST['ano_lancado'];

    

    // Verificar se o ano é válido
    if ($ano_lancado < 1900 || $ano_lancado > date('Y')) {
        $_SESSION['mensagem'] = "<p class='erro'>❌ Ano de lançamento inválido.</p>";
    }

    // Formatar o nome do mangá para URL (removendo caracteres especiais e espaços)
    $nomeManga = strtolower(str_replace(' ', '-', preg_replace('/[^A-Za-z0-9 ]/', '', $titulo)));

    $nomeArquivo = basename($_FILES['file']['name']);
    $tempFile = $_FILES['file']['tmp_name'];

    if (empty($nomeArquivo) || empty($tempFile)) {
        $_SESSION['mensagem'] = "<p class = 'erro'>❌ Upload cancelado! Arquivo inválido.</p>";
    }

    $extensao = pathinfo($nomeArquivo, PATHINFO_EXTENSION);

    if (empty($extensao)) {
        $_SESSION['mensagem'] = "<p class = 'erro'>❌ Upload cancelado! O arquivo '$nomeArquivo' não tem uma extensão válida.</p>";
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
            $_SESSION['mensagem'] = "<p class = 'erro'>❌ Upload cancelado! Erro ao enviar para o Cloudinary: '$nomeArquivo'.</p>";
        }

        // Define a capa do mangá com o link do Cloudinary
        $capa = $upload["secure_url"];

    } catch (Exception $e) {
        $_SESSION['mensagem'] = "<p class = 'erro'> Upload cancelado! Erro: " . $e->getMessage() . "</p>";
    }

    // Inserir os dados do mangá na base de dados
    $sql = "INSERT INTO mangas (titulo, link, tipo, status, sinopse, autor, artista, ano_lancado, capa) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $ligaDB->prepare($sql);
    $stmt->bind_param("sssssssss", $titulo, $link, $tipo, $status, $sinopse, $autor, $artista, $ano_lancado, $capa);

    $sucesso = false;
    if ($stmt->execute()) {
        $sucesso = true;
        $ultimo_id = $ligaDB->insert_id;
    
        // Inserir os géneros associados
        if (isset($_POST['generos']) && is_array($_POST['generos'])) {
            $stmtGenero = $ligaDB->prepare("INSERT INTO manga_generos (id_manga, id_genero) VALUES (?, ?)");
            foreach ($_POST['generos'] as $id_genero) {
                $id_genero = intval($id_genero);
                $stmtGenero->bind_param("ii", $ultimo_id, $id_genero);
                $stmtGenero->execute();
            }
            $stmtGenero->close();
        }
    
        $_SESSION['mensagem'] = "<p class = 'sucesso'> Obra adicionado com sucesso!</p>";
        header("Location: adicionar_manga.php");
        exit();
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
<div class="page-wrapper">
    <div class="upload-container">
        <h2><i class="bi bi-plus-circle"></i> Adicionar Novo Mangá</h2>


        <form id="formUpload" action="adicionar_manga.php" method="POST" enctype="multipart/form-data">
        <input type="text" name="titulo" id="titulo" placeholder="Título" oninput="gerar_link()" required>
        <input type="text" name="link" id="link" placeholder="Link" readonly required>
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

            <div class="generos-container">
                <button type="button" class="btn-toggle-generos" onclick="toggleGeneros()">Selecionar Géneros</button>

                <input type="text" id="filtro-generos" placeholder="Pesquisar género..." style="display: none;">

                <div class="generos-lista" id="generos-lista" style="display: none;">
                     <?php while($genero = $result_generos->fetch_assoc()): ?>
                    <label class="genero-item">
                        <input type="checkbox" name="generos[]" value="<?= $genero['id_genero'] ?>">
                        <?= htmlspecialchars($genero['nome_genero']) ?>
                    </label>
                    <?php endwhile; ?>
                </div>
            </div>


            <input type="text" name="autor" placeholder="Autor">
            <input type="text" name="artista" placeholder="Artista">
            <input type="number" name="ano_lancado" id="ano_lancado" placeholder="Ano que a obra foi lançada" min="1900" max="<?php echo date('Y'); ?>" required>

        
            <!-- Botão de Upload com atualização do texto -->
            <label for="file-upload" class="custom-file-upload">
                <i class="bi bi-file-earmark-arrow-up"></i> <span id="file-label">Escolher Arquivo para a Capa</span>
            </label>
            <input type="file" name="file" id="file-upload" required>

            <button type="submit" class="upload-btn" id="submit-btn">Adicionar</button>

            <!-- Adiciona o spinner no formulário -->
            <div id="loading-spinner" class="loading-spinner" style="display: none;"></div>

            <div class="mensagem" id="mensagem">
                <?php echo $mensagem; ?>
            </div>
        </form>
    </div>
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

function gerar_link() {
    // Capturar os inputs corretamente
    let tituloInput = document.getElementById("titulo");
    let linkInput = document.getElementById("link");

    if (!tituloInput || !linkInput) {
        console.error("Erro: Elementos do formulário não encontrados.");
        return;
    }

    let titulo = tituloInput.value.trim(); // Remove espaços extras no início e no fim

    // Se o título estiver vazio, limpar o campo do link
    if (titulo === "") {
        linkInput.value = "";
        return;
    }

    // Converter para minúsculas
    let link = titulo.toLowerCase();

    // Remover acentos
    link = link.normalize("NFD").replace(/[\u0300-\u036f]/g, "");

    // Substituir espaços por "-"
    link = link.replace(/\s+/g, "-");

    // Remover caracteres especiais, mantendo apenas letras, números e hífens
    link = link.replace(/[^a-z0-9-]/g, "");

    // Atualizar o campo de link
    linkInput.value = link;
}

function toggleGeneros() {
    const lista = document.getElementById("generos-lista");
    const filtro = document.getElementById("filtro-generos");

    const mostrar = lista.style.display === "none";

    lista.style.display = mostrar ? "grid" : "none";
    filtro.style.display = mostrar ? "block" : "none";
}


document.getElementById("filtro-generos").addEventListener("input", function() {
    let termo = this.value.toLowerCase();
    let generos = document.querySelectorAll(".genero-item");

    generos.forEach(function(item) {
        let texto = item.textContent.toLowerCase();
        item.style.display = texto.includes(termo) ? "flex" : "none";
    });
});

//O que faz o loading
document.addEventListener("DOMContentLoaded", function () {
    let formUpload = document.getElementById("formUpload");
    let submitButton = document.getElementById("submit-btn");
    let loadingSpinner = document.getElementById("loading-spinner");
    let mensagemDiv = document.getElementById("mensagem");

    formUpload.addEventListener("submit", function(event) {
        // Oculta mensagens anteriores
        mensagemDiv.innerHTML = "";

        // Desativa o botão de envio
        submitButton.disabled = true;
        submitButton.innerHTML = "Enviando...";
        
        // Exibe o spinner de loading
        loadingSpinner.style.display = "block";
    });    
});

</script>
</body>
</html>