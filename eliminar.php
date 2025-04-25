<?php
include 'config.php';
include 'cloudinary.php';
include 'navbar.php';

if (!isset($_SESSION['rank']) || $_SESSION['rank'] !== 'admin') {
    header("Location: index.php");
    exit;
}

use Cloudinary\Api\Admin\AdminApi;

$adminApi = new AdminApi();

//Para conseguir o caminho das páginas no cloudinary
function extrairPublicId($url) {
    $parsed = parse_url($url);
    $path = $parsed['path'];
    $semUpload = explode('/upload/', $path)[1];
    $partes = explode('/', $semUpload);
    if (preg_match('/^v\d+$/', $partes[0])) {
        array_shift($partes);
    }
    return implode('/', array_slice($partes, 0, 3));
}
//Para conseguir o caminho da capa no cloudinary
function extrairPublicIdcapa($url) {
    $parsed = parse_url($url);
    $path = $parsed['path'];
    $semUpload = explode('/upload/', $path)[1];
    $semVersao = preg_replace('/^v\d+\//', '', $semUpload);
    return pathinfo($semVersao, PATHINFO_DIRNAME) . '/' . pathinfo($semVersao, PATHINFO_FILENAME);
}

// Buscar obras
$sql_obras = "SELECT id_manga, titulo, capa FROM mangas ORDER BY titulo ASC";
$stmt_obra = $ligaDB->prepare($sql_obras);
$stmt_obra-> execute();
$obras = $stmt_obra->get_result()->fetch_all(MYSQLI_ASSOC);

// Se uma obra foi selecionada, buscar os seus capitulos
$capitulos = [];
$id_manga_selecionado = $_GET['id_manga'] ?? $_POST['id_manga'] ?? null;
if ($id_manga_selecionado) {
    $sql_id_selecionado = "SELECT id_capitulos, num_capitulo FROM capitulos WHERE id_manga = ? ORDER BY num_capitulo ASC";
    $stmt_id_selecionado = $ligaDB->prepare($sql_id_selecionado);
    $stmt_id_selecionado->bind_param("i", $id_manga_selecionado);
    $stmt_id_selecionado->execute();
    $capitulos = $stmt_id_selecionado->get_result()->fetch_all(MYSQLI_ASSOC);
}
$obra_sem_capitulos = $id_manga_selecionado && empty($capitulos);






if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_manga = intval($_POST['id_manga'] ?? 0);

    // Eliminar obra completa
    if (isset($_POST["acao"]) && $_POST["acao"] === "eliminar_obra") {
        // === ELIMINA PÁGINAS DO CLOUDINARY ===
        $sql_busca = "SELECT caminho_pagina FROM paginas WHERE id_manga = ?";
        $stmt_busca = $ligaDB->prepare($sql_busca);
        $stmt_busca->bind_param("i", $id_manga);
        $stmt_busca->execute();
        $result_imgs = $stmt_busca->get_result();

        $public_ids = [];
        while ($row = $result_imgs->fetch_assoc()) {
            $public_ids[] = extrairPublicId($row['caminho_pagina']);
        }

        foreach ($public_ids as $prefixo) {
            try {
                $recursos = $adminApi->assets([
                    "type" => "upload",
                    "prefix" => $prefixo
                ]);
                $publics = array_map(fn($r) => $r['public_id'], $recursos['resources']);
                if (!empty($publics)) {
                    $adminApi->deleteAssets($publics);
                }
            } catch (Exception $e) {
                error_log("Capa Public ID: " . $public_id_capa);
            }
        }
        // === ELIMINA A CAPA DO CLOUDINARY (mesmo sem capítulos) ===
        $sql_capa = "SELECT capa FROM mangas WHERE id_manga = ?";
        $stmt_capa = $ligaDB->prepare($sql_capa);
        $stmt_capa->bind_param("i", $id_manga);
        $stmt_capa->execute();
        $result_capa = $stmt_capa->get_result();

        if ($row_capa = $result_capa->fetch_assoc()) {
            $capa_url = $row_capa['capa'];
            $public_id_capa = extrairPublicIdcapa($capa_url);

            try {
                $adminApi->deleteAssets([$public_id_capa]);
            } catch (Exception $e) {
                error_log("Capa Public ID: " . $public_id_capa);
            }
        }

        // === ELIMINA DADOS DA BASE DE DADOS ===
        $sql_delete_pagina = "DELETE FROM paginas WHERE id_manga = ?";
        $stmt_delete_paginas = $ligaDB->prepare($sql_delete_pagina);
        $stmt_delete_paginas->bind_param("i", $id_manga);
        $stmt_delete_paginas->execute();

        $sql_delete_capitulos = "DELETE FROM capitulos WHERE id_manga = ?";
        $stmt_delete_capitulos = $ligaDB->prepare($sql_delete_capitulos);
        $stmt_delete_capitulos->bind_param("i", $id_manga);
        $stmt_delete_capitulos->execute();

        $sql_delete_manga = "DELETE FROM mangas WHERE id_manga = ?";
        $stmt_delete_manga = $ligaDB->prepare($sql_delete_manga);
        $stmt_delete_manga->bind_param("i", $id_manga);
        if ($stmt_delete_manga->execute()) {
            $_SESSION['mensagem'] = "<p class = 'sucesso'> Obra eliminada com sucesso!";
        } else {
            $_SESSION['mensagem'] = "<p class = 'erro'> Erro ao eliminar a obra.";
        }
        header("Location: eliminar.php");
        exit;

    }

    // Eliminar capítulos selecionados
    elseif (isset($_POST["acao"]) && $_POST["acao"] === "eliminar_capitulos") {
        foreach ($_POST['capitulos'] as $id_capitulo) {
            $id_capitulo = intval($id_capitulo);
    
            // Buscar os caminhos das imagens antes de apagar
            $sql_busca = "SELECT caminho_pagina FROM paginas WHERE id_capitulos = ?";
            $stmt_busca = $ligaDB->prepare($sql_busca);
            $stmt_busca->bind_param("i", $id_capitulo);
            $stmt_busca->execute();
            $result_imgs = $stmt_busca->get_result();
    
            $public_ids = [];
            while ($row = $result_imgs->fetch_assoc()) {
                $public_ids[] = extrairPublicId($row['caminho_pagina']);
            }

            foreach ($public_ids as $prefixo) {
                $recursos = $adminApi->assets([
                    "type" => "upload",
                    "prefix" => $prefixo
                ]);
                $publics = array_map(fn($r) => $r['public_id'], $recursos['resources']);
                if (!empty($publics)) {
                    $adminApi->deleteAssets($publics);
                }
            }
    
            // Apagar da base de dados
            $sql_pag = "DELETE FROM paginas WHERE id_capitulos = ?";
            $stmt_pag = $ligaDB->prepare($sql_pag);
            $stmt_pag->bind_param("i", $id_capitulo);
            $stmt_pag->execute();
    
            $sql_cap = "DELETE FROM capitulos WHERE id_capitulos = ?";
            $stmt_cap = $ligaDB->prepare($sql_cap);
            $stmt_cap->bind_param("i", $id_capitulo);
            $stmt_cap->execute();
    
            $_SESSION['mensagem'] = "<p class = 'sucesso'>Capítulo $id_capitulo eliminado com sucesso.</p>";
        }
        header("Location: eliminar.php");
        exit;

    }
}
?>




<!DOCTYPE html>
<html lang="pt">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestão de Eliminações</title>
  <link rel="stylesheet" href="css/eliminar.css">
</head>
<body>
  <div class="container">
    <?php if (isset($_SESSION['mensagem'])): ?>
      <div class="mensagem"><?= $_SESSION['mensagem']; unset($_SESSION['mensagem']); ?></div>
    <?php endif; ?>

    <h2>Gestão de Eliminações</h2>

    <form method="POST" id="form-eliminar">
    <input type="hidden" name="acao" id="acao" value="">
      <input type="hidden" name="id_manga" value="<?= $id_manga_selecionado ?>" required>

      <h3>Selecione uma Obra</h3>
      <div class="obras-grid">
        <?php foreach ($obras as $obra): ?>
          <label class="obra-card <?= ($id_manga_selecionado == $obra['id_manga']) ? 'selected' : '' ?>">
            <input type="radio" name="id_manga" value="<?= $obra['id_manga'] ?>" style="display: none">
            <img src="<?= $obra['capa'] ?>" alt="<?= $obra['titulo'] ?>">
            <span><?= $obra['titulo'] ?></span>
          </label>
        <?php endforeach; ?>
      </div>

      <?php if ($obra_sem_capitulos): ?>
        <div class="alert-info">Esta obra não tem capítulos disponíveis.</div>
        <div class="acoes">
          <button type="button" name="eliminar_obra" onclick="prepararConfirmacao('eliminar_obra')">Eliminar Obra</button>
        </div>
      <?php elseif (!empty($capitulos)): ?>
        <div class="dropdown-container" id="dropdown-capitulos">
          <div class="dropdown-button" onclick="toggleDropdown()">Selecionar Capítulos</div>
          <div class="dropdown-list">
            <label><input type="checkbox" id="selecionar-todos" onchange="selecionarTodos(this)"> Selecionar Todos</label>
            <?php foreach ($capitulos as $cap): ?>
              <label>
                <input type="checkbox" name="capitulos[]" value="<?= $cap['id_capitulos'] ?>">
                Capítulo <?= $cap['num_capitulo'] ?>
              </label>
            <?php endforeach; ?>
          </div>
        </div>

        <div class="acoes">
        <button type="button" name="eliminar_capitulos" onclick="prepararConfirmacao('eliminar_capitulos')">Eliminar Capítulos</button>
        <button type="button" name="eliminar_obra" onclick="prepararConfirmacao('eliminar_obra')">Eliminar Obra</button>
        </div>
        <?php endif; ?>

       <!-- Modal de Confirmação -->
      <div class="modal-confirmar" id="modal-confirmar">
        <div class="modal-caixa">
          <p id="modal-mensagem">Tens a certeza que queres eliminar?</p>
            <div class="modal-botoes">
              <button type="submit" class="confirmar" id="modal-sim">Sim</button>
              <button type="button" class="cancelar" id="modal-nao">Cancelar</button>
            </div>
          </div>
        </div>
    </form>


    <!-- Spinner de loading -->
    <div id="loading-spinner" class="loading-spinner" style="display: none;"></div>
  </div>

<script>
let acaoConfirmar = false;

// Toggle dropdown
function toggleDropdown() {
  document.getElementById('dropdown-capitulos').classList.toggle('active');
}

// Selecionar todos os capítulos
function selecionarTodos(checkbox) {
  const checkboxes = document.querySelectorAll('.dropdown-list input[type="checkbox"]:not(#selecionar-todos)');
  checkboxes.forEach(cb => cb.checked = checkbox.checked);
}

// Definir ação e mostrar modal com mensagem
function prepararConfirmacao(acao) {
  const modal = document.getElementById('modal-confirmar');
  const mensagem = document.getElementById('modal-mensagem');
  const tituloObra = document.querySelector('.obra-card.selected span')?.textContent || 'a obra';
  const capitulosSelecionados = Array.from(document.querySelectorAll('input[name="capitulos[]"]:checked'));
  const totalCapitulos = document.querySelectorAll('input[name="capitulos[]"]').length;

  if (acao === 'eliminar_obra') {
    if (capitulosSelecionados.length > 0) {
      mensagem.textContent = `Tens a certeza que queres eliminar a obra "${tituloObra}" e os seus capítulos?`;
    } else if (totalCapitulos > 0) {
      mensagem.textContent = `Tens a certeza que queres eliminar a obra "${tituloObra}" com ${totalCapitulos} capítulos?`;
    } else {
      mensagem.textContent = `Queres mesmo eliminar a obra "${tituloObra}" sem capítulos?`;
    }
  }

  if (acao === 'eliminar_capitulos') {
    if (capitulosSelecionados.length === 0) {
      alert("Seleciona pelo menos um capítulo para eliminar.");
      return false;
    }

    const nums = capitulosSelecionados.map(cb =>
      cb.parentElement.textContent.trim().replace('Capítulo ', '')
    );
    mensagem.textContent = `Tens a certeza que queres eliminar os ${nums.length} capítulo(s) (${nums.join(', ')}) da obra "${tituloObra}"?`;
  }
  document.getElementById('acao').value = acao;
  modal.style.display = 'flex';
  acaoConfirmar = false;
  return false;
}

// Botão "Sim" dentro do modal - permite submit
document.getElementById('modal-sim').addEventListener('click', () => {
  acaoConfirmar = true;
  document.getElementById('modal-confirmar').style.display = 'none';
});

// Botão "Cancelar" - fecha modal sem submit
document.getElementById('modal-nao').addEventListener('click', () => {
  document.getElementById('modal-confirmar').style.display = 'none';
  acaoConfirmar = false;
  document.getElementById('acao').value = '';
  document.querySelectorAll('input[name="capitulos[]"]').forEach(cb => cb.checked = false);

});

// Submit final controlado
document.getElementById('form-eliminar').addEventListener('submit', function (e) {
  const modalAberto = document.getElementById('modal-confirmar').style.display === 'flex';
  const acao = document.getElementById('acao').value;


  if (modalAberto || (acao && !acaoConfirmar)) {
    e.preventDefault(); // cancela qualquer submissão não confirmada
    return;
  }
  // Desativa botões
  this.querySelectorAll('button').forEach(btn => btn.disabled = true);
   // Desativa a seleção de obra
   document.querySelectorAll('.obra-card input[type="radio"]').forEach(inp => inp.disabled = true);
});

// Ao mudar a obra, submete apenas se não há modal nem ação pendente
document.querySelectorAll('input[name="id_manga"]').forEach(radio => {
  radio.addEventListener('change', function () {
    const modalAberto = document.getElementById('modal-confirmar').style.display === 'flex';
    const acao = document.getElementById('acao').value;

    // Só permite mudar de obra se não estiver em estado de confirmação
    if (!modalAberto && !acao) {
      document.getElementById('form-eliminar').submit();
    }
  });
});

</script>

</body>
</html>
