<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seeker User Home Page</title>
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
	<form ><!-- action=""> -->
      <input type="text" placeholder="Search Shelters near Location" name="search">
      <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
		<label for="filter">Kids allowed?</label>
        <select >
            <option value="0" selected>Yes</option>
            <option value="1">No </option>
        </select>      
        <label for="filter">Pets allowed?</label>
        <select>
            <option value="0" selected>Yes</option>
            <option value="1">No </option>
        </select>
          <label for="filter">Nearby Resources</label>
        <select multiple="3">
            <option value="0" selected>Pharmacy</option>
            <option value="1">Grocery Store </option>
            <option value="2">Laundromat </option>
        </select>       
        Settling Rating
         <input type="range" min="1" max="5" class="slider" id="myRange">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>
	Preferences 
	<br/>
	Location
	<br/>
	<button id="signout" onclick="signOut();">Sign out button</button>
	<div id="resultsTable">
	<table>
		<tr>
			<th>Shelter Info</th>
			<th>Shelter Name</th>
		</tr>
		<tr>
			<td>Image</td>
			<td> Name </td>
		</tr>
		<tr>
			<td>Address</td>
			<td> <table>
			<tr><th></th><th></th>
				</tr><tr><td>Display Preferences</td><td>Resources Offered</tr>
				<tr><td>pref 1</td><td> resource 1</td></tr>
				</table>  </td>
		</tr>
		<tr>
			<td>Image2</td>
			<td> Name2 </td>
		</tr>
		<tr>
			<td>Address2</td>
			<td> <table>
			<tr><th></th><th></th>
				</tr><tr><td>Display Preferences</td><td>Resources Offered</tr>
				<tr><td>pref 2</td><td> resource 2</td></tr>
				</table>  </td>
		</tr>
	</table>

	</div> 
		
		
	</div>
	<div id="bottom">
	<footer></footer>
	</div>
	
	<script>
	function signOut(){
	    document.location.href = "http://localhost:8080/CSCI201-Project/signin.jsp";
	}
	</script>
</body>
</html>