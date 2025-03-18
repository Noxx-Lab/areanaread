<?php
include 'config.php'; // Conexão com o banco de dados
include "navbar.php";
include "cloudinary.php"; // Configuração do Cloudinary

use Cloudinary\Api\Upload\UploadApi;

$uploadApi = new UploadApi(); 

$mensagem = isset($_SESSION['mensagem']) ? $_SESSION['mensagem'] : "";
unset($_SESSION['mensagem']); // Remove a mensagem após exibi-la

// Buscar todos os mangás para exibição na página
$sqlmangas = "SELECT id_manga, titulo, capa FROM mangas";
$resultmangas = $ligaDB->query($sqlmangas);

// Verifica se um mangá foi selecionado para buscar os capítulos
$id_manga_selecionado = isset($_POST['id_manga']) ? $_POST['id_manga'] : null;
$capitulos = [];

if ($id_manga_selecionado) {
    $sqlCapitulos = "SELECT id_capitulos, num_capitulo FROM capitulos WHERE id_manga = ? Order by num_capitulo ASC";
    $stmtCapitulos = $ligaDB->prepare($sqlCapitulos);
    $stmtCapitulos->bind_param("i", $id_manga_selecionado);
    $stmtCapitulos->execute();
    $resultCapitulos = $stmtCapitulos->get_result();

    while ($row = $resultCapitulos->fetch_assoc()) {
        $capitulos[] = $row;
    }
}


// ✅ VERIFICA SE O UPLOAD ESTÁ SENDO FEITO (APENAS SE TIVER ARQUIVOS)
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES['files']) && count($_FILES['files']['name']) > 0 && !empty($_FILES['files']['name'][0])) {
    $id_manga = $_POST["id_manga"];
    $id_capitulo = $_POST["id_capitulo"];


    $sql_num_capitulo = "SELECT num_capitulo FROM capitulos where id_capitulos = ? and id_manga = ?";
    $stmt_num_cap = $ligaDB->prepare($sql_num_capitulo);
    $stmt_num_cap->bind_param("ii", $id_capitulo, $id_manga);
    $stmt_num_cap->execute();
    $result_num_capitulo = $stmt_num_cap->get_result();
    $num_capitulo = $result_num_capitulo->fetch_assoc()['num_capitulo'];


    // Buscar o nome do mangá no banco de dados
    $sqlManga = "SELECT titulo FROM mangas WHERE id_manga = ?";
    $stmtManga = $ligaDB->prepare($sqlManga);
    $stmtManga->bind_param("i", $id_manga);
    $stmtManga->execute();
    $resultManga = $stmtManga->get_result();
    $rowManga = $resultManga->fetch_assoc();    

    if (!$rowManga) {
        $_SESSION['mensagem'] = "<p class='erro'> Erro: Mangá não encontrado.</p>";
    }

    // Formatar o nome do mangá para URL
    $nomeManga = strtolower(str_replace(' ', '-', preg_replace('/[^A-Za-z0-9 ]/', '', $rowManga['titulo'])));
    $arquivos = $_FILES['files']; 
    $totalArquivos = count($arquivos['name']);


    for ($i = 0; $i < $totalArquivos; $i++) {
        $nomeArquivo = basename($arquivos['name'][$i]);
        $tempFile = $arquivos['tmp_name'][$i];

        if (empty($nomeArquivo) || empty($tempFile)) {
            $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Arquivo inválido.</p>";
        }

        $extensao = pathinfo($nomeArquivo, PATHINFO_EXTENSION);
        
        if (empty($extensao)) {
            $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! O arquivo '$nomeArquivo' não tem uma extensão válida</p>";
        }
        $extensao = strtolower($extensao);
        $extensoesPermitidas = ['jpg', 'jpeg', 'png', "webp"];

            if (!in_array($extensao, $extensoesPermitidas)) {
                $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Formato não permitido: '$nomeArquivo'</p>";
        }

        if($extensao !== "webp"){
            // 📌 **Converter para WebP**
            $novoArquivoWebP = sys_get_temp_dir() . '/' . pathinfo($nomeArquivo, PATHINFO_FILENAME) . ".webp";

            if ($extensao === "jpg" || $extensao === "jpeg") {
                $image = imagecreatefromjpeg($tempFile);
            } else {
                $image = imagecreatefrompng($tempFile);
            }

            if ($image) {
                imagewebp($image, $novoArquivoWebP, 90); // Qualidade 90%
                imagedestroy($image);
                $tempFile = $novoArquivoWebP; // Substituir pelo WebP
            } else {
                $_SESSION['mensagem'] = "<p class='erro'> Erro ao processar imagem '$nomeArquivo'.</p>";
                continue;
            }
        }

        try {
            // Upload para Cloudinary
            $upload = $uploadApi->upload($tempFile, [
                "folder" => "mangas/$nomeManga/capitulo-$num_capitulo/"
            ]);

            if (!isset($upload["secure_url"])) {
                $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Erro ao fazer upload para o Cloudinary: '$nomeArquivo'</p>";
            }

            $caminhoArquivo = $upload["secure_url"];

            // Inserir no banco de dados
            $sql = "INSERT INTO paginas (id_manga, id_capitulos, caminho_pagina) VALUES (?, ?, ?)";
            $stmt = $ligaDB->prepare($sql);
            $stmt->bind_param("iis", $id_manga, $id_capitulo, $caminhoArquivo);

            if (!$stmt->execute()) {
                $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Erro ao salvar no banco de dados: '$nomeArquivo'</p>";
            }
        } catch (Exception $e) {
            $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Falha no upload de '$nomeArquivo': " . $e->getMessage() . "</p>";
        }
    }
    $_SESSION['mensagem'] = "<p class='sucesso'>Todos os arquivos foram enviados com sucesso!</p>";
    header("Location: uploud.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload de Capítulos</title>
    <link rel="stylesheet" href="css/uploud.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body>


<div class="upload-container">

<div class="button-group">
    <a href="adicionar_manga.php" class="add-manga" title="Adicionar uma obra nova">
        <i class="bi bi-journal-plus"></i> Adicionar Obra
    </a> 

    <a href="javascript:void(0);" id="add-capitulo" class="add-capitulo disabled" title="Selecione um mangá primeiro">
        <i class="bi bi-journal-text"></i> Adicionar Capítulos
    </a>
</div>


<form id="formUpload" action="uploud.php" method="POST" enctype="multipart/form-data">
    <h3>Selecione o Mangá:</h3>
    <div class="manga-list">
        <?php while ($manga = $resultmangas->fetch_assoc()): ?>
            <label class="manga-card">
                <input type="radio" name="id_manga" value="<?php echo $manga['id_manga']; ?>" 
                       onchange="this.form.submit()" 
                       <?php echo ($id_manga_selecionado == $manga['id_manga']) ? 'checked' : ''; ?> required>
                <img src="<?php echo $manga['capa']; ?>" alt="<?php echo $manga['titulo']; ?>">
                <span><?php echo $manga['titulo']; ?></span>
            </label>
        <?php endwhile; ?>
    </div>

    <?php if ($id_manga_selecionado): ?>
        <h3>Selecione o Capítulo:</h3>
        <div class="dropdown">
            <select name="id_capitulo" required>
                <option value="">Selecionar capítulo</option>
                <?php foreach ($capitulos as $capitulo): ?>
                    <option value="<?php echo $capitulo['id_capitulos']; ?>">
                        Capítulo <?php echo $capitulo['num_capitulo']; ?>
                    </option>
                <?php endforeach; ?>
            </select>
        </div>

        <label for="file-upload" class="custom-file-upload">
            <i class="bi bi-file-earmark-arrow-up"></i> <span id="file-label">Escolher Arquivos</span>
        </label>
        <input type="file" name="files[]" id="file-upload" multiple required>

        <button type="submit" class="upload-btn" id="submit-btn">
            <i class="bi bi-upload"></i> Enviar Arquivos
        </button>

        <!-- Spinner de Loading -->
        <div class="loading-spinner" id="loading-spinner" style="display: none;"></div>

        <!-- Área para exibir mensagens -->
        <div class="mensagem" id="mensagem">
            <?php echo $mensagem; ?>
        </div>
    <?php endif; ?>
    </form>
</div>

<script>
//O que conta e diz quantos ficheiros foram selecionados
document.getElementById("file-upload").addEventListener("change", function() {
    let fileCount = this.files.length; 
    let label = document.getElementById("file-label");

    if (fileCount > 0) {
        label.textContent = `${fileCount} arquivo(s) selecionado(s)`;
    } else {
        label.textContent = "Escolher Arquivos";
    }
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

//E o que seleciona do select mt dor de cabeça
document.addEventListener("DOMContentLoaded", function () {
    let mangaRadios = document.querySelectorAll('input[name="id_manga"]');
    let addCapituloBtn = document.getElementById("add-capitulo");

    function verificarSelecao() {
        let mangaSelecionado = document.querySelector('input[name="id_manga"]:checked');
        if (mangaSelecionado) {
            addCapituloBtn.classList.remove("disabled");
            addCapituloBtn.classList.add("enabled");
            addCapituloBtn.setAttribute("href", "adicionar_capitulo.php?id_manga=" + mangaSelecionado.value);
            addCapituloBtn.setAttribute("title", "Adicionar Capítulo Novo");
        } else {
            addCapituloBtn.classList.add("disabled");
            addCapituloBtn.classList.remove("enabled");
            addCapituloBtn.setAttribute("href", "javascript:void(0);");
            addCapituloBtn.setAttribute("title", "Selecione um mangá primeiro");
        }
    }

    // Verifica a seleção ao carregar a página
    verificarSelecao();

    // Verifica a seleção sempre que um mangá for selecionado
    mangaRadios.forEach(radio => {
        radio.addEventListener("change", verificarSelecao);
    });
});
</script>


</body>
</html>
