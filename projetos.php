<?php
include 'config.php';
include "navbar.php";


$sqlmangas = "SELECT id_manga, titulo, status, tipo, capa, link from mangas";
$resultmangas = $ligaDB->query($sqlmangas);

// Consulta todos os géneros para o filtro
$sql_generos = "SELECT id_genero, nome_genero from generos order by nome_genero ASC";
$result_generos = $ligaDB->query($sql_generos);

$mangas_com_capitulos = [];

while ($manga = $resultmangas->fetch_assoc()) {
    $id_manga = $manga['id_manga'];

    $manga['total_capitulos'] = contar($ligaDB,$id_manga);

    // Pega os géneros ligados ao mangá
    $sql_generos = "SELECT nome_genero from generos 
        inner join manga_generos on generos.id_genero = manga_generos.id_genero 
        where manga_generos.id_manga = ?";
    $stmt_generos = $ligaDB->prepare($sql_generos);
    $stmt_generos->bind_param("i", $id_manga);
    $stmt_generos->execute();
    $result_generos_manga = $stmt_generos->get_result();

    $genero_manga = [];
    while ($generos = $result_generos_manga->fetch_assoc()) {
        $genero_manga[] = $generos["nome_genero"];
    }

    // Junta os géneros num string separado por vírgula
    $manga['generos_string'] = implode(",", $genero_manga);

    $mangas_com_capitulos[] = $manga; // Adiciona ao array final
}


?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Mangás</title>
    <link rel="stylesheet" href="css/projetos.css">
</head>
<body>

<div class="lista-container">
    <h2 class="titulo-lista">Lista de Projetos</h2>
    <div class="filtros-container">
    <div class="filtro">
    <div class="filtro-multiselect">
    <button type="button" class="dropdown-toggle" onclick="toggleDropdown('dropdown-generos')">Genero <span id="contador-genero">Todos</span> <i class="bi bi-chevron-down"></i></button>
    <div class="dropdown-opcoes" id="dropdown-generos">
        <?php while($genero = $result_generos->fetch_assoc()): ?>
            <label>
                <input type="checkbox" class="filtro-genero" value="<?= strtolower($genero['nome_genero']) ?>">
                <?php echo htmlspecialchars($genero['nome_genero']) ?>
            </label>
        <?php endwhile; ?>
    </div>
</div>


    </div>

    <div class="filtro">
        <select id="filtro-status">
            <option value="">Todos os Status</option>
            <option value="Ongoing">Ongoing</option>
            <option value="Lançamento">Lançamento</option>
            <option value="Finalizado">Finalizado</option>
            <option value="Hiatus">Hiatus</option>
            <option value="Dropado">Dropado</option>
        </select>
    </div>

    <div class="filtro">
        <select id="filtro-tipo">
            <option value="">Todos os Tipos</option>
            <option value="Manga">Manga</option>
            <option value="Manhwa">Manhwa</option>
            <option value="Manhua">Manhua</option>
            <option value="Comic">Comic</option>
            <option value="Novel">Novel</option>
        </select>
    </div>

    <div class="filtro">
        <select id="filtro-ordem">
            <option value="padrao">Todas os Padrão</option>
            <option value="az">A-Z</option>
            <option value="za">Z-A</option>
            <option value="mais">Mais Capítulos</option>
            <option value="menos">Menos Capítulos</option>
        </select>
    </div>
</div>

    <div class="manga-grid" id="manga-list">
        <?php foreach ($mangas_com_capitulos as $index => $manga): ?>
            <div class="manga-card" data-generos="<?php echo strtolower($manga['generos_string']); ?>" style="display: <?php echo $index < 14 ? 'block' : 'none'; ?>">
                <a href="/arenaread/<?php echo $manga['link']; ?>">
                    <img src="<?php echo $manga['capa']; ?>" alt="<?php echo $manga['titulo']; ?>">
                </a>
                <h3><?php echo $manga['titulo']; ?></h3>
                <p>Status: <?php echo $manga['status']; ?></p>
                <p>Tipo: <?php echo $manga['tipo']; ?></p>
                <p>Capítulos: <?php echo $manga['total_capitulos']; ?></p>
            </div>
        <?php endforeach; ?>
    </div>
</div>
    <div id="linha-divisoria" class="linha-divisoria" style="display: none;"></div>
    <button id="carregarMais" class="botao-carregar">CARREGUE MAIS</button>

    <script>
document.addEventListener("DOMContentLoaded", function () {
    const cards = document.querySelectorAll('.manga-card');
    const btn = document.getElementById('carregarMais');
    const linha = document.getElementById('linha-divisoria');
    let visiveis = 14;

    // Botão "Carregar mais"
    btn.addEventListener('click', function () {
        let mostrados = 0;
        for (let i = visiveis; i < cards.length && mostrados < 14; i++) {
            cards[i].style.display = 'block';
            mostrados++;
        }
        visiveis += mostrados;
        linha.style.display = 'block';
        if (visiveis >= cards.length) btn.style.display = 'none';
    });

    // Alternar dropdown dos géneros
    window.toggleDropdown = function (id) {
        const dropdown = document.getElementById(id);
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    };

    // Aplicar filtros (status, tipo, ordem e géneros)
    function aplicarFiltros() {
        const status = document.getElementById("filtro-status").value.toLowerCase();
        const tipo = document.getElementById("filtro-tipo").value.toLowerCase();
        const ordem = document.getElementById("filtro-ordem").value;
        const generosSelecionados = Array.from(document.querySelectorAll(".filtro-genero:checked")).map(el => el.value);

        // Atualizar contador de género
        document.getElementById("contador-genero").textContent = generosSelecionados.length > 0
            ? `${generosSelecionados.length} selecionado(s)`
            : "Todos";

        let cards = Array.from(document.querySelectorAll(".manga-card"));

        // Filtrar cards
        cards.forEach(card => {
            const statusCard = card.querySelector("p:nth-of-type(1)").textContent.toLowerCase();
            const tipoCard = card.querySelector("p:nth-of-type(2)").textContent.toLowerCase();
            const generosCard = card.dataset.generos;

            const generoValido = generosSelecionados.length === 0 || generosSelecionados.every(g => generosCard.includes(g));
            const statusValido = status === "" || statusCard.includes(status);
            const tipoValido = tipo === "" || tipoCard.includes(tipo);

            card.style.display = (generoValido && statusValido && tipoValido) ? "block" : "none";
        });

        // Ordenar cards visíveis
        const container = document.getElementById("manga-list");
        let cardsFiltrados = cards.filter(card => card.style.display === "block");

        if (ordem === "az") {
            cardsFiltrados.sort((a, b) => a.querySelector("h3").textContent.localeCompare(b.querySelector("h3").textContent));
        } else if (ordem === "za") {
            cardsFiltrados.sort((a, b) => b.querySelector("h3").textContent.localeCompare(a.querySelector("h3").textContent));
        } else if (ordem === "mais" || ordem === "menos") {
            cardsFiltrados.sort((a, b) => {
                const capA = parseInt(a.querySelector("p:nth-of-type(3)").textContent.replace(/\D/g, ""));
                const capB = parseInt(b.querySelector("p:nth-of-type(3)").textContent.replace(/\D/g, ""));
                return ordem === "mais" ? capB - capA : capA - capB;
            });
        }

        cardsFiltrados.forEach(card => container.appendChild(card));
    }

    // Eventos nos filtros
    document.querySelectorAll(".filtro-genero, #filtro-status, #filtro-tipo, #filtro-ordem")
        .forEach(el => el.addEventListener("change", aplicarFiltros));
});
</script>

</body>
</html>
