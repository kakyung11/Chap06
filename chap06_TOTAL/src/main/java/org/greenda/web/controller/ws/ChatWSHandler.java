package org.greenda.web.controller.ws;

import java.util.*;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component("chatws")
public class ChatWSHandler extends TextWebSocketHandler {
	List<WebSocketSession> list;
	@Autowired
	ObjectMapper mapper;
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map map = new HashMap();
			map.put("mode", "chat");
			map.put("sender", "�����"+session.getId()); // WepSocket Session id != HttpSession id 
													   // �ڵ����� 1�� ���� ������
			map.put("msg", message.getPayload()); 	   // ����ڰ� ���� ���ڿ��� ����
			
		String json = mapper.writeValueAsString(map);
		System.out.println(json);
		for(WebSocketSession wss : list){
			wss.sendMessage(new TextMessage(json)); 
		}		
	}
		
	@PostConstruct // bean�� �����Ǹ鼭 �߰������� �ؾ��� �͵��� ��������   = init-method
	public void chatWSInit(){
		System.out.println("ChatWSHandler - chatWSInit()");
		list = new ArrayList<WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		list.add(session);
		String json = String.format("{\"mode\":\"join\", \"cnt\":%d }", list.size());
		for(WebSocketSession wss : list){
			wss.sendMessage(new TextMessage(json)); 
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		list.remove(session);
		String json = String.format("{\"mode\":\"out\", \"cnt\":%d }" , list.size());
		for(WebSocketSession wss : list){
			wss.sendMessage(new TextMessage(json)); 
		}
	}
	
	
}
