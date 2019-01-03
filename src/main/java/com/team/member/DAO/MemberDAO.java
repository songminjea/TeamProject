package com.team.member.DAO;


import java.util.List;

import com.team.member.VO.MemberVO;

public interface MemberDAO {
	
	public void InsertMember(MemberVO member);
	
	public MemberVO getMember(String ID);
	
	public void updateMember(MemberVO member);

	public List<MemberVO> GetSearchMember(String ID);
	
}
