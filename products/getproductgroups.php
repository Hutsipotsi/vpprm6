<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$uri = parse_url(filter_input(INPUT_SERVER,'PATH_INFO'),PHP_URL_PATH);
$parameters = explode('/',$uri);
$category_id = $parameters[1];

try {
    $db = openDb();
    $sql = "select * from productgroup where id = $category_id";
    $query = $db->query($sql);
    $category = $query->fetch(PDO::FETCH_ASSOC);

    $sql = "select * from product where prodcategory = $category_id";
    $query = $db->query($sql);
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "category" => $category['name'],
        "products" => $products), JSON_PRETTY_PRINT);

    //selectAsJson($db,"select * from productname where id = $category_id");
} catch(PDOException $pdoex) {
    returnError($pdoex);
}