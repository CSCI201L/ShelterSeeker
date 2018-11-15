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
	#numKidsSection {
		visibility: hidden;
	}
	#numPetsSection {
		visibility: hidden;
	}
	#searchLoading {
		visibility: hidden;
	}
	#searchYieldedNoResults {
		visibility: hidden;
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
	<form action="javascript:onSearch();">
     	
     	<h4>I want to only see shelters that accept kids.</h4>
     	<input type="radio" id="criteriaKidsYes" name="criteriaKids" onclick="javascript:showNumKidsSection();"/>
     	<label for="criteriaKidsYes">Yes</label>
     	<input type="radio" id="criteriaKidsNo" name="criteriaKids" onclick="javascript:hideNumKidsSection();"/>
        <label for="criteriaKidsNo">No</label>
        
        <div id="numKidsSection">
        	<h4>How many kids?</h4>
        	<input type="text" id="criteriaNumKids"/>
        </div>
        
        <h4>I want to only see shelters that allow for pets.</h4>
        <input type="radio" id="criteriaPetsYes" name="criteriaPets" onclick="javascript:showNumPetsSection();"/>
     	<label for="criteriaPetsYes">Yes</label>
     	<input type="radio" id="criteriaPetsNo" name="criteriaPets" onclick="javascript:hideNumPetsSection();"/>
        <label for="criteriaPetsNo">No</label>
        
        <div id="numPetsSection">
        	<h4>How many pets?</h4>
        	<input type="text" id="criteriaNumPets" />
        </div>

        <h4>I want to only see shelters that are near these resources:</h4>
        <input type="checkbox" id="criteriaPharmacy"/>
        <label for="criteriaPharmacy">Pharmacy</label>
        <input type="checkbox" id="criteriaGrocery"/>
        <label for="criteriaGrocery">Grocery</label>
        <input type="checkbox" id="criteriaLaundromat"/>
        <label for="criteriaLaundromat">Laundromat</label>
           
        <h4>I want to only see shelters that have at least this Average User Rating: </h4>
        <input type="radio" id="criteriaMinRating1" name="criteriaMinRating"/>
        <label for="criteriaMinRating1">1 Star</label>
        <input type="radio" id="criteriaMinRating2" name="criteriaMinRating"/>
        <label for="criteriaMinRating2">2 Stars</label>
        <input type="radio" id="criteriaMinRating3" name="criteriaMinRating"/>
        <label for="criteriaMinRating3">3 Stars</label>
        <input type="radio" id="criteriaMinRating4" name="criteriaMinRating"/>
        <label for="criteriaMinRating4">4 Stars</label>
        <input type="radio" id="criteriaMinRating5" name="criteriaMinRating"/>
        <label for="criteriaMinRating5">5 Stars</label>
        
        <h4>I want to only see shelters that currently have availability.</h4>
     	<input type="radio" id="criteriaAvailableYes" name="criteriaAvailable"/>
     	<label for="criteriaAvailableYes">Yes</label>
     	<input type="radio" id="criteriaAvailableNo" name="criteriaAvailable" />
        <label for="criteriaAvailableNo">No</label>
        <br />
        <br />
        <input type="text" id="criteriaSearchByName" />
        <label for="criteriaSearchByName">(Optional) Search by Shelter name</label>
        <br />
        <br />
    	<button type="submit">Search for shelters near your location</button>
    	
    	<br />
    	<br />
    	<h4 id="searchLoading">Loading...</h4>
    	<h4 id="searchYieldedNoResults">No shelters match the input criteria.</h4>
    </form>
	
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
		
	<button id="signout" onclick="signOut();">Sign out button</button>
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
		let parameters = "email=borie@usc.edu";
		let numKids = 0;
		if (document.getElementById("criteriaKidsYes").checked) {
			if (isNaN(document.getElementById("criteriaNumKids").value) || 
					document.getElementById("criteriaNumKids").value.includes(".") ||
					document.getElementById("criteriaNumKids").value.includes("-")) {
				alert("Please enter a valid number of kids.");
				return;
			} else {
				numKids = document.getElementById("criteriaNumKids").value;
			}
		}
		parameters += "&numKids=" + numKids;
		
		let numPets = 0;
		if (document.getElementById("criteriaPetsYes").checked) {
			if (isNaN(document.getElementById("criteriaNumPets").value) || 
					document.getElementById("criteriaNumPets").value.includes(".") ||
					document.getElementById("criteriaNumPets").value.includes("-")) {
				alert("Please enter a valid number of pets.");
				return;
			} else {
				numPets = document.getElementById("criteriaNumPets").value;
			}
		}
		parameters += "&numPets=" + numPets;

		if (document.getElementById("criteriaPharmacy").checked)
			parameters += "&pharmacyNearby=true";
		else
			parameters += "&pharmacyNearby=false";
		
		if (document.getElementById("criteriaGrocery").checked)
			parameters += "&groceryNearby=true";
		else
			parameters += "&groceryNearby=false";
		
		if (document.getElementById("criteriaLaundromat").checked)
			parameters += "&laundromatNearby=true";
		else
			parameters += "&laundromatNearby=false";
		
		if (document.getElementById("criteriaMinRating1").checked) 
			parameters += "&minRating=1";
		else if (document.getElementById("criteriaMinRating2").checked)
			parameters += "&minRating=2";
		else if (document.getElementById("criteriaMinRating3").checked)
			parameters += "&minRating=3";
		else if (document.getElementById("criteriaMinRating4").checked)
			parameters += "&minRating=4";
		else if (document.getElementById("criteriaMinRating5").checked)
			parameters += "&minRating=5";
		else 
			parameters += "&minRating=0";
		
		if (document.getElementById("criteriaAvailableYes").checked)
			parameters += "&showAvailableOnly=true";
		else parameters += "&showAvailableOnly=false";
		
		parameters += "&searchByName=" + document.getElementById("criteriaSearchByName").value;
		
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", "Search", true);
		xhttp.onreadystatechange = function () {
			document.getElementById("searchLoading").style.visibility = "hidden";
			
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
			
			if (responseArray.length == 0) {
				document.getElementById("searchYieldedNoResults").style.visibility = "visible";
				document.getElementById("searchResultsTable").style.visibility = "hidden";
				return;
			}
			else {
				document.getElementById("searchYieldedNoResults").style.visibility = "hidden";
				document.getElementById("searchResultsTable").style.visibility = "visible";
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
					currentCell.addEventListener('click', function() {
						loadSearchResult(responseArray[i]);
					});
				}
				
			}
			
			prevNumSearchResults = responseArray.length / 3;
		}
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhttp.send(parameters);
		document.getElementById("searchLoading").style.visibility = "visible";
		document.getElementById("searchResultsTable").style.visibility = "hidden";
	}
	
	function loadSearchResult(shelterId) {
		console.log(shelterId);
		document.location.href = "http://localhost:8080/borie_CSCI201L_Final_Project/searchResult?shelterId=" + 
				shelterId;
	}
	
	function showNumKidsSection() {
		document.getElementById("numKidsSection").style.visibility = "visible";
	}
	
	function hideNumKidsSection() {
		document.getElementById("numKidsSection").style.visibility = "hidden";
	}
	
	function showNumPetsSection() {
		document.getElementById("numPetsSection").style.visibility = "visible";
	}
	
	function hideNumPetsSection() {
		document.getElementById("numPetsSection").style.visibility = "hidden";
	}
	</script>
</body>
</html>