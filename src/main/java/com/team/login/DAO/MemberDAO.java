package com.team.login.DAO;

import com.team.login.DTO.LoginDTO;
import com.team.login.DTO.MemberVO;

public interface MemberDAO{
	public MemberVO login(LoginDTO ldto) throws Exception;
}
