<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers User Settings</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body onload="defaultContactInfo();">
	<div id="security">
	<h1>Security Preferences</h1><br>
	<form onsubmit="return validate();"><!-- method="POST" action="Servlet" -->
		Current Email: currentemail@.com<br>
		Change your email: <input id="new_email" type="text" name="new email" placeholder="New Email"><span id="email-error"></span><br> 
		<h4>Reset your password here</h4>
		Enter your current password: <input id="curr_pass" type="text" name="current_password" placeholder="Current password"><span id="curr_pass-error"></span><br> 
		Enter your new password: <input id="new_pass" type="text" name="new_password" placeholder="New password"><span id="new_pass-error"></span><br>
		<input type="submit" value= "Submit">
	</form>
	</div>
	<div id="personal">
	<h1>Personal Preferences</h1><br>
	<form ><!-- method="POST" action="Servlet" -->
		Looking for shelters that allows children?<br>
		<input type="radio" name="children" value="yes"> Yes<br>
		<input type="radio" name="children" value="no"> No<br>
		Looking for shelters that allows pets? <br>
		<input type="radio" name="pets" value="yes" > Yes<br>
		<input type="radio" name="pets" value="no"> No<br>
		Looking for shelters that are 5 miles from a pharmacy? <br>
		<input type="radio" name="pharmacy" value="yes"> Yes<br>
		<input type="radio" name="pharmacy" value="no"> No<br>
		<input type="submit" value= "Submit">
	</form>
	</div>
<script>
	function validate(){
		var x=document.getElementById("new_email").value;
			y=document.getElementById("curr_pass").value;
			z=document.getElementById("new_pass").value;
			email_errormessage=document.getElementById("email-error");
			curr_passerrormessage=document.getElementById("curr_pass-error");
			new_passerrormessage=document.getElementById("new_pass-error");
		if(x.length<1&&y.length<1){
			alert("emothu");
			email_errormessage.innerHTML="cant be empty";
			curr_passerrormessage.innerHTML="cant be empty";
			return false;
		}
		if(y.length<1&&z.length<1){
			alert("afs");
			curr_passerrormessage.innerHTML="cant be empty";
			new_passerrormessage.innerHTML="cant be empty";
			return false;
		}
	}
	function defaultContactInfo(){
		if(document.getElementById("org_info").value.length<1){
			document.getElementById("org_info").defaultValue="default info, change it";
		}
	}


</script>	
</body>
</html>