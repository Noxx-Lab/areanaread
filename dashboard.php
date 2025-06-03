<?php
session_start();
include "config.php";
include "navbar.php";

if (!isset($_SESSION["rank"]) || $_SESSION["rank"] !== "admin") {
    header("Location: index.php");
    exit;
}
//Total de obras (Manga)
$total_obras = $ligaDB->query("SELECT count(*) from mangas")->fetch_column();

//Capitulos por obra (Manga)
$capitulos_por_obras = $ligaDB->query("SELECT m.titulo, count(c.id_capitulos) as total from mangas m left join capitulos c on m.id_manga = c.id_manga group by m.id_manga")->fetch_all();

foreach ($capitulos_por_obras as $obra){
    echo $obra["titulo"] . ": " . $obra["total_capitulos"] ." capítulos<br>";
}

//Obra mais lida
$mais_lido = $ligaDB->query("SELECT m.titulo, count(up.id_manga) as leituras
from mangas m join user_progresso up on m.id_manga = up.id_manga group by m.id_manga
order by leituras DESC limit 1")->fetch_assoc();

//Obras por status
$obras_status = $ligaDB->query("SELECT status, count(*) as total from mangas group by status")->fetch_all();

foreach ($obras_status as $status_obra){
    echo $status_obra["Status"] . ": " . $status_obra["total"];
}







?>