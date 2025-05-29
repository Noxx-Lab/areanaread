<?php
// definição das constantes com os valores do servidor, utilizador, senha e DB
define("SERVER","localhost");
define("USERNAME","root");
define("PASSWORD","");
define("DATABASE","arenaread");

//Ligação ao servirdor MYSQL
$ligaDB=mysqli_connect(SERVER,USERNAME,PASSWORD);
if(!$ligaDB){
    echo"ERRO!!! Falha na ligação ao SERVIDOR";
    exit;
}
//Ligação à base de dados
$escolhaDB=mysqli_select_db($ligaDB,DATABASE);
if(!$escolhaDB){
    echo "ERROR!!! Falha na ligação à base de dados!";
    exit; 
}

function buscar_obra($ligaDB)
{
    $sql_obras = "SELECT id_manga, titulo, capa FROM mangas ORDER BY titulo ASC";
    $stmt_obra = $ligaDB->prepare($sql_obras);
    $stmt_obra->execute();
    return $stmt_obra->get_result()->fetch_all(MYSQLI_ASSOC);
}


function buscar_obra_mais($ligaDB, $id_manga= null, $link=null):mixed{
    if($id_manga !== null){
        $sql_obras = "SELECT * from mangas where id_manga = ?";
        $stmt_obras = $ligaDB->prepare($sql_obras);
        $stmt_obras->bind_param("i", $id_manga);
    }
    elseif($link !== null){
        $sql_obras = "SELECT * from mangas where link = ?";
        $stmt_obras = $ligaDB->prepare($sql_obras);
        $stmt_obras->bind_param("s", $link);
    }
    else{
        return null;
    }
    $stmt_obras->execute();
    return $stmt_obras->get_result()->fetch_assoc();
}

function extrairPublicId($url, $modo = 'pagina') {
    $path = parse_url($url, PHP_URL_PATH);
    $semUpload = explode('/upload/', $path)[1] ?? '';

    if ($modo === 'capa') {
         // Remove "v123456789/"
        $semVersao = preg_replace('#^v\d+/#', '', $semUpload);
        // Remove extensão (.jpg, .png, etc.)
        $semVersao = preg_replace('/\.[a-zA-Z0-9]+$/', '', $semVersao);
        return $semVersao; // ex: capas/php52FC
    }

    // Remove "vXXXXXX/" (a versão do cloudinary)
    $semVersao = preg_replace('#^v\d+/#', '', $semUpload);
    // Remove extensão (.jpg, .webp, .png, ...)
    $semVersao = preg_replace('/\.[a-zA-Z0-9]+$/', '', $semVersao);

    return $semVersao;
}

function buscar_capitulos_manga($ligaDB,$id_manga=null,$id_capitulos=null, $modo = 'normal') {
        $sql_capitulos = "SELECT * from capitulos where id_manga = ? or id_capitulos = ? order by num_capitulo ASC ";
        $stmt_capitulos = $ligaDB->prepare($sql_capitulos);
        $stmt_capitulos->bind_param("ii", $id_manga,$id_capitulos);
        $stmt_capitulos->execute();

        if($modo === 'array'){
            return $result = $stmt_capitulos->get_result()->fetch_all(MYSQLI_ASSOC);
        }
        return $result = $stmt_capitulos->get_result()->fetch_assoc();
}

function converte_webp($tempFile,$nomeArquivo,$extensao){
    // Converte para WebP
    $novoArquivoWebP = sys_get_temp_dir() . '/' . pathinfo($nomeArquivo, PATHINFO_FILENAME) . ".webp";

    if(in_array($extensao,['jpg','jpeg'])){
        $image = imagecreatefromjpeg($tempFile);
    }
    elseif($extensao === 'png'){
        $image = imagecreatefrompng($tempFile);
        error_reporting(E_ERROR | E_PARSE);
    }
    else{
        return false;}
    if($image){
        imagewebp($image, $novoArquivoWebP, 100); // Qualidade 100%
        imagedestroy($image);
        $tempFile = $novoArquivoWebP; // Substituir pelo WebP
        return $novoArquivoWebP;
    }
    return false;
}

function buscar_pagina ($ligaDB,$id_manga = null,$id_capitulos = null, $modo = 'normal'){
    $sql_pagina = "SELECT * from paginas where id_manga = ? or id_capitulos = ?";
    $stmt_pagina = $ligaDB->prepare($sql_pagina);
    $stmt_pagina->bind_param("ii", $id_manga, $id_capitulos);
    $stmt_pagina->execute();

    if ($modo === "array"){
        return $result = $stmt_pagina->get_result()->fetch_all(MYSQLI_ASSOC);
    }
    return $result = $stmt_pagina->get_result()->fetch_assoc();

}

function eliminar ($ligaDB, $id, $modo){
    if ($modo === "obra"){
        //Elimina todas as páginas dessa obra
        $sql_eliminar_pagina = "DELETE from paginas where id_manga = ?";
        $stmt_eliminar_pagina = $ligaDB->prepare($sql_eliminar_pagina);
        $stmt_eliminar_pagina->bind_param("i", $id);
        $stmt_eliminar_pagina->execute();

        //Elimina todos os capitulos dessa obra
        $sql_eliminar_capitulos = "DELETE from capitulos where id_manga = ?";
        $stmt_eliminar_capitulos = $ligaDB->prepare($sql_eliminar_capitulos);
        $stmt_eliminar_capitulos->bind_param("i", $id);
        $stmt_eliminar_capitulos->execute();

        //Elimina a própria obra
        $sql_eliminar_manga = "DELETE from mangas where id_manga = ?";
        $stmt_eliminar_manga = $ligaDB->prepare($sql_eliminar_manga);
        $stmt_eliminar_manga->bind_param("i", $id);
        return $stmt_eliminar_manga->execute(); //vai devolver true/false para confirmar
    }
    else if ($modo === "capitulo"){
        //Eliminar as páginas dos capitulos selecionados 
        $sql_eliminar_pagina = "DELETE from paginas where id_capitulos = ?";
        $stmt_eliminar_pagina = $ligaDB->prepare($sql_eliminar_pagina);
        $stmt_eliminar_pagina->bind_param("i", $id);
        $stmt_eliminar_pagina->execute();

        //Elimina o(s) capitulo(S) selecionados
        $sql_eliminar_capitulos = "DELETE from capitulos where id_capitulos = ?";
        $stmt_eliminar_capitulos = $ligaDB->prepare($sql_eliminar_capitulos);
        $stmt_eliminar_capitulos->bind_param("i", $id);
        return $stmt_eliminar_capitulos->execute(); //vai devolver true/false para confirmar
    }
    return false; // que deu errado
}

function generos ($ligaDB, $id_manga=null){
    if ($id_manga === null){
        $sql_generos = "SELECT * FROM generos ORDER BY nome_genero ASC";
        $result_generos = $ligaDB->query($sql_generos);
        return $result_generos->fetch_all(MYSQLI_ASSOC);
    }
    else{
        $sql_generos = "SELECT g.* from manga_generos mg inner join generos g on mg.id_genero = g.id_genero where mg.id_manga = ?";
        $result_generos = $ligaDB->prepare($sql_generos);
        $result_generos->bind_param("i", $id_manga);
        $result_generos->execute();
        return $result_generos->get_result()->fetch_all(MYSQLI_ASSOC);
    }
}
