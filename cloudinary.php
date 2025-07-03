<?php
require 'vendor/autoload.php'; // Garante que o Cloudinary está instalado

use Cloudinary\Configuration\Configuration;

Configuration::instance([
    'cloud' => [
        'cloud_name' =>  'dqn5ieptf', 
        'api_key'    => '428725642433822', 
        'api_secret' => 'Y0QkCLUKGp1JaVcZZJuk3rGoxDw',
    ],
    'url' => [
        'secure' => true // Garante que os URLs são HTTPS
    ]
]);
?>
