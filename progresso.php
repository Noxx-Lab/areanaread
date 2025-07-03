<?php
session_start();
include "config.php";

$progresso = json_decode(file_get_contents("php://input"), true);

$iduser = $_SESSION["iduser"];
$link_manga = $progresso["link_manga"];
$capitulos_lidos = $progresso["capitulos_lidos"]; // Agora usamos como array simples

// Verifica se o utilizador existe
$sql_verifica_user = "SELECT * from users where iduser = ?";
$verifica_user = $ligaDB->prepare($sql_verifica_user);
$verifica_user->bind_param("i", $iduser);
$verifica_user->execute();
$result_user = $verifica_user->get_result();

$result_link = verificar_link($ligaDB, $link_manga);
if ($result_link == false) {
    http_response_code(400);
    exit("Utilizador ou manga não encontrados");
}

$id_manga = buscar_obra_mais($ligaDB, null, $link_manga)["id_manga"];

$capitulos_existentes = buscar_capitulos_manga($ligaDB, $id_manga, null, "array");
$capitulos_validos = [];
foreach ($capitulos_existentes as $cap) {
    $capitulos_validos[] = $cap["num_capitulo"];
}

// Validação dos capítulos recebidos
foreach ($capitulos_lidos as $num_cap) {
    if (!in_array($num_cap, $capitulos_validos)) {
        http_response_code(400);
        exit("Capítulo inválido enviado: $num_cap");
    }
}

$sql_progresso = "SELECT * FROM user_progress WHERE iduser = ? AND link_manga = ?";
$stmt_progresso = $ligaDB->prepare($sql_progresso);
$stmt_progresso->bind_param("is", $iduser, $link_manga);
$stmt_progresso->execute();
$result_progresso = $stmt_progresso->get_result();

if ($result_progresso->num_rows > 0) {
    // Já existe progresso → fundir dados existentes
    $row = $result_progresso->fetch_assoc();
    $capitulos_bd = explode(",", $row['capitulos_lidos']);

    if (!is_array($capitulos_bd)) {
        $capitulos_bd = [];
    }

    // Fundir e remover duplicados
    $todos_capitulos = array_unique(array_merge($capitulos_bd, $capitulos_lidos));
    $cap_validos = implode(",", $todos_capitulos);

    $sql_atualizar = "UPDATE user_progress SET capitulos_lidos = ? WHERE iduser = ? AND link_manga = ?";
    $stmt_atualizar = $ligaDB->prepare($sql_atualizar);
    $stmt_atualizar->bind_param("sis", $cap_validos, $iduser, $link_manga);
    $stmt_atualizar->execute();
} else {
    $cap_validos = implode(",", $capitulos_lidos);

    $sql_insert = "INSERT INTO user_progress (iduser, link_manga, capitulos_lidos) VALUES (?, ?, ?)";
    $stmt_insert = $ligaDB->prepare($sql_insert);
    $stmt_insert->bind_param("iss", $iduser, $link_manga, $cap_validos);
    $stmt_insert->execute();
}

echo json_encode([
    'status' => 'ok',
    'limpar_localStorage' => true,
    'rows_affected' => $ligaDB->affected_rows
]);
?>