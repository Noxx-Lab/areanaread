<?php
include 'config.php';
include 'navbar.php';

$por_pagina = 16;
$limite_total = 100;

$pagina_atual = isset($_GET['pagina']) ? max(1, intval($_GET['pagina'])) : '1';

$offset = ($pagina_atual - 1) * $por_pagina;

$mangas_carrossel = [];
$sql_manga = "SELECT m.id_manga, m.titulo, m.link, m.sinopse, m.capa FROM mangas m JOIN capitulos c ON m.id_manga = c.id_manga JOIN paginas p ON c.id_capitulos = p.id_capitulos GROUP BY m.id_manga ORDER BY MAX(c.data_lancamento) DESC LIMIT 5";

$result_manga = $ligaDB->query($sql_manga);

//Para o carrosel 
while ($mangas = $result_manga->fetch_assoc()){
    $id_manga = $mangas["id_manga"];

    $sql_generos = "SELECT nome_genero from generos inner join manga_generos on generos.id_genero = manga_generos.id_genero
                    where manga_generos.id_manga = ?";
    $stmt_generos = $ligaDB->prepare($sql_generos);
    $stmt_generos->bind_param("i", $id_manga);
    $stmt_generos->execute();
    $result_generos = $stmt_generos->get_result();

    $generos = [];
    while ($row = $result_generos->fetch_assoc()) {
        $generos[] = $row['nome_genero'];
    }

    $mangas['generos'] = $generos;


    $mangas['total_capitulos'] = contar($ligaDB, $id_manga, "cap_por_obra");
    $mangas_carrossel[] = $mangas;
}



$ultimos_mangas = [];

$total_obras = contar($ligaDB, null,"obra_com_pag");
$total_paginas = min($total_obras, $limite_total);
$total_paginas = ceil($total_obras / $por_pagina);

$sql_ultimos = "SELECT m.id_manga, m.titulo, m.link, m.capa, m.sinopse from mangas m join capitulos c on m.id_manga = c.id_manga join paginas p on c.id_capitulos = p.id_capitulos group by m.id_manga order by MAX(c.data_lancamento) DESC LIMIT $por_pagina offset $offset";

$result_ultimos = $ligaDB->query($sql_ultimos);

//Para os cards 
while ($manga = $result_ultimos->fetch_assoc()){
    $id_manga = $manga['id_manga'];

    //Para os capitulos
    $stmt_ultimo = "SELECT DISTINCT c.id_capitulos, c.num_capitulo, c.data_lancamento from capitulos c inner join paginas p on c.id_capitulos = p.id_capitulos where c.id_manga = ? order by c.data_lancamento DESC, c.num_capitulo ASC limit 3";
    $stmt_capitulo= $ligaDB ->prepare($stmt_ultimo);
    $stmt_capitulo -> bind_param("i", $id_manga);
    $stmt_capitulo -> execute();
    $capitulos_result = $stmt_capitulo -> get_result();

    $capitulos = [];
    while ($cap = $capitulos_result->fetch_assoc()){
        $capitulos [] = $cap;
    
    }
    $manga['capitulos'] = $capitulos;
    $ultimos_mangas[] = $manga;
    
    }


?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ArenaRead</title>
    <link rel="stylesheet" href="/arenaread/css/index.css">
    <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>

<div class="carousel-container">
    <div class="carousel-wrapper">
        <div class="carousel" id="carousel">
            <?php foreach ($mangas_carrossel as $manga): ?>
                <div class="carousel-item">
                    <div class="carousel-conteudo">
                        <div class="carousel-texto">
                            <span class="capitulo">Capítulo: <?php echo $manga['total_capitulos']; ?> </span>
                            <h2><?php echo htmlspecialchars($manga['titulo']); ?></h2>
                            <p><?php echo htmlspecialchars($manga['sinopse']); ?></p>
                            <div class="carousel-generos">
                                <?php foreach ($manga['generos'] as $genero): ?>
                                <span class="genero-tag"><?= htmlspecialchars($genero) ?></span>
                                <?php endforeach; ?>
                            </div>
                            <a href="/arenaread/<?php echo $manga['link']; ?>" class="botao-ler">Leia agora</a>
                        </div>
                        <div class="carousel-imagem">
                            <img src="<?php echo $manga['capa']; ?>" alt="<?php echo htmlspecialchars($manga['titulo']); ?>">
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
    <div class="carousel-indicadores" id="carousel-indicadores"></div>
</div>
<section class="atualizacoes-container">
    <h2 class="titulo-atualizacoes">Últimas Atualizações</h2>
    <div class="grid-atualizacoes">
        <?php foreach ($ultimos_mangas as $manga): ?>
            <?php
            $lidos = [];
            if (isset($_SESSION["iduser"])) {
            $lidos = capitulos_lidos($ligaDB, $_SESSION["iduser"], $manga["id_manga"]);
            }
            ?>
            <div class="card-atualizacao">
                <a href="/arenaread/<?php echo $manga['link']; ?>">
                    <img src="<?php echo $manga['capa']; ?>" alt="<?php echo htmlspecialchars($manga['titulo']); ?>">
                </a>
                <h3 class="titulo-manga" title="<?php echo htmlspecialchars($manga['titulo']) ?>">
                    <?php echo htmlspecialchars($manga['titulo']) ?>
                </h3>
                <ul class="capitulos-lista">
                    <?php foreach ($manga['capitulos'] as $cap): ?>
                        <?php
                            $classe_lido = '';
                            if (isset($_SESSION['iduser']) && in_array((int) $cap['id_capitulos'], $lidos)) {
                                $classe_lido = 'capitulo-lido';
                            }
                        ?>
                        <li>
                            <a href="/arenaread/<?php echo $manga['link']; ?>/capitulo-<?php echo $cap['num_capitulo']; ?>" class = "<?php echo $classe_lido ?>">
                                Capítulo <?php echo $cap['num_capitulo']; ?>
                                <span class="tempo"><?php echo tempoDecorrido($cap['data_lancamento']); ?></span>
                            </a>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
        <?php endforeach; ?>
    </div>
</section>
<div class="navegacao">
  <?php if ($pagina_atual > 1): ?>
    <a href="?pagina=<?php echo $pagina_atual - 1; ?>" class="botao-navegacao"><i class="bi bi-arrow-left"></i> Anterior</a>
  <?php endif; ?>

  <span class="pagina-atual">Página <?php echo $pagina_atual; ?> de <?php echo $total_paginas; ?></span>

  <?php if ($pagina_atual < $total_paginas): ?>
    <a href="?pagina=<?php echo $pagina_atual + 1; ?>" class="botao-navegacao">Próximo <i class="bi bi-arrow-right"></i></a>
  <?php endif; ?>
</div>

<footer class="footer">
  <p><a href="termos.php">Termos e Condições</a> | 
     <a href="privacidade.php">Política de Privacidade</a></p>
  <p>Contacto: arenaread.devv@gmail.com</a></p>
</footer>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const carousel = document.getElementById("carousel");
    const items = document.querySelectorAll(".carousel-item");
    const indicadores = document.getElementById("carousel-indicadores");
    let index = 0;
    const total = items.length;
    let intervalo;

    carousel.style.width = `${total * 100}%`;
    items.forEach(item => item.style.flex = `0 0 ${100 / total}%`);

    for (let i = 0; i < total; i++) {
        const dot = document.createElement("span");
        dot.classList.add("dot");
        if (i === 0) dot.classList.add("active");
        dot.addEventListener("click", () => {
            index = i;
            updateCarousel();
            resetAutoplay();
        });
        indicadores.appendChild(dot);
    }

    function updateCarousel() {
        const offset = -index * (100 / total);
        carousel.style.transform = `translateX(${offset}%)`;
        document.querySelectorAll(".dot").forEach((dot, i) => {
            dot.classList.toggle("active", i === index);
        });
    }

    function autoplay() {
        index = (index + 1) % total;
        updateCarousel();
    }

    function resetAutoplay() {
        clearInterval(intervalo);
        intervalo = setInterval(autoplay, 6000);
    }

    intervalo = setInterval(autoplay, 6000);

    let startX = 0;
    let endX = 0;

    carousel.addEventListener("mousedown", (e) => {
        startX = e.clientX;
        carousel.style.userSelect = "none";
    });

    carousel.addEventListener("mouseup", (e) => {
        endX = e.clientX;
        handleSwipe();
        carousel.style.userSelect = "auto";
    });

    carousel.addEventListener("touchstart", (e) => {
        startX = e.touches[0].clientX;
    });

    carousel.addEventListener("touchend", (e) => {
        endX = e.changedTouches[0].clientX;
        handleSwipe();
    });

    function handleSwipe() {
        const threshold = 50; // distância mínima para trocar
        const delta = endX - startX;

        if (delta > threshold) {
            index = index > 0 ? index - 1 : total - 1; // voltar
        } else if (delta < -threshold) {
            index = index < total - 1 ? index + 1 : 0; // avançar
        }
        updateCarousel();
        resetAutoplay();
    }

    // SETAS DO TECLADO
    document.addEventListener("keydown", function (e) {
        if (e.key === "ArrowRight") {
            index = (index + 1) % total;
            updateCarousel();
            resetAutoplay();
        } else if (e.key === "ArrowLeft") {
            index = (index - 1 + total) % total;
            updateCarousel();
            resetAutoplay();
        }
    });
});

</script>

</body>
</html>
