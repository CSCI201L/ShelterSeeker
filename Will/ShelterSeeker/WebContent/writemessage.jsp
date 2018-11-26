<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, retrieval.CompareMessageByReadAndTime,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Shelter Seekers Write Message</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<style>
li {
	display: inline;
	float: left;
}
#top ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: blue;
}
li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
</style>
</head>
<body>
	<%
		String sender_name;
		if (request.getParameter("sender") != null)
			sender_name = request.getParameter("sender");
	%>
	<div id="top">
		<ul>
			<li><a href="userhomepage.jsp">Search</a></li>
			<li><a href="usermessages.jsp">Messages</a></li>
			<li><a href="usersettings.jsp">Profile</a></li>
		</ul>
	</div>
	

	<button id="back" onclick="goBack();">Go Back to User Messages
	</button>

	<script>
		function goBack() {
			var x = document.getElementById("message").value;
			if (x.length > 0) {
				alert("Your message will not be saved.");
			}
			location.href = "usermessages.jsp";
		}
		
	</script>
</body>
</html>