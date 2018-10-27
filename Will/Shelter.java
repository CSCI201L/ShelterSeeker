package API;

public class Shelter {
	int id;
	int zipCode;
	int numKids;
	int numPets;
	int phoneNumber;
	String biography;
	int availability;
	double rating;
	
	public void printInfo() {
		System.out.println("========================");
		System.out.println("Shelter id: " + id);
		System.out.println("Shelter ZipCode: " + zipCode);
		System.out.println("Shelter PhoneNumber: " + phoneNumber);
		System.out.println("Shelter Bio: " + biography);
		System.out.println("========================");
	}
}

