import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class Message {
    public String subject;
    public String body;
    public String recipient;
    public String sender;
    public Byte read = 0;
    public long timeSent = 0;

    // Default constructor
    public Message() {
        this.subject = "";
        this.body = "";
        this.recipient = "";
        this.sender = "";
    }

    //Constructor that actually sets values
    public Message(String subject, String body, String sender, String recipient) {
        this.subject = subject;
        this.body = body;
        this.sender = sender;
        this.recipient = recipient;

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        LocalDateTime now = LocalDateTime.now();

        timeSent = Long.parseLong(dtf.format(now));
    }

	//Getters
	public String getSubject() {
		return subject;
	}
	
	public String getBody() {
		return body;
	}
	
	public String getRecip() {
		return recipient;
	}

	public String getSender() {
		return sender;
	}
	
	public String getRead() {
        if(read == 1) return "Read";
        
        return "Unread";
	}
	
	//Returns the timestamp as a printable string
	public String getTime() {
		
		String time = Long.toString(this.timeSent);
		String returnTime = "";
		
		for(int i = 0; i < time.length(); i++) {
			returnTime =  returnTime + time.charAt(i);
			if(i == 3 || i == 5) returnTime = returnTime + "/";
			if(i ==7) returnTime = returnTime + " ";
			if(i == 9 || i == 11) returnTime = returnTime + ":";
		}
		
		return returnTime;
	}
	//Getters

    //Parse into readable format for testing
    public String readable() {
        return "Message from " + getSender() + ": \n" + getSubject() + ": \n" + getBody() + "\nSent on: " + getTime() + "\nSent to: " + getRecip() + "\nRead:" + getRead();
    }

    //Set whether a message is read
    public void read() {
        this.read = 1;
    }
}