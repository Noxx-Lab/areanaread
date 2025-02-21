<?php
include 'config.php'; // Conexão com o banco de dados

if (isset($_POST['id_manga'])) {
    $id_manga = $_POST['id_manga'];

    $sqlcap = $ligaDB->prepare("SELECT id_capitulos, num_capitulo FROM capitulos WHERE id_manga = ?");
    $sqlcap->bind_param("i", $id_manga);
    $sqlcap->execute();
    $resultcap = $sqlcap->get_result();

    $capitulos = [];
    while ($row = $resultcap->fetch_assoc()) {
        $capitulos[] = $row;
    }

    echo json_encode($capitulos);
}
?>
