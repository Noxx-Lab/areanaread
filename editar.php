<?php
include "config.php";
include "cloudinary.php";
include "navbar.php";

if (!isset($_SESSION["rank"]) || $_SESSION["rank"] !== "admin" ){
    header("Location: index.php");
}

use Cloudinary\Api\Upload\UploadApi;
use Cloudinary\Api\Admin\AdminApi;

$uploadApi = new UploadApi();
$AdminApi = new AdminApi();






?>