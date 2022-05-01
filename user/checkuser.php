<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$email = filter_var($input->email, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$pw = filter_var($input->pw, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

//Tarkistetaan onko muttujia asetettu
if (!isset($email) || !isset($pw)) {
    throw new Exception("Pakollisia tietoja puuttuu, ei voi kirjautua.");
}

//Tarkistetaan, ettei tyhjiä arvoja muuttujissa
if (empty($email) || empty($pw)) {
    throw new Exception("Kirjautumistiedot eivät voi olla tyhjät.");
}

$pdo = openDb();

try {
    $pdo->beginTransaction();

    //Haetaan käyttäjä annetulla käyttäjänimellä
    $sql = "SELECT fname, email, password FROM registered_user WHERE email=?";
    $statement = $pdo->prepare($sql);
    $statement->bindParam(1, $email);
    $statement->execute();
    $pdo->commit();

    if ($statement->rowCount() <= 0) {
        throw new Exception("Käyttäjää ei löytynyt!");
    }

    $row = $statement->fetch();

    //Tarkistetaan käyttäjän antama salasana tietokannan salasanaa vasten
    if (!password_verify($pw, $row["password"])) {
        throw new Exception("Väärä salasana!!");
    }
    else {
        header('HTTP/1.1 200 OK');
        echo json_encode(array('firstname' => $row["fname"]));
        
        //Jos käyttäjä tunnistettu, talletetaan käyttäjän tiedot sessioon
        $_SESSION['email'] = $row['email']; 
    }
    
} catch (PDOException $e) {
    $pdo->rollback();
    throw $e;
}