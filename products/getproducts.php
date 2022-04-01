<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'),PHP_URL_PATH);
$parameters = explode('/',$uri);
$category = $parameters[0];

try {
    $db = openDb();
    $sql = "select * from productgroup where groupname = $category";
    $query = $db->query($sql);
    $productgroup = $query->fetch(PDO::FETCH_ASSOC);

    $sql = "select * from product where prodcategory = $category";
    $query = $db->query($sql);
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "productgroup" => $productgroup['groupname'],
        "product" => $products
    ));
}

catch (PDOException $pdoex) {
    returnError($pdoex);
}