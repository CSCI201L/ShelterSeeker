import java.util.ArrayList;
import java.util.Comparator;
import java.util.Arrays;

public class Mail {

   private ArrayList<Message> messages;

   public Mail() {
      messages = new ArrayList<Message>();
   }

   public void addMessage(Message m) {
      this.messages.add(m);
   }

   public void SortByReadAndTime(Comparator comp) {
      messages.sort(comp);
   }

   public void display() {
      for (int i = 0; i < messages.size(); i++) {
         System.out.println(messages.get(i).readable());
         System.out.println();
      }
   }

   public static void main(String[] args) {
      Mail mail = new Mail();

      CompareMessageByReadAndTime comp = new CompareMessageByReadAndTime();

      Message test2 = new Message("Subject2", "Body", 1, (byte)1);
      Message test3 = new Message("Subject2", "Body", 1, (byte)0);
      try {
         Thread.sleep(5000);
      } catch (InterruptedException ex) {
         Thread.currentThread().interrupt();
      }
      Message test1 = new Message("Subject1", "Body", 1, (byte)1);
      Message test4 = new Message("Subject1", "Body", 1, (byte)0);

      mail.addMessage(test1);
      mail.addMessage(test2);
      mail.addMessage(test3);
      mail.addMessage(test4);

      mail.SortByReadAndTime(comp);

      mail.display();
   }
}