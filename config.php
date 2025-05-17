<?php
// definição das constantes com os valores do servidor, utilizador, senha e DB
define("SERVER","localhost");
define("USERNAME","root");
define("PASSWORD","");
define("DATABASE","arena_read");

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