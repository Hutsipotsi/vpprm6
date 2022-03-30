<?php
//require 'config.php';

//Tässä haetaan tiedot init-tiedostosta. 
//Voit käyttää myös ylempänä olevaa config.php tiedostoa
//jos haluat. Kommentoi silloin seuraavat rivit.
$init = parse_ini_file("conf.ini");
$host = $init["host"];
$db = $init["db"];
$user = $init["username"];
$password = $init["pw"];

$dsn = "mysql:host=$host;dbname=$db;charset=UTF8";
try {
	$pdo = new PDO($dsn, $user, $password);
    //echo "Connected!";
} catch (PDOException $e) {
	echo $e->getMessage();
}
