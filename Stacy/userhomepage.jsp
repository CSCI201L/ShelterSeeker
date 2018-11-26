<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Shelter Seeker User Home Page</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link href="https://fonts.googleapis.com/css?family=Nunito+Sans" rel="stylesheet">
	<style>
		 .navbar {
		 	background-color: #c5c1fe;
		 	border-color:#c5c1fe;
	      	margin-bottom: 0;
	      	border-radius: 0;
	      	color:white; 
	      
	    }
		.navbar-default .navbar-brand {
		    color: white;
		   
		}
		.navbar-brand{
    		padding: 0px 15px;
    		margin-right: -15px;
		}
		.navbar-right{
			margin-right: 0px;
		}
		.navbar-default .navbar-nav>li>a {
		    color: white;
		}
		.navbar-default .navbar-nav>.active>a{
			color: grey; 
			background-color: white; 
		}
		
	    body{
			background-image: linear-gradient(to right, #7a5ce5, #a490ea, #7a5ce5);
			font-family: 'Nunito Sans', sans-serif;
			color:white; 
			height: 100%; 
		}  
	    footer {
	      background-color: #c5c1fe;
	      color: white;
	      padding: 15px;
	      position: fixed;
		  bottom: 0;
		  width: 100%;
		  height: 5%; 
	   
		}
	</style>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	  	<div class="navbar-header">
		 	<figure class="navbar-brand">
			  <img src="bed.png" style="width: 30px;height: 40px;">
			</figure>	
		</div>
	    <ul class="nav navbar-nav">
	   	 	<li><a style="font-size: 20px">Safe Hands</a></li>
	      <li class="active"><a href="#">Search</a></li>
	      <li><a href="usermessages.jsp">Messages</a></li>
	      <li><a href="userprofile.jsp">Profile</a></li>
	    </ul>
	     <ul class="nav navbar-nav navbar-right">
        	<li><a class="navbar-brand" href="signin.jsp">Sign Out</a></li>
      	</ul>
	  </div>
	</nav>
	<div class="container-fluid"> 
	<h1 style="text-align: center; ">Search for a Shelter Now</h1>
	<form class="form-inline"  action="javascript:onSearch();"><!-- action=""> -->
	
  		 <label class="control-label" for="loc">Search by name </label>
	      <input type="text" class="form-control"  name="search" placeholder="Enter name">
  		 <label class="control-label" for="loc">Search by location <span class="glyphicon glyphicon-map-marker"></span></label>
	      <input type="text" class="form-control"  name="search" placeholder="Enter zipcode">
     		<button class="col btn btn-md btn-default" style ="color: black;" type="submit">
	      	<span class="glyphicon glyphicon-search"></span> Search
	      </button>
	     	
	     	<div class="panel" style="background-image: linear-gradient(to right, #7a5ce5, #a490ea, #7a5ce5)">
			  <div class="panel-body">
	     			<label>Kids Allowed? <span class="glyphicon glyphicon-user"></span> </label>
		     		<input class="form-check-input" type="radio" id="criteriaKidsYes" name="criteriaKids" value="Yes"/>
		     		<label class="form-check-label"  for="criteriaKidsYes">Yes</label>
		     		<input  class="form-check-input" type="radio" id="criteriaKidsNo" name="criteriaKids" value="No"/>
		       		 <label class="form-check-label" for="criteriaKidsNo">No</label>
		       		 <label for="criteriaPets">Allow Pets?</label>
			        <select style ="color: black;" id="criteriaPets">
			            <option value="Yes" selected>Yes</option>
			            <option value="No">No </option>
			        </select>
			  </div>
			  <label for="criteriaResources">Things I prefer to have nearby</label>
		        <select style ="color: black;" multiple id="criteriaResources">
		        	<option value="None" selected>None</option>
		            <option value="Pharmacy">Pharmacy </option>
		            <option value="Grocery">Grocery Store  </option>
		            <option value="Laundromat">Laundromat </option>
		        </select>
		         <label for="criteriaMinRating">Prefered Shelter Rating <span class="glyphicon glyphicon-star-empty"></span></label>
	         <input type="range" min="1" max="5" class="form-control-range col-sm-5" id="criteriaMinRating">
	 
			   </div>   
	 	 </form>
		</div>
			 
	    
   
    
    <div class="container">	
	  <h2>Search Results</h2>      
	  <table class="table table-hover"  id="searchResultsTable">
	    <thead>
	      <tr>
	        <th>Name</th>
	        <th>Info</th>
	        <th>Zipcode</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>Shelter 1</td>
	        <td>Best place ever</td>
	        <td>1234</td>
	      </tr>
	      <tr>
	        <td>Shelter 2</td>
	        <td>We have good food</td>
	        <td>34354</td>
	      </tr>
	      <tr>
	        <td>Shelter 3</td>
	        <td>We allow pets!</td>
	        <td>1232</td>
	      </tr>
	    </tbody>
	  </table>
	</div> 

   
   
   	
	</div>
	<footer class="container-fluid text-center">
	  <p> © 2018 Safe Hands </p>
	</footer>
	
	<script>
	var prevNumSearchResults;
	function signOut(){
	    location.href = "signin.jsp";
	}
	
	function onSearch() {
		console.log(document.getElementsByName("criteriaKidsYes"));
		console.log(document.getElementsByName("criteriaKidsNo"));

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
					currentCell.addEventListener('click', function() {
						loadSearchResult(responseArray[i]);
					});
				}
				
			}
			
			prevNumSearchResults = responseArray.length / 3;
		}
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhttp.send("email=test@usc.edu&pharmacyNearby=false&groceryNearby=true&laundromatNearby=false"); 
	}
	
	function loadSearchResult(shelterId) {
		console.log(shelterId);
		document.location.href = "http://localhost:8080/ShelterSeekerEclipse/searchResult?shelterId=" + 
				shelterId;
	}
	</script>
</body>
</html>