<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sign up section onsubmit="return !!(validateEmail() & validateUsername() & validatePassword() & validateZip());" -->
<%
	String err = (String) request.getAttribute("err");
	if (err==null){
		err = "";
	}
	%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers User Register</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
	<style>
		.purple {
			background-color: purple;
			opacity:0.7;
			filter: grayscale(10%);	
			
		}
		.style-options {
			margin-bottom:0px;
			font-size:18px;
			
			
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
		.oh:hover{
			background-color: purple;
			opacity:0.7;
			filter: grayscale(10%);	
			color: white;
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
		 .back span {
			  cursor: pointer;
			  display: inline-block;
			  position: relative;
			  transition: 0.5s;
			}
			
			.back span:before {
			
			  content: '\00ab';
			  position: absolute;
			  opacity: 0;
			  top: 0;
			  left: -10px;
			  transition: 0.5s;
			}
			
			.back:hover span {
			  padding-left: 25px;
			}
			
			.back:hover span:before {
			  opacity: 1;
			  left: 0;
			}
			.b span {
			  cursor: pointer;
			  display: inline-block;
			  position: relative;
			  transition: 0.5s;
			}
			
			.b span:after {
			  content: '\00bb';
			  position: absolute;
			  opacity: 0;
			  top: 0;
			  right: -20px;
			  transition: 0.5s;
			}
			
			.b:hover span {
			  padding-right: 25px;
			}
			
			.b:hover span:after {
			  opacity: 1;
			  right: 0;
			}
	</style>
</head>
<body style = "width: 1500px; height: 1000px" >
	<div id="top" class = " purple block"> 
		
	</div>
	<div id="middle"> 
		<button onClick = "redirectHome();" style = "top:0;float:left;" class ="back oh segoe blueFont"> <span> Back </span> </button>
		<div id="content" style="margin-left:500px; text-align:center; display:inline-block;">
			<div id="Sign-Up" style="display:inline-block;">
				<p class = "segoe title blueFont" style="font-size:34px"> Register Organization</p>
				<form name="signup"  action="oSignUp2" method="POST" ><!-- method="POST" action ="Servlet" -->
					Profile Pic<input type="file"  name = "f" id="f" accept="image/*" required>
					<input type="text" id="base64" name="base64" hidden="true">
					<p class = "segoe title blueFont" style="font-size:30px; font-style:italic; margin-bottom:10px;">Shelter Info</p> 
				<p class = "segoe" style = "font-size: 20px; font-weight: bold;color: red"><%= err %></p>
					<p  class = "style-options segoe blueFont" >Do you allow children?</p>
					<input type="checkbox" name="children" checked> Yes<br>
					<p  class = "style-options segoe blueFont" >Do you allow pets?</p>
					<input type="checkbox" name="pets" value="yes" checked> Yes<br>
					<p  class = "style-options segoe blueFont" >Are you near a Pharmacy?</p>
					<input type="checkbox" name="pharmacy" value="yes" checked> Yes<br>
					<p  class = "style-options segoe blueFont" >Do you allow Grocery?</p>
					<input type="checkbox" name="grocery" value="yes" checked> Yes<br>
					<p  class = "style-options segoe blueFont" >Do you allow Laundromat?</p>
					<input type="checkbox" name="laundromat" value="yes" checked> Yes<br>
					<input  type="number" class = "segoe blueFont" name ="occupants" style="margin:10px" placeholder ="Current Occupants" required> <br>
					<input  type="number" class = "segoe blueFont" name ="capacity" style="margin:10px" placeholder ="Capacity" required> <br>
					<input type="hidden" name = "zipcode" value = "<%=(String) request.getParameter("zipcode")%>">
					<input type="hidden" name = "address" value = "<%=(String) request.getParameter("address")%>">
										<input type="hidden" name = "email" value = "<%=(String)request.getParameter("email")%>">
										<input type="hidden" name = "username" value = "<%=(String) request.getParameter("username")%>">
										<input type="hidden" name = "password" value = "<%=(String) request.getParameter("password")%>">
										<input type="hidden" name = "phone" value = "<%=(String) request.getParameter("phone")%>">
					<input  type="text" class = "segoe blueFont" name ="bio" style="height: 100px;margin:10px" placeholder ="Tell us about your shelter!" required> <br>
										
					
					<input type="submit" class ="b oh segoe blueFont" value= "Sign-UP">
				</form>
		  	</div>	
		</div>
	</div>
	
	<div id="bottom" class = "purple block"> 
	
	</div>
	
	<script>
	function redirectHome(){
		location.href="signin.jsp";
	}
	//validate email
	function validateEmail(){
		var x=document.getElementById("email").value;
			unerrormessage=document.getElementById("email-error");
		if(!x.length){
			alert("lmao");
			unerrormessage.innerHTML="must have input";
			return false;
		}
		 if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(signup.email.value))){
			 alert("false");
			 unerrormessage.innerHTML="not valid, needs to contain @";
			 return false;
		 }

	}
	function readFile() {
		if ( this.files && this.files[0]){
			var FR = new FileReader();
			FR.addEventListener("load", function(e){
				document.getElementById("base64").value = e.target.result;
			//	document.getElementById("test").src = e.target.result;
			});
			
			FR.readAsDataURL(this.files[0]);
		}
	}
	
	document.getElementById("f").addEventListener("change", readFile);
	//validate username
	function validateUsername(){
		var x=document.getElementById("un").value;
			unerrormessage=document.getElementById("un-error");
		if(!x.length){
			alert("lmao");
			unerrormessage.innerHTML="must have input";
			return false;
		}
	}
	//validate password
	function validatePassword(){
		var x=document.getElementById("pwd").value;
			unerrormessage=document.getElementById("pw-error");
		if(!x.length){
			alert("lmao");
			unerrormessage.innerHTML="must have input";
			return false;
		}
	}
	//validate zip code
	function validateZip(){
		var x=document.getElementById("zip").value;
			errormessage=document.getElementById("zip-error");
		if(x.length<5){
			alert("af");
			errormessage.innerHTML="input is too short. zip must be 5 numbers";
			return false;
		}
		if(x.length>5){
			errormessage.innerHTML="input is too long. zip must be 5 numbers";
			return false;
		}if(isNaN(x)){
			errormessage.innerHTML="zip must be numbers";
			return false;
		}
	}
	
/* 	var x = document.getElementById("loc");

	function getLocation() {
	    if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(showPosition, showError);
	    } else {
	        x.innerHTML = "Geolocation is not supported by this browser.";
	    }
	}
	
	function showPosition(position) {
	    var latlon = position.coords.latitude + "," + position.coords.longitude;
	    var img_url = "https://maps.googleapis.com/maps/api/staticmap?center="
	    +latlon+"&zoom=14&size=400x300&key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU";
	    document.getElementById("mapholder").innerHTML = "<img src='"+img_url+"'>";
	} */
	
	
	</script>
	
	
	
	
	
</body>
</html>