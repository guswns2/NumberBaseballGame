package com.jhj.baseballgame.Login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class UserController {
	@Autowired
	private UserServiceImp userSer;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String startLogin(Model model) {
		
		return "Login";
	}
	
	@ResponseBody
	@RequestMapping(value="/TryLogin", method=RequestMethod.POST)
	public String Login(UserDto dto, HttpSession session) {
		String logID = userSer.Login(dto);
		if(logID != null) {
			session.setAttribute("logID", logID);
			return logID;
		}
		else {
			return null;
		}
	}
	
}
