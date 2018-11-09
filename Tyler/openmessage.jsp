<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers Open Message</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	<h1>Subject</h1>
	<h3>From senders's username</h3>
	<img src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" width="100" height="100">
	<div id="body_message">
	Body of Message <br>
	</div>
	<button id="back" onclick="goBack();">Go Back to User Messages </button>
<script>
	function goBack(){
		location.href="usermessages.jsp";
	}
	</script>
</body>
</html>