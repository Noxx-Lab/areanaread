<?php
$pagina_atual = $pagina_atual ?? "";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/sidebar.css">
</head>
<body>
<div class="sidebar">
    <div class="sidebar-nav">
        <?php if (isset($_SESSION['rank']) && in_array($_SESSION['rank'], ['admin', 'editor'])): ?>
            <a href="dashboard.php" class="<?php echo $pagina_atual === "dashboard" ? "active" : "" ?>">Dashboard</a>
        <?php endif; ?>

        <?php if (isset($_SESSION['rank']) && in_array($_SESSION['rank'], ['admin', 'editor'])): ?>
            <a href="uploud.php" class="<?php echo $pagina_atual === "uploud" ? "active" : "" ?>">Upload</a>
        <?php endif; ?>
    
        <?php if (isset($_SESSION['rank']) && in_array($_SESSION['rank'], ['admin', 'editor'])): ?>
            <a href="editar.php" class="<?php echo $pagina_atual === "editar" ? "active" : "" ?>">Editar</a>
        <?php endif; ?>

        <?php if (isset($_SESSION['rank']) && $_SESSION['rank'] === 'admin'): ?>
            <a href="eliminar.php" class="<?php echo $pagina_atual === "eliminar" ? "active" : "" ?>">Eliminar</a>
        <?php endif; ?>

    </div>
</div>
    
</body>
</html>
