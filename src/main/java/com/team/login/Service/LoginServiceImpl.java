package com.team.login.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.login.DAO.MemberDAO;
import com.team.login.DTO.LoginDTO;
import com.team.login.DTO.MemberVO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	MemberDAO memberDao;
	
	@Override
	public MemberVO login(LoginDTO ldto) throws Exception {
		return memberDao.login(ldto);
	}
}
