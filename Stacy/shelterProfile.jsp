<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Home Page</title>
	<link href="https://fonts.googleapis.com/css?family=Overlock" rel="stylesheet">
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<style>
		body{
			margin:0;
			font-family: 'Overlock', cursive;
		}
		h2{
			text-align: center;
			font-size: 30px;
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
		    background-color: #BA55D3;
		}
		li a {
		    display: block;
		    color: white;
		    text-align: center;
		    padding: 14px 16px;
		    text-decoration: none;
		}
		.column {
		  	float: left; 
		    padding: 10px;
		}

		.column.side {
		    width: 20%;
		}
		
		.column.middle {
		    width: 75%;
		}
		
		.row:after {
		    content: "";
		    display: table;
		    clear: both;
		}
		
		</style>
</head>
<body>
	<div id="top">
	<ul>
		<li><a href="settings.jsp">Settings</a></li>
		<li><a href="usermessages.jsp">Messages</a></li>
	</ul>
	</div>
	<div class="row">
 
	  <div class="column middle">
	    <h2>Shelter Stats</h2>
	    Ratings <br>
		Page Visits <br>
		Current availability <br>
	  </div>
	  
	  <div class="column side">
	    <h2>Shelter Name</h2>
	    Username: <br>
		Email: <br>
		Bio: <br>
		<div id="settings">
		<button id="org_secrity" onclick="orgSettings();" >Update Settings</button>
		</div>
	  </div>
	</div>
	<div id="bottom">
	
	</div>
	
	
	<script>
	function orgSettings(){
		location.href="orgsettings.jsp";
	}
	</script>
</body>
</html>