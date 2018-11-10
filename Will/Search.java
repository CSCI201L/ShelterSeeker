package API;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String databaseUserName = "root";
	static final String databasePassword = "password1";
	static final String databasePort = "3306";
	static final String databaseName = "shelterSeeker";
	static final String googleAPIKey = "AIzaSyByHkT9nYExPGBdrF8go_Iep92WAnfloWk";
       
    public Search() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:" + databasePort + "/" + 
				databaseName + "?user=" + databaseUserName + "&password= " + databasePassword + 
				"&useSSL=false&serverTimezone=UTC");
			String pharmacyNearby = request.getParameter("pharmacyNearby");
			String groceryNearby = request.getParameter("groceryNearby");
			String laundromatNearby = request.getParameter("laundromatNearby");

			System.out.println("This user called search: " + request.getParameter("email"));
			ps = conn.prepareStatement("SELECT userID from users where email=?");
			ps.setString(1, request.getParameter("email"));
			rs = ps.executeQuery();
			rs.next();
			int searcherID = rs.getInt("userID");
			System.out.println(searcherID);
			
			ps = conn.prepareStatement("SELECT * from userInfo where id=?");
			ps.setInt(1, searcherID);
			rs = ps.executeQuery();
			rs.next();
			int searcherZipCode = rs.getInt("zipcode");
			int searcherNumKids = rs.getInt("kids");
			int searcherNumPets = rs.getInt("pets");
			System.out.println("Searcher's ZipCode: " + searcherZipCode);
			System.out.println("Searcher's numKids: " + searcherNumKids);
			System.out.println("Searcher's numPets: " + searcherNumPets);
			
			String searchStatement = "SELECT s.* FROM users u, shelterInfo s where u.userID = s.id ";
			if(pharmacyNearby.equals("true")) searchStatement += " and nearPharmacy=1 ";
			if(groceryNearby.equals("true")) searchStatement += " and nearGrocery=1 ";
			if(laundromatNearby.equals("true")) searchStatement += " and nearLaundromat=1 ";
			searchStatement += " and s.kids>=? ";
			searchStatement += " and s.pets >=? ";
			searchStatement += " and availability>0 ";
			ps = conn.prepareStatement(searchStatement);
			ps.setInt(1, searcherNumKids);
			ps.setInt(2, searcherNumPets);
			
			System.out.println("Executing this query: " + searchStatement);
			rs = ps.executeQuery();
			ArrayList<Shelter> shelters = new ArrayList<Shelter>();
			
			while(rs.next()) {
				Shelter currentShelter = new Shelter();
				currentShelter.availability = rs.getInt("availability");
				currentShelter.bio = rs.getString("biography");
				currentShelter.id = rs.getInt("id");
				currentShelter.kids = rs.getInt("kids");
				currentShelter.pets = rs.getInt("pets");
				currentShelter.phoneNumber = rs.getString("phoneNumber");
				currentShelter.currentRating = rs.getDouble("currentRating");
				currentShelter.zipcode = rs.getInt("zipCode");
				shelters.add(currentShelter);
			}
			
			Collections.sort(shelters, new Comparator<Shelter>() {	
				public int compare(Shelter lhs, Shelter rhs) {
					URL url;
					try {
						url = new URL("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial"
								+ "&origins=" + Integer.toString(searcherZipCode) + "&destinations=" + 
								Integer.toString(lhs.zipcode) + "&key=" + googleAPIKey);
						HttpURLConnection connection = (HttpURLConnection)url.openConnection();
						connection.setRequestMethod("GET");
					    connection.connect();
					    BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
					    String line = br.readLine();
					    double distanceLHS = 0;
					    boolean distanceOnNextLine = false;
					    while (line != null) {
					    	if (distanceOnNextLine) {
					    		String distance = "";
					    		for(int i = 0; i < line.length(); i++) {
					    			if ((line.charAt(i) <= '9' && line.charAt(i) >= '0') || line.charAt(i) == '.') {
					    				distance += line.charAt(i);
					    			}
					    		}
					    		distanceLHS = Double.parseDouble(distance);
					    		distanceOnNextLine = false;
					    	}
					    	if (line.contains("distance")) {
					    		distanceOnNextLine = true;
					    	}
					    	line = br.readLine();
					    }
				    	url = new URL("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial"
								+ "&origins=" + Integer.toString(searcherZipCode) + "&destinations=" + 
								Integer.toString(rhs.zipcode) + "&key=" + googleAPIKey);
						connection = (HttpURLConnection)url.openConnection();
						connection.setRequestMethod("GET");
					    connection.connect();
					    br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
					    line = br.readLine();
					    double distanceRHS = 0;
					    distanceOnNextLine = false;
					    while (line != null) {
					    	if (distanceOnNextLine) {
					    		String distance = "";
					    		for(int i = 0; i < line.length(); i++) {
					    			if ((line.charAt(i) <= '9' && line.charAt(i) >= '0') || line.charAt(i) == '.') {
					    				distance += line.charAt(i);
					    			}
					    		}
					    		distanceRHS = Double.parseDouble(distance);
					    		distanceOnNextLine = false;
					    	}
					    	if (line.contains("distance")) {
					    		distanceOnNextLine = true;
					    	}
					    	line = br.readLine();
					    }
				    	int result = (int)distanceLHS - (int)distanceRHS;
				    	if (result == 0) { // Same ZipCode, sort by rating
				    		if (lhs.currentRating > rhs.currentRating) result = -1;
				    		else result = 1;
				    	}
				    	return result;
					    // <0 = less than, >0 = greater than, 0 = equal
					} catch (Exception e) {
						System.out.println(e.getMessage());
						return 0;
					}
				}	
			});
			
	    	response.setContentType("text");
			PrintWriter out = response.getWriter();
			
			for(Shelter s : shelters) {
				out.println(s.id);
				out.println(s.bio);
				out.println(s.zipcode);
			}
			
//			
//			URL url = new URL("https://www.zipcodeapi.com/rest/"
//					+ "dYZyo4NBkBmvPIE8EzqA3NABipAJG4wFOLkvJdTFufVARAcVmSE2HCVf8NRp4imi/distance.json/90089/94301/mile");
//			HttpURLConnection connection = (HttpURLConnection)url.openConnection();
//			connection.setRequestMethod("GET");
//		    connection.connect();
//		    InputStream is = connection.getInputStream();
//		    BufferedReader br = new BufferedReader(new InputStreamReader(is));
		   
			
//	    	response.setContentType("text");
//			PrintWriter out = response.getWriter();
	    	
	    	
		} catch (SQLException sqe) {
			System.out.println("sqe in search: " + sqe.getMessage());
		} catch (ClassNotFoundException cnfe) {
			System.out.println("cnfe in search: " + cnfe.getMessage());
		} catch (Exception e) {
			System.out.println("e in search: " + e.getMessage());
		}
		
		
	}

}
