package com.team.chat.Interface;

import javax.servlet.http.HttpSession;

public interface MemberDAO {
	public boolean loginCheck(MemberVO vo);
	public MemberVO viewMember(MemberVO vo);
	public void logout(HttpSession session);
}
