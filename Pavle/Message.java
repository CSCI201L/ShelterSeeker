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
        this.recipient = recipient;

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        LocalDateTime now = LocalDateTime.now();

        timeSent = Long.parseLong(dtf.format(now));
    }

    //Parse into readable format for testing
    public String readable() {
        return subject + ": \n" + body + "\nSent on: " + timeSent + "\nSent to: " + recipient + "\nRead:" + read;
    }

    //Set whether a message is read
    public void read() {
        this.read = 1;
    }
}