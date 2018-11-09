<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers Search Page</title>
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
		<div id="results">
		Search Results <br>
		Rating: <br>
		Availability: <br> 
		Location: <br>
		Description: <br>
		More Pictures: <br>
		</div>
		
		Shelter Image: <br>
		<img id="shelterpic" src="http://www-scf.usc.edu/~csci201/images/jeffrey_miller.jpg" width="100" height="100"><br>
		Shelter Contact Information: <br>
	</div>
	<div id="bottom">
	
	</div>
	
	
	<script>
	</script>
</body>
</html>