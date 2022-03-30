<?php

$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'),PHP_URL_PATH);
$parameters = explode('/',$uri);
$prodcategory = $parameters[1];

try {
    $db = openDb();
    $sql = "select * from productgroup where prodcategory = $prodcategory";
    $query = $db->query($sql);
    $category = $query->fetch(PDO::FETCH_ASSOC);

    $db = openDb();
    $sql = "select * from product where prodcategory = $prodcategory";
    $query = $db->query($sql);
    $category = $query->fetch(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "category" => $category[groupname],
        "products" => $products
    ));
}

catch (PDOException $pdoex) {
    returnError($pdoex);
}