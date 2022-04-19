<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

// $uri = parse_url(filter_input(INPUT_SERVER,'PATH_INFO'),PHP_URL_PATH);
// $parameters = explode('/',$uri);
// $category = $parameters[1];

$input = json_decode(file_get_contents('php://input'));
$name = filter_var($input->name, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

try {
    $db = openDb();
    $sql = "insert into productgroup (name) values ('$name')";
    executeInsert($db,$sql);
  $data = array('id' => $db->lastInsertId(), 'name' => $name);
    print json_encode($data);
   
} catch(PDOException $pdoex) {
    returnError($pdoex);
}