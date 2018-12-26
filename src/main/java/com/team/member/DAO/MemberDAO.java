package com.team.member.DAO;


import com.team.member.VO.MemberVO;

public interface MemberDAO {
	
	public void InsertMember(MemberVO member);
	
	public MemberVO getMember(String ID);
	
	public void updateMember(MemberVO member);
	
}
