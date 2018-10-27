
public class Shelter {
	public String shelterName;
	public int zipcode;
	public int kids = 0;
	public int pets = 0;
	public String phoneNumber = "";
	public int numRatingGiven = 0;
	public Byte nearGrocery = 0;
	public String bio = "";
	public Byte nearPharmacy = 0;
	public Byte nearLaundromat = 0;
	public double currentRating = 0;
	public int pageVisits = 0;
	public int numStays = 0;
	public int numPendingRequests = 0;
	public double avgStayDuration  = 0;
	
	public Shelter (String name, String phoneNumber, int zipcode) {
		this.shelterName = name;
		this.phoneNumber = phoneNumber;
		this.zipcode = zipcode;
	}
	public Shelter () {
		shelterName = "";
		phoneNumber = "";
		zipcode = 0;
	}
}
