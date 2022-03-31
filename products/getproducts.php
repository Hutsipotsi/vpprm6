<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'),PHP_URL_PATH);
$parameters = explode('/',$uri);
$prodcategory = $parameters[1];

try {
    $db = openDb();
    $sql = "select * from productgroup where id = $prodcategory";
    $query = $db->query($sql);
    $productgroup = $query->fetch(PDO::FETCH_ASSOC);

    $sql = "select * from product where prodcategory = $prodcategory";
    $query = $db->query($sql);
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "productgroup" => $productgroup['prodname'],
        "products" => $products
    ));
}

catch (PDOException $pdoex) {
    returnError($pdoex);
}