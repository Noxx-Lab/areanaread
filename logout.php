<?php
session_start();
session_unset();
session_destroy();
header("Location: /arenaread/index.php");
exit();
?>
