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

      Message test1 = new Message("Subject1", "Body", "Test", "Test2");
      Message test2 = new Message("Subject2", "Body", "Test", "Test2");

      try {
         Thread.sleep(5000);
      } catch (InterruptedException ex) {
         Thread.currentThread().interrupt();
      }
      Message test3 = new Message("Subject3", "Body", "Test", "Test2");
      Message test4 = new Message("Subject4", "Body", "Test", "Test2");

      test1.read();
      test3.read();

      mail.addMessage(test1);
      mail.addMessage(test2);
      mail.addMessage(test3);
      mail.addMessage(test4);

      mail.SortByReadAndTime(comp);

      mail.display();
   }
}