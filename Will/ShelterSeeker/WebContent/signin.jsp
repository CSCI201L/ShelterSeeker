<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String err = (String) request.getAttribute("err");
	if (err==null){
		err = "";
	}

%>
<html>
	<head>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
	<style>
		.purple {	
			background-color: purple;
			opacity:0.7;
			filter: grayscale(10%);	
			
		}
		.blueFont {
			color: blue;
			opacity:0.9;
			filter: grayscale(80%);
		}
		.block {
			width:100%;
			height:10%;
		}
		.title {
		    font-size: 34px;
   	 		margin-top: 50px;
		}
		.segoe{
		 font-family: "Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif; 
		 font-size: 24px; 
		 font-style: normal;
		 font-variant: normal; 
		 font-weight: 200; 
		 line-height: 26.4px; 
		 }
	</style>
	<title>Shelter Seekers Sign-In</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	</head>
<body style = "width: 1500px; height: 1000px">
	<div id="top" class = " purple block"> 
		
	</div>
	
	<div id="middle" class = "amber" style="height:80%"> 
		<!-- sign in section -->	
		<div id="content" style="margin-left:450px; text-align:center; display:inline-block;">
			<p class = "segoe title blueFont" style="font-size:34px">Welcome to Shelter Seekers User </p>
			<div id="Sign-In" >
			<form action="vSignIn" method="GET"><!-- method="POST" action ="Servlet" -->
				<p  class = "segoe blueFont" style = "font-size:25px;">Sign-In</p> <br/>
				<input id="un" type="text" name ="email" class = "segoe blueFont" style = " font-size:18px" placeholder ="email" required>
				<br/>
				<input id="pwd" type="text" name ="password" class = "segoe blueFont" style = "font-size:18px"  placeholder ="password" required>
				<br/>
				<label class = "segoe blueFont" style = "font-size:18px; 	"><input type="checkbox"  > Remember me</label>
				<input type="submit" value= "Sign-In">
			</form>
			<p class = "segoe" style = "font-size: 20px; font-weight: bold;color: red"><%= err %></p>
		  	</div>	
		  	
		  	<!-- guest section -->
		  	<button id="guestsignin" class ="segoe blueFont" style = "font-size:25px; display:inline-block; margin-top:50px;" onclick="redirectGuestSign()">Sign In as Guest</button>
		  	<!-- register section -->
		  	<br>

		  	<button id="reg" class ="segoe blueFont" style = "font-size:25px; display:inline-block; margin-top:50px; " onclick="redirectRegister()">Register User</button>
		  	<!-- shelter section -->
		  	<div id="shelter">
		  	<button id="sheltersignin" onclick="redirectShelter()" class ="segoe blueFont" style = "font-size:25px; display:inline-block; margin-top:50px; ">Register Organization</button>
		  	</div>
	  	</div>
	  	
	</div>
	
	<div id="bottom" class = "purple block"> 
	
	</div>
	
	
	<script>
	//redirect to register function
	function redirectRegister(){
		location.href="userregister.jsp";
	}
	//redirect to Sign function
	function redirectGuestSign(){
		var servletName = "vSignIn";
		
		var form = $('<form action="' + servletName + '" method="GET">' +
                '<input type="text" name="email" value="guest" />' +
                 '<input type="text" name="password" value="guest" />' +
                                                      '</form>');
		$('body').append(form);
		form.submit();  
	}
	//redirect to shelter function
	function redirectShelter(){
		location.href="orgreg1.jsp";
	}
	</script>
	
</body>
</html>