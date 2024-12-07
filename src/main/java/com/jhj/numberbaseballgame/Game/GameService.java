package com.jhj.numberbaseballgame.Game;

import java.util.List;

public interface GameService {
	public String AnsGen();
	
	public void insRank(GameDto dto);
	
	public List selRank();
}
