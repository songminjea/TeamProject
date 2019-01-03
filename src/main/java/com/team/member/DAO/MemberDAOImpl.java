package com.team.member.DAO;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.member.VO.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void InsertMember(MemberVO member) {
		
		sqlSession.insert("insertMember", member);
		
	}
	
	@Override
	public MemberVO getMember(String ID) {
		
		return sqlSession.selectOne("getMember",ID);
		
	}
	
	@Override
	public void updateMember(MemberVO member) {
		sqlSession.update("updateMember",member);
	}

	@Override
	public List<MemberVO> GetSearchMember(String ID) {
		return sqlSession.selectList("GetSearchMemberList", ID);
	}
	
	
	
	
}
