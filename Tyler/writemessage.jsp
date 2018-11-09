<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers Write Message</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	Send a Message to someone!
	<form onsubmit="defaultMessage();"><!--  method="post" action="Servlet"-->
		To: <input id="recipient" type="text" name ="recipient" placeholder ="Recipient" ><br />
		Subject: <input id="subject" type="text" name ="subject" placeholder ="Subject Line" required><br />
		Message: <input id="message" type="text" name ="message" placeholder ="Message Body" ><br />
		<input type="submit" value= "Send">
	</form>
	
	<button id="back" onclick="goBack();">Go Back to User Messages </button> 

<script>
	function goBack(){
		var x=document.getElementById("message").value;
 		if(x.length>1){
			alert("text will not be saved");
		} 
		location.href="usermessages.jsp";
	}
	function defaultMessage(){
		if(document.getElementById("message").value.length<1){
			document.getElementById("message").defaultValue=document.getElementById("subject").value;
			alert(document.getElementById("message").defaultValue);
		}
	}

</script>
</body>
</html>