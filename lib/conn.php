<?php
$conn = mysqli_connect("หมายเลข ip address ของเครื่อง database server","ชื่อ
ผูใ้ชง้านฐานขอ้มูล","รหัสผ่าน") or die("ไม่สามารถเชื่อมต่อฐานเข้ามูลได้");
mysqli_select_db($conn,"ชอ

ื่ ฐานขอ้มูล") or die("ไม่พบฐานข้อมูล");

mysqli_query($conn,"SET NAMES UTF8");
?>