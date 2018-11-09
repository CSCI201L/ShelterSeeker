<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%String availability = (String)request.getAttribute("availability"); %>
	<%String zipCode = (String)request.getAttribute("zipCode"); %>
	<%String phoneNumber = (String)request.getAttribute("phoneNumber"); %>
	<%String kids = (String)request.getAttribute("kids"); %>
	<%String pets = (String)request.getAttribute("pets"); %>
	<%String bio = (String)request.getAttribute("bio"); %>
	<%String currentRating = (String)request.getAttribute("currentRating"); %>
	<%String nearPharmacy = (String)request.getAttribute("nearPharmacy"); %>
	<%String nearGrocery = (String)request.getAttribute("nearGrocery"); %>
	<%String nearLaundromat = (String)request.getAttribute("nearLaundromat"); %>
	
	<title>Shelter Seekers Organization Public Profile Page</title>
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
		<h3>Shelter Information</h3><br>
		Availability: <%= availability %> <br>
		Zip Code: <%= zipCode %> <br>
		Phone Number: <%= phoneNumber %> <br>
		Biography: <%= bio %> <br>
		Rating: <%= currentRating %> <br>
		 
		</div>
		<div id="preferences">
		<h3>Org Information</h3>
		Pets? <%= pets %> <br>
		Children? <%= kids %> <br>
		Near a pharmacy? <%= nearPharmacy %> <br>
		Near a grocery store? <%= nearGrocery %> <br>
		Near a laundromat? <%= nearLaundromat %>  <br>
		</div>
		
	</div>
	<div id="bottom">
	
	</div>
	
</body>
</html>