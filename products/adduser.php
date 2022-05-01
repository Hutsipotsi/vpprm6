<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$fname = filter_var($input->fname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$lname = filter_var($input->lname, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$email = filter_var($input->email, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
$pw = filter_var($input->pw, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

  
    //Tarkistetaan onko muttujia asetettu
    if( !isset($fname) || !isset($lname) || !isset($email) || !isset($pw) ) {
        echo "Tietoja puuttui!! Ei voida rekisteröidä henkilöä";
        exit;
    }
    
    //Tarkistetaan, ettei tyhjiä arvoja muuttujissa
    if(empty($fname) || empty($lname) || empty($email)  || empty($pw) ){
        echo "Et voi asettaa tyhjiä arvoja!!";
        exit;
    }
    
    try{
        $pdo = openDb();
        $pdo->beginTransaction();

        //Suoritetaan parametrien lisääminen tietokantaan.
        $sql = "INSERT INTO registered_user (fname, lname, email, password) VALUES ('?', '?', '?', '?')";
        $statement = $pdo->prepare($sql);
        $statement->bindParam(1, $fname);
        $statement->bindParam(2, $lname);
        $statement->bindParam(3, $email);
        
        $hash_pw = password_hash($pw, PASSWORD_DEFAULT);$statement->bindParam(4, $hash_pw);
        
        $statement->execute();
        $pdo->commit();
        echo "Kiitos rekisteröitymisestä ".$fname." .";
    
    }catch(PDOException $e){
        $pdo->rollback();
        echo "Käyttäjää ei voitu rekisteröidä<br>";
        echo $e->getMessage();
    }
