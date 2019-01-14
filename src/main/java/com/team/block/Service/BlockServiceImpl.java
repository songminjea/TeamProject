package com.team.block.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.block.DAO.BlockDAO;
import com.team.block.VO.BlockVO;

@Service("BlockService")
public class BlockServiceImpl implements BlockService {

	@Autowired
	private BlockDAO blockDAO;
	
	@Override
	public List<BlockVO> GetAllBlocker(Map<String, String> BlockInfo) {
		// 해당 아이디의 모든 blocker 목록 리턴(Blocker_id, Block_date)
		return blockDAO.GetAllBlocker(BlockInfo);
	}

	@Override
	public List<BlockVO> GetAllBlocking(Map<String, String> BlockInfo) {
		// 해당 아이디의 모든 blocking 목록 리턴(Blocking_id, Block_date)
		return blockDAO.GetAllBlocking(BlockInfo);
	}

	@Override
	public void DeleteBlocking(BlockVO vo) {
		blockDAO.DeleteBlocking(vo);
	}

	@Override
	public void InsertBlocking(BlockVO vo) {
		blockDAO.InsertBlocking(vo);		
	}

	@Override
	public boolean IsBlocking(BlockVO vo) {
		return blockDAO.IsBlocking(vo);
	}

	@Override
	public int getCountBlocking(String pageID) {
		// TODO Auto-generated method stub
		return blockDAO.getCountBlocking(pageID);
	}

	@Override
	public boolean IsBlocked(BlockVO vo) {
		// TODO Auto-generated method stub
		return blockDAO.IsBlocked(vo);
	}
	
	
	
}
