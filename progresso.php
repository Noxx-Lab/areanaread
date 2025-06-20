<?php
session_start();
include "config.php";


$progresso = json_decode(file_get_contents("php://input"), true);

$iduser = $_SESSION["iduser"];
$link_manga = $progresso["link_manga"];
$capitulos_lidos  = $progresso["capitulos_lidos"]; //Guardamos em JSON

if (count($capitulos_lidos) > 1000) {
    http_response_code(400);
    exit("Limite de capítulos ultrapassado.");
}


$sql_verifica_user = "SELECT * from users where iduser = ?";
$verifica_user = $ligaDB -> prepare($sql_verifica_user);
$verifica_user -> bind_param("i", $iduser);
$verifica_user ->execute();
$result_user = $verifica_user -> get_result();


$result_link = verificar_link($ligaDB, $link_manga);

if($result_link == false ){
    http_response_code(400);
    exit("Utilizador ou manga não encontrados");
}

$id_manga = buscar_obra_mais($ligaDB, null, $link_manga)["id_manga"];

$capitulos_existentes = buscar_capitulos_manga($ligaDB, $id_manga, null,"array");
$capitulos_validos = [];
foreach($capitulos_existentes as $cap){
    $capitulos_validos [] = $cap["num_capitulo"];
}

foreach ($capitulos_lidos as $num_cap){
    if(!in_array($num_cap,$capitulos_validos)){
        http_response_code(400);
        exit("Capítulo inválido enviado: $num_cap");
    }
}


$sql_progresso = "SELECT * from user_progress where iduser = ? and link_manga = ?";
$stmt_progresso = $ligaDB -> prepare($sql_progresso);
$stmt_progresso -> bind_param("is", $iduser,$link_manga);
$stmt_progresso -> execute();
$result_progresso = $stmt_progresso -> get_result();

$cap_validos = json_encode($capitulos_lidos);
if ($result_progresso->num_rows > 0){
    $sql_atualizar = "UPDATE user_progress set capitulos_lidos = ? where iduser = ? and link_manga = ?";
    $stmt_atualizar = $ligaDB->prepare($sql_atualizar);
    $stmt_atualizar -> bind_param("sis", $cap_validos, $iduser, $link_manga);
    $stmt_atualizar->execute();
}
else{
    $sql_insert = "INSERT into user_progress (iduser, link_manga, capitulos_lidos) values (?, ?, ?)";
    $stmt_insert = $ligaDB -> prepare($sql_insert);
    $stmt_insert -> bind_param("iss", $iduser, $link_manga, $cap_validos);
    $stmt_insert->execute();
}

// No final do progresso.php, após o INSERT ou UPDATE
echo json_encode([
    'status' => 'ok',
    'rows_affected' => $ligaDB->affected_rows
]);



?>