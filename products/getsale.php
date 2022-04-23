<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$uri = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'),PHP_URL_PATH);
$parameters = explode('/',$uri);

try {
    $db = openDb();
    $sql = "SELECT DISTINCT product.name, price, image, productgroup.name AS category, ROUND(price-(price*discount/100),2) AS 'discount' FROM product, sale, productgroup WHERE sale.prod_id = product.id AND product.prodcategory = productgroup.id;";
    $query = $db->query($sql);
    $sales = $query->fetchAll(PDO::FETCH_ASSOC);

    header('HTTP/1.1 200 OK');
    echo json_encode(array(
        "sales" => $sales
    ), JSON_PRETTY_PRINT);
}

catch (PDOException $pdoex) {
    returnError($pdoex);
}

