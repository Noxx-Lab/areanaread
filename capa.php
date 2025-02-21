<?php
include('config.php');

// Consulta para buscar todos os mangás da base de dados
$sql = "SELECT * FROM mangas";
$result = $ligaDB->query($sql);

// Verifica se existem registros na tabela
if ($result->num_rows > 0) {
    $mangas = [];
    while ($row = $result->fetch_assoc()) {
        $mangas[] = $row; 
    }
}