package com.arian.NumBaseGame.Game;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GameDaoImp implements GameDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override public void insRank(GameDto dto) {
		sqlSession.insert("ranksql.insRank", dto); 
	}

	@Override
	public List selRank() {
		return sqlSession.selectList("ranksql.selRank");
	}
	
}
