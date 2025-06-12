<?php
include 'config.php';
include "navbar.php";
include "cloudinary.php";
$pagina_atual = "uploud";
include "sidebar.php";

if (!isset($_SESSION['rank']) || !in_array($_SESSION['rank'], ['admin', 'editor'])) {
    header("Location: index.php");
    exit;
}

use Cloudinary\Api\Upload\UploadApi;

// Instancia a API do Cloudinary
$uploadApi = new UploadApi(); 

$mensagem = isset($_SESSION['mensagem']) ? $_SESSION['mensagem'] : "";
unset($_SESSION['mensagem']);

$obras = buscar_obra($ligaDB);

// Verifica se um mangá foi selecionado para buscar os capítulos
$id_manga_selecionado = isset($_GET['id_manga']) ? $_GET['id_manga'] : (isset($_POST['id_manga']) ? $_POST['id_manga'] : null);


$capitulos = [];

// Se houver um mangá selecionado, busca os capítulos desse mangá
if ($id_manga_selecionado) {
    $capitulos = buscar_capitulos_manga($ligaDB,$id_manga_selecionado,null,'array');
}


// VERIFICA SE O UPLOAD ESTÁ SENDO FEITO (APENAS SE TIVER ARQUIVOS)
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES['files']) && count($_FILES['files']['name']) > 0 && !empty($_FILES['files']['name'][0])) {
    $id_manga = $_POST["id_manga"];
    $id_capitulo = $_POST["id_capitulo"];

    

    
    $num_capitulo = buscar_capitulos_manga($ligaDB,null, $id_capitulo, 'normal')["num_capitulo"];

    // Buscar o nome do mangá no banco de dados
    $link = buscar_obra_mais($ligaDB,$id_manga)["link"];    

    // Formatar o nome do mangá para URL para a Cloudinary  
    
    $arquivos = $_FILES['files']; 
    $totalArquivos = count($arquivos['name']);

    //Loop para enviar varios arquivos
  for ($i = 0; $i < $totalArquivos; $i++) {
    try {
      $nomeArquivo = basename($arquivos['name'][$i]);
      $tempFile = $arquivos['tmp_name'][$i];

      if (empty($nomeArquivo) || empty($tempFile)) {
        $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Arquivo inválido.</p>";
        continue;
      }

      $extensao = strtolower(pathinfo($nomeArquivo, PATHINFO_EXTENSION));
      $extensoesPermitidas = ['jpg', 'jpeg', 'png', "webp", "avif"];

      if (!in_array($extensao, $extensoesPermitidas)) {
        $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Formato não permitido: '$nomeArquivo'</p>";
        continue;
      }

        $upload = $uploadApi->upload($tempFile, [
          "folder" => "mangas/$link/capitulo-$num_capitulo/"
        ]);

      if (!isset($upload["secure_url"])) {
        $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Erro no Cloudinary para '$nomeArquivo'</p>";
        continue;
      }

      $caminhoArquivo = $upload["secure_url"];
      $stmt = $ligaDB->prepare("INSERT INTO paginas (id_manga, id_capitulos, caminho_pagina) VALUES (?, ?, ?)");
      $stmt->bind_param("iis", $id_manga, $id_capitulo, $caminhoArquivo);
      $stmt->execute();
    } catch (Exception $e) {
      $_SESSION['mensagem'] = "<p class='erro'> Upload cancelado! Erro: " . $e->getMessage() . "</p>";
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
    <title>Upload</title>
    <link rel="stylesheet" href="css/uploud.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body>
<div class="upload-container">

<div class="button-group">
    <!-- Botão para adicionar novo mangá -->
    <a href="adicionar_manga.php" class="add-manga" title="Adicionar uma obra nova">
        <i class="bi bi-journal-plus"></i> Adicionar Obra
    </a> 

    <a href="<?php echo  $id_manga_selecionado ? "adicionar_capitulo.php?id_manga=$id_manga_selecionado" : 'javascript:void(0);' ?>"
   id="add-capitulo"
   class="add-capitulo <?php echo $id_manga_selecionado ? 'enabled' : 'disabled' ?>"
   title="<?php echo $id_manga_selecionado ? 'Adicionar Capítulo Novo' : 'Selecione um mangá primeiro' ?>">
   <i class="bi bi-journal-text"></i> Adicionar Capítulos
</a>

</div>

<form id="formUpload" action="uploud.php" method="POST" enctype="multipart/form-data">
  <h2 class="titulo-pagina"> Upload Páginas</h2>
  <h3>Selecione uma Obra</h3>
  <input type="text" id="filtro-obras" placeholder="Pesquisar obras..." class="barra-pesquisa">

<div id="obras-container" class="obras-grid">
  <?php foreach ($obras as $obra): ?>
    <label class="obra-card <?= $id_manga_selecionado == $obra['id_manga'] ? 'selected' : '' ?>"
      data-titulo="<?= strtolower($obra['titulo']) ?>" style="display: none;">

      <input type="radio" name="id_manga" value="<?= $obra['id_manga'] ?>" style="display:none"
        <?= ($id_manga_selecionado == $obra['id_manga']) ? 'checked' : '' ?>
        onchange="this.form.submit();">
      <img src="<?= htmlspecialchars($obra['capa']) ?>" alt="<?= htmlspecialchars($obra['titulo']) ?>">
      <span><?= htmlspecialchars($obra['titulo']) ?></span>
    </label>
  <?php endforeach; ?>

</div>

<div class="navegacao">
  <button type="button" id="anterior">&#8592;</button>
  <span id="pagina-atual">1</span>
  <button type="button" id="proximo">&#8594;</button>
</div>

  <?php if ($id_manga_selecionado): ?>
    <h3>Selecione o Capítulo:</h3>
    <div class="dropdown-container" id="dropdown-capitulos">
  <div class="dropdown-button" onclick="toggleDropdown()">Selecionar Capítulo</div>
  <div class="dropdown-list">
  <?php foreach ($capitulos as $cap): ?>
  <?php $capitulo_tem_paginas = contar($ligaDB, $cap['id_capitulos'], 'pag_por_cap'); ?>
  <label class="capitulo-label<?php echo $capitulo_tem_paginas ? ' disabled-capitulo' : '' ?>">
    <input type="radio" name="id_capitulo" value="<?php echo $cap['id_capitulos'] ?>" <?php echo $capitulo_tem_paginas ? 'disabled' : '' ?> required>
    <span>
      Capítulo <?php echo $cap['num_capitulo'] ?> <?php echo $capitulo_tem_paginas ? '(Já tem páginas)' : '' ?>
    </span>
  </label>
<?php endforeach; ?>
  </div>
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
    <div class="loading-spinner" id="loading-spinner" style="display: none;"></div>
    <div class="mensagem" id="mensagem">
      <?php echo $mensagem; ?>
    </div>
  <?php endif; ?>
</form>

</div>

<script>

document.addEventListener("DOMContentLoaded", function () {
  const formulario = document.getElementById("formUpload");
  const inputFicheiros = document.getElementById("file-upload");
  const botaoEnviar = document.getElementById("submit-btn");

  formulario.addEventListener("submit", async function (evento) {
    evento.preventDefault(); // Impede o envio imediato do formulário

    const ficheirosOriginais = Array.from(inputFicheiros.files);
    if (ficheirosOriginais.length === 0) return;//Se não tiver nenhum ficheiro bloqueia

    const novoConjunto = new DataTransfer(); // Novo conjunto de ficheiros

    // Converte todos os ficheiros em paralelo (lote)
    const ficheirosConvertidos = await Promise.all(
      ficheirosOriginais.map(async (ficheiro) => {
        const extensao = ficheiro.name.split(".").pop().toLowerCase();

        if (["jpg", "jpeg", "png"].includes(extensao)) {
          const convertido = await converterParaWebP(ficheiro);
          return convertido || ficheiro; // Usa o convertido ou mantém original
        }

        return ficheiro; // Outros formatos mantêm-se
      })
    );

    // Adiciona ao novo input
    ficheirosConvertidos.forEach(f => novoConjunto.items.add(f));
    inputFicheiros.files = novoConjunto.files;

    // Envia o formulário após pequena espera
    setTimeout(() => {
      botaoEnviar.disabled = true;
      formulario.submit();
    }, 100);
  });
});

// Função para converter uma imagem para WebP
async function converterParaWebP(ficheiro) {
  return new Promise((resolver) => {
    const leitor = new FileReader();

    leitor.onload = function (evento) {
      const imagem = new Image();

      imagem.onload = function () {
        const canvas = document.createElement("canvas");
        canvas.width = imagem.width;
        canvas.height = imagem.height;

        const contexto = canvas.getContext("2d");
        contexto.drawImage(imagem, 0, 0);

        canvas.toBlob((blob) => {
          if (!blob) {
            console.warn("Erro ao converter:", ficheiro.name);
            resolver(null);
            return;
          }

          const nomeBase = ficheiro.name.split(".")[0];
          const ficheiroWebP = new File([blob], nomeBase + ".webp", { type: "image/webp" });
          resolver(ficheiroWebP);
        }, "image/webp", 0.9);
      };

      imagem.onerror = () => {
        console.warn("Erro ao carregar imagem:", ficheiro.name);
        resolver(null);
      };

      imagem.src = evento.target.result;
    };

    leitor.readAsDataURL(ficheiro);
  });
}


document.addEventListener("DOMContentLoaded", function () {
  const obras = Array.from(document.querySelectorAll(".obra-card"));
  const obrasContainer = document.getElementById("obras-container");
  const input = document.getElementById("filtro-obras");
  const btnAnterior = document.getElementById("anterior");
  const btnProximo = document.getElementById("proximo");
  const spanPagina = document.getElementById("pagina-atual");

  let pagina = 1;
  const porPagina = 8;
  let obrasFiltradas = obras;

  function atualizarLista() {
  const inicio = (pagina - 1) * porPagina;
  const fim = inicio + porPagina;

  // Oculta todos os cards
  obras.forEach(card => card.style.display = "none");

  // Mostra os da página atual
  obrasFiltradas.slice(inicio, fim).forEach(card => card.style.display = "block");

  // Atualiza número
  spanPagina.textContent = pagina;

  // Desabilita ou ativa os botões conforme necessário
  btnAnterior.disabled = pagina === 1;
  btnProximo.disabled = pagina * porPagina >= obrasFiltradas.length;

  // Aplica/remover classe para visual desativado
  btnAnterior.classList.toggle("disabled-btn", btnAnterior.disabled);
  btnProximo.classList.toggle("disabled-btn", btnProximo.disabled);
}


  function aplicarFiltro() {
  const termo = input.value.toLowerCase();
  obrasFiltradas = obras.filter(card => card.dataset.titulo.includes(termo));

  // Verifica se há obra selecionada e posiciona na página correta
  const selecionado = document.querySelector('.obra-card.selected');
  if (selecionado) {
    const indexSelecionado = obrasFiltradas.indexOf(selecionado);
    if (indexSelecionado !== -1) {
      pagina = Math.floor(indexSelecionado / porPagina) + 1;
    } else {
      pagina = 1; // Se a obra selecionada for excluída pelo filtro
    }
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

  aplicarFiltro(); // inicializa
});

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

function toggleDropdown() {
    document.getElementById('dropdown-capitulos').classList.toggle('active');
}

// Fecha o dropdown se clicar fora
document.addEventListener('click', function(event) {
    let container = document.getElementById('dropdown-capitulos');
    if (container && !container.contains(event.target)) {
        container.classList.remove('active');
    }
});

// Atualiza texto do botão ao selecionar
document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.dropdown-list input[type="radio"]').forEach(function(radio) {
        radio.addEventListener('change', function() {
            const label = this.parentNode.textContent.trim();
            document.querySelector('.dropdown-button').textContent = label;
            document.getElementById('dropdown-capitulos').classList.remove('active');
        });
    });
});
// Após aplicar o filtro, garante que a obra selecionada esteja visível
const selecionado = document.querySelector('.obra-card.selected');
if (selecionado) {
  const indexSelecionado = obrasFiltradas.indexOf(selecionado);
  if (indexSelecionado !== -1) {
    pagina = Math.floor(indexSelecionado / porPagina) + 1;
    atualizarLista();
  }
}

</script>


</body>
</html>