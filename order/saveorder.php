<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$db = null;
$input = json_decode(file_get_contents('php://input'));

$lastname = filter_var($input->lastname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$firstname = filter_var($input->firstname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$street = filter_var($input->street, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$postal = filter_var($input->postal, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$city = filter_var($input->city, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$phone = filter_var($input->phone, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$cart = $input->cart;

try {
    $db = openDb();
    $db->beginTransaction();

    $sql = "INSERT INTO customer (firstname, lastname, street, postal, city, phone) VALUES ('" .
        filter_var($firstname, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($lastname, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($street, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($postal, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($city, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($phone, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "')";
    $customer_id = executeInsert($db, $sql);

    $sql = "INSERT INTO customorder (customer_id) values ($customer_id)";
    $order_id = executeInsert($db, $sql);

    foreach($cart as $product) {
        $sql = "INSERT INTO orderrow (order_id, product_id, pcs) values (" .
        $order_id . "," .
        $product->id . "," . 
        $product->amount . ")";
        executeInsert($db, $sql);
    }

    $db->commit();

    header('HTTP/1.1 200 OK');
    $data = array('id' => $customer_id);
    echo json_encode($data);
} catch (PDOException $pdoex) {
    $db->rollback();
    returnError($pdoex);
}