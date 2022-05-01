<?php

$init = parse_ini_file("conf.ini");
$host = $init["host"];
$db = $init["db"];
$user = $init["username"];
$password = $init["pw"];

$dsn = "mysql:host=$host;dbname=$db;charset=UTF8";
try {
	$pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
	echo $e->getMessage();
}
