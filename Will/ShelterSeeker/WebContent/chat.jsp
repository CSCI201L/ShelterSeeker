<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
<title>Chat Client</title>

<style>
	html, body{
		margin: 0;
  		height: 100%;
		font-family: 'Quicksand', sans-serif;
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
	#footer {
	    position: fixed;
	    left: 0;
	    right: 0; 
	    bottom: 0;
	    padding: 1rem;
	    background-color: #9734D1;
	    text-align: center; 
	}
	.container {
	    border: 2px solid #dedede;
	    background-color: #f1f1f1;
	    border-radius: 5px;
	    margin: 5px 0;
	}
	
	.container::after {
	    content: "";
	    clear: both;
	    display: table;
	}
	
	.container img {
	    float: left;
	    max-width: 50px;
	    width: 100%;
	    margin-right: 10px;
	    border-radius: 50%;
	}
	.container img.right {
	    float: right;
	    margin-left: 10px;
	    margin-right:0;
	}
	.time-right {
	    float: right;
	    color: #aaa;
	}
	#chat{
		overflow: scroll; 
		border-color: #D89EFA;
		border-radius: 5px;
		border-style: inset;
		height: 70%;
		width: 90%;
		margin: auto; 
		margin-top: 2%; 
		
	}
	#formInput{
		width: 75%;
		height: 4%;
		margin-left: 5%; 
	}
	#submit{
		height: 5%;
		width: 13%;
		font-family: 'Quicksand', sans-serif;
		font-size: 20px;
		
	}
	#title{
		margin-top: 2%;
		font-size: 30px; 
		text-align: center; 
	}
	input[type=text] {
	    padding: 5px 5px 5px 5px;
	}
	.column {
    float: left;
    padding: 10px;
	}
	.column.side {
    	width: 25%;
    	height: 100%; 
	}
	.column.middle {
	    width: 70%;
	    height: 100%;
	    border-right: 1px dotted #D89EFA;
	}
	i{
		font-size:20px;
		text-align: center;
	}
</style>
</head>
<script>
	var socket;
	function connectToServer() {
		socket = new WebSocket("ws://localhost:8080/ShelterSeeker/chatroomServerEndpoint");
		var today = new Date();
		var iso = today.toLocaleTimeString('en-US');
		var time = iso.slice(0, 4) + " " + iso.slice(8,10);
		document.getElementById("title").innerHTML = "Welcome to " + sessionStorage.getItem('shelterName') + "'s chat room!";
		console.log(time);
		
		socket.onopen = function(event) {
			document.getElementById("chat").innerHTML += "You have successfully joined the conversation as " + sessionStorage.getItem('username');
			socket.send(sessionStorage.getItem('username') + "|" + sessionStorage.getItem('shelterID'));
		}
		
		socket.onmessage = function(event) {
			//document.getElementById("chat").innerHTML += sessionStorage.getItem('username') + " has joined the conversation";
			document.getElementById("chat").innerHTML += "<div id='mychat' class='container'> <img src='https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909__340.png'>" + time + " " + event.data + "</div>";
			//document.getElementById("users").innerHTML += "<img src='https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909__340.spng'>" + time + " " + event.data + "</div>";
		}
		
		
		socket.onclose = function(event) {
			document.getElementById("chat").innerHTML += document.getElementById("user").value + " has left the conversation at" + d.getHours() + ":" + d.getMinutes();
			//document.getElementById("chat").innerHTML += document.getElementById("user").value + " has left the conversation at" + d.getHours() + ":" + d.getMinutes();
		}
		
	}
	function sendMessage() {
		socket.send(sessionStorage.getItem('shelterID') + "|" + document.getElementById("formInput").value);
		return false;
	}
	function sendUserName(e) {
		//console.log("IN send user name");
		if(e.keyCode == 13){
			console.log("username = " + document.getElementById("user").value);
			socket.send(document.getElementById("user").value);
		}
	}
</script>
			
<body onload="connectToServer()">
	<div id="top">
	<ul>
		<li><a href="userhomepage.jsp">Search</a></li>
		<li><a href="usermessages.jsp">Messages</a></li>
		<li><a href="usersettings.jsp">Profile</a></li>
	</ul>
	</div>
	<div class="column middle">
		<div id="title">
		</div>
		<div id="chat"> 
		</div>
	
		<input id="formInput" type="text" name="message" placeholder="Type message here...">
		 <button id="submit" onClick="return sendMessage();">Send </button>
	
	</div>
	<div class="column side">
		<div id="rules">
			<br> 
			<p style="margin-top: 5%; font-weight: bold; text-align:center; font-size:20px"><ins>Chat Room Rules</ins></p>
			<i> Rule 1 </i> <br> Be positive and helpful to other users. <br><br>
			<i> Rule 2 </i> <br> Be respectful to Shelter administrators.	<br><br>
			<i> Rule 3 </i>  <br> Any signs of abuse will lead to expulsion from the chat room.<br><br>
			<i> Rule 4 </i> <br>	Do not share any personal information that you are not comfortable with.<br><br>
			<i> Rule 5 </i>  <br> Please call The National Domestic Violence Hotline at 1.800.799.SAFE.<br><br>
		</div>
	</div>
	
	<div id="footer"></div>
</body>
</html>