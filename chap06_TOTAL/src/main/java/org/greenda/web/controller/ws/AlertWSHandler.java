package org.greenda.web.controller.ws;

import java.io.IOException;
import java.util.*;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component("alertws")
public class AlertWSHandler extends TextWebSocketHandler {
	List<WebSocketSession> list;
	@Autowired
	ObjectMapper mapper;
	
	// AlertWsHandler 객체를 통해서 전체 사용자에게 메세지를 보낸다.
	public void sendMessage(String message){
		for(WebSocketSession s : list){
			try {
				s.sendMessage(new TextMessage(message));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@PostConstruct // bean이 생성되면서 추가적으로 해야할 것들을 설정해줌   = init-method
	public void alertWSInit(){
		System.out.println("AlertWSHandler - alertWSInit()");
		list = new ArrayList<WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
	}
	
}
