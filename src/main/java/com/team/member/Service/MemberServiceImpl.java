package com.team.member.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.member.DAO.MemberDAO;
import com.team.member.VO.MemberVO;


@Service
public class MemberServiceImpl {
	
	@Autowired
	MemberDAO memberDAO;
	
	public void InsertMember(MemberVO vo) {
		memberDAO.InsertMember(vo);
		
	}
}
