package com.arian.NumBaseGame.Login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserDaoImp userDao;
	
	@Override
	public String Login(UserDto dto) {
		return userDao.Login(dto);
	}
}
