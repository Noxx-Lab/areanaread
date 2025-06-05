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

        // Apagar progressos desse capítulo
        $sql_del_progress = "DELETE FROM user_progress WHERE id_manga = ?";
        $stmt_del = $ligaDB->prepare($sql_del_progress);
        $stmt_del->bind_param("i", $id);
        $stmt_del->execute();


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

        // Apagar progressos desse capítulo
        $sql_del_progress = "DELETE FROM user_progress WHERE id_capitulo = ?";
        $stmt_del = $ligaDB->prepare($sql_del_progress);
        $stmt_del->bind_param("i", $id);
        $stmt_del->execute();

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

function contar ($ligaDB, $id_manga){
    // Conta os capítulos deste mangá
    $sql_count_manga = "SELECT count(DISTINCT c.id_capitulos) as total from capitulos c inner join paginas p on c.id_capitulos = p.id_capitulos where c.id_manga = ? ";
    $stmt_count = $ligaDB->prepare($sql_count_manga);
    $stmt_count->bind_param("i", $id_manga);
    $stmt_count->execute();
    $result_count = $stmt_count->get_result();
    return $capitulos = $result_count->fetch_assoc()['total'];
    
}

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

function user_progress($ligaDB, $id_user, $id_manga, $id_capitulo ){
    $sql_progress = "INSERT into user_progress (id_user, id_manga, id_capitulo, data_leitura)
    VALUES (?,?,?, NOW()) on duplicate key UPDATE data_leitura = NOW()";
    $stmt_progress = $ligaDB->prepare($sql_progress);
    $stmt_progress->bind_param("iii", $id_user, $id_manga, $id_capitulo);
    $stmt_progress->execute();
}

function capitulos_lidos($ligaDB, $id_user, $id_manga){
    $sql_lido = "SELECT id_capitulo from user_progress where id_user = ? and id_manga = ?";
    $stmt_lido = $ligaDB->prepare($sql_lido);
    $stmt_lido->bind_param("ii", $id_user, $id_manga);
    $stmt_lido->execute();

    $res = $stmt_lido->get_result();
    $capitulosLido = [];
    while ($row = $res->fetch_assoc()) {
        $capitulosLido[] = $row["id_capitulo"];
    }
    return $capitulosLido;
}
