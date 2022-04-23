<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$lastname = filter_var($input->lastname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$firstname = filter_var($input->firstname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$street = filter_var($input->lastname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$postal = filter_var($input->postal, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$city = filter_var($input->city, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$phone = filter_var($input->city, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$cart = $input->cart;

try {
    $db->openDb();
    $db->beginTransaction();

    $sql = "INSERT INTO customer (firstname, lastname, street, postal, city, phone) VALUES ('" .
        filter_var($firstname, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($lastname, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($street, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($postal, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($city, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "','" .
        filter_var($phone, FILTER_SANITIZE_FULL_SPECIAL_CHARS) . "'.)";
    $customer_id = executeInsert($db, $sql);

    $sql = "INSERT INTO customorder (customer_id) values ($customer_id)";
    $order_id = executeInsert($db, $sql);

    foreach($cart as $product) {
        $sql = "INSERT INTO orderrow (order_id, product_id, pcs) values (" .
        $order_id . "," .
        $product->id . "," . 
        $product->pcs . ")";
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

/*
    id int primary key auto_increment,
    firstname varchar(50) not null,
    lastname varchar(50) not null,
    contact VARCHAR(15),
    street VARCHAR(40),
    postal CHAR(5),
    city VARCHAR(20),
    phone VARCHAR(20)
*/