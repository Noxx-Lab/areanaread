<?php include "config.php";
$capa = "https://res.cloudinary.com/dghfkjx36/image/upload/v1749735432/capas/php510B.jpg";
$pagina = "https://res.cloudinary.com/dghfkjx36/image/upload/v1749727559/mangas/revenge-of-the-iron-blooded-sword-hound/capitulo-6/dj84rgouhy68angjgkxy.webp";

echo "Página: ".extrairPublicId($pagina)."<br>";
echo "Capa: ".extrairPublicId($capa,"capa")."<br>";
$total_pag = $ligaDB ->query("SELECT count(id_pagina) as total from paginas")->fetch_assoc();
$total_cap = $ligaDB ->query("SELECT count(*) as total from capitulos")->fetch_assoc();
echo $total_pag["total"]."<br>";
echo $total_cap["total"]."<br>";
$link = buscar_obra_mais($ligaDB, 87)["link"];
$num_capitulo = buscar_capitulos_manga($ligaDB, null, 308, 'normal')["num_capitulo"];
$prefixo = "manga/$link/capitulo-$num_capitulo/";
echo $prefixo;
?>
