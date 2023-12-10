<?php
$servername = "your_database_host";
$username = "your_database_username";
$password = "your_database_password";
$dbname = "mydb";

    
    
    $conn = new mysqli($servername, $username, $password, $dbname, $port);
    
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>

