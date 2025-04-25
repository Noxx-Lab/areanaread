<?php
include 'config.php'; // Conexão com o banco de dados
include "navbar.php";
include "cloudinary.php"; // Configuração do Cloudinary

if (!isset($_SESSION['rank']) || !in_array($_SESSION['rank'], ['admin', 'editor'])) {
    header("Location: index.php");
    exit;
}

use Cloudinary\Api\Upload\UploadApi;

// Instancia a API do Cloudinary
$uploadApi = new UploadApi(); 

$mensagem = isset($_SESSION['mensagem']) ? $_SESSION['mensagem'] : "";
unset($_SESSION['mensagem']);

$sql_obras = "SELECT id_manga, titulo, capa FROM mangas ORDER BY titulo ASC";
$stmt_obra = $ligaDB->prepare($sql_obras);
$stmt_obra-> execute();
$obras = $stmt_obra->get_result()->fetch_all(MYSQLI_ASSOC);

// Verifica se um mangá foi selecionado para buscar os capítulos
$id_manga_selecionado = isset($_GET['id_manga']) ? $_GET['id_manga'] : (isset($_POST['id_manga']) ? $_POST['id_manga'] : null);


$capitulos = [];

// Se houver um mangá selecionado, busca os capítulos desse mangá
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


// VERIFICA SE O UPLOAD ESTÁ SENDO FEITO (APENAS SE TIVER ARQUIVOS)
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

    //Verefica se encontrou alguma obra
    if (!$rowManga) {
        $_SESSION['mensagem'] = "<p class='erro'> Erro: Obra não encontrado.</p>";
    }

    // Formatar o nome do mangá para URL para a Cloudinary  
    $nomeManga = strtolower(str_replace(' ', '-', preg_replace('/[^A-Za-z0-9 ]/', '', $rowManga['titulo'])));
    $arquivos = $_FILES['files']; 
    $totalArquivos = count($arquivos['name']);

    //Loop para enviar varios arquivos
    for ($i = 0; $i < $totalArquivos; $i++) {
        $nomeArquivo = basename($arquivos['name'][$i]);
        $tempFile = $arquivos['tmp_name'][$i];

        //Verifica se o arquivo é valido 
        if (empty($nomeArquivo) || empty($tempFile)) {
            $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Arquivo inválido.</p>";
        }

        //Verifica a extensão é valida 
        $extensao = pathinfo($nomeArquivo, PATHINFO_EXTENSION);
        
        if (empty($extensao)) {
            $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! O arquivo '$nomeArquivo' não tem uma extensão válida</p>";
        }
        $extensao = strtolower($extensao);
        //Extensões permitidas 
        $extensoesPermitidas = ['jpg', 'jpeg', 'png', "webp"];

            if (!in_array($extensao, $extensoesPermitidas)) {
                $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Formato não permitido: '$nomeArquivo'</p>";
        }
        //Se a imagem não for webp ele converte para ajudar no processamento 
        if($extensao !== "webp"){
            // 📌 **Converter para WebP**
            $novoArquivoWebP = sys_get_temp_dir() . '/' . pathinfo($nomeArquivo, PATHINFO_FILENAME) . ".webp";

            // Cria a imagem a partir do tipo original
            if ($extensao === "jpg" || $extensao === "jpeg") {
                $image = imagecreatefromjpeg($tempFile);
            } elseif ($extensao === "png") {
                $image = imagecreatefrompng($tempFile);
            } else {
                $image = false; // Caso não seja reconhecido
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
    <!-- Botão para adicionar novo mangá -->
    <a href="adicionar_manga.php" class="add-manga" title="Adicionar uma obra nova">
        <i class="bi bi-journal-plus"></i> Adicionar Obra
    </a> 

    <a href="<?= $id_manga_selecionado ? "adicionar_capitulo.php?id_manga=$id_manga_selecionado" : 'javascript:void(0);' ?>"
   id="add-capitulo"
   class="add-capitulo <?= $id_manga_selecionado ? 'enabled' : 'disabled' ?>"
   title="<?= $id_manga_selecionado ? 'Adicionar Capítulo Novo' : 'Selecione um mangá primeiro' ?>">
   <i class="bi bi-journal-text"></i> Adicionar Capítulos
</a>

</div>


<form id="formUpload" action="uploud.php" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="id_manga" value="<?= $id_manga_selecionado ?>" required>
    <h3>Selecione uma Obra</h3>
<div class="obras-grid">
  <?php foreach ($obras as $obra): ?>
    <label class="obra-card <?= ($id_manga_selecionado == $obra['id_manga']) ? 'selected' : '' ?>">
      <input type="radio" name="id_manga" value="<?= $obra['id_manga'] ?>" style="display: none" onchange="selecionarObra(this)">
      <img src="<?= $obra['capa'] ?>" alt="<?= $obra['titulo'] ?>">
      <span><?= $obra['titulo'] ?></span>
    </label>
  <?php endforeach; ?>
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
        
        <!-- Upload de arquivos -->
        <label for="file-upload" class="custom-file-upload">
            <i class="bi bi-file-earmark-arrow-up"></i> <span id="file-label">Escolher Arquivos</span>
        </label>
        <input type="file" name="files[]" id="file-upload" multiple required>
        
        <!-- Botão de envio -->
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
    let fileCount = this.files.length; // Número total de arquivos
    let label = document.getElementById("file-label"); // Elemento que mostra a contagem

    if (fileCount > 0) {
        label.textContent = `${fileCount} arquivo(s) selecionado(s)`;  // Atualiza o texto
    } else {
        label.textContent = "Escolher Arquivos"; // Reseta se nenhum foi escolhido
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

function selecionarObra(radio) {
  // Remover seleção anterior
  document.querySelectorAll('.obra-card').forEach(label => label.classList.remove('selected'));

  // Adicionar classe à nova
  const labelSelecionado = radio.closest('label');
  if (labelSelecionado) labelSelecionado.classList.add('selected');

  // Atualizar campo hidden com o novo ID
  document.querySelector('input[name="id_manga"][type="hidden"]').value = radio.value;

  // Submeter o formulário para carregar os capítulos
  document.getElementById("formUpload").submit();
}


</script>


</body>
</html>
