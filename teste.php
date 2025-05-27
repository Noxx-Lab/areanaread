<?php
include "config.php";

$url_capa = "https://res.cloudinary.com/dghfkjx36/image/upload/v1748362969/capas/php80DB.jpg";

$url_pagina = "https://res.cloudinary.com/dghfkjx36/image/upload/v1748365028/mangas/solo-leveling/capitulo-1/slnbnvogpmxxaucdvqwm.webp";

echo "Capa: " .extrairPublicId($url_capa, "capa")."<br>";  

echo "Página: " .extrairPublicId($url_pagina, "pagina");

?>