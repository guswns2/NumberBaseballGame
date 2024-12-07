package com.jhj.numberbaseballgame.Thread;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;

@Controller
@ServerEndpoint(value="/echo.do")
public class WebSocket {
	private Basic basic;
	private TimerThread timerTh;
	
	// 서버 실행 되면 실행
	public WebSocket() {
		System.out.println("웹 소켓 객체 생성");
	}
	
	@OnOpen
	public void onOpen(Session session) {
		try {
			System.out.println("웹 소켓 연결 오픈");
			timerTh = new TimerThread(session);
			timerTh.start();
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	@OnClose
	public void onClose() {
		timerTh.interrupt();
		System.out.println("웹 소켓 연결 클로즈");
	}
	
	@OnError
	public void onError(Throwable e, Session session) {
		System.out.println("웹 소켓 에러");
	}
	
	// 데이터 수신했을 때
	@OnMessage
	public void onMessage(String message, Session session) {
		try {	
			basic = session.getBasicRemote();
			basic.sendText(message); 
		} 
		catch (Exception e) {
			System.out.println("웹 소켓 타이머 전송 에러"); 
		}
	}
}
