<?php
include('conn.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta  charset="utf-8">
    <meta name="robots">
    <title>شات بوت</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="style.css" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row justify-content-md-center mb-4">
            <div class="col-md-6">
            <div class="card">
                <div class="card-body messages-box">
					<ul class="list-unstyled messages-list">
							<?php
							$res=mysqli_query($con,"SELECT * FROM message");
							if(mysqli_num_rows($res)>0){
								$html='';
								while($row=mysqli_fetch_assoc($res)){
									$message=$row['message'];
									$added_on=$row['added_on'];
									$strtotime=strtotime($added_on);
									$time=date('h:i A',$strtotime);
									$type=$row['type'];
									if($type=='user'){
										$class="messages-me";
										$imgAvatar="user_avatar.png";
										$name="أنا";
									}else{
										$class="messages-you";
										$imgAvatar="bot_avatar.png";
										$name="المساعد الشخصي";
									}
									$html.=
									'<li class="'.$class.' 
									clearfix"><span class="message-img">
									<img src="image/'.$imgAvatar.'
									" class="avatar-sm rounded-circle">
									</span><div class="message-body clearfix">
									<div class="message-header">
									<strong class="messages-title">'
									.$name.'</strong> 
									<small class="time-messages text-muted">
									<span class="fas fa-time"></span> 
									<span class="minutes">'.$time.'</span>
									</small> </div><p class="messages-p">'
									.$message.'</p>
									</div></li>';
								}
								echo $html;
							}else{
								?>
								<center>
								<li dir="rtl" class="messages-me clearfix start_chat">
									<span style="font-weight: bold;">المساعد الشخصي | النموذج الأولي</span><br>
									إبدأ الدردشة😎
								</li>
								</center>
								<?php
							}
							?>
                    </ul>
                </div>
                <div class="card-header">
                    <div class="input-group">
					<input dir="rtl" id="input-me" type="text" name="messages" class="form-control input-sm" placeholder="أدخل رسالتك هنا..." required/>
					<span class="input-group-append">
					<input type="button" class="btn btn-primary" value="إرسال" onclick="send_msg()">
					<?php
						include 'conn.php';
							$res=mysqli_query($con,"SELECT * FROM message");
							if(mysqli_num_rows($res)>0){
					echo "
					<a href='delete.php'>
					<input type='button' style='margin-left:15px; font-weight:bolder;' class='btn btn-success' value='بدء دردشة جديدة'>
					</a>";
							}else{
								echo "";
							}
					?>
					</span>
					</div> 
                </div>
            </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
		function getCurrentTime(){
			var now = new Date();
			var hh = now.getHours();
			var min = now.getMinutes();
			var ampm = (hh>=12)?'PM':'AM';
			hh = hh%12;
			hh = hh?hh:12;
			hh = hh<10?'0'+hh:hh;
			min = min<10?'0'+min:min;
			var time = hh+":"+min+" "+ampm;
			return time;
		}
		function send_msg(){
			jQuery('.start_chat').hide();
			var txt=jQuery('#input-me').val();
			var html='<li class="messages-me clearfix"><span class="message-img"><img src="image/user_avatar.png" class="avatar-sm rounded-circle"></span><div class="message-body clearfix"><div class="message-header"><strong class="messages-title">أنا</strong> <small class="time-messages text-muted"><span class="fas fa-time"></span> <span class="minutes">'+getCurrentTime()+'</span></small> </div><p class="messages-p">'+txt+'</p></div></li>';
			jQuery('.messages-list').append(html);
			jQuery('#input-me').val('');
			if(txt){
				jQuery.ajax({
					url:'get_bot_message.php',
					type:'post',
					data:'txt='+txt,
					success:function(result){
						var html='<li class="messages-you clearfix"><span class="message-img"><img src="image/bot_avatar.png" class="avatar-sm rounded-circle"></span><div class="message-body clearfix"><div class="message-header"><strong class="messages-title">المساعد الشخصي</strong> <small class="time-messages text-muted"><span class="fas fa-time"></span> <span class="minutes">'+getCurrentTime()+'</span></small> </div><p class="messages-p">'+result+'</p></div></li>';
						jQuery('.messages-list').append(html);
						jQuery('.messages-box').scrollTop(jQuery('.messages-box')[0].scrollHeight);
					}
				});
			}
		}
    </script>
</body>
</html>