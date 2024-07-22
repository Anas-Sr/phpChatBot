<?php 
    include 'conn.php';
$sql = "DELETE FROM message";
$query = mysqli_query($con,$sql);
    if($query){
        header("location:index.php");
    }
