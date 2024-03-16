package com.jhj.baseballgame.Main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jhj.baseballgame.Game.GameServiceImp;

@Controller
public class MainController {
	@Autowired
	private GameServiceImp gameSer;
	
	
	@RequestMapping(value="/Main")
	public void Main(HttpSession session, Model model) {
		String logID = (String) session.getAttribute("logID");
		model.addAttribute("logID", logID);
	}
	
	@RequestMapping(value = "/Game")
	public void Game(HttpSession session, Model model) {
		String logID = (String) session.getAttribute("logID");
		model.addAttribute("logID", logID);
	}
	
	@RequestMapping(value = "/Rank")
	public void Rank(HttpSession session, Model model) {
		List rankList = gameSer.selRank(); 
		model.addAttribute("rankList", rankList);
	}
}
