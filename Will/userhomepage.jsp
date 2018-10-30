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
	<form action="javascript:onSearch();"><!-- action=""> -->
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
		<table id="searchResultsTable">
			<thead>
				<tr>
					<th>Shelter Id</th>
					<th>Shelter Info</th>
					<th>Shelter ZipCode</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>

	</div> 
		
		
	</div>
	<div id="bottom">
	<footer></footer>
	</div>
	
	<script>
	var prevNumSearchResults;
	function signOut(){
	    document.location.href = "http://localhost:8080/CSCI201-Project/signin.jsp";
	}
	
	function onSearch() {
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", "Search", true);
		xhttp.onreadystatechange = function () {
			// Put the response in an array format
			let responseText = this.responseText;
			let responseArray = []
			let currentStr = ""
			for(let i = 0; i < responseText.length; i++) {
				if (responseText[i] != "\n") {
					currentStr += responseText[i];
				}
				else {
					responseArray.push(currentStr);
					currentStr = "";
				}
			}
			
			// Clear the search results table
			let table = document.getElementById("searchResultsTable").getElementsByTagName('tbody')[0];
			for(let i = prevNumSearchResults; i > 0; i--) {
				try {
					table.deleteRow(-1);
				}
				catch(error) {
					continue;
				}
			}
			
			// Put the retrieved search results into the table
			for(let i = 0; i < responseArray.length; i+=3) {
				let row = table.insertRow();
				row.style.height="60px";
				for(let j = 0; j < 3; j++) {
					let currentCell = row.insertCell();
					currentCell.innerHTML = responseArray[i + j];
					currentCell.style.borderTop = "1px solid #898989";
					if (j % 3 == 0) currentCell.style.width = "450px";
					else if (j % 3 == 1) currentCell.style.width ="200px";
					else currentCell.style.width ="250px";
				}
				
			}
			
			prevNumSearchResults = responseArray.length / 3;
		}
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhttp.send("email=borie@usc.edu&pharmacyNearby=false&groceryNearby=true&laundromatNearby=false"); 
	}
	</script>
</body>
</html>