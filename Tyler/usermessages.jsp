<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers User Messages Page</title>
	<style>
		li {
    		display: inline;
    		float:left;
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
		<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	<div id="top">
	<ul>
		<li><a href="search.jsp">Search</a></li>
		<li><a href="usermessages.jsp">Messages</a></li>
		<li><a href="profile.jsp">Profile</a></li>
	</ul>
	</div>
	<div id="middle">
	List
	<ul>
		<li>Message Opened</li><br>
		<li>Send time</li><br>
		<li>Username of Sender</li><br> 
		<li>Subject of Message</li><br>
		<li>First Line of Message</li><br>
	</ul>
	<form><!--  method="post" action="Servlet"-->
		<input id="search" type="text" name ="search" placeholder ="User Messages" >
		<input type="submit" value= "Search">
		
	</form>	
	
	<br>
	<button id="write" onclick="writeMessage();">Write Message</button> 
	</div>
	<div id="bottom">
	
	</div>
	
	
	<script>
	function writeMessage(){
		location.href="writemessage.jsp";
	}
	</script>
</body>
</html>