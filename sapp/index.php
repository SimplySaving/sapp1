<?php

// John Doe

//Receiving JSON POST with PHP

// Read the input stream
// php://input
$body = file_get_contents("https://simplysaving.000webhostapp.com");
 
// Decode the JSON object
$object = json_decode($body, true);
 
// Throw an exception if decoding failed
if (!is_array($object)) {
  throw new Exception('Failed to decode JSON object');
}

// Should print username and password
print_r($object);

$servername = "localhost";
$username = "SimplySavingAdmin";
$password = "savingmoney2021";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// database name = mydatabase
// Select all of our stocks from table 'user'
//$sql = "INSERT INTO user (usern, passw)
//VALUES ('John', 'Doe', 'john@example.com')";



// Close connections
mysqli_close($con);
?>
