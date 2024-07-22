<?php
date_default_timezone_set('Asia/Kolkata');
include('conn.php');
$txt=mysqli_real_escape_string($con,$_POST['txt']);
$sql="SELECT reply FROM chatbot_hints WHERE question LIKE '%$txt%'";
$res=mysqli_query($con,$sql);
if(mysqli_num_rows($res)>0){
	$row=mysqli_fetch_assoc($res);
	$html=$row['reply'];
}else{
	$html="آسف,لا أفهم ما تقول😥";
}
$added_on=date('Y-m-d h:i:s');
mysqli_query($con,"INSERT INTO message(message,added_on,type) VALUES('$txt','$added_on','user')");
$added_on=date('Y-m-d h:i:s');
mysqli_query($con,"INSERT INTO message(message,added_on,type) VALUES('$html','$added_on','bot')");
echo $html;
?>