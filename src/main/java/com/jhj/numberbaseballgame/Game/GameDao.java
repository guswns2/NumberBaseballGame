package com.jhj.numberbaseballgame.Game;

import java.util.List;

public interface GameDao {
	public void insRank(GameDto dto);
	
	public List selRank();
}
