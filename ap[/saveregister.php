<?php
header('Access-Control-Allow-Origin: *');
include("conn.php");

// Sanitize and validate input data
$firstname = mysqli_real_escape_string($conn, $_REQUEST['firstname']);
$lastname = mysqli_real_escape_string($conn, $_REQUEST['lastname']);
$dob = mysqli_real_escape_string($conn, $_REQUEST['dob']);
$email = mysqli_real_escape_string($conn, $_REQUEST['email']);
$phone = mysqli_real_escape_string($conn, $_REQUEST['phone']);
$password = mysqli_real_escape_string($conn, $_REQUEST['password']);

// Calculate the next user_id
$sql = "SELECT MAX(user_id) AS MAX_ID FROM idoo_user";
$result = mysqli_query($conn, $sql) or die(mysqli_error($conn));

if ($row = mysqli_fetch_array($result)) {
    $no = $row["MAX_ID"] != "" ? $row["MAX_ID"] + 1 : 1;
}

$newuserid = sprintf("%05d", $no);

// Insert new user into the database
$sql = "INSERT INTO idoo_user (user_id, firstname, email, phone, password, lastname, dob)
        VALUES ('$newuserid', '$firstname', '$email', '$phone', '$password', '$lastname', '$dob')";
mysqli_query($conn, $sql) or die(mysqli_error($conn));

// Set HTTP response code
http_response_code(200);
?>1