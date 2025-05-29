<?php
include 'config.php';
include 'navbar.php';

function tempoDecorrido($data) {
    $agora = new DateTime();
    $data = new DateTime($data);
    $diff = $agora->diff($data);

    $tempos = [
        'y' => 'ano',
        'm' => 'mês',
        'd' => 'dia',
        'h' => 'hora',
        'i' => 'min'
    ];

    foreach ($tempos as $chave => $texto) {
        if ($diff->$chave > 0) {
            return $diff->$chave . ' ' . $texto . ($diff->$chave > 1 ? 's' : '') . ' atrás';
        }
    }

    return 'Agora mesmo';
}



$sql_manga = "SELECT id_manga, titulo, link, sinopse, capa from mangas order by RAND() Desc limit 10";
$result_manga = $ligaDB->query($sql_manga);

$mangas_carrossel = [];

$ultimos_mangas = [];


$sql_ultimos = "SELECT m.id_manga, m.titulo, m.link, m.capa, m.sinopse from mangas m join capitulos c on m.id_manga = c.id_manga
group by m.id_manga ORDER BY MAX(c.data_lancamento) Desc limit 10";

$result_ultimos = $ligaDB->query($sql_ultimos);

while ($manga = $result_ultimos->fetch_assoc()){
    $id_manga = $manga['id_manga'];

    $stmt_ultimo = "SELECT DISTINCT c.num_capitulo, c.data_lancamento from capitulos c inner join paginas p on c.id_capitulos = p.id_capitulos where c.id_manga = ? order by c.data_lancamento Desc limit 3";
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

    $manga['generos'] = $generos;


    $capitulos = [];
    while ($cap = $capitulos_result->fetch_assoc()) {
        $capitulos[] = $cap;
    }

    
    $manga['total_capitulos'] = contar($ligaDB, $id_manga);
    $mangas_carrossel[] = $manga;
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
                    <div class="carousel-content">
                        <div class="carousel-text">
                            <span class="capitulo">Capítulo: <?php echo $manga['total_capitulos']; ?> </span>
                            <h2><?php echo htmlspecialchars($manga['titulo']); ?></h2>
                            <p><?php echo htmlspecialchars($manga['sinopse']); ?></p>
                            <div class="carousel-generos">
                                <?php foreach ($manga['generos'] as $genero): ?>
                                <span class="genero-tag"><?= htmlspecialchars($genero) ?></span>
                                <?php endforeach; ?>
                            </div>
                            <a href="/arenaread/<?php echo $manga['link']; ?>" class="read-button">Leia agora</a>
                        </div>
                        <div class="carousel-image">
                            <img src="<?php echo $manga['capa']; ?>" alt="<?php echo htmlspecialchars($manga['titulo']); ?>">
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
    <div class="carousel-indicators" id="carousel-indicators"></div>
</div>
<section class="atualizacoes-container">
    <h2 class="titulo-atualizacoes">Últimas Atualizações</h2>
    <div class="grid-atualizacoes">
        <?php foreach ($ultimos_mangas as $manga): ?>
            <div class="card-atualizacao">
                <a href="/arenaread/<?php echo $manga['link']; ?>">
                    <img src="<?php echo $manga['capa']; ?>" alt="<?php echo htmlspecialchars($manga['titulo']); ?>">
                </a>
                <h3 class="titulo-manga" title="<?php echo htmlspecialchars($manga['titulo']) ?>">
                    <?= htmlspecialchars($manga['titulo']) ?>
                </h3>
                <ul class="capitulos-lista">
                    <?php foreach ($manga['capitulos'] as $cap): ?>
                        <li>
                            <a href="/arenaread/<?php echo $manga['link']; ?>/capitulo-<?php echo $cap['num_capitulo']; ?>">
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

<script>
document.addEventListener("DOMContentLoaded", function () {
    const carousel = document.getElementById("carousel");
    const items = document.querySelectorAll(".carousel-item");
    const indicators = document.getElementById("carousel-indicators");
    let index = 0;
    const total = items.length;
    let interval;

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
        indicators.appendChild(dot);
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
        clearInterval(interval);
        interval = setInterval(autoplay, 6000);
    }

    interval = setInterval(autoplay, 6000);

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
