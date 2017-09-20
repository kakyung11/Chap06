package org.greenda.web.controller.ws;

import java.io.IOException;
import java.util.*;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("userws")
public class LoginUserWSHandler extends TextWebSocketHandler{
	Map<String,WebSocketSession> users = new HashMap<>();
	//Map<String,Set<WebSocketSession> user;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// HttpSession에 어떻게 접근하여 사용하는가?
		Map<String, Object> hs = session.getAttributes();
			//HttpSession.setAttribute되어 있는 값들이 Map으로 추출됨
		System.out.println("/ws/loginUser: "+hs);
		String id = (String)hs.get("auth");
		users.put(id, session);
	}
	
	// 컨트롤러에서 사용하기 위한 메소드
	public void sendMessageToUser(String id, String msg){
		if(users.containsKey(id)){
			try {
				users.get(id).sendMessage(new TextMessage(msg));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
