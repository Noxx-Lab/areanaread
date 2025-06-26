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

function extrairPublicId($url) {
    $path = parse_url($url, PHP_URL_PATH);
    $semUpload = explode('/upload/', $path)[1] ?? '';
    // Remove "v123456789/"
    $semVersao = preg_replace('#^v\d+/#', '', $semUpload);
    // Remove extensão (.jpg, .png, etc.)
    $semVersao = preg_replace('/\.[a-zA-Z0-9]+$/', '', $semVersao);
    return $semVersao; // ex: capas/php52FC

}

function eliminar_user_progress($ligaDB, $id)
{
    $sql_link = "SELECT m.link, c.num_capitulo from mangas m join capitulos c on c.id_manga = m.id_manga where c.id_capitulos = ? ";
    $stmt_link = $ligaDB->prepare($sql_link);
    $stmt_link->bind_param("i", $id);
    $stmt_link->execute();
    $result_link = $stmt_link->get_result()->fetch_assoc();
    $link = $result_link["link"];
    $num_capitulo = $result_link["num_capitulo"];

    $sql_progress = "SELECT * from user_progress where link_manga = ? ";
    $stmt_progress = $ligaDB->prepare($sql_progress);
    $stmt_progress->bind_param("s", $link);
    $stmt_progress->execute();
    $result_progress = $stmt_progress->get_result()->fetch_all(MYSQLI_ASSOC);

    foreach ($result_progress as $progresso) {
        $capitulos_lidos = json_decode($progresso["capitulos_lidos"], true);
        $capitulos_lidos = array_filter($capitulos_lidos, function ($num) use ($num_capitulo) {
            return $num != $num_capitulo;
        });

        $novo_progresso = json_encode(array_values($capitulos_lidos));
        $sql_update = "UPDATE user_progress set capitulos_lidos = ? where iduser = ? and link_manga = ?";
        $stmt_update = $ligaDB->prepare($sql_update);
        $stmt_update->bind_param("sis", $novo_progresso, $progresso["iduser"], $link);
        return $stmt_update->execute();
    }
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

        // Apagar o(s) capitulo(s) do user_progress
        $eliminar_user_progress = eliminar_user_progress($ligaDB, $id);
        

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

function contar ($ligaDB, $id = null, $modo){
    if ($modo ==="cap_por_obra"){// Conta os capítulos deste mangá
        $sql_count_manga = "SELECT count(DISTINCT c.id_capitulos) as total from capitulos c inner join paginas p on c.id_capitulos = p.id_capitulos where c.id_manga = ? ";
        $stmt_count = $ligaDB->prepare($sql_count_manga);
        $stmt_count->bind_param("i", $id);
        $stmt_count->execute();
        $result_count = $stmt_count->get_result();
        return $capitulos = $result_count->fetch_assoc()['total'];}
    if($modo === 'pag_por_cap'){
        //para verificar se o capitulo tem páginas para o utilizador não ver capitulos vazios
        $sql_count_pag = "SELECT COUNT(*) as total from paginas where id_capitulos = ?";
        $stmt_count_pag = $ligaDB->prepare($sql_count_pag);
        $stmt_count_pag->bind_param("i", $id);
        $stmt_count_pag->execute();
        $result = $stmt_count_pag->get_result();
        return $result->fetch_assoc()['total'] > 0; // true se tem páginas
    }
    if($modo === "obra_com_pag"){
        //Conta quantar obras têm páginas 
        $sql_total = "SELECT count(DISTINCT m.id_manga) as total from mangas m join capitulos c on m.id_manga = c.id_manga join paginas p on c.id_capitulos = p.id_capitulos";
        $stmt_total = $ligaDB->prepare($sql_total);
        $stmt_total->execute();
        return $result_total = $stmt_total->get_result()->fetch_assoc()["total"];
    }
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

function capitulos_lidos($ligaDB, $iduser, $link){
    $sql_lidos = "SELECT capitulos_lidos from user_progress where iduser = ? and link_manga = ?";
    $stmt_lidos = $ligaDB->prepare($sql_lidos);
    $stmt_lidos ->bind_param("is", $iduser, $link);
    $stmt_lidos -> execute();
    $result_lidos = $stmt_lidos-> get_result();

    if($cap_lidos = $result_lidos -> fetch_assoc()){
        $capitulos_lidos = json_decode($cap_lidos['capitulos_lidos'], true);
        if (is_array($capitulos_lidos)) {
            return $capitulos_lidos; // devolve array dos capítulos lidos
        }
    }

}

function verificar_link ($ligaDB, $link){
    $sql_verifica = "SELECT id_manga FROM mangas WHERE link = ?";
    $stmt_verifica = $ligaDB->prepare($sql_verifica);
    $stmt_verifica->bind_param("s", $link);
    $stmt_verifica->execute();
    $result_verifica = $stmt_verifica->get_result();

    return $result_verifica->num_rows > 0;

    
}

