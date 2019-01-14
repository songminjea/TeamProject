package com.team.block.DAO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.block.VO.BlockVO;

@Repository
public class BlockDAOImpl implements BlockDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<BlockVO> GetAllBlocker(Map<String, String> BlockInfo) {
		// 해당 아이디의 모든 blocker 목록 리턴(Blocker_id, Block_date)
		
		return sqlSession.selectList("GetAllBlocker", BlockInfo);
	}

	@Override
	public List<BlockVO> GetAllBlocking(Map<String, String> BlockInfo) {
		// 해당 아이디의 모든 blocking 목록 리턴(Blocking_id, Block_date)

		return sqlSession.selectList("GetAllBlocking", BlockInfo);
	}

	@Override
	public void DeleteBlocking(BlockVO vo) {
		// blocking 삭제
		
		sqlSession.delete("DeleteBlocking", vo);
		
		
	}

	@Override
	public void InsertBlocking(BlockVO vo) {
		sqlSession.insert("InsertBlocking", vo);
	}

	@Override
	public boolean IsBlocking(BlockVO vo) {
		// blocking 하고 있는지 체크

		
		int result = sqlSession.selectOne("IsBlocking", vo);
		
		
		if(result >= 1)
			return true;
		else
			return false;

	}

	@Override
	public int getCountBlocking(String pageID) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getCountBlocking", pageID);
	}

	@Override
	public boolean IsBlocked(BlockVO vo) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("IsBlocked", vo);
		
		
		if(result >= 1)
			return true;
		else
			return false;
	}
	
	
}
