package web.chat;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("입장");
		sessionList.add(session);
//		log.info("{}  입장", session.getPrincipal().getName());
	}


	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		log.info("메세지");
		for(WebSocketSession ws : sessionList ) {
//			ws.sendMessage(new TextMessage(httpSession.getAttribute("userNick")+":"+message.getPayload()));
			ws.sendMessage(new TextMessage((byte[])message.getPayload()));
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("퇴장");
//		log.info("{}  퇴장", session.getPrincipal().getName());
		sessionList.remove(session);
	}
}
