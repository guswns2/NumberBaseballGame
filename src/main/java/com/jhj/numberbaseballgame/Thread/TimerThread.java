package com.jhj.numberbaseballgame.Thread;

import javax.websocket.Session;

public class TimerThread extends Thread {
	private boolean flag = false;
	private WebSocket ws = new WebSocket();
	private Session session;

	public TimerThread() {
		super();
	}
	public TimerThread(Session session) {
		super();
		this.session = session;
	}

	public void finish() {
		flag = true;
	}
	
	@Override
	public void run() {
		System.out.println("TimerThread 시작");

		for (int i = 1; i <= 10; i++) {
			try {
				System.out.println(i);
				Thread.sleep(1000);
				ws.onMessage(timer(), session);
				if (flag == true) {
					System.out.println("TimerThread finish 종료");
					return;
				}
			} catch (InterruptedException e) {
				System.out.println("TimerThread interrupt 종료");
				return;
			} 
		}
		System.out.println("TimerThread 종료");
	}

	int time = 180000;
	int min = 3;
	int sec = 60;
	String timer = min + " : " + "00";

	public String timer() {
		time = time - 1000;
		min = time / (60 * 1000);

		if (sec > 0) {
			sec = sec - 1;
			if(sec<10) {
				timer = min + " : 0" + sec;
			}
			else {
				timer = min + " : " + sec;
			}
		}
		if (sec == 0) {
			sec = 60;
			timer = min + " : " + "00";
		}
		return timer;
	}
}
