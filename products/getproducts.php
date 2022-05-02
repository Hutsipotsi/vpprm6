<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'),PHP_URL_PATH);
$parameters = explode('/',$uri);
$category = $parameters[1];

try {
    $db = openDb();
    $sql = "select * from productgroup where id = $category";
    $query = $db->query($sql);
    $productgroup = $query->fetch(PDO::FETCH_ASSOC);

    $sql = "select * from product";
    if($category == 1) $sql .= " inner join discproperty ON product.id = discproperty.disc";
    $sql .= " where prodcategory = $category";
    $query = $db->query($sql);
    $products = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "productgroup" => $productgroup['name'],
        "products" => $products
    ), JSON_PRETTY_PRINT);
}

catch (PDOException $pdoex) {
    returnError($pdoex);
}