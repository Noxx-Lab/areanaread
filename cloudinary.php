<?php
include 'vendor\autoload.php'; // Garante que o Cloudinary está instalado

use Cloudinary\Configuration\Configuration;

Configuration::instance([
    'cloud' => [
        'cloud_name' =>  'dghfkjx36', 
        'api_key'    => '293911136245679', 
        'api_secret' => '15TW0fnC0C2krN612kNLgUKQGkA',
    ],
    'url' => [
        'secure' => true // Garante que os URLs são HTTPS
    ]
]);
?>
