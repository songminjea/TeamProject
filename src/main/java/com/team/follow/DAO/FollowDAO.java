package com.team.follow.DAO;

import java.util.List;

import com.team.follow.VO.FollowVO;




public interface FollowDAO {
	
	// 해당 아이디의 모든 팔로워 목록 리턴(follower_id, follow_date)
	public List<FollowVO> GetAllFollower(String id);
	
	// 해당 아이디의 모든 팔로잉 목록 리턴(fowllowing_id, follow_date)
	public List<FollowVO> GetAllFollowing(String id);
	
	// 팔로잉 삭제
	public void DeleteFollowing(FollowVO vo);
	
	// 팔로잉 추가
	public void InsertFollowing(FollowVO vo);
	
	// 팔로잉 하고 있는지 체크
	public boolean IsFollowing(FollowVO vo);
		
}
