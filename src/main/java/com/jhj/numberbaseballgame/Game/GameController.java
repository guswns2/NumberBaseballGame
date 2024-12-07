package com.jhj.numberbaseballgame.Game;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class GameController {
	@Autowired
	private GameServiceImp gameSer;
	

	@ResponseBody
	@RequestMapping(value = "/AnsGen", method = RequestMethod.POST)
	public String AnsGen() {
		return gameSer.AnsGen();
	}
	
	@ResponseBody
	@RequestMapping(value="/InsertRank", method=RequestMethod.POST) 
	public void
	InsertRank(GameDto dto) { 
		gameSer.insRank(dto); 
	}
}
