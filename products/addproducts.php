<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$name = filter_var($input->name, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$price = filter_var($input->price, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$image = filter_var($input->image, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$manufacturer = filter_var($input->manufacturer, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$prodcategory = filter_var($input->prodcategory, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

try {
    $db = openDb();
    $sql = "insert into product (name, price, image, manufacturer, prodcategory) values ('$name', '$price', '$image', '$manufacturer', '$prodcategory')";
    executeInsert($db,$sql);
  $data = array('id' => $db->lastInsertId(), 'name' => $name, 'price' => $price, 'image' => $image, 'manufacturer' => $manufacturer, 'prodcategory' => $prodcategory);
    print json_encode($data);
   
} catch(PDOException $pdoex) {
    returnError($pdoex);
}