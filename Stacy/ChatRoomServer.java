package chatRoom;

import java.io.IOException;
import java.util.Vector;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/chatroomServerEndpoint")
public class ChatRoomServer {

	private static Vector<Session> sessionVector = new Vector<Session>();
	
	@OnOpen
	public void open(Session session) {
		//System.out.println("Connection made!");
		sessionVector.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) {
		//System.out.println(message);
		String username = (String) session.getUserProperties().get("username");
		try {
			if(username==null) {
				session.getUserProperties().put("username", message);
				//session.getBasicRemote().sendText(username + "nhas joined the conversation!");
			}
			else
			{
				for(Session s : sessionVector) {
					s.getBasicRemote().sendText("@" + username + ": " + message);
				}
			}
		} catch (IOException ioe) {
			System.out.println("ioe: " + ioe.getMessage());
			close(session);
		}
	}
	
	@OnClose
	public void close(Session session) {
		//System.out.println("Disconnecting!");
		sessionVector.remove(session);
	}
	
	@OnError
	public void error(Throwable error) {
		System.out.println("Error!");
	}
}