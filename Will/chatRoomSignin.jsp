<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
	<style>
		html, body{
			margin: 0;
   			height: 100%;
			font-family: 'Quicksand', sans-serif;
			background-image: radial-gradient(rgb(242, 242, 242), rgb(230, 230, 230), rgb(217, 217, 217));
		}
		
		li {
	   		display: inline;
	   		float:left;
		}	
		#top ul {
		    list-style-type: none; 
		    margin: 0;
		    padding: 0;
		    overflow: hidden;
		    background-color: #9734D1;
		}
		li a {
		    display: block;
		    color: white;
		    text-align: center;
		    padding: 14px 16px;
		    text-decoration: none;
		}
		input[type=text] {
		    width: 40%;
		    padding: 12px 20px;
		    margin-left: 30%;
		    border-radius: 25px;
		}
		#text{
			text-align:center; 
			font-size: 25px; 
			margin-top:15%; 
		}
	</style>
	<script>
	function sendUserName(e) {
		console.log("IN send user name");
		if(e.keyCode == 13){
			console.log("username = " + document.getElementById("user").value);
			sessionStorage.setItem('username', document.getElementById("user").value);
			window.location.href ='http://localhost:8080/borie_CSCI201L_Final_Project/chat.jsp';
		}
	}
	</script>
	</head>
	
	<body id="background">
		<div id="top">
		<ul>
			<li><a href="search.jsp">Search Page</a></li>
		</ul>
		</div>
	
		<p id="text">Before entering the chat room please enter a username:<br></p>
		<input id="user" type="text" name="username" placeholder="Enter username here..." onkeyup="sendUserName(event);">
	
	
	</body>
</html>