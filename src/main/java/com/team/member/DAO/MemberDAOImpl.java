package com.team.member.DAO;


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
	
	
}
