<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, retrieval.CompareMessageByReadAndTime,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seekers User Settings</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
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
</head>
<%
	DBHelper db =(DBHelper) request.getSession().getAttribute("DBHelper");
	//String email=db.user.email;
	String emailerror=(String)request.getAttribute("email_err");
	if(emailerror==null){
		emailerror="";	
	}
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
<div id="top">
	<ul>
		<li><a href="userhomepage.jsp">Search</a></li>
		<li><a href="usermessages.jsp">Messages</a></li>
		<li><a href="usersettings.jsp">Profile</a></li>
	
	</ul>
	</div>
	<div id="security">
	<h1>Security Preferences</h1><br>
	<form action="bUpdateUser" method="GET"><!-- <!-- onsubmit="return validate(); --"> -->
		Current Email: <%=db.user.email %><br>
		Change your email: <input id="new_email" type="text" name="new_email" placeholder="New Email">
		<%= emailerror %>
		<br> 
		<h4>Reset your password here</h4>
		Enter your current password: <input id="curr_pass" type="text" name="current_password" placeholder="Current password">
		<%= currpassworderror %>
		<br> 
		Enter your new password: <input id="new_pass" type="text" name="new_password" placeholder="New password">
		<%= newpassworderror %>
		<br>
	<h1>Personal Preferences</h1><br>
		Are you looking for shelters that allows children?<br>
		<input type="radio" name="children" value="1" required> Yes<br>
		<input type="radio" name="children" value="0"> No<br>
		Are you looking for shelters that allows pets? <br>
		<input type="radio" name="pets" value="1" required> Yes<br>
		<input type="radio" name="pets" value="0"> No<br>
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