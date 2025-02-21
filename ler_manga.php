<?php
include "navbar.php";
$sql = "SELECT caminho_pagina FROM paginas WHERE id_manga = ? AND id_capitulos = ? ORDER BY num_pagina ASC";
$stmt = $ligaDB->prepare($sql);
$stmt->bind_param("ii", $id_manga, $id_capitulo);
$stmt->execute();
$result = $stmt->get_result();

echo '<div style="text-align: center;">';
while ($row = $result->fetch_assoc()) {
    echo "<img src='" . $row['caminho_pagina'] . "' style='width: 80%; margin: 10px; display: block;'>";
}
echo '</div>';

?>
 