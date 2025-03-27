<?php
include 'config.php';
include 'navbar.php';

// Buscar os últimos 10 mangás
$sql_manga = "SELECT id_manga, titulo, link, sinopse, capa FROM mangas ORDER BY RAND() DESC LIMIT 10";
$result_manga = $ligaDB->query($sql_manga);

// Verifica se há registros
$tem_mangas = $result_manga->num_rows > 0;
?>

<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ArenaRead</title>
    <link rel="stylesheet" href="/arenaread/css/index.css">
</head>
<body>

<div class="carousel-container">
    <div class="carousel-wrapper">
        <div class="carousel" id="carousel">
            <?php while ($manga = $result_manga->fetch_assoc()): ?>
                <div class="carousel-item">
                    <div class="carousel-content">
                        <div class="carousel-text">
                            <span class="capitulo">Capítulo 1</span>
                            <h2><?php echo htmlspecialchars($manga['titulo']); ?></h2>
                            <p><?php echo htmlspecialchars($manga['sinopse']); ?></p>
                            <a href="/arenaread/<?php echo $manga['link']; ?>" class="read-button">Leia agora</a>
                        </div>
                        <div class="carousel-image">
                            <img src="<?php echo $manga['capa']; ?>" alt="<?php echo htmlspecialchars($manga['titulo']); ?>">
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        </div>
    </div>
    <div class="carousel-indicators" id="carousel-indicators"></div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const carousel = document.getElementById("carousel");
    const items = document.querySelectorAll(".carousel-item");
    const indicators = document.getElementById("carousel-indicators");
    let index = 0;
    const total = items.length;
    let interval;

    // Garantir largura total do carrossel
    carousel.style.width = `${total * 100}%`;

    // Definir largura de cada item
    items.forEach(item => {
        item.style.flex = `0 0 ${100 / total}%`;
    });

    // Criar indicadores
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
});
</script>

</body>
</html>
