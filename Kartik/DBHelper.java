import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

public class DBHelper {
	public String email; //unique identifier
	public UserInfo user;
	public Connection conn = null;
	public Statement st = null;
	public ResultSet rs = null;
	public int userId = -1;
	public PreparedStatement ps = null;
	public Shelter shInfo = null;
	public static final String CLASS_NAME = "com.mysql.jdbc.Driver";
	public static final String CONNECTION_URL = "jdbc:mysql://localhost:3306/calendarinfo?user=root&password=root&useSSL=false";
	public DBHelper(String email, String password)  {
		this.email = email;
		this.user = new UserInfo();
		
		//login user to database using username and password
		//if success, populate UserInfo with values. and maintain email.
		//if connection fails, then set email to nothing
		
		try {
			Class.forName(CLASS_NAME);
			conn = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM users WHERE email=? AND password=?";
			ps = conn.prepareStatement(query);		
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			while (rs.next()) {
				this.userId = rs.getInt("userID");
				user.email = rs.getString("email");
				user.username = rs.getString("username");
				user.isShelter = rs.getByte("isShelter");
				updateUserInfo(userId);
				if (user.isShelter == 1) {
					shInfo = getShelterInfo(userId);
				}
				//now userObject will be fully updated
				//if it is a shelter, then shInfo will also be populated!
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (conn!= null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		
	
		//DUMMY - TO BE REPLACED LATER (just so I don't get a ton of errors)
		//END DUMMY
	}
	
	public void updateUserInfo (int userId) {
		Connection conn1 = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName(CLASS_NAME);
			conn1 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM userInfo WHERE id=?";
			ps1 = conn1.prepareStatement(query);		
			ps1.setInt(1, userId);
			rs1 = ps1.executeQuery();
			while (rs1.next()) {
				user.zipcode = rs1.getInt("zipcode");
				user.kids = rs1.getInt("kids");
				user.pets = rs1.getInt("pets");
				user.phoneNumber = rs1.getInt("phoneNumber") + "";
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs1 != null) {
					rs1.close();
				}
				if (ps1 != null) {
					ps1.close();
				}
				if (conn1!= null) {
					conn1.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
	}
	public Shelter getShelterInfo(int userId) {
		Shelter s = new Shelter();
		Connection conn1 = null;
		PreparedStatement ps1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName(CLASS_NAME);
			conn1 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM shelterInfo WHERE id=?";
			ps1 = conn1.prepareStatement(query);		
			ps1.setInt(1, userId);
			rs1 = ps1.executeQuery();
			while (rs1.next()) {
				s.zipcode = rs1.getInt("zipcode");
				s.kids = rs1.getInt("kids");
				s.pets = rs1.getInt("pets");
				s.phoneNumber = rs1.getInt("phoneNumber") + "";
				s.bio = rs1.getString("biography");
				s.numRatingGiven = rs1.getInt("numRatingGiven");
				s.nearGrocery = rs1.getByte("nearGrocery");
				s.nearPharmacy = rs1.getByte("nearPharmacy");
				s.nearLaundromat = rs1.getByte("nearLaundromat");
				s.currentRating = rs1.getDouble("currentRating");
				s.pageVisits = rs1.getInt("pageVisits");
				s.numStays = rs1.getInt("numStays");
				s.numPendingRequests = rs1.getInt("numPendingRequests");
				s.avgStayDuration = rs1.getDouble("avgStayDuration");	
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs1 != null) {
					rs1.close();
				}
				if (ps1 != null) {
					ps1.close();
				}
				if (conn1!= null) {
					conn1.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		return s;
	}
	public boolean didConnect () {
		if (user.username.equals("")) {
			return false;
		} else {
			return true;
		}
	}
	
	//SIGN UP VARIOUS USERS ---
	public  int addNormalUser(UserInfo u, String password) {
		//should sign up basic survivor
		Connection conn2 = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		try {
			Class.forName(CLASS_NAME);
			conn2 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "INSERT INTO users(username,email,pass,isShelter) VALUES (?,?,?,?)";
			ps2 = conn2.prepareStatement(query);		
			ps2.setString(1, u.username);
			ps2.setString(2, u.email);
			ps2.setString(3, password);
			ps2.setByte(4, u.isShelter);
			ps2.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs2 != null) {
					rs2.close();
				}
				if (ps2 != null) {
					ps2.close();
				}
				if (conn2!= null) {
					conn2.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		if (u.isShelter==0) {
			//if isn't a shelter, create a table in userInfo
			int userId = -1;
			try {
				Class.forName(CLASS_NAME);
				conn2 = DriverManager.getConnection(CONNECTION_URL); 
				
				String query = "SELECT * FROM users WHERE username=? AND pass=?";
				ps2 = conn2.prepareStatement(query);		
				ps2.setString(1, u.username);
				ps2.setString(2, password);
				rs2 = ps2.executeQuery();
				if (rs2.next()) {
					userId = rs2.getInt("userID"); 
				}
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if (rs2 != null) {
						rs2.close();
					}
					if (ps2 != null) {
						ps2.close();
					}
					if (conn2!= null) {
						conn2.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle closing streams: " + sqle.getMessage());
				}
			}
			if (userId == -1) {
				System.out.println("could not find the id?");
			} else {
				try {
					Class.forName(CLASS_NAME);
					conn2 = DriverManager.getConnection(CONNECTION_URL); 
					
					String query = "INSERT INTO userInfo(id,zipcode,kids,pets,phoneNumber) VALUES (?,?,?,?,?)";
					ps2 = conn2.prepareStatement(query);		
					ps2.setInt(1, userId);
					ps2.setInt(2, u.zipcode);
					ps2.setInt(3, u.kids);
					ps2.setInt(4, u.pets);
					ps2.setString(5, u.phoneNumber);
					
					rs2 = ps2.executeQuery();

				}catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					try {
						if (rs2 != null) {
							rs2.close();
						}
						if (ps2 != null) {
							ps2.close();
						}
						if (conn2!= null) {
							conn2.close();
						}
					} catch (SQLException sqle) {
						System.out.println("sqle closing streams: " + sqle.getMessage());
					}
				}
			}
		}
		return userId;
		
	}
	public void createOrg (UserInfo u, String password, Shelter s) {
		//should sign up organization user with isShelter = true by adding to userinfo table
		//should add entry to Shelter table. Both Should contain the same values
		int userId = addNormalUser(u,password);
		Connection conn2 = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;
		try {
			Class.forName(CLASS_NAME);
			conn2 = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "INSERT INTO shelter(id,zipcode,kids,pets,phoneNumber,biography,nearGrocery,nearPharmacy,nearLaundromat) VALUES (?,?,?,?,?,?,?,?)";
			ps2 = conn2.prepareStatement(query);		
			ps2.setInt(1, userId);
			ps2.setInt(2, s.zipcode);
			ps2.setInt(3, s.kids);
			ps2.setInt(4, s.pets);
			ps2.setString(5, s.phoneNumber);
			ps2.setByte(6, s.nearGrocery);
			ps2.setByte(7, s.nearPharmacy);
			ps2.setByte(8, s.nearLaundromat);
			ps2.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs2 != null) {
					rs2.close();
				}
				if (ps2 != null) {
					ps2.close();
				}
				if (conn2!= null) {
					conn2.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
	}
	
	//TO BE USED ON SEARCH SHELTER PAGE --
	public ArrayList<Shelter> getShelters(){
		ArrayList<Shelter> res = new ArrayList<>();
		try {
			Class.forName(CLASS_NAME);
			conn = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM shelters";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				int tempId = rs.getInt("userID");
				res.add(getShelterInfo(tempId));
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (conn!= null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		//populate res based on statement SELECT * FROM shelter 
		return res;
	}
	
	//MESSAGES PAGE --
	
	public boolean sendMessage (Message m) {
		//add m to messages table
		if(!userExists(m.recipient)) {
			return false;
		} else {
			//send message here
			try {
				Class.forName(CLASS_NAME);
				conn = DriverManager.getConnection(CONNECTION_URL); 
				
				String query = "INSERT INTO shelters(senderID,recipientID,timeSent,mSubject,mContent,mRead) VALUES (?,?,?,?,?,?)";
				Byte b = 0;
				ps = conn.prepareStatement(query);
				ps.setInt(1, this.userId);
				ps.setInt(2, m.recipient);
				ps.setString(3,""+ LocalDateTime.now());
				ps.setString(4, m.subject);
				ps.setString(5, m.body);
				ps.setByte(6, b);
				ps.executeUpdate();
				
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					if (rs != null) {
						rs.close();
					}
					if (st != null) {
						st.close();
					}
					if (conn!= null) {
						conn.close();
					}
				} catch (SQLException sqle) {
					System.out.println("sqle closing streams: " + sqle.getMessage());
					
				}
			}
			return true;			
		}
	}
	public ArrayList<Message> getMessages(){
		ArrayList<Message> res = new ArrayList<>();
		try {
			Class.forName(CLASS_NAME);
			conn = DriverManager.getConnection(CONNECTION_URL); 
			
			String query = "SELECT * FROM messages WHERE recipientID=?";
			ps = conn.prepareStatement(query);
			ps.setInt(1, this.userId);
			rs = ps.executeQuery();
			while (rs.next()) {
				Message m = new Message();
				m.sender = rs.getInt("senderID");
				m.recipient = this.userId;
				m.subject = rs.getString("mSubject");
				m.body = rs.getString("mBody");
				m.read = rs.getByte("mRead");
				m.timeSent = rs.getString("timeSent");
				res.add(m);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (st != null) {
					st.close();
				}
				if (conn!= null) {
					conn.close();
				}
			} catch (SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		return res;
	}
	
	//updating Settings
	public void updateUserSettings(UserInfo user) {
		
	}
	public void updateShelterSettings(Shelter s) {
		
	}
	
	//MISC. HELPER FUNCTIONS
	public static void visitShelter(String shelterId) {
		//user statement: 
		//UPDATE  shelterinfo SET visits = 
			//(SELECT visits FROM shelterinfo WHERE shelterId = shelterId)+1 
			// WHERE shelterId=shelterId'
		
	}
	public boolean userExists(int id) {
		//checks userInfo and sees if email exists in the table
		return true;
	}
	
	
	
	
}
