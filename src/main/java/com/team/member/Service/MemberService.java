package com.team.member.Service;


import com.team.member.VO.MemberVO;

public interface MemberService {
	
	public void InsertMember(MemberVO vo);
	
	public MemberVO getMember(String ID);
	
	public void updateMember(MemberVO vo);
	
}
