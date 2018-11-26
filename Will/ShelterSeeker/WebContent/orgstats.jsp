<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page    
    import="retrieval.DBHelper, retrieval.Message, retrieval.Mail,  javax.servlet.http.HttpServlet, 
    javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, 
    retrieval.CompareMessageByReadAndTime,java.util.*,retrieval.Shelter"%>
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
    <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.1.0/lodash.min.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/highlight.min.js"></script>

    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
</head>

<body>
    <div id="top">
        <ul>
            <li><a href="orgstats.jsp">Shelter Statistics</a></li>
            <li><a href="usermessages.jsp">Messages</a></li>
            <li><a href="orgsettings.jsp">Profile</a></li>

        </ul>
    </div>
    <div id="middle">
        <div> Rating: </div>
        <div id='rating-over-time'></div>
        <div id='click-series'></div>
        <div id='interest-map'></div>
        <div id='pie-charts' style="display:flex">
        <div id='pie-chart-1'></div>
        <div id='pie-chart-2'></div>
        <div id='pie-chart-3'></div>
        <div id='pie-chart-4'></div>
        </div>
    </div>
    <div id="bottom">
        <footer></footer>
    </div>

    <script type="text/javascript">
        <% DBHelper dbh = (DBHelper) request.getSession().getAttribute("DBHelper");
			Shelter sh = dbh.shInfo;
		%>
		
		fetch("ClickRetriever?q=clicks&here=<%= sh.id %>", {"method":"GET"}).then(resp => resp.json()).then(plotCallback);
		
        // [{date:new Date('2013-01-01'),n:120,n3:200},...]
        /* Generate random times between two dates */
        function unpack(rows, key) {
  			return rows.map(function(row) { return row[key]; });
		}
        
        function plotCallback(rows){
            var trace1 = {
              type: "scatter",
              mode: "lines",
              name: 'Clicks',
              x: unpack(rows, 'time'),
              y: unpack(rows, 'Clicks'),
              line: {color: '#17BECF'}
            }

			var data = [trace1];

            var layout = {
              title: 'Clicks per Day',
            };

			Plotly.newPlot('click-series', data, layout);
		}
    

        </script>

        <script type="text/javascript">
        Plotly.d3.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_us_cities.csv', function(err, rows){
        
            var cityName = unpack(rows, 'name'),
                cityPop = unpack(rows, 'pop'),
                cityLat = unpack(rows, 'lat'),
                cityLon = unpack(rows, 'lon'),
                color = [,"rgb(255,65,54)","rgb(133,20,75)","rgb(255,133,27)","lightgrey"],
                citySize = [],
                hoverText = [],
                scale = 50000;
        
            for ( var i = 0 ; i < cityPop.length; i++) {
                var currentSize = cityPop[i] / scale;
                var currentText = cityName[i] + " pop: " + cityPop[i];
                citySize.push(currentSize);
                hoverText.push(currentText);
            }
        
            var data = [{
                type: 'scattergeo',
                locationmode: 'USA-states',
                lat: cityLat,
                lon: cityLon,
                hoverinfo: 'text',
                text: hoverText,
                marker: {
                    size: citySize,
                    line: {
                        color: 'black',
                        width: 2
                    },
                }
            }];
        
            var layout = {
                title: 'Regional Interest',
                showlegend: false,
                geo: {
                    scope: 'usa',
                    projection: {
                        type: 'albers usa'
                    },
                    showland: true,
                    landcolor: 'rgb(217, 217, 217)',
                    subunitwidth: 1,
                    countrywidth: 1,
                    subunitcolor: 'rgb(255,255,255)',
                    countrycolor: 'rgb(255,255,255)'
                },
            };
        
            Plotly.plot('interest-map', data, layout, {showLink: false});
        
        });
        </script>



<script>
</script>

    <script>
        function signOut() {
            document.location.href = "http://localhost:8080/CSCI201-Project/signin.jsp";
        }
    </script>
    
    <script>
        var ratings = [];
        
		function plotRating(){
			fetch("ClickRetriever?q=currRating&here=<%= sh.id %>", {"method":"GET"}).then(resp=>resp.json()).then(json => ratings.concat(json)).then(plotRatingCallback);
		}
		
		window.setInterval(plotRating, 5000);
		
		
	    // [{date:new Date('2013-01-01'),n:120,n3:200},...]
	    /* Generate random times between two dates */
	    function unpack(rows, key) {
				return rows.map(function(row) { return row[key];});
		}
	    
	    function plotRatingCallback(rows){
	    	console.log(rows);
	        var trace1 = {
	          type: "scatter",
	          mode: "lines",
	          name: 'Rating',
	          x: unpack(rows, 'time'),
	          y: unpack(rows, 'rating'),
	          line: {color: '#17BECF'}
	        }
	
			var data = [trace1];
	
	        var layout = {
	          title: 'Ratings over Time',
	        };
	
			Plotly.newPlot('rating-over-time', data, layout);
		}
	
	        
        </script>
</body>

</html>