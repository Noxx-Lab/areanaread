<?php include "config.php";
$capa = "https://res.cloudinary.com/dghfkjx36/image/upload/v1749459324/capas/php200C.jpg";
$pagina = "https://res.cloudinary.com/dghfkjx36/image/upload/v1749727559/mangas/revenge-of-the-iron-blooded-sword-hound/capitulo-6/dj84rgouhy68angjgkxy.webp";

echo "Página: ".extrairPublicId($pagina)."<br>";
echo "Capa: ".extrairPublicId($capa,"capa");

?>
