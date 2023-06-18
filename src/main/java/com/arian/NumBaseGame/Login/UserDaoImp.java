package com.arian.NumBaseGame.Login;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImp implements UserDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public String Login (UserDto dto) {
		return sqlSession.selectOne("logsql.logID", dto); 
	}
}
