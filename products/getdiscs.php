<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

$speed = $_GET["nopeus"];
$glide = $_GET["liito"];
$turn = $_GET["vakaus"];
$fade = $_GET["feidi"];

$and = false;

try {
    $db = openDb();

    $sql = "select * from productgroup where id = 1";
    $query = $db->query($sql);
    $productgroup = $query->fetch(PDO::FETCH_ASSOC);

    $sql = "SELECT * FROM product";
    $sql .= " INNER JOIN discproperty ON product.id = discproperty.disc";
    if($speed != "null" || $glide != "null" || $turn!= "null" || $fade != "null") {

        if($speed != "null") {
            $sql .= " WHERE discproperty.speed = $speed";
            $and = true;
        }
        if($glide != "null") {
            if($and) $sql .= " AND";
            else $sql .= " WHERE";
            $sql .= " discproperty.glide = $glide";
            $and = true;
        }
        if($turn!= "null") {
            if($and) $sql .= " AND";
            else $sql .= " WHERE";
            $sql .= " discproperty.turn = $turn";
            $and = true;
        }
        if($fade != "null") {
            if($and) $sql .= " AND";
            else $sql .= " WHERE";
            $sql .= " discproperty.fade = $fade";
        }
    }
    else $sql .= " WHERE prodcategory = 1";

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

// EOF