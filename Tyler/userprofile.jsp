<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers User Profile Page</title>
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
		<img id="pic" src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" width="100" height="100">
		<div id="info">
		<h3>Contact Information</h3><br>
		Username: <br>
		Email: <br>
		</div>
		<div id="preferences">
		<h3>User Preferences</h3>
		Pets? <br>
		Children? <br>
		Proximity to Resources: <br>
		Pharmacys: <br>
		Grocery Stores: <br>
		Laundromats: <br>
		</div>
		<div id="settings">
		<button id="user_secrity" onclick="userSettings();" >Security Settings</button>
		
		</div>
		
	</div>
	<div id="bottom">
	
	</div>
	
	
	<script>
	function userSettings(){
		location.href="usersettings.jsp";
	}
	</script>
</body>
</html>