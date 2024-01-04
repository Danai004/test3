<?php
$database_host = "";
$database_user = "";
$database_password = "รหัผ่าน";
$database_name = "database_csit2023";

// Create a connection
$conn = mysqli_connect($database_host, $database_user, $database_password, $database_name);

// Check the connection
if (!$conn) {
    die("ไม่สามารถเชื่อมต่อฐานข้อมูลได้: " . mysqli_connect_error());
}

// Set character set to UTF-8
mysqli_query($conn, "SET NAMES UTF8");
?>




