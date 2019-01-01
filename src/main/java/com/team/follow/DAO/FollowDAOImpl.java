package com.team.follow.DAO;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.follow.VO.FollowVO;

@Repository
public class FollowDAOImpl implements FollowDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<FollowVO> GetAllFollower(String following_id) {
		// 해당 아이디의 모든 팔로워 목록 리턴(follower_id, follow_date)
		
		return sqlSession.selectList("GetAllFollower", following_id);
	}

	@Override
	public List<FollowVO> GetAllFollowing(String follower_id) {
		// 해당 아이디의 모든 팔로잉 목록 리턴(following_id, follow_date)

		return sqlSession.selectList("GetAllFollowing", follower_id);
	}

	@Override
	public void DeleteFollowing(FollowVO vo) {
		// 팔로잉 삭제
		
		sqlSession.delete("DeleteFollowing", vo);
		
		
	}

	@Override
	public void InsertFollowing(FollowVO vo) {
		Date dt = new Date(System.currentTimeMillis());
		vo.setFollow_date(dt);
		sqlSession.insert("InsertFollowing", vo);
	}

	@Override
	public boolean IsFollowing(FollowVO vo) {
		// 팔로잉 하고 있는지 체크

		
		int result = sqlSession.selectOne("IsFollowing", vo);
		
		
		if(result >= 1)
			return true;
		else
			return false;

	}

	@Override
	public List<FollowVO> getNotFollowingList(String follower_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getNotFollowingList", follower_id);
	}
	
	

}
