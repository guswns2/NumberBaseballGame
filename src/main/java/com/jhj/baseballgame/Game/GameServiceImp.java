package com.jhj.baseballgame.Game;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GameServiceImp implements GameService{
	@Autowired
	private GameDaoImp gameDao;
	
	@Override
	public String AnsGen() {
		Random rd = new Random();
		int num1 = rd.nextInt(10);
		int num2 = rd.nextInt(10);
		int num3 = rd.nextInt(10);

		while (num2 == num1) {
			num2 = rd.nextInt(10);
		}
		while (num3 == num1 || num3 == num2) {
			num3 = rd.nextInt(10);
		}

		String ansNum = Integer.toString(num1) + Integer.toString(num2) + Integer.toString(num3);
		System.out.println(ansNum);

		return ansNum;
	}

	@Override 
	public void insRank(GameDto dto) { 
		gameDao.insRank(dto); 
	}

	@Override
	public List selRank() {
		return gameDao.selRank();
		
	}
}
