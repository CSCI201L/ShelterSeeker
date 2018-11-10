import java.util.Comparator;

public class CompareMessageByReadAndTime implements Comparator<Message> {

   @Override
   public int compare(Message m1, Message m2) {
      int read_status = m1.read - m2.read;
      if (read_status == 0) return -m1.timeSent.compareTo(m2.timeSent);
      return read_status;
   }

}
