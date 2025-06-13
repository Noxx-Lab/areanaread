<?php
include "config.php";
include "cloudinary.php";
include "navbar.php";
$pagina_atual = "editar";
include "sidebar.php";

if (!isset($_SESSION['rank']) || !in_array($_SESSION['rank'], ['admin', 'editor'])) {
    header("Location: index.php");
}

use Cloudinary\Api\Upload\UploadApi;
use Cloudinary\Api\Admin\AdminApi;

$uploadApi = new UploadApi();
$AdminApi = new AdminApi();

$mensagem = isset($_SESSION["mensagem"]) ? $_SESSION["mensagem"] : "";
unset($_SESSION["mensagem"]);

$obras = buscar_obra($ligaDB);


// Buscar todos os géneros da base de dados
$generos = [];
$result_generos = generos($ligaDB);

foreach ($result_generos as $row_generos) {
    $generos[] = $row_generos;
}

$generos_manga = [];
$campos_obra = [];

$id_manga_selecionado = isset($_GET["id_manga"]) ? $_GET["id_manga"] : (isset($_POST["id_manga"]) ? $_POST["id_manga"] : null);

if ($id_manga_selecionado) {
    $campos_obra = buscar_obra_mais($ligaDB, $id_manga_selecionado);

    //Busca os generos associados ao manga selecionado
    $result_genero_manga = generos($ligaDB, $id_manga_selecionado);
    foreach ($result_genero_manga as $row_generos_manga) {
        $generos_manga[] = $row_generos_manga["id_genero"];
    }
}

$capa = [];
if ($_SERVER["REQUEST_METHOD"] === "POST" && isset($_POST["editar"])) {
    $id_manga = $_POST["id_manga"];
    $titulo = $_POST["titulo"];
    $link = $_POST["link"];
    $tipo = $_POST["tipo"];
    $status = $_POST["status"];
    $sinopse = $_POST["sinopse"];
    $autor = $_POST["autor"];
    $artista = $_POST["artista"];
    $ano = $_POST["ano_lancado"];
    $capa_antiga = $_POST["capa_antiga"];

    $nova_capa_url = $capa_antiga;
    if (isset($_FILES["nova_capa"]) && !empty($_FILES["nova_capa"]["name"])) {

        $publicId = extrairPublicId($capa_antiga, "capa");
        $AdminApi->deleteAssets($publicId);

        // Formatar o nome do mangá para URL (removendo caracteres especiais e espaços)
        $nomeManga = strtolower(str_replace(' ', '-', preg_replace('/[^A-Za-z0-9 ]/', '', $titulo)));

        $nomeArquivo = basename($_FILES['nova_capa']['name']);
        $tempFile = $_FILES['nova_capa']['tmp_name'];

        if (empty($nomeArquivo) || empty($tempFile)) {
            $_SESSION['mensagem'] = "<p class = 'erro'>Upload cancelado! Arquivo inválido.</p>";
        }

        $extensao = pathinfo($nomeArquivo, PATHINFO_EXTENSION);

        if (empty($extensao)) {
            $_SESSION['mensagem'] = "<p class = 'erro'>Upload cancelado! O arquivo '$nomeArquivo' não tem uma extensão válida.</p>";
        }

        $extensao = strtolower($extensao);
        $extensoesPermitidas = ['jpg', 'png', "webp", "avif"];

        if (!in_array($extensao, $extensoesPermitidas)) {
            die("<p class = 'erro'>Upload cancelado! Formato não permitido: '$nomeArquivo'.</p>");
        }

        try {
            // Upload para Cloudinary antes de inserir no banco de dados
            $upload = $uploadApi->upload($tempFile, [
                "folder" => "capas/",
                "use_filename" => true
            ]);

            if (!isset($upload["secure_url"])) {
                $_SESSION['mensagem'] = "<p class = 'erro'>Upload cancelado! Erro ao enviar para o Cloudinary: '$nomeArquivo'.</p>";
            }

            // Define a capa do mangá com o link do Cloudinary
            $capa = $upload["secure_url"];

        } catch (Exception $e) {
            $_SESSION['mensagem'] = "<p class = 'erro'> Upload cancelado! Erro: " . $e->getMessage() . "</p>";
        }
    }

    if (!empty($capa)) {
        $nova_capa_url = $capa;
    }


    $sql_editar = "UPDATE mangas set titulo = ?, link=?, tipo=?, status = ?, sinopse = ?, autor = ?, artista = ?, ano_lancado = ?, capa = ? where id_manga = ? ";
    $stmt_editar = $ligaDB->prepare($sql_editar);
    $stmt_editar->bind_param("sssssssssi", $titulo, $link, $tipo, $status, $sinopse, $autor, $artista, $ano, $nova_capa_url, $id_manga);
    $stmt_editar->execute();

    //Atualizar os géneros associados
    $sql_delete_genero = "DELETE from manga_generos where id_manga = ?";
    $stmt_delete_genero = $ligaDB->prepare($sql_delete_genero);
    $stmt_delete_genero->bind_param("i", $id_manga);
    $stmt_delete_genero->execute();
    if (isset($_POST["generos"]) && is_array($_POST["generos"])) {
        $sql_genero = "INSERT into manga_generos (id_manga, id_genero) values (?,?)";
        $stmt_genero = $ligaDB->prepare($sql_genero);
        foreach ($_POST["generos"] as $id_genero) {
            $stmt_genero->bind_param("ii", $id_manga, $id_genero);
            $stmt_genero->execute();
        }
    }
    $_SESSION["mensagem"] = "<p class='sucesso'>Obra atualizado com sucesso! </p>";
    header("Location: editar.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="pt">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar</title>
    <link rel="stylesheet" href="css/editar.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>

<body>
    <div class="container">
        <h2 class="titulo-pagina"> Editar Obra</h2>
        <?php if ($mensagem): ?>
        <div class="mensagem"><?php echo $mensagem; ?></div>
        <?php endif; ?>

        <h3>Selecione uma Obra</h3>
        <form method="POST" id="selecionar-obra-form" action="">
        <input type="text" id="filtro-obras" placeholder="Pesquisar obras" class="barra-pesquisa">

        <div id="obras-container" class="obras-grid">
            <?php foreach ($obras as $obra): ?>
                    <label class="obra-card <?= $id_manga_selecionado == $obra['id_manga'] ? 'selected' : '' ?>"
                        data-titulo="<?= strtolower($obra['titulo']) ?>" style="display: none;">
                        <input type="radio" name="id_manga" value="<?= $obra['id_manga'] ?>" style="display: none">
                        <img src="<?= $obra['capa'] ?>" alt="<?= htmlspecialchars($obra['titulo']) ?>">
                        <span><?= htmlspecialchars($obra['titulo']) ?></span>
                    </label>
                <?php endforeach; ?>
            </div>
        
            <div class="navegacao">
                <button type="button" id="anterior">&#8592;</button>
                <span id="pagina-atual">1</span>
                <button type="button" id="proximo">&#8594;</button>
            </div>
        </form>

        <!-- Formulario e a capa da obra selecionada ao lado -->
        <?php if ($campos_obra): ?>
            <div class="edicao-flex editar-central">
                <div class="capa-editar">
                    <img src="<?php echo $campos_obra["capa"] ?>" alt="Capa atual do manga">
                </div>
                <form id="edit-form" class="edit-form" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id_manga" value="<?php echo $campos_obra["id_manga"] ?>">
                    <input type="hidden" name="capa_antiga" value="<?php echo htmlspecialchars($campos_obra["capa"]) ?>">

                    <label>Titulo</label>
                    <input type="text" name="titulo" id="titulo" oninput="gerar_link()"
                        value="<?php echo htmlspecialchars($campos_obra["titulo"]) ?>" required>

                    <label>Link</label>
                    <input type="text" name="link" id="link" value="<?php echo htmlspecialchars($campos_obra["link"]) ?>"
                        placeholder="<?php echo htmlspecialchars($campos_obra["link"]) ?>" readonly>

                    <label>Tipo</label>
                    <select name="tipo" required>
                        <option value="Manga" <?php if ($campos_obra["tipo"] == "Manga")
                            echo "selected"; ?>>Manga</option>
                        <option value="Manhua" <?php if ($campos_obra["tipo"] == "Manhua")
                            echo "selected"; ?>>Manhua</option>
                        <option value="Manhwa" <?php if ($campos_obra["tipo"] == "Manhwa")
                            echo "selected"; ?>>Manhwa</option>
                        <option value="Comic" <?php if ($campos_obra["tipo"] == "Comic")
                            echo "selected"; ?>>Comic</option>
                        <option value="Novel" <?php if ($campos_obra["tipo"] == "Novel")
                            echo "selected"; ?>>Novel</option>
                    </select>

                    <label>Status</label>
                    <select name="status" required>
                        <option value="Ongoing" <?php if ($campos_obra["status"] == "Ongoing")
                            echo "selected"; ?>>Ongoing
                        </option>
                        <option value="Hiatus" <?php if ($campos_obra["status"] == "Hiatus")
                            echo "selected"; ?>>Hiatus
                        </option>
                        <option value="Finalizado" <?php if ($campos_obra["status"] == "Finalizado")
                            echo "selected"; ?>>
                            Finalizado</option>
                        <option value="Dropado" <?php if ($campos_obra["status"] == "Dropado")
                            echo "selected"; ?>>Dropado
                        </option>
                        <option value="Lançamento" <?php if ($campos_obra["status"] == "Lançamento")
                            echo "selected"; ?>>
                            Lançamento</option>
                    </select>

                    <label>Sinopse</label>
                    <textarea name="sinopse" required><?php echo htmlspecialchars($campos_obra["sinopse"]) ?></textarea>

                    <label>Autor</label>
                    <input type="text" name="autor" value="<?php echo htmlspecialchars($campos_obra["autor"]) ?>">

                    <label>Artista</label>
                    <input type="text" name="artista" value="<?php echo htmlspecialchars($campos_obra["artista"]) ?>">

                    <label>Ano de lançamento</label>
                    <input type="number" name="ano_lancado" id="ano_lancado"
                        value="<?php echo htmlspecialchars($campos_obra["ano_lancado"]) ?>" min="1900"
                        max="<?php echo date('Y'); ?>" required>


                    <label>Géneros:</label>
                    <div class="generos-container">
                        <button type="button" class="btn-toggle-generos" onclick="toggleGeneros()">Selecionar
                            Géneros</button>

                        <input type="text" id="filtro-generos" placeholder="Pesquisar género..." style="display: none;">

                        <div class="generos-lista" id="generos-lista" style="display: none;">
                            <?php foreach ($generos as $g): ?>
                                <label class="genero-item">
                                    <input type="checkbox" name="generos[]" value="<?php echo $g['id_genero'] ?>" <?php echo in_array($g["id_genero"], $generos_manga) ? "checked" : "" ?>>
                                    <?php echo htmlspecialchars($g['nome_genero']) ?>
                                </label>
                            <?php endforeach; ?>
                        </div>
                    </div>



                    <!-- Botão de Upload com atualização do texto -->
                    <label for="file-upload" class="custom-file-upload">
                        <i class="bi bi-file-earmark-arrow-up"></i> <span id="file-label">Escolher Arquivo para a
                            Capa</span>
                    </label>
                    <input type="file" name="nova_capa" id="file-upload">
                    <button type="submit" id="submit-btn" name="editar" class="btn-editar">Guardar Alterações</button>
                    <div class="loading-spinner" id="loading-spinner" style="display: none;"></div>
                </form>

            </div>
        <?php endif; ?>
    </div>
<script>
//O que faz o loading
document.addEventListener("DOMContentLoaded", function () {
            let formUpload = document.getElementById("edit-form");
            let submitButton = document.getElementById("submit-btn");
            let loadingSpinner = document.getElementById("loading-spinner");
            let mensagemDiv = document.querySelector(".mensagem");

            formUpload.addEventListener("submit", function(event) {
                // Oculta mensagens anteriores
                mensagemDiv.innerHTML = "";

                // Desativa o botão de envio
                submitButton.disabled = true;
                submitButton.innerHTML = "Editando...";
                
                // Exibe o spinner de loading
                loadingSpinner.style.display = "block";
            });
        });
document.addEventListener("DOMContentLoaded", function () {
  const obras = Array.from(document.querySelectorAll(".obra-card"));
  const obrasContainer = document.getElementById("obras-container");
  const input = document.getElementById("filtro-obras");
  const btnAnterior = document.getElementById("anterior");
  const btnProximo = document.getElementById("proximo");
  const spanPagina = document.getElementById("pagina-atual");

  let pagina = 1;
  const porPagina = 7;
  let obrasFiltradas = obras;

  function atualizarLista() {
    const inicio = (pagina - 1) * porPagina;
    const fim = inicio + porPagina;

    obras.forEach(card => card.style.display = "none");
    obrasFiltradas.slice(inicio, fim).forEach(card => card.style.display = "block");

    spanPagina.textContent = pagina;

    btnAnterior.disabled = pagina === 1;
    btnProximo.disabled = pagina * porPagina >= obrasFiltradas.length;

    btnAnterior.classList.toggle("disabled-btn", btnAnterior.disabled);
    btnProximo.classList.toggle("disabled-btn", btnProximo.disabled);
  }

  function aplicarFiltro() {
    const termo = input.value.toLowerCase();
    obrasFiltradas = obras.filter(card => card.dataset.titulo.includes(termo));

    const selecionado = document.querySelector('.obra-card.selected');
    if (selecionado) {
      const indexSelecionado = obrasFiltradas.indexOf(selecionado);
      pagina = indexSelecionado !== -1 ? Math.floor(indexSelecionado / porPagina) + 1 : 1;
    } else {
      pagina = 1;
    }

    atualizarLista();
  }

  btnAnterior.addEventListener("click", () => {
    if (pagina > 1) {
      pagina--;
      atualizarLista();
    }
  });

  btnProximo.addEventListener("click", () => {
    if (pagina * porPagina < obrasFiltradas.length) {
      pagina++;
      atualizarLista();
    }
  });

  input.addEventListener("input", aplicarFiltro);
  aplicarFiltro();

  // Ao mudar a obra, submete imediatamente com POST
  document.querySelectorAll('input[name="id_manga"]').forEach(radio => {
    radio.addEventListener('change', function () {
      document.getElementById('selecionar-obra-form').submit();
    });
  });
});


        // Atualiza o texto do botão ao selecionar um arquivo
        document.getElementById('file-upload').addEventListener('change', function () {
            let fileName = this.files[0] ? this.files[0].name : 'Nenhum ficheiro selecionado';
            this.previousElementSibling.innerText = fileName;
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


        document.getElementById("filtro-generos").addEventListener("input", function () {
            let termo = this.value.toLowerCase();
            let generos = document.querySelectorAll(".genero-item");

            generos.forEach(function (item) {
                let texto = item.textContent.toLowerCase();
                item.style.display = texto.includes(termo) ? "flex" : "none";
            });
        });
        function selecionarObra(id) {
            // Cria um campo hidden com o novo id_manga
            const form = document.getElementById('selecionar-obra-form');

            // Remove o antigo campo id_manga se existir
            let antigo = form.querySelector('input[name="id_manga"]');
            if (antigo) antigo.remove();

            // Cria e adiciona o novo campo id_manga
            let input = document.createElement("input");
            input.type = "hidden";
            input.name = "id_manga";
            input.value = id;
            form.appendChild(input);

            // Submete o formulário
            form.submit();
        }

</script>
</body>

</html>