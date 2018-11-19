<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page    
    import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, 
    javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, 
    retrieval.CompareMessageByReadAndTime,java.util.*"%>
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
	<%String shelterID = (String)request.getAttribute("shelterID"); %>
	<%
		DBHelper db = (DBHelper) request.getSession().getAttribute("DBHelper");
		System.out.println(db.didConnect() + " is status");
		String email = db.user.email;
		String user = db.user.username;
	%>
	
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
		#requestSpotSection {
			visibility: hidden;
		}
		#confirmRequestSent {
			visibility: hidden;
		}
		</style>
		<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	<div id="top">
	<ul>
		<li><a href="userhomepage.jsp">Search</a></li>
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
		<div id="rating">
			Rating: <%= currentRating %> <br>
		</div>
		Pets? <%= pets %> <br>
		Children? <%= kids %> <br>
		Near a pharmacy? <%= nearPharmacy %> <br>
		Near a grocery store? <%= nearGrocery %> <br>
		Near a laundromat? <%= nearLaundromat %>  <br>
		</div>
		<br />
		<br />
		
		<button id="goToShelterChatRoom" onclick="goToShelterChatRoom();">Shelter Chat Room</button>
		<br />
		<br />
		<h4>Give this shelter a rating</h4>
		<input type="radio" id="criteriaMinRating1" name="criteriaMinRating" onclick="javascript:giveRatingOne();"/>
        <label for="criteriaMinRating1">1 Star</label>
        <input type="radio" id="criteriaMinRating2" name="criteriaMinRating" onclick="javascript:giveRatingTwo();"/>
        <label for="criteriaMinRating2">2 Stars</label>
        <input type="radio" id="criteriaMinRating3" name="criteriaMinRating" onclick="javascript:giveRatingThree();"/>
        <label for="criteriaMinRating3">3 Stars</label>
        <input type="radio" id="criteriaMinRating4" name="criteriaMinRating" onclick="javascript:giveRatingFour();"/>
        <label for="criteriaMinRating4">4 Stars</label>
        <input type="radio" id="criteriaMinRating5" name="criteriaMinRating" onclick="javascript:giveRatingFive();"/>
        <label for="criteriaMinRating5">5 Stars</label>
        <br />
		<br />
        <button id="requestSpot" onclick="clickRequestSpot();">Request a room</button>
		<br />
		<br />
		<div id="requestSpotSection">
			<form id="requestSpotForm" action="javascript:onRequestSpot();">
				To: <input type="text" id="to"/>
				<br />
				<br />
				Subject: <input type="text" id="subject" value="Requesting a shelter spot" />
				<br />
				<br />
				Message:
				<textarea rows="10" cols="50" form="requestSpotForm">I would like to request a spot in your shelter.
				</textarea>
				<br />
				<br />
				<input type="submit" value="Send Message"/>
			</form>
		</div>
		<p id="confirmRequestSent">Your request has been sent!</p>
		
	</div>
	<div id="bottom">
	
	</div>
	
	<script>
	
	function goToShelterChatRoom() {
		sessionStorage.setItem('shelterID', <%=(String)request.getAttribute("shelterID")%>);
		sessionStorage.setItem('shelterName', "<%=(String)request.getAttribute("shelterName")%>");
		sessionStorage.setItem('username', "<%=user%>");
		document.location.href = "http://localhost:8080/ShelterSeeker/chat.jsp";
		
	}
	
	function giveRatingOne() {giveRating(1);}
	function giveRatingTwo() {giveRating(2);}
	function giveRatingThree() {giveRating(3);}
	function giveRatingFour() {giveRating(4);}
	function giveRatingFive() {giveRating(5);}
	
	function giveRating(rating) {
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", "GiveRating", true);
		xhttp.onreadystatechange = function () {
			let responseText = this.responseText;
			document.getElementById("rating").innerHTML = "Rating: " + responseText.trim();
		}
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhttp.send("rating=" + rating + "&email=" + "<%=email%>" +
			"&shelterID=" + <%=(String)request.getAttribute("shelterID")%>);
	}
	
	function clickRequestSpot() {
		document.getElementById("requestSpotSection").style.visibility = "visible";
	}
	
	function onRequestSpot() {
		document.getElementById("requestSpot").remove();
		document.getElementById("requestSpotSection").remove();
		document.getElementById("confirmRequestSent").style.visibility = "visible";
	}
	
	</script>
	
</body>
</html>