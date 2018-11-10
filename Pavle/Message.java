import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class Message implements Comparable<Message> {
   public String subject;
   public String body;
   public int recipient;
   public int sender = 0;
   public Byte read = 0;
   public String timeSent = "";

   public Message(String subject, String body, int recipient) {
      this.subject = subject;
      this.body = body;
      this.recipient = recipient;

      DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
      LocalDateTime now = LocalDateTime.now();

      timeSent = dtf.format(now);
   }

   public Message(String subject, String body, int recipient, byte read) {
      this.subject = subject;
      this.body = body;
      this.recipient = recipient;
      this.read = read;

      DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
      LocalDateTime now = LocalDateTime.now();

      timeSent = dtf.format(now);
   }

   public Message() {
      this.subject = "";
      this.body = "";
      this.recipient = -1;
   }

   public String readable(){
      return subject + ": \n" + body + "\nSent on: " + timeSent + "\nSent to: " + recipient + "\nRead:" + read;
   }

   public void read(){
       this.read = 1;
   }

   public void convertTimeToLong(String datetime){
       int mult = 1;
       for(int i = datetime.length(); i > -1; i--){
           this.timeSent += (long)datetime.charAt(i) * mult;
           mult *= 10;
       }
   }

   @Override
    public int compareTo(Message m) {
        
        return (int)(this.read - m.read);
    }

}