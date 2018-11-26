<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
	li {
   		display: inline;
   		float:left;
	}	
	ul {
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
	<title>Shelter Seekers Organization Settings</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<%
	String currpassworderror=(String)request.getAttribute("currpass_err");
	if(currpassworderror==null){
		currpassworderror="";
	}
	String newpassworderror=(String)request.getAttribute("newpass_err");
	if(newpassworderror==null){
		newpassworderror="";
	}
	String ziperror=(String)request.getAttribute("zip_err");
	if(ziperror==null){
		ziperror="";
	}
	String phoneerror=(String)request.getAttribute("phone_err");
	if(phoneerror==null){
		phoneerror="";
	}
%>
<body> <!-- onload="defaultContactInfo();"> -->
<ul>
		<li><a href="orgstats.jsp">Shelter Statistics</a></li>
		<li><a href="usermessages.jsp">Messages</a></li>
		<li><a href="orgsettings.jsp">Profile</a></li>
		</ul>
	<div id="security">
	<h1>Security Preferences</h1><br>
	<form action="bUpdateOrg" method="GET"><!-- onsubmit="return validate();"> --><!-- method="POST" action="Servlet" -->
		Current Email: currentemail@.com<br>
		<h4>Reset your password here</h4>
		Enter your current password: <input id="curr_pass" type="text" name="current_password" placeholder="Current password">
		<%= currpassworderror %>
		<br> 
		Enter your new password: <input id="new_pass" type="text" name="new_password" placeholder="New password">
		<%= newpassworderror %>
		<br>
	<h1>Shelter Description</h1>
		Are you a shelter that allows children ?<br>
		<input type="radio" name="children" value="1" required> Yes<br>
		<input type="radio" name="children" value="0"> No<br>
		Are you a shelter that allows pets ? <br>
		<input type="radio" name="pets" value="1" required> Yes<br>
		<input type="radio" name="pets" value="0"> No<br>
		Are you a shelter that is near a pharmacy within a 5 mile distance? <br>
		<input type="radio" name="pharmacy" value="1" required> Yes<br>
		<input type="radio" name="pharmacy" value="0"> No<br>
		Are you a shelter that is near a grocery within a 5 mile distance? <br>
		<input type="radio" name="grocery" value="1" required> Yes<br>
		<input type="radio" name="grocery" value="0"> No<br>
		Are you a shelter that is near a laundromat within a 5 mile distance? <br>
		<input type="radio" name="laundromat" value="1" required> Yes<br>
		<input type="radio" name="laundromat" value="0"> No<br>
		Organizations Contact Info <br>
		<a href="http://localhost:8080/ShelterSeeker/orgprofile.jsp"><input id="pic" type="text" value="Press to go to Picture" readonly></a><br>
		<br>
		Current Zipcode: 12345<br>
		Update Zipcode: <input id="new_zipcode" type="text" name="new_zipcode" placeholder="Update Zip Code">
		<%= ziperror %>
		<br>
		Current Phone Number: (123)456-7890<br>
		Update Phone Number: <input id="new_phone" type="tel" name="new_phone" placeholder="123-456-7890" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
		<%= phoneerror %>
		<br>
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