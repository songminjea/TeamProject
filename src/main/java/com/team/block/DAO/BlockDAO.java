package com.team.block.DAO;

import java.util.List;
import java.util.Map;

import com.team.block.VO.BlockVO;




public interface BlockDAO {
	
	// 해당 아이디의 모든 blocker 목록 리턴(Blocker_id, Block_date)
	public List<BlockVO> GetAllBlocker(Map<String, String> BlockInfo);
	
	// 해당 아이디의 모든 blocking 목록 리턴(Blocking_id, Block_date)
	public List<BlockVO> GetAllBlocking(Map<String, String> BlockInfo);
	
	// blocking 삭제
	public void DeleteBlocking(BlockVO vo);
	
	// blocking 추가
	public void InsertBlocking(BlockVO vo);
	
	// blocking 하고 있는지 체크
	public boolean IsBlocking(BlockVO vo);

	public int getCountBlocking(String pageID);

	public boolean IsBlocked(BlockVO vo);
		
}
