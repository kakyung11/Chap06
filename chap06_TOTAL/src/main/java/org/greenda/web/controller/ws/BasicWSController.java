package org.greenda.web.controller.ws;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/*
 * ws protocol 처리용 컨트롤러는 
 * AbstractWebSocketHandler 혹은
 * TextWebSocketHandler 중 하나를 상속받고 만든다.
 */

public class BasicWSController extends TextWebSocketHandler {
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//super.afterConnectionEstablished(session);
		// 클라이언트측에서 연결이 발생하였을 때
		System.out.println("afterConnectionEstablished");
		String msg = "환영합니다.";
		session.sendMessage(new TextMessage(msg));
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 클라이언트 측으로 부터 연결이 해제 되었을 때
		System.out.println("afterConnectionClosed");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//super.handleTextMessage(session, message);
		// 클라이언트 측으로 부터 데이터를 전송 받았을 때,
		System.out.println("handleTextMessage");
		String m = message.getPayload();
		System.out.println("수신된 내용: ["+m+"]");
	}
}
