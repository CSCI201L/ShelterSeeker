<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<title>Shelter Seekers Organization Sign-In</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	</head>
<body>
	<div id="top"> 
	
	</div>
	
	<div id="middle"> 
	Welcome to Shelter Seekers Organization <br />
	
		<div id="Sign-In">
		<!-- sign in section -->
		<form><!-- method="POST" action ="Servlet" -->
			Sign-In <br/>
			<input id="un" type="text" name ="username" placeholder ="Username" required>
			<br/>
			<input id="pwd" type="text" name ="username" placeholder ="Password" required>
			<br/>
			<label><input type="checkbox"> Remember me</label>
			<input type="submit" value= "Sign-In">
		</form>
	  	</div>	
	  	<!-- register section -->
	  	<div id="register">
	  	Register
	  	<button id="reg" onclick="redirectRegister()">Register</button>
	  	</div>
	  	
	  	
	</div>
	
	<div id="bottom"> 
	
	</div>
	
	
	<script>
	//redirect to register function
	function redirectRegister(){
		location.href="orgregister.jsp";
	}
	</script>
	
</body>
</html>